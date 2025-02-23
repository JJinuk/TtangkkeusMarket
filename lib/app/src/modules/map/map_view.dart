import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ttangkkeusmarket/app/core/values/app_color.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapView();
}

class _MapView extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? _initialPosition;

  void getUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
    super.initState();

    getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        googlemap(context),
        buildContainer(),
      ]),
    );
  }

  Widget buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: boxes(36.9179192, 127.1289245, '신선농산'),
              ),
              const SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: boxes(36.7710051, 127.2036732, '청정농산'),
              ),
              const SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: boxes(36.78200, 127.1549662, '하늘농산'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> goToLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 15),
        // , tilt: 50.0, bearing: 45.0
      ),
    );
  }

  Widget boxes(double lat, double long, String storeName) {
    // final ItemController itemController = Get.put(ItemController());

    return GestureDetector(
      onTap: () {
        goToLocation(lat, long);
      },
      child: FittedBox(
        child: Material(
          color: AppColor.white50,
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: AppColor.gray100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  // child: Image(
                  //   fit: BoxFit.fill,
                  // image: NetworkImage(_image),
                  // ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: detailsContaier(storeName),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget detailsContaier(String storeName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            storeName,
            style: const TextStyle(
                color: AppColor.black100,
                fontFamily: 'NotoSans',
                fontSize: 24.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              "4.3",
              style: TextStyle(
                  color: AppColor.black100,
                  fontSize: 18.0,
                  fontFamily: 'NotoSans'),
            ),
            Icon(
              LineIcons.starAlt,
              color: AppColor.yellow100,
              size: 15.0,
            ),
            Icon(
              LineIcons.starAlt,
              color: AppColor.yellow100,
              size: 15.0,
            ),
            Icon(
              LineIcons.starAlt,
              color: AppColor.yellow100,
              size: 15.0,
            ),
            Icon(
              LineIcons.starAlt,
              color: AppColor.yellow100,
              size: 15.0,
            ),
            Icon(
              LineIcons.starHalf,
              color: AppColor.yellow100,
              size: 15.0,
            ),
          ],
        )
      ],
    );
  }

  Widget googlemap(BuildContext context) {
    if (_initialPosition == null) {
      return Container();
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _initialPosition!,
            zoom: 15,
          ),
          markers: {seller1, seller2, seller3},
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
    );
  }
}

Marker seller1 = Marker(
  markerId: const MarkerId('신신농산'),
  position: const LatLng(36.9179192, 127.1289245),
  infoWindow: const InfoWindow(title: '신신농산'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker seller2 = Marker(
  markerId: const MarkerId('청정농산'),
  position: const LatLng(36.7710051, 127.2036732),
  infoWindow: const InfoWindow(title: '청정농산'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker seller3 = Marker(
  markerId: const MarkerId('하늘농산'),
  position: const LatLng(36.7820082, 127.1549662),
  infoWindow: const InfoWindow(title: '하늘농산'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);
