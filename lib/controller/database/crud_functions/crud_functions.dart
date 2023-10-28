import 'package:sqflite/sqlite_api.dart';
import '../../../business_card_model/business_card_model.dart';
import '../database_connection/database_connection.dart';

// Database Insert function -----------------------------------------------------
Future<void> insertBusinessCard(BusinessCardModel businessCard) async {
  final db = await databaseConnection();
  final data = {
    "name": businessCard.name,
    "contactNumber": businessCard.contactNumber,
    "email": businessCard.email,
    "website": businessCard.website
  };
  await db.insert('BusinessCards', data,
      conflictAlgorithm: ConflictAlgorithm.replace);
  await getAllBusinessCards();
}

// Database GetAll function from BusinessCards collection ----------------------
Future<List<BusinessCardModel>> getAllBusinessCards() async {
  final db = await databaseConnection();
  final List<Map<String, dynamic>> cardDataMaps =
      await db.query('BusinessCards');
  return cardDataMaps
      .map((cardMap) => BusinessCardModel(
            id: cardMap['id'],
            name: cardMap['name'],
            contactNumber: cardMap['contactNumber'],
            email: cardMap['email'],
            website: cardMap['website'],
          ))
      .toList();
}

// Database Delete function for BusinessCards collection -----------------------
Future<void> deleteBusinessCard(int id) async {
  final db = await databaseConnection();
  await db.delete(
    'BusinessCards',
    where: 'id = ?',
    whereArgs: [id],
  );
}

// Database Update function for BusinessCards collection -----------------------
Future<void> updateBusinessCard(
    int id, BusinessCardModel businessCardData) async {
  final db = await databaseConnection();
  final data = {
    "name": businessCardData.name,
    "contactNumber": businessCardData.contactNumber,
    "email": businessCardData.email,
    "website": businessCardData.website
  };

  await db.update(
    'BusinessCards',
    data,
    where: 'id = ?',
    whereArgs: [id],
  );
  await getAllBusinessCards(); // You may want to update your UI or retrieve the updated data.
}
