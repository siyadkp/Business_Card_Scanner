import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../business_card_model/business_card_model.dart';
import '../database/crud_functions/crud_functions.dart';
import 'image_picker_camera_function/image_picker_camera_function.dart';

// Optical Character Recognition Scanner Function ------------------------------
Future<void> orcScanner() async {
  final DabaseCURDfunctionController databaseCRUDFunctionController =
      Get.find<DabaseCURDfunctionController>();
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  try {
    final InputImage? inputImage = await getImageFromGallery();
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
          if (lineText.isNotEmpty) {
            if (RegExp(r'\b[A-Z][a-zA-Z]+ [A-Z][a-zA-Z]+\b')
                .hasMatch(lineText)) {
              if (lineText.length <= 15 && !lineText.contains(',')) {
                names.add(lineText);
              }
            }

            if (RegExp(r'\b(\+91\s?\d{10}|04\d{8}|\d{10})\b')
                .hasMatch(lineText)) {
              contactNumbers.add(lineText);
            }

            if (RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b')
                .hasMatch(lineText)) {
              emails.add(lineText);
            }

            if (RegExp(r'https?://\S+').hasMatch(lineText) ||
                RegExp(r'\bwww\.[A-Za-z0-9.-]+\b').hasMatch(lineText)) {
              websites.add(lineText);
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

      await databaseCRUDFunctionController.insertBusinessCard(
        BusinessCardModel(
          name: nameValue,
          contactNumber: contactNumberValue,
          email: emailValue,
          website: websiteValue,
        ),
      );
    }
  } catch (e) {
    print(e);
  }
}
