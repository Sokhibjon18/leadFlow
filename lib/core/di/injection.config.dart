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

import '../../future/auth/data/auth_repo.dart' as _i273;
import '../../future/auth/domain/auth_bloc.dart' as _i398;
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
    gh.factory<_i273.AuthRepo>(() => _i273.AuthRepo(gh<_i59.FirebaseAuth>()));
    gh.factory<_i398.AuthBloc>(() => _i398.AuthBloc(gh<_i273.AuthRepo>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i912.FirebaseInjectableModule {}
