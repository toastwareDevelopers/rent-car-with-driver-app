import 'package:flutter/material.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';
import '../../../constants/assets_path.dart';
import '../../../models/customer.dart';
import '../../../services/profile.dart';
import '../../../utils/base64_converter.dart';
import '../../../widgets/profile_icon_widget.dart';

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
  late Future<Customer> myFuture;

  static int flag = 0;

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

  final ProfileIcon _profileIcon = ProfileIcon(key: null, selectedImage: "null");

  @override
  void initState() {
    super.initState();
    myFuture = ProfileService.getCustomer(RentVanApp.userId);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<Customer>(
          future: myFuture,
          builder: (context, snapshot) {
            Customer? customerData = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(child: Text('Some error occurred!'));
                } else {
                  return buildCustomerEditScreen(customerData!);
                }
            }
          },
        ),
      );

  Widget buildCustomerEditScreen(Customer customerData) {
    // double phoneHeight = MediaQuery.of(context).size.height;
    // double phoneWidth = MediaQuery.of(context).size.width;
    if (flag == 0) {
      // Making sure initialization done once
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
      birthDateController.text = customerData.birthDate!.substring(0, 10);
      genderDropdown = customerData.gender;
      // Initialize the phone height and width
      phoneHeight = size.height / ratio;
      phoneWidth = size.width / ratio;
      _profileIcon.selectedImage = customerData.profileImage!;

    }

    flag++; // Update flag

    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SafeArea(
        child: SizedBox(
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

                    SizedBox(
                      height: phoneHeight / 2,
                      width: phoneWidth,
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
                                        const InputDecoration(
                                            hintText: 'Surname'),
                                    controller: surname,
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
                                    //onSubmitted: (text) {if(birthDateController.text.isEmpty){birthDateController.text = customerData.birthDate!;}},
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
                              changedCustomerData.email = customerData.email;
                              changedCustomerData.password =
                                  password1.value.text.toString();
                              changedCustomerData.phoneNumber =
                                  customerData.phoneNumber;
                              changedCustomerData.birthDate =
                                  birthDateController.value.text.toString();
                              changedCustomerData.gender =
                                  genderDropdown.toString();
                              changedCustomerData.nationalId =
                                  nationalID.value.text.toString();
                              changedCustomerData.passportNumber =
                                  passportID.value.text.toString();
                              changedCustomerData.profileImage = _profileIcon.selectedImage;

                              if ((await ProfileService.editCustomer(
                                      changedCustomerData,
                                      RentVanApp.userId)) !=
                                  200) {

                                WarningAlert.showWarningDialog(
                                  context,
                                  "We can not change your data!.",
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              } else {
                                WarningAlert.showWarningDialog(
                                  context,
                                  "Congratulations! You have changed your data!",
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