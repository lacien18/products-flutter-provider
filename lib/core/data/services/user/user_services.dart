import 'package:products/core/domain/entities/user_model.dart';

abstract class  UserServices{

Future<UserModel?> getUser();
Future<UserModel?> loginUser(UserModel? credencials);

Future<UserModel?> createUser(UserModel? credencials);

}