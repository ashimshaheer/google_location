import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grogentask/App/utils/extentions.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final LatLng currentpostion;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Responsive.width * 90,
          height: Responsive.height * 30,
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(12.1355709, 76.9462739), // Initial map center
              zoom: 15.0, // Initial zoom level
            ),
            markers: <Marker>{
              const Marker(
                markerId: MarkerId('user_location'),
                position: LatLng(20.5937, 78.9629),
                icon: BitmapDescriptor.defaultMarker,
              ),
            },
          ),
        ),
        // StreamBuilder<Position>(
        //   stream: Geolocator.getPositionStream(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       final position = snapshot.data;
        //       return GoogleMap(
        //         initialCameraPosition: const CameraPosition(
        //           target: LatLng(20.5937, 78.9629),
        //           zoom: 15.0,
        //         ),
        //         onMapCreated: (controller) {
        //           controller.animateCamera(
        //             CameraUpdate.newCameraPosition(
        //               CameraPosition(
        //                   target: LatLng(position?.latitude ?? 20.5937, position?.longitude ?? 78.9629), zoom: 15.0),
        //             ),
        //           );
        //         },
        //       );
        //     }
        //     return const CircularProgressIndicator();
        //   },
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Toggle tracking logic
              },
              child: const Text('Toggle Tracking'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // Switch map layers logic
              },
              child: const Text('Switch Layers'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
