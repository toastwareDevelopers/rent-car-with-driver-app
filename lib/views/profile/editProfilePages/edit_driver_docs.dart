import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentcarmobile/utils/base64_converter.dart';

import '../../../constants/assets_path.dart';
import '../../../main.dart';
import '../../../services/profile.dart';
import '../../../utils/warning_alert.dart';
import 'edit_driver_auth.dart';

class EditDriverDocsScreen extends StatefulWidget {
  EditDriverDocsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _EditDriverDocsScreenState();
}

class _EditDriverDocsScreenState extends State<EditDriverDocsScreen> {
  List<String> legalDocumentPhotos = <String>["null"];
  Size size = WidgetsBinding.instance.window.physicalSize;
  double ratio = WidgetsBinding.instance.window.devicePixelRatio;
  double phoneHeight = 0.0;
  double phoneWidth = 0.0;

  @override
  void initState() {
    super.initState();
    phoneHeight = size.height / ratio;
    phoneWidth = size.width / ratio;
    legalDocumentPhotos = EditDriverAuthScreen.editDriver.legalDocumentPhotos.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        child: SizedBox(
          height: phoneHeight,
          width: phoneWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Legal Documents",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: phoneWidth * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Please upload all necessary legal documents :",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: phoneWidth * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "⋅  Identity Card (Front, Back)",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "⋅  Driving License (Front, Back)",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "⋅  Registration Documents",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "⋅  Car Insurance Documents",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "⋅  Tax Plate",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "⋅  A1 Permission Documents",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              listDocumentPhotosWidget(phoneWidth, phoneHeight),
              const SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 25),
                  child: ElevatedButton(
                    child: const Text("Save"),
                    onPressed: () async {
                      if(legalDocumentPhotos.length - 1 < 6) {
                        WarningAlert.showWarningDialog(
                            context, "You must upload atleast 6 legal document photos!", () {
                          Navigator.pop(context);
                        });
                      } else {
                        EditDriverAuthScreen.editDriver.legalDocumentPhotos = legalDocumentPhotos;
                        if ((await ProfileService.editDriver(EditDriverAuthScreen.editDriver, RentVanApp.userId)) !=
                            200) {
                          WarningAlert.showWarningDialog(
                              context, "An Error occurred, We can not change your data!.", () {
                            Navigator.pop(context);
                          });
                        } else {
                          SnackBar snackbar = const SnackBar(content: Text("Profile updated!"), duration: Duration(seconds: 2),);
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          Navigator.pushReplacementNamed(context, "/profileDriverPersonal", arguments: RentVanApp.userId);
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // List of document photos
  Container listDocumentPhotosWidget(double phoneWidth, double phoneHeight) {
    return Container(
      height: phoneHeight * 0.40,
      width: phoneWidth * 0.88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 218, 218, 218),
        border: Border.all(width: 10, color: const Color.fromARGB(255, 218, 218, 218)),
      ),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 3,
        ),
        itemCount: legalDocumentPhotos.length,
        itemBuilder: ((context, index) => Stack(
          children: legalDocumentPhotos[index] != "null" ? [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  //color: Color.fromARGB(255, 244, 243, 243),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 167, 117, 77),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                uploadPhotosWidget(100, 100, index),
              ],
            ),
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    legalDocumentPhotos.removeAt(index);
                  });
                },
                child: const Align(
                  alignment: FractionalOffset.topRight,
                  child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close, color: Colors.red),
                  ),
                ),
              ),
            ),
          ] :
          [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  //color: Color.fromARGB(255, 244, 243, 243),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 167, 117, 77),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                uploadPhotosWidget(100, 100, index),
              ],
            ),
          ],
        )),
      ),
    );
  }

  // Upload photos (from gallery or camera)
  InkWell uploadPhotosWidget(double width, double height, int index) {
    return  InkWell(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: legalDocumentPhotos[index] != "null" ? Border.all(width: 4, color: const Color.fromARGB(255, 167, 117, 77)) : null,
          color: Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            fit:  legalDocumentPhotos[index] != "null" ? BoxFit.fill : null,
            alignment: Alignment.center,
            image: legalDocumentPhotos[index] != "null" ?
            Image.memory(
                Base64Converter.decodeImage64(
                    legalDocumentPhotos[index])).image :
            AssetImage(AssetPaths.uploadImageIconPath),
          ),
        ),
      ),
      onTap: () async {
        await selectImage(index);
        setState(() {
          if((legalDocumentPhotos[index] != "null") &&
              (legalDocumentPhotos.length - 1 == index || legalDocumentPhotos.length == 1)) {
            legalDocumentPhotos.add("null");
          }
        });
      },
    );
  }

  // Select image
  Future selectImage(int index) {
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
                            legalDocumentPhotos[index] = await selectImageFromGallery(index);
                            if (legalDocumentPhotos[index] != "null") {
                              Navigator.pop(context);
                              setState(() {EditDriverAuthScreen.editDriver.legalDocumentPhotos = legalDocumentPhotos;});
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
                            legalDocumentPhotos[index] = await selectImageFromCamera(index);
                            if (legalDocumentPhotos[index] != "null") {
                              Navigator.pop(context);
                              setState(() {EditDriverAuthScreen.editDriver.legalDocumentPhotos = legalDocumentPhotos;});
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
  selectImageFromGallery(int index) async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 100, maxHeight: 400, maxWidth: 400);
    if (file != null) {
      return Base64Converter.encodeImage64(file.path);
    } else {
      // Keep the current picture
      if(legalDocumentPhotos[index] != "null") {
        return legalDocumentPhotos[index];
      } else {
        return "null";
      }
    }
  }

  // Select image from phone camera
  selectImageFromCamera(int index) async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100, maxHeight: 400, maxWidth: 400);
    if (file != null) {
      return Base64Converter.encodeImage64(file.path);
    } else {
      // Keep the current picture
      if(legalDocumentPhotos[index] != "null") {
        return legalDocumentPhotos[index];
      } else {
        return "null";
      }
    }
  }
}