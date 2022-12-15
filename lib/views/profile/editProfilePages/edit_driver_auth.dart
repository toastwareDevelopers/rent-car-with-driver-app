import 'package:flutter/material.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/services/profile.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';

import '../../../models/driver.dart';

class EditDriverAuthScreen extends StatefulWidget {
  const EditDriverAuthScreen({super.key});
  @override
  State<EditDriverAuthScreen> createState() => _EditDriverAuthScreenState();
}

class _EditDriverAuthScreenState extends State<EditDriverAuthScreen> {
  late Future<Driver> myFuture;
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  Size size = WidgetsBinding.instance.window.physicalSize;
  double ratio = WidgetsBinding.instance.window.devicePixelRatio;
  double phoneHeight = 0.0;
  double phoneWidth = 0.0;

  // Provide existing driver ID
  @override
  void initState() {
    myFuture = ProfileService.getDriver(RentVanApp.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<Driver>(
          future: myFuture,
          builder: (context, snapshot) {
            Driver? driverData = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(child: Text('Some error occurred!'));
                } else {
                  return buildDriverEditAuthScreen(driverData!);
                }
            }
          },
        ),
      );
  Driver driver = ModalRoute.of(context)!.settings.arguments as Driver;

  Widget buildDriverEditAuthScreen(Driver driverData) {
    // double phoneHeight = MediaQuery.of(context).size.height;
    // double phoneWidth = MediaQuery.of(context).size.width;
    phoneHeight = size.height / ratio;
    phoneWidth = size.width / ratio;

    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        child: SizedBox(
          height: phoneHeight,
          width: phoneWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.only(top: phoneHeight * 0.08),
                  child: Text(
                    "Edit Driver",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(
                      left: phoneWidth * 0.07, right: phoneWidth * 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Email - Uneditable
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          autofocus: false,
                          readOnly: true,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: driverData.email,
                          ),
                        ),
                      ),
                      //Phone Number -Uneditable
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          autofocus: false,
                          readOnly: true,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: driverData.phoneNumber,
                          ),
                        ),
                      ),
                      //Password - Editable
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            //Password - Editable
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                  hintText: "Password",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: phoneWidth * 0.04,
                            ),
                            //Retype Password - Editable
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: repasswordController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                  hintText: "Retype Password",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: phoneHeight * 0.01,
              ),
              //Continue Button
              Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    child: const Text("Continue"),
                    onPressed: () async {
                      if (!controlIsSamePasswordAndRePassword(
                          passwordController.text, repasswordController.text)) {
                        WarningAlert.showWarningDialog(context,
                            "Master Password must be same as confirmation ,but was different!",
                            () {
                          Navigator.pop(context);
                        });
                        // Get to the next screen
                      } else {
                        Navigator.of(context).pushNamed(
                          "/editDriverPersonal",
                          arguments: Driver(
                            email: driverData.email,
                            phoneNumber: driverData.phoneNumber,
                            password: passwordController.text,
                            name: driverData.name,
                            surname: driverData.surname,
                            birthDate: driverData.birthDate,
                            gender: driverData.gender,
                            nationalId: driverData.nationalId,
                            passportNumber: driverData.passportNumber,
                            location: driverData.location,
                            info: driverData.info,
                            skills: driverData.skills,
                            languages: driverData.languages,
                            licenceNumber: driverData.licenceNumber,
                            licenceYear: driverData.licenceYear,
                            rating: driverData.rating,
                            hourlyPrice: driverData.hourlyPrice,
                            taxNumber: driverData.taxNumber,
                            carInfo: driverData.carInfo,
                            trips: driverData.trips,
                          ),
                        );
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

  bool controlIsSamePasswordAndRePassword(String password, String rePassword) {
    return password == rePassword;
  }
}
