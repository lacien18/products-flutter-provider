// **************************************************************************
// To build Injectable generated file run:
// flutter packages pub run build_runner build --delete-conflicting-outputs
// **************************************************************************
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:products/di/locator.config.dart';

/// Service Locator.
final GetIt sl = GetIt.instance;

/// Register and inject dependencies.
@InjectableInit(preferRelativeImports: false)
Future<void> configureInjection() async => GetItInjectableX(sl).init();
