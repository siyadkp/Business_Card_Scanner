// Business Card Model----------------------------------------------------------

class BusinessCardModel {
  final int? id;
  final String name;
  final String contactNumber;
  final String email;
  final String website;
  BusinessCardModel(
      {this.id,
      required this.name,
      required this.contactNumber,
      required this.email,
      required this.website});
}
