// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_core/firebase_core.dart' as _i5;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app/modules/authentication/domain/repository/authentication_repository.dart'
    as _i18;
import 'app/modules/authentication/domain/repository/interface/authentication_repository_interface.dart'
    as _i17;
import 'app/modules/authentication/domain/service/authentication_service.dart'
    as _i12;
import 'app/modules/authentication/domain/service/interface/authentication_service_interface.dart'
    as _i11;
import 'app/modules/authentication/presentation/controllers/login_controller.dart'
    as _i24;
import 'app/modules/authentication/presentation/pages/counter_page.dart' as _i4;
import 'app/modules/home/presentation/controller/get_category_news_controller.dart'
    as _i22;
import 'app/modules/home/presentation/controller/get_news_controller.dart'
    as _i23;
import 'app/modules/news/domain/repository/interface/news_repository_interface.dart'
    as _i15;
import 'app/modules/news/domain/repository/news_repository.dart' as _i16;
import 'app/modules/news/domain/service/interface/news_service_interface.dart'
    as _i9;
import 'app/modules/news/domain/service/news_service.dart' as _i10;
import 'app/modules/playground/domain/repository/cash_repository.dart' as _i20;
import 'app/modules/playground/domain/repository/interface/cash_repository_interface.dart'
    as _i19;
import 'app/modules/playground/domain/service/cash_service.dart' as _i14;
import 'app/modules/playground/domain/service/interface/cash_service_interface.dart'
    as _i13;
import 'app/modules/playground/presentation/controllers/get_cash_request_controller.dart'
    as _i21;
import 'core/framework/theme/controller/app_theme_controller.dart' as _i3;
import 'injection_modules/firebase_modules.dart' as _i25;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i3.AppThemeController>(() => _i3.AppThemeController());
    gh.lazySingleton<_i4.CounterController>(() => _i4.CounterController());
    await gh.factoryAsync<_i5.FirebaseApp>(
      () => firebaseModule.getFirebaseApp(),
      preResolve: true,
    );
    gh.lazySingleton<_i6.FirebaseAuth>(
        () => firebaseModule.getFirebaseAuth(gh<_i5.FirebaseApp>()));
    gh.lazySingleton<_i7.FirebaseFirestore>(
        () => firebaseModule.getFirebaseFirestore(gh<_i5.FirebaseApp>()));
    gh.lazySingleton<_i8.FirebaseRemoteConfig>(
        () => firebaseModule.remoteConfigs);
    gh.lazySingleton<_i9.NewsServiceInterface>(() => _i10.NewsService());
    gh.lazySingleton<_i11.AuthenticationServiceInterface>(
        () => _i12.AuthenticationService(gh<_i6.FirebaseAuth>()));
    gh.lazySingleton<_i13.CashServiceInterface>(
        () => _i14.CashService(gh<_i7.FirebaseFirestore>()));
    gh.lazySingleton<_i15.NewsRepositoryInterface>(
        () => _i16.NewsRepository(gh<_i9.NewsServiceInterface>()));
    gh.lazySingleton<_i17.AuthenticationRepositoryInterface>(() =>
        _i18.AuthenticationRepository(
            gh<_i11.AuthenticationServiceInterface>()));
    gh.lazySingleton<_i19.CashRepositoryInteface>(
        () => _i20.CashRepository(gh<_i13.CashServiceInterface>()));
    gh.lazySingleton<_i21.GetCashRequestController>(() =>
        _i21.GetCashRequestController(
            repository: gh<_i19.CashRepositoryInteface>()));
    gh.lazySingleton<_i22.GetNewsCategoryController>(() =>
        _i22.GetNewsCategoryController(
            repository: gh<_i15.NewsRepositoryInterface>()));
    gh.lazySingleton<_i23.GetNewsController>(() =>
        _i23.GetNewsController(repository: gh<_i15.NewsRepositoryInterface>()));
    gh.lazySingleton<_i24.LoginController>(() => _i24.LoginController(
        repository: gh<_i17.AuthenticationRepositoryInterface>()));
    return this;
  }
}

class _$FirebaseModule extends _i25.FirebaseModule {}
