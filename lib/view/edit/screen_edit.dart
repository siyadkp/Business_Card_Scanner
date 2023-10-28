import 'package:business_card_scanner/business_card_model/business_card_model.dart';
import 'package:business_card_scanner/view/home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/database/crud_functions/crud_functions.dart';
import 'widget/textformfield_widget.dart';

class ScreenEdit extends StatefulWidget {
  const ScreenEdit({
    Key? key,
    required this.businessCardData,
  }) : super(key: key);

  final BusinessCardModel businessCardData;

  @override
  State<ScreenEdit> createState() => _ScreenEditState();
}

class _ScreenEditState extends State<ScreenEdit> {
  // Create an instance of the CRUD controller ---------------------------------
  final DabaseCURDfunctionController databaseCurdFunctionController =
      Get.put(DabaseCURDfunctionController());

  // Define text controllers for form fields -----------------------------------
  late TextEditingController name;
  late TextEditingController contactNumber;
  late TextEditingController email;
  late TextEditingController website;

  @override
  void initState() {
    super.initState();

    // Initialize text controllers with data from the provided business card ---
    name = TextEditingController(text: widget.businessCardData.name);
    contactNumber =
        TextEditingController(text: widget.businessCardData.contactNumber);
    email = TextEditingController(text: widget.businessCardData.email);
    website = TextEditingController(text: widget.businessCardData.website);
  }

  @override
  void dispose() {
    // Dispose of text controllers to avoid memory leaks -----------------------
    name.dispose();
    contactNumber.dispose();
    email.dispose();
    website.dispose();
    super.dispose();
  }

  // Function to update the business card data ---------------------------------
  void _updateBusinessCard(BuildContext context) async {
    // Create a BusinessCardModel with the updated data ------------------------
    final data = BusinessCardModel(
      name: name.text,
      contactNumber: contactNumber.text,
      email: email.text,
      website: website.text,
    );
    databaseCurdFunctionController.updateBusinessCard(
        widget.businessCardData.id!, data);
    // Show a dialog to indicate the update is successful ----------------------
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Successful'),
          content: const Text('The business card has been updated.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Get.offAll(const ScreenHome());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  // Function to build the app bar ---------------------------------------------
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Edit details'),
    );
  }

  // Function to build the body of the screen ----------------------------------
  Widget _buildBody(BuildContext context) {
    return ListView(
      children: [
        TextFormFiledWidget(
          title: 'Name',
          hintText: 'Enter your name',
          controller: name,
        ),
        TextFormFiledWidget(
          title: 'Contact number',
          hintText: 'Enter your name',
          controller: contactNumber,
        ),
        TextFormFiledWidget(
          title: 'Email',
          hintText: 'Enter your name',
          controller: email,
        ),
        TextFormFiledWidget(
          title: 'Website',
          hintText: 'Enter your name',
          controller: website,
        ),
        Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => _updateBusinessCard(context),
              child: const Text("Update"),
            ),
          ),
        ),
      ],
    );
  }
}
