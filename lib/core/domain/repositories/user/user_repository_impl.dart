import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:products/core/data/services/user/user_services.dart';
import 'package:products/core/domain/entities/user_model.dart';
import 'package:products/core/domain/repositories/user/user_repository.dart';
import 'package:products/core/error/failure.dart';
import 'package:products/core/utils/base_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends BaseRepository implements UserRepository {
  final UserServices _userServices;

  UserRepositoryImpl(this._userServices);

  @override
  Future<Either<Failure, UserModel?>> createUser(UserModel? credencials) {
    return runCatching(() async {
      final success = await _userServices.createUser(credencials);
      return Right(success);
    });
  }

  @override
  Future<Either<Failure, UserModel?>> getUser() {
    return runCatching(() async {
      final success = await _userServices.getUser();
      return Right(success);
    });
  }

  @override
  Future<Either<Failure, UserModel?>> loginUser(UserModel? credencials) {
    return runCatching(() async {
      final success = await _userServices.loginUser(credencials);
      return Right(success);
    });
  }
}
