import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';
import '../../../models/customer.dart';
import '../../../services/profile.dart';
import '../../../widgets/profile_icon_widget.dart';

///  NOTES: APPBARS WORK SKETCHY!
///
///

class EditCustomerScreen extends StatefulWidget {
  EditCustomerScreen({super.key});

  @override
  State<EditCustomerScreen> createState() => _EditCustomerScreenState();
}

enum SingingCharacter { nationalNumber, passportNumber }

class _EditCustomerScreenState extends State<EditCustomerScreen> {
  SingingCharacter? _character = SingingCharacter.nationalNumber;
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController nationalID = TextEditingController();
  TextEditingController passportID = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  final List<String> genders = ["Male", "Female"];
  String? genderDropdown;
  Size size = WidgetsBinding.instance.window.physicalSize;
  double ratio = WidgetsBinding.instance.window.devicePixelRatio;
  double phoneHeight = 0.0;
  double phoneWidth = 0.0;
  Customer customerData = Customer();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getCustomer(); // get customer data
    phoneHeight = size.height / ratio;
    phoneWidth = size.width / ratio;
  }

  final ProfileIcon _profileIcon =
      ProfileIcon(key: null, selectedImage: "null");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Container(
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
                              "Edit Account",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),

                          _profileIcon,

                          Container(
                            height: phoneHeight / 2,
                            width: phoneWidth,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: phoneWidth * 0.07,
                                  right: phoneWidth * 0.07),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      //Name - Editable
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          // This part will receive the data from database
                                          decoration: const InputDecoration(
                                              hintText: 'Name'),
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
                                      //Surname - Editable
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration:
                                              // This part will receive data from the database
                                              const InputDecoration(
                                                  hintText: 'Surname'),
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
                                  //Email - Uneditable
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          autofocus: false,
                                          readOnly: true,
                                          enabled: false,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.deny(
                                                RegExp(r'\s')),
                                          ],
                                          decoration: InputDecoration(
                                            // This part will receive data from the database
                                            hintText: customerData.email,
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
                                          obscureText: true,
                                          enableSuggestions: false,
                                          autocorrect: false,
                                          decoration:
                                              // This part will receive data from the database
                                              const InputDecoration(
                                                  hintText: 'Password'),
                                          controller: password1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.deny(
                                                RegExp(r'\s')),
                                          ],
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
                                              // This part will receive data from the database
                                              const InputDecoration(
                                                  hintText: 'Retype Password'),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.deny(
                                                RegExp(r'\s')),
                                          ],
                                          controller: password2,
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
                                            hintText: customerData.phoneNumber,
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
                                          activeColor: const Color.fromRGBO(
                                              255, 167, 117, 77),
                                          title: const Text(
                                              style: TextStyle(
                                                  color: Colors.white),
                                              'National ID'),
                                          value:
                                              SingingCharacter.nationalNumber,
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
                                          activeColor: const Color.fromRGBO(
                                              255, 167, 117, 77),
                                          title: const Text(
                                              style: TextStyle(
                                                  color: Colors.white),
                                              'Passport ID'),
                                          value:
                                              SingingCharacter.passportNumber,
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
                                  // Both national id and passport id data can be changed
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration:
                                              // This part will receive data from the database
                                              InputDecoration(
                                                  hintText: (_character ==
                                                          SingingCharacter
                                                              .nationalNumber)
                                                      ? 'National ID'
                                                      : 'Passport ID'),
                                          controller: (_character ==
                                                  SingingCharacter
                                                      .nationalNumber)
                                              ? nationalID
                                              : passportID,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Birthdate - Editable
                                  Row(
                                    children: [
                                      //Birthdate
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            DatePicker.showDatePicker(
                                              context,
                                              theme: DatePickerTheme(
                                                doneStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .highlightColor,
                                                ),
                                                itemStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .highlightColor,
                                                ),
                                              ),
                                              showTitleActions: true,
                                              minTime: DateTime(1900, 1, 1),
                                              maxTime: DateTime(2004, 1, 1),
                                              onChanged: (date) {},
                                              onConfirm: (date) {
                                                setState(() {
                                                  birthDateController.text =
                                                      date
                                                          .toString()
                                                          .substring(0, 10);
                                                });
                                              },
                                              onCancel: () {
                                                setState(() {
                                                  birthDateController.text = "";
                                                });
                                              },
                                              currentTime: DateTime.now(),
                                            );
                                          },
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(left: 12),
                                            alignment: Alignment.centerLeft,
                                            height: phoneHeight * 0.06,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 218, 218, 218),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              birthDateController.text != ""
                                                  ? birthDateController.text
                                                  : "Birthdate",
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  color: Color.fromARGB(
                                                      255, 96, 96, 96)),
                                            ),
                                          ),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: DropdownButton(
                                            value: genderDropdown,
                                            items: genders
                                                .map(
                                                  (value) => DropdownMenuItem(
                                                    value: value,
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 12),
                                                      child: Text(value,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      17)),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                          Container(
                            height: phoneHeight / 2,
                            width: phoneWidth,
                            child: Container(
                              alignment: Alignment.topRight,
                              padding: const EdgeInsets.only(right: 15),
                              child: ElevatedButton(
                                child: const Text("Save"),
                                onPressed: () async {
                                  if (password1.value.text.toString().compareTo(
                                          password2.value.text.toString()) !=
                                      0) {
                                    WarningAlert.showWarningDialog(
                                      context,
                                      "Warning",
                                      "Master Password must be same as confirmation ,but was different!",
                                      () {
                                        Navigator.pop(context);
                                      },
                                    );
                                    // Update Customer Info
                                  } else {
                                    Customer changedCustomerData = Customer();
                                    changedCustomerData.name =
                                        name.value.text.toString();
                                    changedCustomerData.surname =
                                        surname.value.text.toString();
                                    changedCustomerData.email =
                                        customerData.email;
                                    changedCustomerData.password =
                                        password1.value.text.toString();
                                    changedCustomerData.phoneNumber =
                                        customerData.phoneNumber;
                                    changedCustomerData.birthDate =
                                        birthDateController.value.text
                                            .toString();
                                    changedCustomerData.gender =
                                        genderDropdown.toString();
                                    changedCustomerData.nationalId =
                                        nationalID.value.text.toString();
                                    changedCustomerData.passportNumber =
                                        passportID.value.text.toString();
                                    changedCustomerData.profileImage =
                                        _profileIcon.selectedImage;

                                    if ((await ProfileService.editCustomer(
                                            changedCustomerData,
                                            RentVanApp.userId)) !=
                                        200) {
                                      WarningAlert.showWarningDialog(
                                        context,
                                        "Warning",
                                        "An Error occurred, We can not change your data!.",
                                        () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    } else {
                                      SnackBar snackbar = const SnackBar(
                                        content: Text("Profile updated!"),
                                        duration: Duration(seconds: 2),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackbar);

                                      Navigator.popUntil(
                                          context, ModalRoute.withName('/'));
                                      Navigator.pushNamed(
                                          context, '/customerMain',
                                          arguments: RentVanApp.userId);
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

  // Get customer data
  getCustomer() async {
    setState(() {
      isLoading = true;
    });
    final response = await ProfileService.getCustomer(RentVanApp.userId);
    customerData = response;

    name.text = customerData.name!;
    surname.text = customerData.surname!;
    if (customerData.nationalId?.compareTo("null") != 0) {
      // if null show hintText instead
      nationalID.text = customerData.nationalId!;
    }
    if (customerData.passportNumber?.compareTo("null") != 0) {
      // if null show hintText instead
      passportID.text = customerData.passportNumber!;
    }
    birthDateController.text = (customerData.birthDate!).substring(0, 10);
    genderDropdown = customerData.gender;
    // Initialize the phone height and width
    _profileIcon.selectedImage = customerData.profileImage!;
    genderDropdown = customerData.gender!;
    setState(() {
      isLoading = false;
    });
  }
}
