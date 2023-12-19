import 'package:flutter/material.dart';
import 'page/pages.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const PositionPage());
    case '/maps':
      final args = settings.arguments as MapsArgs;
      return MaterialPageRoute(
          builder: (_) => MapsPage(lat: args.lat, lng: args.lng));
    case '/search-and-pick':
      final args = settings.arguments as SearchAndPickArgs;
      return MaterialPageRoute(
          builder: (_) => SearchAndPickPage(lat: args.lat, lng: args.lng));
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text.rich(
              TextSpan(text: 'No route defined for: ', children: [
                TextSpan(
                  text: settings.name,
                  style: const TextStyle(color: Colors.blue),
                )
              ]),
            ),
          ),
        ),
      );
  }
}
