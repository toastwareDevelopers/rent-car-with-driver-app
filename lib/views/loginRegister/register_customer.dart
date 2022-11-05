import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/services/auth.dart';
import 'package:rentcarmobile/utils/input_validator.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';

import '../../constants/assets_path.dart';
import '../../models/customerRegisterData.dart';

class RegisterCustomerScreen extends StatefulWidget {
  const RegisterCustomerScreen({super.key});

  @override
  State<RegisterCustomerScreen> createState() => _RegisterCustomerScreenState();
}

enum SingingCharacter { nationalNumber, passportNumber }

class _RegisterCustomerScreenState extends State<RegisterCustomerScreen> {
  SingingCharacter? _character = SingingCharacter.nationalNumber;
  CustomerRegisterData data = CustomerRegisterData();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController idtype = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  String? genderDropdown = "Male";
  final List<String> genders = ["Male", "Female"];
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container( // ismin bulunduğu alan
                    child: Container(
                      padding: EdgeInsets.only(top: phoneHeight * 0.06),
                      child: Text(
                        "Register as a Customer",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  Container( // profil resmi
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
                                  AssetImage(AssetPaths.blankProfilePhotoPath),
                              radius: 37.0,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Theme.of(context).highlightColor,
                            radius: 13,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(AssetPaths.uploadPhotoIconPath),
                              radius: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container( // form elamanları
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: phoneWidth * 0.07, right: phoneWidth * 0.07),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Name - Surname
                          Row(
                            children: [
                              //Name
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  decoration: InputDecoration(hintText: "Name"),
                                  controller: name,
                                ),
                              ),
                              SizedBox(
                                width: phoneWidth * 0.04,
                              ),
                              //Surname

                              Expanded(
                                flex: 1,
                                child: TextField(
                                  decoration: InputDecoration(hintText: "Surname"),
                                  controller: surname,
                                ),
                              ),
                            ],
                          ),
                          //Birthdate - Gender
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                    hintText: "Email",
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) =>
                                      InputValidator.validateEmail(value),
                                  controller: email,
                                ),
                              ),
                            ],
                          ),
                          //NationalID - Location
                          Row(
                            children: [
                              //passwordler
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  decoration:
                                      InputDecoration(hintText: "Password"),
                                  controller: password1,
                                ),
                              ),
                              SizedBox(
                                width: phoneWidth * 0.04,
                              ),
                              //Location
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  decoration:
                                      InputDecoration(hintText: "Password"),
                                  controller: password2,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              //Phone number
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                    hintText: "Phone Number",
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) =>
                                      InputValidator.validatePhoneNumber(value),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]"),
                                    ),
                                  ],
                                  controller: phoneNumber,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded( // radio button id number icin
                                flex: 1,
                                child: RadioListTile<SingingCharacter>(
                                  title: const Text(
                                      style: TextStyle(color: Colors.white),
                                      'National ID'),
                                  value: SingingCharacter.nationalNumber,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RadioListTile<SingingCharacter>(
                                  title: const Text(
                                      style: TextStyle(color: Colors.white),
                                      'Passpord ID'),
                                  value: SingingCharacter.passportNumber,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              //NationalID
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  decoration:
                                      InputDecoration(hintText: "National ID"),
                                  controller: idNumber,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              //Birthdate
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Birth Date",
                                  ),
                                  controller: birthDateController,
                                  onTap: () async {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return Theme(
                                            data: Theme.of(context),
                                            child: AlertDialog(
                                              actions: [
                                                CalendarDatePicker(
                                                  firstDate:
                                                  DateTime.parse("1900-01-01"),
                                                  initialDate:
                                                  birthDateController.text !=
                                                      ""
                                                      ? DateTime.parse(birthDateController.text)
                                                      : DateTime.now(),
                                                  lastDate: DateTime.now(),
                                                  onDateChanged: (DateTime value) {
                                                    birthDateController.text =
                                                    "${value.year}-${value.month < 10 ? "0${value.month}" : value.month}-${value.day < 10 ? "0${value.day}" : value.day}";
                                                  },
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("OK"),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: phoneWidth * 0.04,
                              ),
                              //Gender
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 218, 218, 218),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DropdownButton(
                                    value: genderDropdown,
                                    items: genders
                                        .map(
                                          (value) => DropdownMenuItem(
                                        value: value,
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 12),
                                          child: Text(value,
                                              style: const TextStyle(fontSize: 17)),
                                        ),
                                      ),
                                    )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        genderDropdown = value as String?;
                                      });
                                    },
                                    dropdownColor:
                                    const Color.fromARGB(255, 218, 218, 218),
                                    borderRadius: BorderRadius.circular(10),
                                    isExpanded: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ), //form elemanları
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 15),
                      child: ElevatedButton(
                        child: const Text("Continue"),
                        onPressed: () async {
                          print("okey1");
                          if (name.value.text.toString().isEmpty ||
                              surname.value.text.toString().isEmpty ||
                              email.value.text.toString().isEmpty ||
                              password1.value.text.toString().isEmpty ||
                              password2.value.text.toString().isEmpty ||
                              phoneNumber.value.text.toString().isEmpty ||
                              idNumber.value.text.toString().isEmpty ) {
                            print("okey2");
                            WarningAlert.showWarningDialog(
                                context, "Please fill all inputs!");
                          } else if (password1.value.text
                                  .toString()
                                  .compareTo(password2.value.text.toString()) !=
                              0) {
                            print("okey3");
                            WarningAlert.showWarningDialog(context,
                                "Password and repassword must be same!");
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email.text)) {
                            print("okey4");
                            WarningAlert.showWarningDialog(
                                context, "Email format is wrong!");
                          } else if ((await AuthService.controlEmailPhone(
                                  email.text.toString(), phoneNumber.text.toString())) ==
                              400) {
                            print("okey5");
                            WarningAlert.showWarningDialog(context,
                                "There is a user with same email or phone number");
                          } else {
                            print("okey6");
                            data.name = name.value.text.toString();
                            data.surname = surname.value.text.toString();
                            data.mail = email.value.text.toString();
                            data.password = password1.value.text.toString();
                            data.phoneNumber =
                                phoneNumber.value.text.toString();
                            data.birthday =
                                birthDateController.value.text.toString();
                            data.gender = genderDropdown.toString();
                            data.birthday ="3243244";

                            if(_character?.index ==0){
                              data.nationalId = idNumber.value.text.toString();
                            }
                            else{
                              data.passportNumber = idNumber.value.text.toString();
                            }
                            print("okey7");
                            AuthService.registerCustomer(data);
                          }
                          print("okey 8");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void requestData() {}
}
