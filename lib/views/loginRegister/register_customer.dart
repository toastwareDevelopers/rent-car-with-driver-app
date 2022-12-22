import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/services/auth.dart';
import 'package:rentcarmobile/utils/input_validator.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';
import 'package:rentcarmobile/widgets/profile_icon_widget.dart';

import '../../models/customer.dart';

class RegisterCustomerScreen extends StatefulWidget {
  RegisterCustomerScreen({super.key});

  @override
  State<RegisterCustomerScreen> createState() => _RegisterCustomerScreenState();
}

enum SingingCharacter { nationalNumber, passportNumber }

class _RegisterCustomerScreenState extends State<RegisterCustomerScreen> {
  SingingCharacter? _character = SingingCharacter.nationalNumber;
  Customer data = Customer();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController nationalID = TextEditingController();
  TextEditingController passportID = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  String? genderDropdown = "Male";
  final List<String> genders = ["Male", "Female"];
  Size size = WidgetsBinding.instance.window.physicalSize;
  double ratio = WidgetsBinding.instance.window.devicePixelRatio;
  double phoneHeight = 0.0;
  double phoneWidth = 0.0;

  final ProfileIcon _profileIcon = ProfileIcon(key: null, selectedImage: "null");

  @override
  void initState() {
    super.initState();
    phoneHeight = size.height / ratio;
    phoneWidth = size.width / ratio;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Container(
        height: phoneHeight,
        width: phoneWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: phoneHeight * 0.06),
                    child: Text(
                      "Register as a Customer",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                  // Profile Icon
                  _profileIcon,

                  Container(
                    height: phoneHeight / 2,
                    width: phoneWidth,
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
                                  decoration: const InputDecoration(hintText: "Name"),
                                  controller: name,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp("[a-zA-Z]"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: phoneWidth * 0.04,
                              ),
                              //Surname
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  decoration:
                                      const InputDecoration(hintText: "Surname"),
                                  controller: surname,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp("[a-zA-Z]"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          //Email
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
                          //Password
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration:
                                      const InputDecoration(hintText: "Password"),
                                  controller: password1,
                                ),
                              ),
                              SizedBox(
                                width: phoneWidth * 0.04,
                              ),
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration:
                                      const InputDecoration(hintText: "Retype Password"),
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
                              Expanded(
                                flex: 1,
                                child: RadioListTile<SingingCharacter>(
                                  activeColor:
                                      const Color.fromRGBO(255, 167, 117, 77),
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
                                  activeColor:
                                      const Color.fromRGBO(255, 167, 117, 77),
                                  title: const Text(
                                      style: TextStyle(color: Colors.white),
                                      'Passport ID'),
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
                              //National ID & Passport ID
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  decoration:
                                  InputDecoration(
                                      hintText: (_character ==
                                          SingingCharacter
                                              .nationalNumber)
                                          ? 'National ID'
                                          : 'Passport ID'),
                                  controller: (_character ==
                                      SingingCharacter.nationalNumber)
                                      ? nationalID
                                      : passportID,
                                  inputFormatters: [
                                    // Should national id and passport id only consist of numbers?
                                    FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]"),
                                    ),
                                  ],
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
                                    color: const Color.fromARGB(
                                        255, 218, 218, 218),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DropdownButton(
                                    value: genderDropdown,
                                    items: genders
                                        .map(
                                          (value) => DropdownMenuItem(
                                            value: value,
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 12),
                                              child: Text(value,
                                                  style: const TextStyle(
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        genderDropdown = value;
                                      });
                                    },
                                    dropdownColor: const Color.fromARGB(
                                        255, 218, 218, 218),
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
                  ),
                  Container(
                    height: phoneHeight / 2,
                    width: phoneWidth,
                    child: Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 15),
                      child: ElevatedButton(
                        child: const Text("Register"),
                        onPressed: () async {
                          if (name.value.text.toString().isEmpty ||
                              surname.value.text.toString().isEmpty ||
                              email.value.text.toString().isEmpty ||
                              password1.value.text.toString().isEmpty ||
                              password2.value.text.toString().isEmpty ||
                              phoneNumber.value.text.toString().isEmpty ||
                              nationalID.value.text.toString().isEmpty) {
                            WarningAlert.showWarningDialog(
                              context,
                              "Please fill all inputs!",
                              () {
                                Navigator.pop(context);
                              },
                            );
                          } else if (password1.value.text
                                  .toString()
                                  .compareTo(password2.value.text.toString()) !=
                              0) {
                            WarningAlert.showWarningDialog(
                              context,
                              "Master Password must be same as confirmation ,but was different!",
                              () {
                                Navigator.pop(context);
                              },
                            );
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email.text)) {
                            WarningAlert.showWarningDialog(
                                context, "Email format is wrong!", () {
                              Navigator.pop(context);
                            });
                          } else {
                            data.name = name.value.text.toString();
                            data.surname = surname.value.text.toString();
                            data.email = email.value.text.toString();
                            data.password = password1.value.text.toString();
                            data.phoneNumber =
                                phoneNumber.value.text.toString();
                            data.birthDate =
                                birthDateController.value.text.toString();
                            data.gender = genderDropdown.toString();
                            if(nationalID.value.text.toString().isNotEmpty) {
                              data.nationalId = nationalID.value.text.toString();
                            }
                            if(passportID.value.text.toString().isNotEmpty) {
                              data.passportNumber = passportID.value.text.toString();
                            }
                            data.profileImage = _profileIcon.selectedImage;

                            if ((await AuthService.registerCustomer(data)) !=
                                200) {
                              WarningAlert.showWarningDialog(
                                context,
                                "We can not register you. Please Try Again!",
                                () {
                                  Navigator.pop(context);
                                },
                              );
                            } else {
                              WarningAlert.showWarningDialog(
                                context,
                                "Congratulations! You have registered successfully!",
                                () {
                                  Navigator.pushNamed(context, "/");
                                },
                              );
                            }
                          }
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
}
