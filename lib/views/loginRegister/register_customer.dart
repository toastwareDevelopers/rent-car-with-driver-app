import 'package:flutter/material.dart';

import '../../constants/assets_path.dart';

class RegisterCustomerScreen extends StatefulWidget {
  const RegisterCustomerScreen({super.key});

  @override
  State<RegisterCustomerScreen> createState() => _RegisterCustomerScreenState();
}
enum SingingCharacter { nationalNumber, passportNumber }
class _RegisterCustomerScreenState extends State<RegisterCustomerScreen> {
  SingingCharacter? _character = SingingCharacter.nationalNumber;
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    TextEditingController birthDateController = TextEditingController();
    return Scaffold(

      appBar: AppBar(
        title: const Text("Register Customer Screen"),
      ),
      body: Column(
          children : <Widget>[

            Expanded(
              flex: 2,

              child: Container(
                padding: EdgeInsets.only(top: phoneHeight * 0.04),
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
            Expanded(
              flex: 7,

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
                        const Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(hintText: "Name"),
                          ),
                        ),
                        SizedBox(
                          width: phoneWidth * 0.04,
                        ),
                        //Surname
                        const Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(hintText: "Surname"),
                          ),
                        ),
                      ],
                    ),
                    //Birthdate - Gender
                    Row(
                      children: const [
                        //Birthdate


                        //Gender
                        Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(hintText: "Email"),
                          ),
                        ),
                      ],
                    ),
                    //NationalID - Location
                    Row(
                      children: [
                        //NationalID
                        const Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(hintText: "Password"),
                          ),
                        ),
                        SizedBox(
                          width: phoneWidth * 0.04,
                        ),
                        //Location
                        const Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(hintText: "Password"),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: const [
                        //NationalID
                        Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(hintText: "Phone Number"),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: RadioListTile<SingingCharacter>(
                            title: const Text(style: TextStyle(color: Colors.white) ,'National ID'),
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
                            title: const Text(style: TextStyle(color: Colors.white) ,'Passpord ID'),
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
                      children: const [
                        //NationalID
                        Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(hintText: "National ID"),
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
                            decoration: const InputDecoration(hintText: "Birth Date"),
                            controller: birthDateController,
                            onTap: () async {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      actions: [
                                        CalendarDatePicker(
                                          firstDate: DateTime.parse("1900-01-01"),
                                          initialDate: DateTime.now(),
                                          lastDate: DateTime.now(),
                                          onDateChanged: (DateTime value) {
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
                        const Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(hintText: "Gender"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  child: const Text("Continue"),
                  onPressed: () {},
                ),
              ),
            ),
          ],

        ),
      );

  }
}
