import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('diary');

class database_provider {
  static String? userUid;

  static Future<void> addItem({
    required String diaryTime,
    required String diaryTitle,
    required String diaryDescription,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "diaryTime": diaryTime,
      "diaryTitle": diaryTitle,
      "diaryDescription": diaryDescription,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Diary items added to the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }

  static Future<void> updateItem({
    required String diaryTime,
    required String diaryTitle,
    required String diaryDescription,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "diaryTime": diaryTime,
      "diaryTitle": diaryTitle,
      "diaryDescription": diaryDescription,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
