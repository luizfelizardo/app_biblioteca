import 'package:flutter/widgets.dart';
//import 'package:biblioteca_uniceu_alvarenga/firebase_options.dart';
import 'package:biblioteca_uniceu_alvarenga/myapp.dart';
//import 'package:firebase_core/firebase_core.dart';

Future<void> main(async) async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Firebase.initializeApp(
  //options: DefaultFirebaseOptions.currentPlatform,
  //);

  runApp(const MyApp());
}
