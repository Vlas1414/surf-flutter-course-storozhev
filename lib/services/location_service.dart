import 'package:geolocator/geolocator.dart';
import 'package:places/models/exception_model.dart';

/// Получить местоположение пользователя
class LocationService {
  Future<Position> determinePosition({
    bool openSettingsAfterError = false,
  }) async {
    bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        throw LocationException(
          'Location permissions are permanently denied, we cannot request permissions.',
        );
      }
      if (openSettingsAfterError) {
        await Geolocator.openAppSettings();
      }
      if (permission == LocationPermission.denied) {
        throw LocationException('Location permissions are denied');
      }
    }

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (openSettingsAfterError) {
        await Geolocator.openLocationSettings();
      }
      throw LocationException('Location services are disabled.');
    }

    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
