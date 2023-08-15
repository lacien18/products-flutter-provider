import 'package:products/core/routes/route_model.dart';

class Routes {
  //HOME
  static RouteInfo home = RouteInfo(name: 'home', path: '/');
//PRODUCT
  static RouteInfo detailProduct =
      RouteInfo(name: 'detail', path: '/detail/:product');

  static RouteInfo addEditProduct =
      RouteInfo(name: 'addedit', path: '/addedit/:product');

  //AUTH
  static RouteInfo login = RouteInfo(name: 'login', path: '/login');
  static RouteInfo register = RouteInfo(name: 'register', path: 'register');
}
