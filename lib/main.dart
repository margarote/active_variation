import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/inject/inject_container.dart';
import 'routes/route_names.dart';
import 'routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Active Variation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      onGenerateRoute: generateRoute,
      initialRoute: RouteNames.splash,
    );
  }
}
