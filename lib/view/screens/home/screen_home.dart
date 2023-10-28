import 'package:flutter/material.dart';
import 'package:business_card_scanner/controller/database/crud_functions/crud_functions.dart';
import 'package:business_card_scanner/controller/orc_scanning_functions/orc_scanning_functions.dart';
import 'widget/business_card_data_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: getAllBusinessCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Loading data...'));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found'));
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => BusinessCardDataWidget(
                  businessCardData: snapshot.data![index]),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: snapshot.data!.length,
            );
          }
        },
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: orcScanner,
        tooltip: 'Scan Business Card',
        child: Icon(Icons.document_scanner_outlined),
      ),
    );
  }
}
