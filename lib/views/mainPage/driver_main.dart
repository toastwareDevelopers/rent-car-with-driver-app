import 'package:flutter/material.dart';

class DriverMainScreen extends StatefulWidget {
  const DriverMainScreen({super.key});

  @override
  State<DriverMainScreen> createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff282828),
        body: SizedBox(
          width: phoneWidth,
          height: phoneHeight,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: phoneHeight * 0.06, bottom: phoneHeight * 0.01),
                width: phoneWidth * 0.75,
                child: const Text(
                  "Active Customer",
                  style: TextStyle(color: Colors.white, fontFamily: 'Arapey'),
                ),
              ),
              Center(
                child: Container(
                  height: phoneHeight * 0.125,
                  width: phoneWidth * 0.75,
                  decoration: const BoxDecoration(
                    color: Color(0xffA7754D),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: phoneHeight * 0.03, bottom: phoneHeight * 0.01),
                width: phoneWidth * 0.75,
                child: const Text(
                  "Future Appointments",
                  style: TextStyle(color: Colors.white, fontFamily: 'Arapey'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 5,
                    color: const Color(0xffA7754D),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                height: phoneHeight * 0.625,
                width: phoneWidth * 0.75,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: phoneHeight * 0.03),
                        height: phoneHeight * 0.125,
                        width: phoneWidth * 0.7,
                        decoration: const BoxDecoration(
                          color: Color(0xffA7754D),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
