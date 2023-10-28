import 'package:business_card_scanner/business_card_model/business_card_model.dart';
import 'package:flutter/material.dart';
import '../../../controller/database/crud_functions/crud_functions.dart';
import 'widget/textformfield_widget.dart';

class ScreenEdit extends StatefulWidget {
  const ScreenEdit({super.key, required this.businessCardData});

  final BusinessCardModel businessCardData;

  @override
  State<ScreenEdit> createState() => _ScreenEditState();
}

class _ScreenEditState extends State<ScreenEdit> {
  late TextEditingController name;

  late TextEditingController contactNumber;

  late TextEditingController email;

  late TextEditingController website;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.businessCardData.name);
    contactNumber =
        TextEditingController(text: widget.businessCardData.contactNumber);
    email = TextEditingController(text: widget.businessCardData.email);
    website = TextEditingController(text: widget.businessCardData.website);
  }

  @override
  void dispose() {
    name.dispose();
    contactNumber.dispose();
    email.dispose();
    website.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Edit details'),
      ),
      body: Column(
        children: [
          TextFormFiledWidget(
              title: 'Name', hintText: 'Enter your name', controller: name),
          TextFormFiledWidget(
              title: 'Contact number',
              hintText: 'Enter your name',
              controller: contactNumber),
          TextFormFiledWidget(
              title: 'Email', hintText: 'Enter your name', controller: email),
          TextFormFiledWidget(
              title: 'Website',
              hintText: 'Enter your name',
              controller: website),
          ElevatedButton(
            onPressed: () {
              final data = BusinessCardModel(
                  name: name.text,
                  contactNumber: contactNumber.text,
                  email: email.text,
                  website: website.text);
              updateBusinessCard(widget.businessCardData.id!, data);
            },
            child: const Text("Update"),
          )
        ],
      ),
    );
  }
}
