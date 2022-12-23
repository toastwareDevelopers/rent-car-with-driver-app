import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';

import '../../../services/profile.dart';
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
                      child: const Text("Save"),
                      onPressed: () async {
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
