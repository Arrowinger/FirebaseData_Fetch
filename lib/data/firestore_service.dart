import 'package:assignment1/data/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  static final FirestoreService _firestoreService =
      FirestoreService._internal();
  Firestore _db = Firestore.instance;

  FirestoreService._internal();

  factory FirestoreService() {
    return _firestoreService;
  }
  Stream<List<Message>> getMessages() {
    return _db.collection('message').snapshots().map(
          (snapshot) => snapshot.documents.map(
            (doc) => Message.fromMap(doc.data),
          ).toList(),
        );
  }
}
