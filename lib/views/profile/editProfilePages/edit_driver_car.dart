import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';

import '../../../models/driver.dart';
import '../../../services/profile.dart';

class EditDriverCarScreen extends StatefulWidget {
  const EditDriverCarScreen({super.key});
  @override
  State<EditDriverCarScreen> createState() => _EditDriverCarScreenState();
}

class _EditDriverCarScreenState extends State<EditDriverCarScreen> {
  TextEditingController driverLicenceNumberController = TextEditingController();
  TextEditingController carLicenceNumberController = TextEditingController();
  TextEditingController driverLicenceYearController = TextEditingController();
  TextEditingController modelYearController = TextEditingController();
  TextEditingController carBrandController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  TextEditingController carRegistrationPlateController =
      TextEditingController();
  TextEditingController hourlyPriceController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();

  static int flag = 0;

  @override
  Widget build(BuildContext context) {
    Driver driver = ModalRoute.of(context)!.settings.arguments
        as Driver; // Receive driver data from previous page
    // double phoneHeight = MediaQuery.of(context).size.height;
    // double phoneWidth = MediaQuery.of(context).size.width;
    Size size = WidgetsBinding.instance.window.physicalSize;
    double ratio = WidgetsBinding.instance.window.devicePixelRatio;
    double phoneHeight = size.height / ratio;
    double phoneWidth = size.width / ratio;

    if(flag >= 0) {
      driverLicenceNumberController.text = driver.licenceNumber;
      carLicenceNumberController.text = driver.carInfo["licenseYear"];
      carRegistrationPlateController.text = driver.carInfo["plateNumber"];
      carBrandController.text = driver.carInfo["brand"];
      carModelController.text = driver.carInfo["model"];
      carColorController.text = driver.carInfo["color"];
      modelYearController.text = driver.carInfo["year"];
      driverLicenceYearController.text = driver.licenceYear;
      hourlyPriceController.text = driver.hourlyPrice.toString();
      taxNumberController.text = driver.taxNumber;
    }

    flag++;

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
                      //Driver Licence Number - Car Licence Number
                      Row(
                        children: [
                          //Driver Licence Number - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: driverLicenceNumberController,
                              decoration: const InputDecoration(
                                hintText: "Driver Licence Number ",
                                hintMaxLines: 2,
                                isDense: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Car Licence Number - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: carLicenceNumberController,
                              decoration: const InputDecoration(
                                hintText: "Car Licence Number",
                                hintMaxLines: 2,
                                isDense: false,
                              ),
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
                              controller: driverLicenceYearController,
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
                      child: const Text("Save"),
                      onPressed: () async {
                        if ((await ProfileService.editDriver(
                                Driver(
                                  info: driver.info,
                                  birthDate: driver.birthDate,
                                  email: driver.email,
                                  gender: driver.gender,
                                  hourlyPrice:
                                      int.parse(hourlyPriceController.text),
                                  languages: driver.languages,
                                  licenceNumber:
                                      carLicenceNumberController.text,
                                  licenceYear: driverLicenceYearController.text,
                                  location: driver.location,
                                  name: driver.name,
                                  nationalId: driver.nationalId,
                                  passportNumber: driver.passportNumber,
                                  password: driver.password,
                                  phoneNumber: driver.phoneNumber,
                                  skills: driver.skills,
                                  surname: driver.surname,
                                  taxNumber: taxNumberController.text,
                                  carInfo: {
                                    "licenseNumber":
                                        carLicenceNumberController.text,
                                    "plateNumber":
                                        carRegistrationPlateController.text,
                                    "brand": carBrandController.text,
                                    "model": carModelController.text,
                                    "year": modelYearController.text,
                                    "color": carColorController.text,
                                  },
                                  profileImage: driver.profileImage,
                                ),
                            RentVanApp.userId)) !=
                            200) {
                          WarningAlert.showWarningDialog(
                              context, "We can not change your data!.", () {
                            Navigator.pop(context);
                          });
                        } else {
                          WarningAlert.showWarningDialog(context,
                              "Congratulations! You have changed your data!",
                              () {
                            Navigator.pushNamed(context, "/profileDriverPerson");
                          });
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
}
