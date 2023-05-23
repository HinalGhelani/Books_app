import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  CollectionReference? collectionReference;

  connectCollection() async {
    collectionReference = fireStore.collection('Books');
  }

  Future<void> addBooks({required String name}) async {
    connectCollection();

    String id = DateTime.now().millisecondsSinceEpoch.toString();

    await collectionReference!
        .doc(id)
        .set({
          'id': id,
          'name': name,
        })
        .then(
          (value) => print("Notes is add...."),
        )
        .catchError((error) => print("$error"));

    print("================================================");
    print(name);
    print("================================================");
  }

  removeBooks({required String id}) {
    connectCollection();

    collectionReference!
        .doc(id)
        .delete()
        .then((value) => print("Notes delete"))
        .catchError((error) => print("Notes not delete"));
  }

  editBooks({required String id, required Map<Object, Object> data}) {
    connectCollection();

    collectionReference!
        .doc(id)
        .update(data)
        .then((value) => print("Books Edit"))
        .catchError(
          (error) =>
              print("====================\n$error\n======================"),
        );
  }

  Stream<QuerySnapshot<Object?>> getBooks() {
    connectCollection();

    return collectionReference!.snapshots();
  }
}
