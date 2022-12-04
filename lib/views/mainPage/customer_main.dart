import 'package:flutter/material.dart';

import '../../constants/assets_path.dart';

class CustomerMainScreen extends StatefulWidget {
  const CustomerMainScreen({super.key});

  @override
  State<CustomerMainScreen> createState() => _CustomerMainScreenState();
}

class _CustomerMainScreenState extends State<CustomerMainScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rent Car App"),
        actions: [
          CircleAvatar(
            backgroundColor: Theme.of(context).highlightColor,
            radius: 24,
            child: CircleAvatar(
              backgroundImage: AssetImage(AssetPaths.blankProfilePhotoPath),
              radius: 21.0,
            ),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                //Active Renting
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: phoneWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Active Renting",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: phoneHeight * 0.005,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).highlightColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: ListTile(
                              style: ListTileStyle.list,
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          AssetPaths.blankProfilePhotoPath),
                                      radius: 27.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: phoneWidth * 0.05,
                                    height: phoneHeight * 0.05,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Lewis Hamilton (27)",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                      Text(
                                        "Istanbul",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Text(
                                        "Start : 25.05.22 - Finish : 27.05.22",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: Text("150TL"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //Drivers
                Expanded(
                  flex: 15,
                  child: Container(
                    child: Container(
                        padding: EdgeInsets.only(
                            left: phoneWidth * 0.05,
                            right: phoneWidth * 0.05,
                            bottom: phoneHeight * 0.03),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Find A Driver",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: phoneHeight * 0.005,
                            ),
                            Expanded(
                              flex: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                      color: Theme.of(context).highlightColor,
                                      width: 5),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ), //Filter Button
            Positioned(
              top: phoneHeight * 0.84,
              left: phoneWidth * 0.35,
              child: Container(
                width: phoneWidth * 0.3,
                height: phoneHeight * 0.045,
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: Center(
                  child: Text(
                    "Filter",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
