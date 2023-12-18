import 'package:flutter/material.dart';
import 'page/pages.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const PositionPage());
    case '/osm':
      final args = settings.arguments as OsmArgs;
      return MaterialPageRoute(
          builder: (_) => OsmPage(lat: args.lat, lng: args.lng));
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
