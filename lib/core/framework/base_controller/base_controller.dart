import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nuntium_rigid/core/framework/stream_state/stream_state.dart';
import 'package:rxdart/rxdart.dart';

enum TriggerType { value, reset, auto }

(double, double) lol() {
  return (10, 20);
}

class _Trigger<SinkType, StreamType> {
  final TriggerType type;
  final SinkType? value;
  final StreamType? autoValue;
  final bool startsWithLoading;

  _Trigger({
    required this.type,
    this.value,
    this.autoValue,
    this.startsWithLoading = true,
  });
}

class NoArgBaseController<StreamType> extends BaseController<void, StreamType> {
  NoArgBaseController({
    required FutureOr<StreamType> Function() function,
    Stream<(void, bool)> Function(Stream<(void, bool)>)? pipe,
  }) : super(
          function: (_) => function(),
          pipe: pipe,
        );

  void get({bool startsWithLoading = true}) {
    trigger(null, startsWithLoading: startsWithLoading);
  }

  bool _firstTime = true;

  void getLoadOnce() {
    if (_firstTime) {
      get(startsWithLoading: true);
      _firstTime = false;
      return;
    }
    get(startsWithLoading: false);
  }
}

class BaseController<SinkType, StreamType> {
  late final Sink<_Trigger<SinkType, StreamType>> _sink;
  late Stream<StreamState<StreamType>> state;

  final List<StreamSubscription<StreamState<StreamType>>> listenersCache = [];

  BaseController({
    required FutureOr<StreamType> Function(SinkType data) function,
    Stream<(SinkType, bool)> Function(Stream<(SinkType, bool)>)? pipe,
  }) {
    final subject = BehaviorSubject<_Trigger<SinkType, StreamType>>();

    final valueStream = subject.stream
        .where((event) => event.type == TriggerType.value)
        .map((event) => (event.value as SinkType, event.startsWithLoading));

    final valueStreamPipe = pipe != null ? pipe(valueStream) : valueStream;

    final subjectStream = Rx.merge<_Trigger<SinkType, StreamType>>([
      subject.stream.where((event) => event.type != TriggerType.value),
      valueStreamPipe.map(
        (event) => _Trigger<SinkType, StreamType>(
          type: TriggerType.value,
          value: event.$1,
          startsWithLoading: event.$2,
        ),
      ),
    ]).asBroadcastStream();

    final behaviorSubjectStream =
        BehaviorSubject<_Trigger<SinkType, StreamType>>();
    subjectStream.listen(behaviorSubjectStream.add);

    final stateSubject = BehaviorSubject<StreamState<StreamType>>();

    behaviorSubjectStream.switchMap<StreamState<StreamType>>(
      (value) {
        if (value.type == TriggerType.reset) {
          return Stream.value(StreamState<StreamType>.initial());
        }
        if (value.type == TriggerType.auto) {
          return Stream.value(
            StreamState<StreamType>.success(value.autoValue as StreamType),
          );
        }
        final response = function(value.value as SinkType);
        return Rx.fromCallable<StreamType>(() => response).asStreamState(
          startsWithLoading: value.startsWithLoading,
        );
      },
    ).listen(stateSubject.add, onError: stateSubject.addError);

    _sink = subject.sink;
    this.state = stateSubject.stream;
  }

  void auto(StreamType value) {
    _sink.add(
      _Trigger<SinkType, StreamType>(
        type: TriggerType.auto,
        autoValue: value,
      ),
    );
  }

  void trigger(SinkType model, {bool startsWithLoading = true}) {
    _sink.add(
      _Trigger<SinkType, StreamType>(
        type: TriggerType.value,
        value: model,
        startsWithLoading: startsWithLoading,
      ),
    );
  }

  void reset() {
    _sink.add(
      _Trigger<SinkType, StreamType>(type: TriggerType.reset),
    );
    removeListeners();
  }

  void removeListeners() {
    for (final listener in listenersCache) {
      listener.cancel();
    }
    listenersCache.clear();
  }

  StreamSubscription<StreamState<StreamType>> listenWhen<K>({
    K? Function()? initial,
    K? Function()? loading,
    K? Function(StreamType data)? success,
    K? Function(Object error)? failure,
    String? from,
  }) {
    listenersCache.add(
      state.listenWhen(
        initial: initial,
        loading: loading,
        success: success,
        failure: failure,
      ),
    );
    return listenersCache.last;
  }

  Widget buildWhen({
    Widget Function()? initial,
    Widget Function()? loading,
    Widget Function(StreamType data)? success,
    Widget Function(Object error)? failure,
  }) {
    return state.buildWhen(
      initial: initial,
      loading: loading,
      success: success,
      failure: failure,
    );
  }
}
