import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../business_card_model/business_card_model.dart';
import '../database/crud_functions/crud_functions.dart';
import 'image_picker_camera_function/image_picker_camera_function.dart';

// Optical Character Recognition Scanner Function ------------------------------
Future<void> orcScanner() async {
  final DabaseCURDfunctionController dabaseCURDfunctionController =
      Get.put(DabaseCURDfunctionController());
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  InputImage? inputImage = await getImageFromGallery();

  try {
    if (inputImage != null) {
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);
      final List<String> names = [];
      final List<String> emails = [];
      final List<String> websites = [];
      final List<String> contactNumbers = [];

      for (TextBlock block in recognizedText.blocks) {
        for (TextLine line in block.lines) {
          final String lineText = line.text;
          if (lineText.isNotEmpty && !lineText.contains(RegExp(r'\([^)]+\)'))) {
            if (lineText.contains(RegExp(r'[A-Z][a-z]+ [A-Z][a-z]+'))) {
              names.add(lineText);
            }

            // Check for email addresses
            if (lineText.contains(RegExp(
                r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b'))) {
              emails.add(lineText);
            }

            // Check for website links
            if (lineText.contains(RegExp(r'https?://\S+'))) {
              websites.add(lineText);
            }

            // Check for contact numbers (this is a basic example, you might need to adapt it)
            if (lineText.contains(RegExp(r'\b\d{3}[-.]?\d{3}[-.]?\d{4}\b'))) {
              contactNumbers.add(lineText);
            }
          }
        }
      }

      // Assign default values if lists are empty
      String nameValue = names.isNotEmpty ? names.first : "";
      String contactNumberValue =
          contactNumbers.isNotEmpty ? contactNumbers.first : "";
      String emailValue = emails.isNotEmpty ? emails.first : "";
      String websiteValue = websites.isNotEmpty ? websites.first : "";

      await dabaseCURDfunctionController.insertBusinessCard(BusinessCardModel(
          name: nameValue,
          contactNumber: contactNumberValue,
          email: emailValue,
          website: websiteValue));
    }
  } catch (e) {
    print(e);
  }
}
