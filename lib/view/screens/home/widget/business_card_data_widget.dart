import 'package:business_card_scanner/business_card_model/business_card_model.dart';
import 'package:business_card_scanner/view/screens/edit/screen_edit.dart';
import 'package:flutter/material.dart';

import '../../../../controller/add_to_contact_funcatio/add_to_contact_funcatio.dart';
import '../../../../controller/database/crud_functions/crud_functions.dart';

class BusinessCardDataWidget extends StatelessWidget {
  const BusinessCardDataWidget({super.key, required this.businessCardData});
  final BusinessCardModel businessCardData;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100,
              height: 70,
              color: const Color.fromARGB(255, 7, 205, 255),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  businessCardData.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  businessCardData.id.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  businessCardData.website,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => addToContacts(businessCardData.name,
                                  businessCardData.contactNumber),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: const Row(
                                  children: [
                                    Icon(Icons.supervised_user_circle_outlined),
                                    SizedBox(width: 16),
                                    Text("Add to contact"),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScreenEdit(
                                        businessCardData: businessCardData),
                                  )),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: const Row(
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(width: 16),
                                    Text("Edit"),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  deleteBusinessCard(businessCardData.id!),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: const Row(
                                  children: [
                                    Icon(Icons.delete),
                                    SizedBox(width: 16),
                                    Text("Delete"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.more_horiz_outlined))
          ],
        ));
  }
}
