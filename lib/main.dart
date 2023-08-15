import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:products/app.dart';
import 'package:products/core/utils/block_screen.dart';
import 'package:products/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await configureInjection();
  
  BlockScreen.blockScreen;


  runApp(
    const App(),
  );
}
