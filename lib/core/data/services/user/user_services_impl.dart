import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:products/core/data/services/user/user_services.dart';
import 'package:products/core/domain/entities/user_model.dart';
import 'package:products/core/error/exception.dart';

@LazySingleton(as: UserServices)
class UserServicesImpl implements UserServices {
  UserServicesImpl({required this.fireAuth, required this.fireStore});

  final FirebaseAuth fireAuth;
  final FirebaseFirestore fireStore;

  String dbUsers = 'users';

  @override
  Future<UserModel?> createUser(UserModel? credencials) async {
    try {
      await fireAuth.createUserWithEmailAndPassword(
        email: credencials!.email!,
        password: credencials.password!,
      );

      final data = credencials.toJson();

      await fireStore.collection(dbUsers).doc(data['id']).set(data);

      return credencials;
    } on FirebaseAuthException catch (e) {
      throw AppException.custom(e.message!);
    } on PlatformException catch (e) {
      throw AppException.custom(e.message!);
    }
  }

  @override
  Future<UserModel?> loginUser(UserModel? credencials) async {
    try {
      await fireAuth.signInWithEmailAndPassword(
        email: credencials!.email!,
        password: credencials.password!,
      );

      UserModel? userLoaded = await getUser();
      return userLoaded;
    } on FirebaseAuthException catch (e) {
      throw AppException.custom(e.message!);
    } on PlatformException catch (e) {
      throw AppException.custom(e.message!);
    }
  }

  @override
  Future<UserModel?> getUser() async {
    User? firebaseUser = fireAuth.currentUser;

    if (firebaseUser != null) {
      return UserModel(
        email: firebaseUser.email,
      );
    }

    return null;
  }
}
