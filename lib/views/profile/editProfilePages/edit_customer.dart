import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:rentcarmobile/services/auth.dart';
//import 'package:rentcarmobile/utils/input_validator.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';
import '../../../constants/assets_path.dart';
import '../../../models/customer.dart';

///  NOTES:
///
///

class EditCustomerScreen extends StatefulWidget {
  const EditCustomerScreen({super.key});

  @override
  State<EditCustomerScreen> createState() => _EditCustomerScreenState();
}

enum SingingCharacter { nationalNumber, passportNumber }

class _EditCustomerScreenState extends State<EditCustomerScreen> {
  SingingCharacter? _character = SingingCharacter.nationalNumber;
  static Customer prevData = Customer.n(3); // Customers previous data (stub)
  Customer data = Customer(); // Customers updated data
  TextEditingController name = TextEditingController(text: prevData.name);
  TextEditingController surname = TextEditingController(text: prevData.surname);
  // If user is allowed to update email and phone number uncomment these
  //TextEditingController email = TextEditingController(text: prevData.mail);
  //TextEditingController phoneNumber = TextEditingController(text: prevData.phoneNumber);
  TextEditingController password1 = TextEditingController(text: prevData.password);
  TextEditingController password2 = TextEditingController(text: prevData.password);
  TextEditingController nationalID = TextEditingController(text: prevData.nationalId);
  TextEditingController passportID = TextEditingController(text: prevData.passportNumber);
  TextEditingController gender = TextEditingController(text: prevData.gender);
  TextEditingController birthDateController = TextEditingController(text: prevData.birthday);
  String? genderDropdown = prevData.gender;
  final List<String> genders = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: phoneHeight * 0.06),
                      child: Text(
                        "Edit Account",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Container(
                      // Profile Picture
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: phoneWidth * 0.07, right: phoneWidth * 0.07),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                //Name - Editable
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    // This part will receive the data from database
                                    decoration:
                                      const InputDecoration(hintText: 'Name'),
                                    controller: name,
                                    onSubmitted: (text) {if(name.text.isEmpty){name.text = prevData.name!;}},
                                    // textInputAction: TextInputAction.next, this might come in handy with register pages
                                  ),
                                ),
                                SizedBox(
                                  width: phoneWidth * 0.04,
                                ),
                                //Surname - Editable
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration:
                                      // This part will receive data from the database
                                      const InputDecoration(hintText: 'Surname'),
                                    controller: surname,
                                    onSubmitted: (text) {if(surname.text.isEmpty){surname.text = prevData.surname!;}},
                                  ),
                                ),
                              ],
                            ),
                            //Email - Uneditable
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    autofocus: false,
                                    readOnly: true,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      // This part will receive data from the database
                                      hintText: prevData.mail,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Password - Editable
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration:
                                      // This part will receive data from the database
                                      const InputDecoration(hintText: 'Password'),
                                    controller: password1,
                                    onSubmitted: (text) {if(password1.text.isEmpty){password1.text = prevData.password!;}},
                                  ),
                                ),
                                SizedBox(
                                  width: phoneWidth * 0.04,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration:
                                      // This part will receive data from the database
                                      const InputDecoration(hintText: 'Retype Password'),
                                    controller: password2,
                                    onSubmitted: (text) {if(password2.text.isEmpty){password2.text = prevData.password!;}},
                                  ),
                                ),
                              ],
                            ),
                            // Phone number - Uneditable
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    autofocus: false,
                                    readOnly: true,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      // This part will receive data from the database
                                      hintText: prevData.phoneNumber,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // National ID button
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
                                // Passport ID button
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
                            // National ID || Passport ID - Editable
                            // As of now we can only change national ID or passport ID but not both
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                      decoration:
                                        // This part will receive data from the database
                                        InputDecoration(hintText: (_character == SingingCharacter.nationalNumber) ? 'National ID' : 'Passport ID'),
                                    controller: (_character == SingingCharacter.nationalNumber) ? nationalID : passportID,
                                    onSubmitted: (text) {if(nationalID.text.isEmpty){nationalID.text = prevData.nationalId!;}else if(passportID.text.isEmpty){passportID.text = prevData.passportNumber!;}},
                                  ),
                                ),
                              ],
                            ),
                            // Birthdate - Editable
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      // This part will receive data from the database
                                      hintText: 'Birth Date',
                                    ),
                                    controller: birthDateController,
                                    //onEditingComplete: () {if(birthDateController.text.isEmpty){birthDateController.text = prevData.birthday!;}},
                                    onSubmitted: (text) {if(birthDateController.text.isEmpty){birthDateController.text = prevData.birthday!;}},
                                  ),
                                ),
                                SizedBox(
                                  width: phoneWidth * 0.04,
                                ),
                                //Gender - Editable
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
                    // Save button
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: const Text("Save"),
                          onPressed: () async {
                            if (password1.value.text
                                    .toString()
                                    .compareTo(password2.value.text.toString()) !=
                                0) {
                              WarningAlert.showWarningDialog(
                                context,
                                "Master Password must be same as confirmation ,but was different",
                                () {
                                  Navigator.pop(context);
                                },
                              );
                            } else {
                              data.name = name.text;
                              data.surname = surname.text;
                              data.mail = prevData.mail;
                              data.password = password1.text;
                              data.phoneNumber = prevData.phoneNumber;
                              data.birthday =
                                  birthDateController.text;
                              data.gender = genderDropdown;
                              data.birthday =
                                  birthDateController.text;
                              data.nationalId = nationalID.text;
                              data.passportNumber =
                                  passportID.text;

                              if ((await AuthService.registerCustomer(data)) !=
                                  200) {
                                WarningAlert.showWarningDialog(
                                  context,
                                  "We encountered a problem please try again",
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              } else {
                                WarningAlert.showWarningDialog(
                                  context,
                                  "You have successfully updated your account!",
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
      ),
    );
  }
}