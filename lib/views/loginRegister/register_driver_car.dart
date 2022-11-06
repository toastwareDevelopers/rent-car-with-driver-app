import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/services/auth.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';

import '../../models/driver.dart';

class RegisterDriverCarScreen extends StatefulWidget {
  TextEditingController driverLisenceNumberController = TextEditingController();
  TextEditingController carLisenceNumberController = TextEditingController();
  TextEditingController driverLisenceYearController = TextEditingController();
  TextEditingController modelYearController = TextEditingController();
  TextEditingController carBrandController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  TextEditingController carRegistirationPlateController =
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
                              controller: widget.driverLisenceNumberController,
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
                              controller: widget.carLisenceNumberController,
                              decoration: const InputDecoration(
                                hintText: "Car Lisence Number",
                                hintMaxLines: 2,
                                isDense: true,
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
                            child: TextField(
                              controller: widget.driverLisenceYearController,
                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                              maxLength: 4,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]"),
                                ),
                              ],
                              decoration: const InputDecoration(
                                hintText: "Driver Lisence Year ",
                                hintMaxLines: 2,
                                isDense: true,
                                counterText: "",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Car Model Year
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.modelYearController,
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
                              controller: widget.carRegistirationPlateController,
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
                                isDense: true,
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
                          widget.driverLisenceNumberController.text,
                          widget.carLisenceNumberController.text,
                          widget.driverLisenceYearController.text,
                          widget.modelYearController.text,
                          widget.carBrandController.text,
                          widget.carModelController.text,
                          widget.carColorController.text,
                          widget.carRegistirationPlateController.text,
                          widget.hourlyPriceController.text,
                          widget.taxNumberController.text)) {
                        WarningAlert.showWarningDialog(
                            context, "You must fill all inputs",(){Navigator.pop(context);});
                      } else {
                        if ((await AuthService.registerDriver(
                              Driver(
                                info: driver.info,
                                birthDate: driver.birthDate,
                                email: driver.email,
                                gender: driver.gender,
                                hourlyPrice:
                                    int.parse(widget.hourlyPriceController.text),
                                languages: driver.languages,
                                licenceNumber:
                                    widget.carLisenceNumberController.text,
                                licenceYear:
                                    widget.driverLisenceYearController.text,
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
                                  "lisenceNumber":
                                      widget.carLisenceNumberController.text,
                                  "plateNumber":
                                      widget.carRegistirationPlateController.text,
                                  "brand": widget.carBrandController.text,
                                  "model": widget.carModelController.text,
                                  "year": widget.modelYearController.text,
                                  "color": widget.carColorController.text,
                                },
                              ),
                            )) !=
                            200) {
                          WarningAlert.showWarningDialog(context,
                              "We can not register you. Try again please.",(){Navigator.pop(context);});
                        } else {
                          WarningAlert.showWarningDialog(context,
                              "Congrulations! You have registered succesfully!",(){Navigator.pushNamed(context, "/");});
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
      String driverLisenceNumber,
      String carLisenceNumber,
      String driverLisenceYear,
      String modelYear,
      String carBrand,
      String carModelName,
      String carColor,
      String carRegistirationPlate,
      String price,
      String taxNumber) {
    return driverLisenceNumber.isNotEmpty &&
        carLisenceNumber.isNotEmpty &&
        driverLisenceYear.isNotEmpty &&
        modelYear.isNotEmpty &&
        carBrand.isNotEmpty &&
        carModelName.isNotEmpty &&
        carColor.isNotEmpty &&
        carRegistirationPlate.isNotEmpty &&
        price.isNotEmpty &&
        taxNumber.isNotEmpty;
  }
}
