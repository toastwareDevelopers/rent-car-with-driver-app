import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/assets_path.dart';
import '../utils/base64_converter.dart';

class ProfileIcon extends StatefulWidget {
  String selectedImage= "null";

  ProfileIcon(
      {super.key, required this.selectedImage});

  @override
  State<ProfileIcon> createState() => _ProfileIcon();
}

class _ProfileIcon extends State<ProfileIcon> {

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(
          top: phoneHeight * 0.04, bottom: phoneHeight * 0.04),
      child: Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).highlightColor,
              radius: 40,
              child: CircleAvatar(
                backgroundImage:
                widget.selectedImage != "null" ? Image.memory(
                    Base64Converter.decodeImage64(
                        widget.selectedImage)).image : AssetImage(AssetPaths.blankProfilePhotoPath),
                radius: 37.0,
              ),
            ),
            InkWell(
              onTap: () async {
                selectImage();
                setState(() {});
              },
              child: CircleAvatar(
                backgroundColor: Theme.of(context).highlightColor,
                radius: 13,
                child: CircleAvatar(
                  backgroundImage:
                  AssetImage(AssetPaths.uploadPhotoIconPath),
                  radius: 10.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // SELECT IMAGE FROM GALLERY
                        GestureDetector(
                          onTap: () async {
                            widget.selectedImage = await selectImageFromGallery();
                            if (widget.selectedImage != "null") {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }

                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      // edit this part
                                      AssetPaths.galleryImageIconPath,
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        // SELECT IMAGE FROM CAMERA
                        GestureDetector(
                          onTap: () async {
                            widget.selectedImage = await selectImageFromCamera();
                            if (widget.selectedImage != "null") {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      // edit this part (proper icon)
                                      AssetPaths.cameraImagePath,
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                        // REMOVE IMAGE
                        GestureDetector(
                          onTap: () async {
                            widget.selectedImage = removeImage();
                              Navigator.pop(context);
                              setState(() {});
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      // edit this part (proper icon)
                                      AssetPaths.removeImageIconPath,
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('Remove'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  // Select image from phone gallery
  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 90, maxHeight: 100, maxWidth: 100);
    if (file != null) {
      return Base64Converter.encodeImage64(file.path);
    } else {
      // Keep the current picture
      if(widget.selectedImage != "null") {
        return widget.selectedImage;
      } else {
        return "null";
      }
    }
  }

  // Select image from phone camera
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 90, maxHeight: 100, maxWidth: 100);
    if (file != null) {
      return Base64Converter.encodeImage64(file.path);
    } else {
      // Keep the current picture
      if(widget.selectedImage != "null") {
        return widget.selectedImage;
      } else {
        return "null";
      }
    }
  }

  // Remove image
  removeImage() {
    return "null";
  }
}