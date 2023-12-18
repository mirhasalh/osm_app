import 'package:flutter/material.dart';

import 'route.dart';
import 'themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OSM Demo',
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: generateRoute,
      initialRoute: '/',
    );
  }
}
