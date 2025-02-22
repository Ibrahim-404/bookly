import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'picker_image_state.dart';

class PickerImageCubit extends Cubit<PickerImageState> {
  PickerImageCubit() : super(PickerImageInitial());

  File? imageFile;

  // Pick Image from Gallery
  void getImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      emit(PickerImageLoading());

      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        emit(PickerImageSuccess(imageFile: imageFile!));

        // Upload Image to Firebase Storage
        await uploadImageToStorage();
      } else {
        emit(PickerImageFailure()); // Emit failure if no file is selected
      }
    } catch (e) {
      emit(PickerImageFailure());
    }
  }

  // Upload Image to Firebase Storage and Save URL in Firestore
  Future<void> uploadImageToStorage() async {
    if (imageFile == null) return;

    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      Reference storageRef = FirebaseStorage.instance.ref().child('users/$userId/profile.jpg');

      UploadTask uploadTask = storageRef.putFile(imageFile!);
      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();

      // Save the image URL to Firestore
      await putImageToFireBase(imageUrl);

      emit(PickerImageCovertImageToLinkSuccess(imageUrl));
    } catch (e) {
      emit(PickerImageCovertImageToLinkFailure(e.toString()));
    }
  }

  // Save image link to Firestore
  Future<void> putImageToFireBase(String imageUrl) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection("users").doc(userId).set(
        {"image": imageUrl},
        SetOptions(merge: true), // Prevents overwriting existing fields
      );
    } catch (e) {
      emit(PickerImageCovertImageToLinkFailure(e.toString()));
    }
  }
}
