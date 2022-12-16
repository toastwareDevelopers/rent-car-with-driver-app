import 'dart:convert';

import 'package:flutter/material.dart';

import '../constants/assets_path.dart';

class DriverListDriver extends StatelessWidget {
  var driverId = "null";
  var driverPhoto = "null";
  var driverName = "null";
  var driverAge = "00";
  var driverLocation = "null";
  var driverDescription = "null";
  var driverPrice = "00";
  var driverRating = "0.0";

  DriverListDriver(
      {super.key,
      this.driverId = "null",
      this.driverPhoto = "null",
      this.driverName = "null",
      this.driverAge = "00",
      this.driverLocation = "",
      this.driverDescription = "null",
      this.driverPrice = "00",
      this.driverRating = "0.0"});

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (() {
        Navigator.pushNamed(context, "/profileDriverPersonal",arguments: driverId);
      }),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Theme.of(context).highlightColor,
            ),
            child: ListTile(
              style: ListTileStyle.list,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: CircleAvatar(
                        backgroundImage: driverPhoto == "null" ? 
                            AssetImage(AssetPaths.blankProfilePhotoPath) : Image.memory(base64Decode(driverPhoto)).image,
                        radius: 27.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: phoneWidth * 0.02,
                    height: phoneHeight * 0.05,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${driverName} (${driverAge})",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          Text(
                            "${driverLocation}",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            "${driverDescription}",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: phoneHeight*0.06,right: phoneWidth*0.01),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Text("${driverPrice}TL"),
            ),
          ),
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                color: Colors.green),
            child: Center(
                child: Text(
              driverRating,
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}
