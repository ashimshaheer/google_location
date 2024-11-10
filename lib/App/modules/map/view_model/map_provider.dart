import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapProvider extends ChangeNotifier {
  Future<Position> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      // ignore: deprecated_member_use
      desiredAccuracy: LocationAccuracy.high,
    );
    notifyListeners();
    return position;
  }
}
