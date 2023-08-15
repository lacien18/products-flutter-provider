import 'package:dartz/dartz.dart';
import 'package:products/core/domain/entities/user_model.dart';
import 'package:products/core/error/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel?>> getUser();
  Future<Either<Failure, UserModel?>> loginUser(UserModel? credencials);

  Future<Either<Failure, UserModel?>> createUser(UserModel? credencials);
}
