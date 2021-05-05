import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI{
  final Reference _storageReference = FirebaseStorage.instance.ref();

  Future<UploadTask> uploadProfilePic(String path, File image) async {
    await _storageReference.child('profile_pictures/$path').putFile(image);
  }

  Future<String> getImageUrl(String imageId) async {
    ImagePicker picker = ImagePicker();
    PickedFile imagePicked =
    await picker.getImage(source: ImageSource.gallery, imageQuality: 80);
    File imageFile = File(imagePicked.path);
    UploadTask uploadTask = await uploadProfilePic(imageId, imageFile);
    return await (await uploadTask.snapshot).ref.getDownloadURL();
  }
}

