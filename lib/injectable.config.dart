// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_core/firebase_core.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app/modules/authentication/domain/repository/authentication_repository.dart'
    as _i13;
import 'app/modules/authentication/domain/repository/interface/authentication_repository_interface.dart'
    as _i12;
import 'app/modules/authentication/domain/service/authentication_service.dart'
    as _i9;
import 'app/modules/authentication/domain/service/interface/authentication_service_interface.dart'
    as _i8;
import 'app/modules/authentication/presentation/controllers/login_controller.dart'
    as _i16;
import 'app/modules/home/presentation/controller/get_category_news_controller.dart'
    as _i14;
import 'app/modules/home/presentation/controller/get_news_controller.dart'
    as _i15;
import 'app/modules/news/domain/repository/interface/news_repository_interface.dart'
    as _i10;
import 'app/modules/news/domain/repository/news_repository.dart' as _i11;
import 'app/modules/news/domain/service/interface/news_service_interface.dart'
    as _i6;
import 'app/modules/news/domain/service/news_service.dart' as _i7;
import 'core/framework/theme/controller/app_theme_controller.dart' as _i3;
import 'injection_modules/firebase_modules.dart' as _i17;

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
    await gh.factoryAsync<_i4.FirebaseApp>(
      () => firebaseModule.getFirebaseApp(),
      preResolve: true,
    );
    gh.lazySingleton<_i5.FirebaseAuth>(
        () => firebaseModule.getFirebaseAuth(gh<_i4.FirebaseApp>()));
    gh.lazySingleton<_i6.NewsServiceInterface>(() => _i7.NewsService());
    gh.lazySingleton<_i8.AuthenticationServiceInterface>(
        () => _i9.AuthenticationService(gh<_i5.FirebaseAuth>()));
    gh.lazySingleton<_i10.NewsRepositoryInterface>(
        () => _i11.NewsRepository(gh<_i6.NewsServiceInterface>()));
    gh.lazySingleton<_i12.AuthenticationRepositoryInterface>(() =>
        _i13.AuthenticationRepository(
            gh<_i8.AuthenticationServiceInterface>()));
    gh.lazySingleton<_i14.GetNewsCategoryController>(() =>
        _i14.GetNewsCategoryController(
            repository: gh<_i10.NewsRepositoryInterface>()));
    gh.lazySingleton<_i15.GetNewsController>(() =>
        _i15.GetNewsController(repository: gh<_i10.NewsRepositoryInterface>()));
    gh.lazySingleton<_i16.LoginController>(() => _i16.LoginController(
        repository: gh<_i12.AuthenticationRepositoryInterface>()));
    return this;
  }
}

class _$FirebaseModule extends _i17.FirebaseModule {}
