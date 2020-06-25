import 'dart:async';

import 'package:cep/store/map_store.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: mapStore.posicao != null
        ? mapStore.posicao
        : LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  moverCamera() {
    mapController.moveCamera(CameraUpdate.newLatLng(mapStore.posicao));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1505FF),
        title: Text("Google Maps"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.searchLocation),
            onPressed: () async {
              moverCamera();
            },
          ),
        ],
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
