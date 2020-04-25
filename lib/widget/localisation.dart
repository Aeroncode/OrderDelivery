import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

import '../helper.dart';

class Localisation extends StatefulWidget{
  Localisation({ Key key }) : super(key: key);
  @override
  _Localisation createState() => _Localisation();
}

class _Localisation extends State<Localisation> {
  Widget appBarTitle = new Image.asset('assets/logo_transp_white.png', width: 60,fit: BoxFit.contain,);

  static const LatLng _center = const LatLng(23.521563, -72.677433);
  Completer<GoogleMapController> _controller = Completer();
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  final Map<String, Marker> _markers = {};
  Position currentLocation;

  Geolocator _geolocator;
  Position _position;

  void checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) { print('status: $status'); });
    _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationAlways).then((status) { print('always status: $status'); });
    _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationWhenInUse)..then((status) { print('whenInUse status: $status'); });
  }

   @override
  void initState() {
    super.initState();



    _getLocation();
  }

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      key: widget.key,
      backgroundColor: backgroundColor,
      appBar: buildBar(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.hybrid,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(7.53998, -5.54708),
            zoom: 11,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }

  void _getLocation() async {
      var currentLocationPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

      setState(() {
        currentLocation = currentLocationPosition;
        _markers.clear();
        final marker = Marker(
            markerId: MarkerId("curr_loc"),
            position: LatLng(currentLocation.latitude, currentLocation.longitude),
            infoWindow: InfoWindow(title: 'Your Location'),
        );
        _markers["Current Location"] = marker;
      });
    }  

  Widget buildBar(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: appBarTitle,
        backgroundColor: primaryColor,
        elevation: 0,
    );
  }

}