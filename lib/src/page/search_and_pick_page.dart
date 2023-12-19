import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class SearchAndPickPage extends StatefulWidget {
  static const routeName = '/search-and-pick';

  const SearchAndPickPage({super.key, required this.lat, required this.lng});

  final double lat;
  final double lng;

  @override
  State<SearchAndPickPage> createState() => _SearchAndPickPageState();
}

class _SearchAndPickPageState extends State<SearchAndPickPage> {
  late double _lat;
  late double _lng;
  String _address = '';

  @override
  void initState() {
    super.initState();
    _lat = widget.lat;
    _lng = widget.lng;
  }

  @override
  Widget build(BuildContext context) {
    final m = ScaffoldMessenger.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    const inputBorder = OutlineInputBorder(borderSide: BorderSide.none);
    final focusBorder = OutlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: colorScheme.primary),
        borderRadius: BorderRadius.circular(8.0));

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlutterLocationPicker(
            initPosition: LatLong(_lat, _lng),
            selectLocationButtonText: 'Set current location',
            initZoom: 18.2746,
            minZoomLevel: 3.0,
            maxZoomLevel: 19.0,
            stepZoom: 1.0,
            trackMyPosition: true,
            mapAnimationDuration: const Duration(milliseconds: 200),
            searchbarBorderRadius: BorderRadius.circular(8.0),
            searchbarInputBorder: inputBorder,
            searchbarInputFocusBorderp: focusBorder,
            loadingWidget: const CircularProgressIndicator(),
            showZoomController: false,
            showSelectLocationButton: false,
            showLocationController: false,
            showContributorBadgeForOSM: false,
            onError: (e) => m.showSnackBar(SnackBar(content: Text('$e'))),
            onPicked: (v) {
              setState(() {
                _lat = v.latLong.latitude;
                _lng = v.latLong.longitude;
                _address = v.address;
              });
            },
            onChanged: (v) {
              setState(() {
                _lat = v.latLong.latitude;
                _lng = v.latLong.longitude;
                _address = v.address;
              });
            },
          ),
          _address == ''
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    clipBehavior: Clip.antiAlias,
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        width: double.infinity,
                        height: kToolbarHeight * 2,
                        color: Colors.white.withAlpha(150),
                        child: Text(_address),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class SearchAndPickArgs {
  const SearchAndPickArgs({required this.lat, required this.lng});

  final double lat;
  final double lng;
}
