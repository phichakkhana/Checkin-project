import 'dart:async';

import 'package:chrckin/base/size.dart';
import 'package:chrckin/base/ui_strings.dart';
import 'package:chrckin/feature/home/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({
    Key? key,
    required this.isChecked,
  }) : super(key: key);
  final bool isChecked;
  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController googleMapController;
  static final CameraPosition _kgoogleplex =
      CameraPosition(target: LatLng(37.427, -122.085), zoom: 15);

  @override
  Future<void> getCurrent() async {
    Location location = Location();
    var locat = await location.getLocation();
    GoogleMapController googlecontroller = await _controller.future;
    googlecontroller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            locat.latitude!,
            locat.longitude!,
          ),
          zoom: 16,
        ),
      ),
    );
  }

  void initState() {
    getCurrent();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MaterailSize.mapheight,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kgoogleplex,
                zoomGesturesEnabled: false,
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: MaterailSize.containerheight2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(MaterailSize.basiccircular),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: widget.isChecked == true
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Homepage(isChecked: false),
                                ),
                              );
                            }
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Homepage(isChecked: true),
                                ),
                              );
                            },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MaterailSize.basiccircular2),
                            color: Colors.white,
                            border: Border.all(color: Colors.pink)),
                        width: double.infinity,
                        height: MaterailSize.buttonheight,
                        margin: EdgeInsets.symmetric(
                            horizontal: MaterailSize.smallpadding),
                        child: Center(
                          child: widget.isChecked == false
                              ? Text(UiStrings.confirm_checkin)
                              : Text(UiStrings.confirm_checkout),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
