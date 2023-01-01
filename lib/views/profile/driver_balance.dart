import 'package:flutter/material.dart';

import '../../utils/input_validator.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    String balance = ModalRoute.of(context)!.settings.arguments as String;
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
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
                          children: [TextSpan(text: " $balance TL",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 180, 130, 77),
                                fontSize: 30,
                                fontFamily: "Arapey"),)]
                        ),
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
                            validator: (value) =>
                                InputValidator.validateIBAN(value),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                          onPressed: () {},
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
