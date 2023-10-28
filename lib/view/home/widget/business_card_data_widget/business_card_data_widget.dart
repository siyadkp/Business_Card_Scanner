import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card_scanner/business_card_model/business_card_model.dart';
import 'package:business_card_scanner/controller/add_to_contact_funcatio/add_to_contact_funcatio.dart';
import 'package:business_card_scanner/controller/database/crud_functions/crud_functions.dart';
import 'package:business_card_scanner/view/edit/screen_edit.dart';
import '../show_alert_dialog_widget/show_alert_dialog_widget.dart';

class BusinessCardDataWidget extends StatelessWidget {
  BusinessCardDataWidget({
    Key? key,
    required this.businessCardData,
  }) : super(key: key);

  // Define the business card data and database CRUD function controller
  final BusinessCardModel businessCardData;
  final DabaseCURDfunctionController databaseCRUDFunctionController =
      Get.put(DabaseCURDfunctionController());

  @override
  Widget build(BuildContext context) {
    return buildCard(context);
  }

  // Widget to build the card with its content ---------------------------------
  Widget buildCard(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: buildCardDecoration(), // Define card decoration
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildIconContainer(), // Add icon container
          buildInfoSection(), // Add business card info section
          buildMoreOptionsButton(context), // Add more options button
        ],
      ),
    );
  }

  // Define the card's decoration ----------------------------------------------
  BoxDecoration buildCardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  // Create the icon container -------------------------------------------------
  Container buildIconContainer() {
    return Container(
      width: 100,
      height: double.infinity,
      color: const Color.fromARGB(255, 7, 205, 255),
      child: const Center(
        child: Icon(
          Icons.business,
          color: Colors.white,
          size: 48,
        ),
      ),
    );
  }

  // Build the information section of the business card ------------------------
  Expanded buildInfoSection() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
              child: Text(
                businessCardData.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              businessCardData.email,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
              child: Text(
                businessCardData.website,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Create the more options button --------------------------------------------
  IconButton buildMoreOptionsButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext ctx) {
            return buildMoreOptionsContent(ctx); // Build more options content
          },
        );
      },
      icon: const Icon(Icons.more_horiz_outlined),
    );
  }

  // Build the content of the more options bottom sheet ------------------------
  Column buildMoreOptionsContent(BuildContext ctx) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildBottomSheetButton(
          text: 'Add to contact',
          icon: Icons.supervised_user_circle_outlined,
          function: () => showAlertDialog(
              ctx,
              () => addToContacts(
                    businessCardData.name,
                    businessCardData.contactNumber,
                  ),
              'Add to Contacts',
              'Do you want to add this contact to your contact book?',
              'Your contact added'),
        ),
        buildBottomSheetButton(
          text: 'Edit',
          icon: Icons.edit,
          function: () {
            Get.to(ScreenEdit(
              businessCardData: businessCardData,
            ));
          },
        ),
        buildBottomSheetButton(
          text: 'Delete',
          icon: Icons.delete,
          function: () {
            showAlertDialog(
                ctx,
                () => databaseCRUDFunctionController
                    .deleteBusinessCard(businessCardData.id!),
                'Delete Business Card',
                'Are you sure you want to delete this business card? This action cannot be undone.',
                'Business card deleted');
          },
        )
      ],
    );
  }

  // Build a button in the bottom sheet ----------------------------------------
  Widget buildBottomSheetButton({
    required String text,
    required IconData icon,
    required Function() function,
  }) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Text(text),
          ],
        ),
      ),
    );
  }
}
