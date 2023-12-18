import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class OsmPage extends StatefulWidget {
  static const routeName = '/osm';

  const OsmPage({super.key, required this.lat, required this.lng});

  final double lat;
  final double lng;

  @override
  State<OsmPage> createState() => _OsmPageState();
}

class _OsmPageState extends State<OsmPage> {
  late double _lat;
  late double _lng;
  late MapController _controller;

  @override
  void initState() {
    super.initState();

    _lat = widget.lat;
    _lng = widget.lng;

    _controller = MapController(
      initPosition: GeoPoint(latitude: _lat, longitude: _lng),
      areaLimit: BoundingBox(
        east: 10.4922941,
        north: 47.8084648,
        south: 45.817995,
        west: 5.9559113,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const zoomOption = ZoomOption(
      initZoom: 18.2746,
      minZoomLevel: 3.0,
      maxZoomLevel: 19.0,
      stepZoom: 1.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('OSM Demo'),
      ),
      body: OSMFlutter(
        controller: _controller,
        osmOption: const OSMOption(
          showZoomController: true,
          enableRotationByGesture: false,
          zoomOption: zoomOption,
          isPicker: true,
        ),
      ),
    );
  }
}

class OsmArgs {
  const OsmArgs({required this.lat, required this.lng});

  final double lat;
  final double lng;
}
