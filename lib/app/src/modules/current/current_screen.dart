// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class CurrentLocationScreen extends StatefulWidget {
//   CurrentLocationScreen({Key? key}) : super(key: key);

//   @override
//   State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
// }

// class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
//   late GoogleMapController googleMapController;

//   static const CameraPosition initialCameraPosition =
//       CameraPosition(target: LatLng(36.8330, 127.1790), zoom: 14);

//   Set<Marker> markers = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("User current location"),
//         centerTitle: true,
//       ),
//       body: GoogleMap(
//         initialCameraPosition: initialCameraPosition,
//         markers: markers,
//         zoomControlsEnabled: false,
//         mapType: MapType.normal,
//         onMapCreated: (GoogleMapController controller) {
//           googleMapController = controller;
//         },
//       ),
//     );
//   }
// }
