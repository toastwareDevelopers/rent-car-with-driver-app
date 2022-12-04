import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:rentcarmobile/utils/input_validator.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';
import '../../../constants/assets_path.dart';
import '../../../models/customer.dart';
import '../../../services/profile.dart';

///  NOTES:
///
///

class EditCustomerScreen extends StatefulWidget  {
  const EditCustomerScreen({super.key});

  @override
  State<EditCustomerScreen> createState() => _EditCustomerScreenState();

}

enum SingingCharacter { nationalNumber, passportNumber }

class _EditCustomerScreenState extends State<EditCustomerScreen> {
  late Future<Customer> myFuture;

  SingingCharacter? _character = SingingCharacter.nationalNumber;
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController nationalID = TextEditingController();
  TextEditingController passportID = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  final List<String> genders = ["Male", "Female"];
  String? genderDropdown = "Male";


  @override
  void initState() {
    myFuture = ProfileService.getCustomer("636658c908ae9ae84b4b7ea7");
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: FutureBuilder<Customer>(
      future: myFuture,
      builder: (context, snapshot) {
        Customer? customerData = snapshot.data;
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if(snapshot.hasError) {
              return const Center(child: Text('Some error occurred!'));
            } else {
              return buildCustomerEditScreen(customerData!);
            }
        }
      },
    ),
  );

  Widget buildCustomerEditScreen(Customer customerData) {
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
                                      hintText: customerData.mail,
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
                                      const InputDecoration(hintText: 'Password'),
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
                                      const InputDecoration(hintText: 'Retype Password'),
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
                                        InputDecoration(hintText: (_character == SingingCharacter.nationalNumber) ? 'National ID' : 'Passport ID'),
                                    controller: (_character == SingingCharacter.nationalNumber) ? nationalID : passportID,
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
                                    onSubmitted: (text) {if(birthDateController.text.isEmpty){birthDateController.text = customerData.birthday!;}},
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
                                "Master Password must be same as confirmation ,but was different!",
                                () {
                                  Navigator.pop(context);
                                },
                               );

                            // Update Customer Info
                            } else {

                              Customer changedCustomerData = Customer();

                              changedCustomerData.name = name.value.text.toString();
                              changedCustomerData.surname = surname.value.text.toString();
                              changedCustomerData.mail = customerData.mail;
                              changedCustomerData.password = password1.value.text.toString();
                              changedCustomerData.phoneNumber = customerData.phoneNumber;
                              changedCustomerData.birthday = birthDateController.value.text.toString();
                              changedCustomerData.gender = genderDropdown.toString();
                              changedCustomerData.nationalId = nationalID.value.text.toString();
                              changedCustomerData.passportNumber = passportID.value.text.toString();

                              if(changedCustomerData.name.toString().isEmpty) {
                                changedCustomerData.name = customerData.name;
                              }

                              if(changedCustomerData.surname.toString().isEmpty) {
                                changedCustomerData.surname = customerData.surname;
                              }

                              if(changedCustomerData.password.toString().isEmpty) {
                                changedCustomerData.password = customerData.password;
                              }

                              if(changedCustomerData.birthday.toString().isEmpty) {
                                changedCustomerData.birthday = customerData.birthday;
                              }

                              if(changedCustomerData.gender.toString().isEmpty) {
                                changedCustomerData.gender = customerData.gender;
                              }

                              if(changedCustomerData.nationalId.toString().isEmpty) {
                                changedCustomerData.nationalId = customerData.nationalId;
                              }

                              if(changedCustomerData.passportNumber.toString().isEmpty) {
                                changedCustomerData.passportNumber = customerData.passportNumber;
                              }

                              print(changedCustomerData.toString());

                              if ((await ProfileService.editCustomer(changedCustomerData, "636658c908ae9ae84b4b7ea7")) !=
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
                                  "Congrulations! You have changed!",
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