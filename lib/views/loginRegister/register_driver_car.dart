import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentcarmobile/constants/assets_path.dart';
import 'package:rentcarmobile/utils/base64_converter.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';

import '../../models/driver.dart';

class RegisterDriverCarScreen extends StatefulWidget {
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
  RegisterDriverCarScreen({super.key});
  @override
  State<RegisterDriverCarScreen> createState() =>
      _RegisterDriverCarScreenState();
}

class _RegisterDriverCarScreenState extends State<RegisterDriverCarScreen> {
  List<String> carPhotos = <String>["null"];
  @override
  Widget build(BuildContext context) {
    Driver driver = ModalRoute.of(context)!.settings.arguments as Driver;
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        child: Container(
          height: phoneHeight,
          width: phoneWidth,
          child: Column(
            children: <Widget>[
              //Register as a Driver yazan başlık
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(top: phoneHeight * 0.08),
                  child: Text(
                    "Register as a Driver",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              //Form inputları alanı
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.only(
                      left: phoneWidth * 0.07, right: phoneWidth * 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Add-Remove Car Photos
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: listCarPhotosWidget(phoneWidth, phoneHeight),
                          ),
                        ],
                      ),
                      //Driver Lisence Number - Car Lisence Number
                      Row(
                        children: [
                          //Driver Lisence Number
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.driverLicenseNumberController,
                              decoration: const InputDecoration(
                                hintText: "Driver License Number ",
                                hintMaxLines: 2,
                                isDense: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Car Lisence Number
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.carLicenseNumberController,
                              decoration: const InputDecoration(
                                hintText: "Car License Number",
                                hintMaxLines: 2,
                                isDense: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Driver Lisence Year - Car Age
                      Row(
                        children: [
                          //Driver Lisence Year
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                DatePicker.showDatePicker(
                                  context,
                                  theme: DatePickerTheme(
                                    doneStyle: TextStyle(
                                      color: Theme.of(context).highlightColor,
                                    ),
                                    itemStyle: TextStyle(
                                      color: Theme.of(context).highlightColor,
                                    ),
                                  ),
                                  showTitleActions: true,
                                  minTime: DateTime(1940, 1, 1),
                                  maxTime: DateTime.now(),
                                  onChanged: (date) {},
                                  onConfirm: (date) {
                                    setState(() {
                                      widget.driverLicenseYearController.text =
                                          date.toString().substring(0, 4);
                                    });
                                  },
                                  onCancel: () {
                                    setState(() {
                                      widget.driverLicenseYearController.text = "";
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 12),
                                alignment: Alignment.centerLeft,
                                height: phoneHeight * 0.06,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 218, 218, 218),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  widget.driverLicenseYearController.text != ""
                                      ? widget.driverLicenseYearController.text
                                      : "Driver License Year",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 96, 96, 96)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Car Model Year
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                DatePicker.showDatePicker(
                                  context,
                                  theme: DatePickerTheme(
                                    doneStyle: TextStyle(
                                      color: Theme.of(context).highlightColor,
                                    ),
                                    itemStyle: TextStyle(
                                      color: Theme.of(context).highlightColor,
                                    ),
                                  ),
                                  showTitleActions: true,
                                  minTime: DateTime(1940, 1, 1),
                                  maxTime: DateTime.now(),
                                  onChanged: (date) {},
                                  onConfirm: (date) {
                                    setState(() {
                                      widget.modelYearController.text =
                                          date.toString().substring(0, 4);
                                    });
                                  },
                                  onCancel: () {
                                    setState(() {
                                      widget.modelYearController.text = "";
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 12),
                                alignment: Alignment.centerLeft,
                                height: phoneHeight * 0.06,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 218, 218, 218),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  widget.modelYearController.text != ""
                                      ? widget.modelYearController.text
                                      : "Model Year",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 96, 96, 96)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Car Brand - Car Model
                      Row(
                        children: [
                          //Car Brand
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.carBrandController,
                              decoration: const InputDecoration(
                                hintText: "Car Brand ",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Car Model
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.carModelController,
                              decoration:
                                  const InputDecoration(hintText: "Car Model"),
                            ),
                          ),
                        ],
                      ),
                      //Car Color - Car Registration Plate
                      Row(
                        children: [
                          //Car Color
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.carColorController,
                              decoration: const InputDecoration(
                                hintText: "Car Color",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Car Registration Plate
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller:
                                  widget.carRegistrationPlateController,
                              decoration: const InputDecoration(
                                hintText: "Car Registration Plate",
                                hintMaxLines: 2,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Hourly Price - Tax Number
                      Row(
                        children: [
                          //Hourly Price
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.hourlyPriceController,
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
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Tax Number
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.taxNumberController,
                              decoration: const InputDecoration(
                                hintText: "Tax Number",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //Continue butonu alanı
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    child: const Text("Continue"),
                    onPressed: () async {
                      if (!controlInputsAreNotEmpty(
                          widget.driverLicenseNumberController.text,
                          widget.carLicenseNumberController.text,
                          widget.driverLicenseYearController.text,
                          widget.modelYearController.text,
                          widget.carBrandController.text,
                          widget.carModelController.text,
                          widget.carColorController.text,
                          widget.carRegistrationPlateController.text,
                          widget.hourlyPriceController.text,
                          widget.taxNumberController.text)) {
                        WarningAlert.showWarningDialog(
                            context, "Warning","You must fill all inputs", () {
                          Navigator.pop(context);
                        });
                      } else if(carPhotos.length - 1 < 3) {
                        WarningAlert.showWarningDialog(
                            context, "Warning","You must upload at least 3 Car Photos!", () {
                          Navigator.pop(context);
                        });
                      } else {
                        Navigator.of(context).pushNamed(
                          "/registerDriverDocs",
                          arguments: Driver(
                            bio: driver.bio,
                            birthDate: driver.birthDate,
                            email: driver.email,
                            gender: driver.gender,
                            hourlyPrice:
                            int.parse(widget.hourlyPriceController.text),
                            languages: driver.languages,
                            licenseNumber:
                            widget.driverLicenseNumberController.text,
                            licenseYear:
                            widget.driverLicenseYearController.text,
                            location: driver.location,
                            name: driver.name,
                            nationalId: driver.nationalId,
                            passportNumber: driver.passportNumber,
                            password: driver.password,
                            phoneNumber: driver.phoneNumber,
                            rating: 0,
                            skills: driver.skills,
                            surname: driver.surname,
                            taxNumber: widget.taxNumberController.text,
                            carInfo: {
                              "licenseNumber":
                              widget.carLicenseNumberController.text,
                              "plateNumber":
                              widget.carRegistrationPlateController.text,
                              "brand": widget.carBrandController.text,
                              "model": widget.carModelController.text,
                              "year": widget.modelYearController.text,
                              "color": widget.carColorController.text,
                            },
                            profileImage: driver.profileImage,
                            carPhotos: carPhotos,
                          ),
                        );
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
                            carPhotos[index] = await selectImageFromCamera(index);
                            if (carPhotos[index] != "null") {
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

  bool controlInputsAreNotEmpty(
      String driverLicenseNumber,
      String carLicenseNumber,
      String driverLicenseYear,
      String modelYear,
      String carBrand,
      String carModelName,
      String carColor,
      String carRegistrationPlate,
      String price,
      String taxNumber) {
    return driverLicenseNumber.isNotEmpty &&
        carLicenseNumber.isNotEmpty &&
        driverLicenseYear.isNotEmpty &&
        modelYear.isNotEmpty &&
        carBrand.isNotEmpty &&
        carModelName.isNotEmpty &&
        carColor.isNotEmpty &&
        carRegistrationPlate.isNotEmpty &&
        price.isNotEmpty &&
        taxNumber.isNotEmpty;
  }
}

