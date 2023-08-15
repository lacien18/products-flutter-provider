// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:products/core/data/services/destination/destination_services.dart'
    as _i3;
import 'package:products/core/data/services/destination/destination_services_impl.dart'
    as _i4;
import 'package:products/core/data/services/user/user_services.dart' as _i9;
import 'package:products/core/data/services/user/user_services_impl.dart'
    as _i10;
import 'package:products/core/domain/repositories/user/user_repository.dart'
    as _i13;
import 'package:products/core/domain/repositories/user/user_repository_impl.dart'
    as _i14;
import 'package:products/core/global_providers/user_notifier.dart' as _i16;
import 'package:products/di/modules.dart' as _i17;
import 'package:products/feature/products/data/domain/repositories/product_repository.dart'
    as _i11;
import 'package:products/feature/products/data/domain/repositories/product_repository_impl.dart'
    as _i12;
import 'package:products/feature/products/data/services/product_services.dart'
    as _i7;
import 'package:products/feature/products/data/services/product_services_impl.dart'
    as _i8;
import 'package:products/feature/products/presentation/providers/product_notifier.dart'
    as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i3.DestinationServices>(
        () => _i4.DestinationServicesImpl());
    gh.lazySingleton<_i5.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i6.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.lazySingleton<_i7.ProductServices>(
        () => _i8.ProductServicesImpl(gh<_i6.FirebaseFirestore>()));
    gh.lazySingleton<_i9.UserServices>(() => _i10.UserServicesImpl(
          fireAuth: gh<_i5.FirebaseAuth>(),
          fireStore: gh<_i6.FirebaseFirestore>(),
        ));
    gh.lazySingleton<_i11.ProductRepository>(
        () => _i12.ProductRepositoryImpl(gh<_i7.ProductServices>()));
    gh.lazySingleton<_i13.UserRepository>(
        () => _i14.UserRepositoryImpl(gh<_i9.UserServices>()));
    gh.factory<_i15.ProductProvider>(
        () => _i15.ProductProvider(gh<_i11.ProductRepository>()));
    gh.factory<_i16.UserProvider>(
        () => _i16.UserProvider(gh<_i13.UserRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i17.FirebaseModule {}
