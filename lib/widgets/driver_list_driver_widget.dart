import 'package:flutter/material.dart';

import '../constants/assets_path.dart';

class DriverListDriver extends StatelessWidget {
  var driverName = "null";
  var driverAge = "00";
  var driverLocation = "null";
  var driverDescription = "null";
  var driverPrice = "00";
  var driverRating = "0.0";

  DriverListDriver(
      {super.key,
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
        Navigator.pushNamed(context, "/profileDriverPersonal");
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
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage(AssetPaths.blankProfilePhotoPath),
                      radius: 27.0,
                    ),
                  ),
                  SizedBox(
                    width: phoneWidth * 0.05,
                    height: phoneHeight * 0.05,
                  ),
                  Container(
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
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(bottom: phoneHeight * 0.03),
                      alignment: Alignment.topRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text("${driverPrice}TL"),
                      ),
                    ),
                  )
                ],
              ),
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
              style: TextStyle(color: Colors.grey.shade900),
            )),
          ),
        ],
      ),
    );
  }
}
