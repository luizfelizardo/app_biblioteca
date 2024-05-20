import 'package:biblioteca_uniceu_alvarenga/myapp.dart';
import 'package:flutter/widgets.dart';
import 'package:biblioteca_uniceu_alvarenga/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'hive_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await HiveConfig.start();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
