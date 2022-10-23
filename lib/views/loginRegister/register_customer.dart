import 'package:flutter/material.dart';

import '../../constants/assets_path.dart';
import '../../models/CustumerRegisterData.dart';

class RegisterCustomerScreen extends StatefulWidget {
  const RegisterCustomerScreen({super.key});

  @override
  State<RegisterCustomerScreen> createState() => _RegisterCustomerScreenState();
}

enum SingingCharacter { nationalNumber, passportNumber }

class _RegisterCustomerScreenState extends State<RegisterCustomerScreen> {
  SingingCharacter? _character = SingingCharacter.nationalNumber;
  CustumerRegisterData data = new CustumerRegisterData();
  TextEditingController name = new TextEditingController();
  TextEditingController surname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController password1 = new TextEditingController();
  TextEditingController password2 = new TextEditingController();
  TextEditingController idnumber = new TextEditingController();
  TextEditingController idtype = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Customer Screen"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    child: Container(
                      padding: EdgeInsets.all(phoneHeight * 0.04),
                      alignment: Alignment.topCenter,
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
                  Container(
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
                                  decoration:
                                      InputDecoration(hintText: "Surname"),
                                  controller: surname,
                                ),
                              ),
                            ],
                          ),
                          //Birthdate - Gender
                          Row(
                            children:  [
                              //Birthdate

                              //Gender
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  decoration:
                                      InputDecoration(hintText: "Email"),
                                  controller: email,
                                ),
                              ),
                            ],
                          ),
                          //NationalID - Location
                          Row(
                            children: [
                              //NationalID
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
                              //NationalID
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  decoration:
                                      InputDecoration(hintText: "Phone Number"),
                                  controller: phoneNumber ,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
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
                                  controller: idnumber ,
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
                                      hintText: "Birth Date"),
                                  controller: birthDateController,
                                  onTap: () async {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            actions: [
                                              CalendarDatePicker(
                                                firstDate: DateTime.parse(
                                                    "1900-01-01"),
                                                initialDate: DateTime.now(),
                                                lastDate: DateTime.now(),
                                                onDateChanged:
                                                    (DateTime value) {
                                                  birthDateController.text =
                                                      "${value.year}-${value.month}-${value.day}";
                                                },
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("OK"),
                                              ),
                                            ],
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
                                child: TextField(
                                  decoration:
                                      InputDecoration(hintText: "Gender"),
                                  controller: gender,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        child: const Text("Continue"),
                        onPressed: () {
                          if(name.value.text.toString().isEmpty || surname.value.text.toString().isEmpty || email.value.text.toString().isEmpty
                              || password1.value.text.toString().isEmpty || password2.value.text.toString().isEmpty || phoneNumber.value.text.toString().isEmpty
                              || idnumber.value.text.toString().isEmpty   || gender.value.text.toString().isEmpty  ){
                            print("bos kutucuklar var");
                          }
                          else if(password1.value.text.toString().compareTo(password2.value.text.toString()) == false){
                            print("iki sifre uyusmuyor");
                          }
                          else{
                            data.name = name.value.text.toString();
                            data.surname = surname.value.text.toString();
                            data.mail = email.value.text.toString();
                            data.password = password1.value.text.toString();
                            data.phoneNumber = phoneNumber.value.text.toString();
                            data.birthday = birthDateController.value.text.toString();
                            data.gender = gender.value.text.toString();
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

  void requestData(){

  }
}
