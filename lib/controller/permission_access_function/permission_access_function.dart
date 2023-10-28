import 'package:permission_handler/permission_handler.dart';

// Camera permistion request function ------------------------------------------

Future<bool> requestPermissionOfCamera() async {
  final status = await Permission.camera.request();
  if (status.isGranted) {
    return true;
  }
  return false;
}

Future<void> requestContactPermissionOfContacs() async {
  final status = await Permission.contacts.request();
  if (status.isGranted) {
    // You have permission to access contacts.
  } else {
    // Handle permission denial.
  }
}
