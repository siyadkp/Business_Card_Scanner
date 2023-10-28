import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

import '../../permission_access_function/permission_access_function.dart';

// Camera image picking function -----------------------------------------------
Future<InputImage?> getImageFromGallery() async {
  await requestPermissionOfCamera();
  final imagePicker = ImagePicker();
  final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    InputImage inputImage = InputImage.fromFilePath(pickedFile.path);
    return inputImage;
  } else {
    return null;
  }
}
