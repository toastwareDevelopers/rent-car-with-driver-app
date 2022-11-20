import 'package:flutter/material.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Profile Screen"),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: phoneHeight*0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.pink,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            padding: const EdgeInsets.only(
                                left: 1, right: 0, bottom: 5, top: 0),
                            child: const Text(
                              "Biography",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 244, 243, 243),
                              ),
                            )),
                      ),
                    ),
                    const Expanded(
                      flex: 4,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 1,
                            right: 0,
                            bottom: 5,
                            top: 0,
                          ),
                          child: const Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 244, 243, 243),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 244, 243, 243),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
