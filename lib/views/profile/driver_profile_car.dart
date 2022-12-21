import 'package:flutter/material.dart';
import '../../constants/assets_path.dart';
import '../../main.dart';
import '../../models/driver.dart';

class DriverProfileCarScreen extends StatefulWidget {
  DriverProfileCarScreen({super.key});

  @override
  State<DriverProfileCarScreen> createState() => _DriverProfileCarScreenState();
}

class _DriverProfileCarScreenState extends State<DriverProfileCarScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    Driver driver = ModalRoute.of(context)!.settings.arguments as Driver;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Profile Car"),
      ),
      floatingActionButton: FloatingActionButton(
        child: RentVanApp.userType == "driver" ? Image.asset(
          AssetPaths.editIconPath,
          scale: 0.1,
          height: 40,
          width: 40,
          color: Colors.white,
        ) : Image.asset(
          AssetPaths.chatIconPath,
          scale: 0.1,
          height: 40,
          width: 40,
          color: Colors.white,
        ) ,
        onPressed: RentVanApp.userType == "driver" ? () {Navigator.pushNamed(context, "/editDriverAuth");} : () {Navigator.pushNamed(context, "/messaging");} ,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: phoneHeight * 0.02),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned(
              top: phoneHeight * 0.2,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: phoneHeight * 0.05,
                  width: phoneWidth * 0.15,
                  decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Image.asset(
                    AssetPaths.personalIconPath,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Profile Photo and Name
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.only(right: 5),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).highlightColor,
                                  radius: 40,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        AssetPaths.blankProfilePhotoPath),
                                    radius: 37.0,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).highlightColor,
                                  radius: 13,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green.shade700,
                                    radius: 11,
                                    child: Text(
                                      driver.rating.toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${driver.name} ${driver.surname} (${DateTime.now().year - int.parse(driver.birthDate.toString().substring(0, 4))})",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                                Text(
                                  "${driver.location}, ${driver.gender}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).highlightColor,
                                      borderRadius: BorderRadius.circular(3)),
                                  height: phoneHeight * 0.03,
                                  width: phoneWidth * 0.20,
                                  child: Center(
                                    child: Text(
                                      "${driver.hourlyPrice}TL",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Car Photos
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: phoneWidth * 0.04,
                    ),
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
                                "Car Photos",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 244, 243, 243),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 7,
                            initialValue: "",
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Other Informations
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: phoneWidth * 0.04, right: phoneWidth * 0.04),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Car Brand",
                                      style: TextStyle(color: Colors.white,fontSize: 17),
                                    ),
                                    SizedBox(height: 5,),
                                    TextFormField(
                                      readOnly: true,
                                      initialValue: driver.carInfo["brand"],
                                      decoration: const InputDecoration(
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Car Model",
                                      style: TextStyle(color: Colors.white,fontSize: 17),
                                    ),
                                    SizedBox(height: 5,),
                                    TextFormField(
                                      readOnly: true,
                                      initialValue: driver.carInfo["model"],
                                      decoration: const InputDecoration(
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: phoneWidth * 0.1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Car Color",
                                      style: TextStyle(color: Colors.white,fontSize: 17),
                                    ),
                                    SizedBox(height: 5,),
                                    TextFormField(
                                      readOnly: true,
                                      initialValue: driver.carInfo["color"],
                                      decoration: const InputDecoration(
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Car Year",
                                      style: TextStyle(color: Colors.white,fontSize: 17),
                                    ),
                                    SizedBox(height: 5,),
                                    TextFormField(
                                      readOnly: true,
                                      initialValue: driver.carInfo["year"],
                                      decoration: const InputDecoration(
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}