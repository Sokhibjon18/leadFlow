// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/auth_repo.dart' as _i585;
import '../../features/auth/domain/auth_cubit.dart' as _i769;
import '../../features/funnel/funnel_repository.dart' as _i718;
import '../../features/splash/data/splash_repository.dart' as _i689;
import 'models/firebase_model.dart' as _i912;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.factory<_i59.FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
    gh.factory<_i974.FirebaseFirestore>(
        () => firebaseInjectableModule.firestore);
    gh.factory<_i457.FirebaseStorage>(() => firebaseInjectableModule.storage);
    gh.factory<_i769.AuthCubit>(() => _i769.AuthCubit());
    gh.factory<_i718.FunnelRepository>(
        () => _i718.FunnelRepository(gh<_i974.FirebaseFirestore>()));
    gh.factory<_i585.AuthRepo>(() => _i585.AuthRepo(gh<_i59.FirebaseAuth>()));
    gh.factory<_i689.SplashRepository>(() => _i689.SplashRepository(
          gh<_i974.FirebaseFirestore>(),
          gh<_i59.FirebaseAuth>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i912.FirebaseInjectableModule {}
