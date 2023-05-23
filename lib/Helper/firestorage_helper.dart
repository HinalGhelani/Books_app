import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FireBaseStorageHelper {
  FireBaseStorageHelper._();

  FireBaseStorageHelper fireBaseStorageHelper = FireBaseStorageHelper._();

  Reference storageRef = FirebaseStorage.instance.ref();

  uploadFile({required String imagePath, required String bId}) {
    final ref = storageRef.child("images/$bId.jpg");

    File file = File(imagePath);

    try {
      ref.putFile(file).toString();
    } catch (e) {
      print("Error : $e");
    }

    Future<String> getImageURL({required String bId}) async {
      String imageURL = await ref.child("images/$bId.jpg").getDownloadURL();

      print("URL = $imageURL");

      return imageURL;
    }
  }
}
