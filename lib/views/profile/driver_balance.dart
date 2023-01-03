import 'package:flutter/material.dart';
import 'package:rentcarmobile/services/profile.dart';
import '../../models/driver.dart';
import '../../utils/input_validator.dart';
import '../../utils/warning_alert.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);
  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    Driver driver = ModalRoute.of(context)!.settings.arguments as Driver;
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    String? ibanValue = "";
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: phoneHeight * 0.85,
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      const Center(
                        child: Icon(
                          Icons.account_balance_wallet_rounded,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Balance :",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: "Arapey"),
                            children: [
                              TextSpan(
                                text: " ${driver.balance} TL",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 180, 130, 77),
                                    fontSize: 30,
                                    fontFamily: "Arapey"),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: phoneWidth * 0.05),
                        child: Center(
                          child: TextFormField(
                            controller: TextEditingController(),
                            decoration: const InputDecoration(hintText: "IBAN"),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              ibanValue = value;
                              InputValidator.validateIBAN(value);
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (driver.balance == 0) {
                              WarningAlert.showWarningDialog(
                                  context,
                                  "Your balance is zero.You can not withraw money.",
                                  () => Navigator.pop(context));
                            } else if (InputValidator.validateIBAN(ibanValue) !=
                                "") {
                              WarningAlert.showWarningDialog(
                                  context,
                                  "Please enter valid iban.",
                                  () => Navigator.pop(context));
                            } else {
                              int statusCode =
                                  await ProfileService.withdrawDriver(
                                      driver.id);
                              if (statusCode == 200) {
                                WarningAlert.showWarningDialog(context,
                                    "Your money has been successfully transferred to your account.",
                                    () {
                                  Navigator.popUntil(context,
                                      ModalRoute.withName('/driverMain'));
                                  Navigator.pushNamed(
                                      context, '/profileDriverPersonal',
                                      arguments: driver.id);
                                });
                              } else {
                                WarningAlert.showWarningDialog(
                                    context,
                                    "Sorry, we are unable to process your transaction at this time. Please try again later.",
                                    () => Navigator.pop(context));
                              }
                            }
                          },
                          child: const Text("Withdraw"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
