import 'package:injectable/injectable.dart';
import 'package:products/core/data/services/destination/destination_services.dart';
import 'package:products/core/data/services/user/user_services.dart';
import 'package:products/core/routes/routes.dart';
import 'package:products/di/locator.dart';

@LazySingleton(as: DestinationServices)
class DestinationServicesImpl implements DestinationServices {
  DestinationServicesImpl();

  @override
  Future<String> requestInitialDestination() async {
    final findUser = await sl<UserServices>().getUser();

    try {
      if (findUser != null && findUser.email != null) {
        return Routes.home.path;
      } else {
        return Routes.login.path;
      }
    } catch (e) {
      return Routes.login.path;
    }
  }
}
