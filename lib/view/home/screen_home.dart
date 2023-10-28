import 'package:flutter/material.dart';
import 'package:business_card_scanner/controller/database/crud_functions/crud_functions.dart';
import 'package:get/get.dart';
import '../../business_card_model/business_card_model.dart';
import '../../controller/orc_scanning_functions/orc_scanning_functions.dart';
import 'widget/business_card_data_widget/business_card_data_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  // Function to build the list view of business card data ---------------------
  Widget _buildBusinessCardList(List<BusinessCardModel> data) {
    if (data.isEmpty) {
      return const Center(child: Text('No data found'));
    } else {
      return ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) =>
            BusinessCardDataWidget(businessCardData: data[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: data.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _buildAppBar(context),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  // Function to build the app bar ---------------------------------------------
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Home'),
    );
  }

  // Function to build the body of the screen ----------------------------------
  Widget _buildBody() {
    return GetBuilder<DabaseCURDfunctionController>(
      builder: (controller) {
        return _buildBusinessCardList(controller.businessCardsData);
      },
    );
  }

  // Function to build the floating action button ------------------------------
  FloatingActionButton _buildFloatingActionButton() {
    return const FloatingActionButton(
      onPressed: orcScanner,
      tooltip: 'Scan Business Card',
      child: Icon(Icons.document_scanner_outlined),
    );
  }
}
