import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:products/core/domain/entities/type_feed.dart';
import 'package:products/core/domain/entities/user_model.dart';
import 'package:products/core/domain/repositories/user/user_repository.dart';
import 'package:products/core/utils/state_app/state_app.dart';

@injectable
class UserProvider with ChangeNotifier {
  UserProvider(this._userRepository);

  final UserRepository _userRepository;

  StateApp<UserModel?> _state = const StateApp.initial();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  UserModel credencials = UserModel();

  StateApp<UserModel?> get state {
    return _state;
  }

  Future<void> createUser() async {
    _state = StateApp.loading(message: TypeFeed.createdUser.index.toString());

    notifyListeners();

    final result = await _userRepository.createUser(credencials);

    _state = result.fold(
      (l) => StateApp.failure(l),
      (r) => StateApp.success(r, feed: TypeFeed.createdUser),
    );

    notifyListeners();
  }

  Future<void> loginUser() async {
    _state = StateApp.loading(message: TypeFeed.loginUser.index.toString());

    notifyListeners();

    final result = await _userRepository.loginUser(credencials);

    _state = result.fold(
      (l) => StateApp.failure(l),
      (r) => StateApp.success(r, feed: TypeFeed.loginUser),
    );

    notifyListeners();
  }
}
