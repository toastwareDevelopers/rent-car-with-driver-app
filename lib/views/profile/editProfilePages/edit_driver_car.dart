import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentcarmobile/utils/base64_converter.dart';

import '../../../constants/assets_path.dart';
import '../../../utils/warning_alert.dart';
import 'edit_driver_auth.dart';

class EditDriverCarScreen extends StatefulWidget {
  EditDriverCarScreen({super.key});

  @override
  State<EditDriverCarScreen> createState() => _EditDriverCarScreenState();
}

class _EditDriverCarScreenState extends State<EditDriverCarScreen> {
  TextEditingController driverLicenseNumberController = TextEditingController();
  TextEditingController carLicenseNumberController = TextEditingController();
  TextEditingController driverLicenseYearController = TextEditingController();
  TextEditingController modelYearController = TextEditingController();
  TextEditingController carBrandController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  TextEditingController carRegistrationPlateController =
      TextEditingController();
  TextEditingController hourlyPriceController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();
  Size size = WidgetsBinding.instance.window.physicalSize;
  double ratio = WidgetsBinding.instance.window.devicePixelRatio;
  double phoneHeight = 0.0;
  double phoneWidth = 0.0;
  List<String>carPhotos = <String>["null"];

  @override
  void initState() {
    super.initState();
    phoneHeight = size.height / ratio;
    phoneWidth = size.width / ratio;
    driverLicenseNumberController.text = EditDriverAuthScreen.editDriver.licenseNumber;
    carLicenseNumberController.text = EditDriverAuthScreen.editDriver.carInfo["licenseNumber"];
    carRegistrationPlateController.text = EditDriverAuthScreen.editDriver.carInfo["plateNumber"];
    carBrandController.text = EditDriverAuthScreen.editDriver.carInfo["brand"];
    carModelController.text = EditDriverAuthScreen.editDriver.carInfo["model"];
    carColorController.text = EditDriverAuthScreen.editDriver.carInfo["color"];
    modelYearController.text = EditDriverAuthScreen.editDriver.carInfo["year"].toString().length > 4 ?
    EditDriverAuthScreen.editDriver.carInfo["year"].substring(0, 4) :
    EditDriverAuthScreen.editDriver.carInfo["year"];
    driverLicenseYearController.text = EditDriverAuthScreen.editDriver.licenseYear.toString().length > 4 ?
    EditDriverAuthScreen.editDriver.licenseYear.substring(0, 4) :
    EditDriverAuthScreen.editDriver.licenseYear;
    hourlyPriceController.text = EditDriverAuthScreen.editDriver.hourlyPrice.toString();
    taxNumberController.text = EditDriverAuthScreen.editDriver.taxNumber;
    carPhotos = EditDriverAuthScreen.editDriver.carPhotos.toList();
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
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(top: phoneHeight * 0.08),
                  child: Text(
                    "Edit Driver",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.only(
                      left: phoneWidth * 0.07, right: phoneWidth * 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Add-Remove Car Photos - Editable
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: listCarPhotosWidget(phoneWidth, phoneHeight),
                          ),
                        ],
                      ),
                      //Driver Licence Number - Car Licence Number
                      Row(
                        children: [
                          //Driver Licence Number - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: driverLicenseNumberController,
                              decoration: const InputDecoration(
                                hintText: "Driver License Number ",
                                hintMaxLines: 2,
                                isDense: true,
                              ),
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.licenseNumber = value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Car Licence Number - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: carLicenseNumberController,
                              decoration: const InputDecoration(
                                hintText: "Car License Number",
                                hintMaxLines: 2,
                                isDense: false,
                              ),
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.carInfo["licenseNumber"] = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      //Driver Licence Year - Car Age
                      Row(
                        children: [
                          //Driver Licence Year - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: driverLicenseYearController,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              maxLength: 4,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]"),
                                ),
                              ],
                              decoration: const InputDecoration(
                                hintText: "Driver Licence Year ",
                                hintMaxLines: 2,
                                isDense: false,
                                counterText: "",
                              ),
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.licenseYear = value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Car Model Year - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: modelYearController,
                              maxLength: 4,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]"),
                                ),
                              ],
                              decoration: const InputDecoration(
                                hintText: "Model Year",
                                counterText: "",
                              ),
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.carInfo["year"] = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      //Car Brand - Car Model
                      Row(
                        children: [
                          //Car Brand - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: carBrandController,
                              decoration: const InputDecoration(
                                hintText: "Car Brand ",
                              ),
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.carInfo["brand"] = value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Car Model - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: carModelController,
                              decoration:
                                  const InputDecoration(hintText: "Car Model"),
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.carInfo["model"] = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      //Car Color - Car Registration Plate
                      Row(
                        children: [
                          //Car Color - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: carColorController,
                              decoration: const InputDecoration(
                                hintText: "Car Color",
                              ),
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.carInfo["color"] = value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Car Registration Plate - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: carRegistrationPlateController,
                              decoration: const InputDecoration(
                                hintText: "Car Registration Plate",
                                hintMaxLines: 2,
                                isDense: true,
                              ),
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.carInfo["plateNumber"] = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      //Hourly Price - Tax Number
                      Row(
                        children: [
                          //Hourly Price - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: hourlyPriceController,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]"),
                                ),
                              ],
                              decoration: const InputDecoration(
                                hintText: "Hourly Price (TL)",
                                hintMaxLines: 2,
                                isDense: false,
                              ),
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.hourlyPrice = int.parse(value);
                              },
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Tax Number - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: taxNumberController,
                              decoration: const InputDecoration(
                                hintText: "Tax Number",
                              ),
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.taxNumber = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //Continue Button
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                      child: const Text("Continue"),
                      onPressed: () {
                        if(carPhotos.length - 1 < 3) {
                          WarningAlert.showWarningDialog(
                              context, "You must upload atleast 3 car photos!", () {
                            Navigator.pop(context);
                          });
                        } else {
                          EditDriverAuthScreen.editDriver.hourlyPrice = int.parse(hourlyPriceController.text);
                          EditDriverAuthScreen.editDriver.licenseNumber = driverLicenseNumberController.text;
                          EditDriverAuthScreen.editDriver.licenseYear = driverLicenseYearController.text;
                          EditDriverAuthScreen.editDriver.taxNumber = taxNumberController.text;
                          EditDriverAuthScreen.editDriver.carInfo["licenseNumber"] = carLicenseNumberController.text;
                          EditDriverAuthScreen.editDriver.carInfo["plateNumber"] = carRegistrationPlateController.text;
                          EditDriverAuthScreen.editDriver.carInfo["brand"] = carBrandController.text;
                          EditDriverAuthScreen.editDriver.carInfo["model"] = carModelController.text;
                          EditDriverAuthScreen.editDriver.carInfo["year"] = modelYearController.text;
                          EditDriverAuthScreen.editDriver.carInfo["color"] = carColorController.text;
                          EditDriverAuthScreen.editDriver.carPhotos = carPhotos;
                          Navigator.of(context).pushNamed('/editDriverDocs');
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Listview of photos
  Container listCarPhotosWidget(double phoneWidth, double phoneHeight) {
    return Container(
      padding: EdgeInsets.only(left: phoneWidth * 0.03,right : phoneWidth * 0.03,top: phoneHeight*0.01, bottom:  phoneHeight*0.01),
      height: phoneHeight * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 218, 218, 218),
      ),
      child: ListView.separated(
        itemCount: carPhotos.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
          width: phoneWidth * 0.01,
        ),
        itemBuilder: ((context, index) => Stack(
          children: carPhotos[index] != "null" ? [
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
                    carPhotos.removeAt(index);
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
          border: carPhotos[index] != "null" ? Border.all(width: 4, color: const Color.fromARGB(255, 167, 117, 77)) : null,
          color: Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            fit:  carPhotos[index] != "null" ? BoxFit.fill : null,
            alignment: Alignment.center,
            image: carPhotos[index] != "null" ?
            Image.memory(
                Base64Converter.decodeImage64(
                    carPhotos[index])).image :
            AssetImage(AssetPaths.uploadImageIconPath),
          ),
        ),
      ),
      onTap: () async {
        await selectImage(index);
        setState(() {
          if((carPhotos[index] != "null") &&
              (carPhotos.length - 1 == index || carPhotos.length == 1)) {
            carPhotos.add("null");
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
                            carPhotos[index] = await selectImageFromGallery(index);
                            if (carPhotos[index] != "null") {
                              Navigator.pop(context);
                              setState(() {EditDriverAuthScreen.editDriver.carPhotos = carPhotos;});
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
                            carPhotos[index] = await selectImageFromCamera(index);
                            if (carPhotos[index] != "null") {
                              Navigator.pop(context);
                              setState(() {EditDriverAuthScreen.editDriver.carPhotos = carPhotos;});
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
        .pickImage(source: ImageSource.gallery, imageQuality: 100, maxHeight: 300, maxWidth: 300);
    if (file != null) {
      return Base64Converter.encodeImage64(file.path);
    } else {
      // Keep the current picture
      if(carPhotos[index] != "null") {
        return carPhotos[index];
      } else {
        return "null";
      }
    }
  }

  // Select image from phone camera
  selectImageFromCamera(int index) async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100, maxHeight: 300, maxWidth: 300);
    if (file != null) {
      return Base64Converter.encodeImage64(file.path);
    } else {
      // Keep the current picture
      if(carPhotos[index] != "null") {
        return carPhotos[index];
      } else {
        return "null";
      }
    }
  }
}