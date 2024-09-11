import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/user/user.dart';

class UserRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future saveUserData(UserModel user) async {
    try {
      //print("user id :${user.uid}");
      await _firestore.collection('users').doc(user.uid).set(user.toJson());
    } catch (error) {
     // debug//print('Error saving user data: $error');
      throw Exception("Error while saving data to the database $error");
    }
  }

  Future getUserData(String userId) async {
    try {
      final documentSnapshot =
          await _firestore.collection('users').doc(userId).get();
      if (documentSnapshot.exists) {
        return UserModel.fromJson(documentSnapshot.data() ?? {});
      } else {
        return {}; // Return empty map if user doesn't exist
      }
    } catch (error) {
      // Handle errors appropriately
      throw Exception('Error getting user data: $error');
      ////print('Error getting user data: $error');
      //return {}; // Return empty map on error
    }
  }

  Future updataUserData(
      {required String userId,
      required String field,
      required dynamic data}) async {
    //print("userId $userId");

    try {
      print("fire");
      print("user Id: $userId");
      
      await _firestore
          .collection("users")
          .doc(userId)
          .update({field: data}).then((value){print("done");}). catchError((error) {
        throw Exception('Failed to update user data');
      });
    } catch (error) {
      //print(error);
      throw Exception('Failed to update user data');
    }
  }

  Future<String> uploadImage(
      {required String userId, required XFile image}) async {
    try {
      final storage = FirebaseStorage.instance;
      final imageName = '$userId.jpg';
      final reference = storage.ref().child('profile_pictures/$imageName');
      final uploadTask = reference.putFile(File(image.path));
      final snapshot = await uploadTask.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      await updataUserData(userId: userId, field: "imageUrl", data: url);
      return url.toString();
    } catch (error) {
      //print("error yad");
      throw Exception("Faild to Upload Image");
    }
  }


  /* Future deleteHistoryItem(String userID, List data) async {
    try {
      await _firestore.collection("users").doc(userID).set(
          {"history": data}).then((value) => debug//print("delete history item"));
    } catch (error) {
      throw Exception("Faild to delete history item");
    }
  } */
}
