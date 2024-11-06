import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/home/home_page.dart';
import 'package:todo_app/pages/home/provider/home_provider.dart';
import 'package:todo_app/util/strings.dart';
import 'database/floor/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseSingleton.getDatabase();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: SANS_REGULAR, useMaterial3: true),
      home: const HomePage(),
    ),
  ));
}
