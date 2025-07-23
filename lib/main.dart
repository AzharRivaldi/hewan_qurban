import 'package:flutter/material.dart';
import 'package:hewan_qurban/page/page_main.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  Intl.defaultLocale = 'in';
  initializeDateFormatting('in', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent
        ),
        useMaterial3: false,
      ),
      home: const PageMain(),
    );
  }
}
