import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart';
import 'package:rentcarmobile/services/auth.dart';
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
                      //Driver Lisence Number - Car Lisence Number
                      Row(
                        children: [
                          //Driver Lisence Number
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.driverLicenseNumberController,
                              decoration: const InputDecoration(
                                hintText: "Driver Lisence Number ",
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
                                hintText: "Car Lisence Number",
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
                                      : "Driver Lisence Year",
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
                    child: const Text("Register"),
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
                            context, "You must fill all inputs", () {
                          Navigator.pop(context);
                        });
                      } else {
                        Response res = (await AuthService.registerDriver(
                          Driver(
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
                          ),
                        ));
                        if (res.statusCode != 200) {
                          List<String> errors = jsonDecode(res.body)["error"]
                              .toString()
                              .split(",");
                          List<String> errorMessages = [];

                          errors.forEach(
                            (element) {
                              errorMessages.add(element.split(":").last.trim());
                            },
                          );
                          WarningAlert.showWarningDialog(
                              context,
                              errorMessages[0] == "null"
                                  ? jsonDecode(res.body)["msg"]
                                  : errorMessages
                                      .toString()
                                      .replaceAll("[", "")
                                      .replaceAll("]", "")
                                      .replaceAll(",", "\n")
                                      .replaceAll("\n ", "\n"), () {
                            Navigator.pop(context);
                          });
                        } else {
                          WarningAlert.showWarningDialog(context,
                              "Congrulations! You have registered succesfully!",
                              () {
                            Navigator.pushNamed(context, "/");
                          });
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
