import 'package:contacts_service/contacts_service.dart';
import '../permission_access_function/permission_access_function.dart';

// Contacte number adding to contact book function -----------------------------
Future<void> addToContacts(String name, String phoneNumber) async {
  await requestContactPermissionOfContacs();

  // Create a Contact object.
  final contact = Contact();
  contact.givenName = name;

  // Create a Phone object.
  final phone = Item(
    label: 'mobile',
    value: phoneNumber,
  );
  contact.phones = [phone];

  try {
    await ContactsService.addContact(contact);
  } catch (e) {
    print('Error opening contact for editing: $e');
  }
}
