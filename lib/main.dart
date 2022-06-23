import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/presentation/movie_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import './di/get_it.dart' as getIt;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  unawaited(getIt.init());
  runApp(const MovieApp());
}
class Ap extends StatelessWidget {
  const Ap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

