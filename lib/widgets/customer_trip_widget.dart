import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/trip.dart';
import 'make_review.dart';

class CustomerTrip extends StatelessWidget {
  var skillText = "null";
  var DriverName;
  var age;
  var city;
  var start_time;
  var finish_time;
  var tripId;
  var driverId;
  var customerId;

  CustomerTrip(var DriverName,var age,var city,var start_time,var finish_time,var tripId, var customerId, var driverId){
    this.DriverName = DriverName;
    this.age  = age;
    this.city = city;
    this.start_time = start_time;
    this.finish_time =finish_time;
    this.tripId = tripId;
    this.customerId = customerId;
    this.driverId = driverId;


  }

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return  Container(
      width: phoneWidth*0.7,
      margin: EdgeInsets.only(
          bottom: phoneWidth * 0.03,

          ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 167, 117, 77),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(
                right: phoneWidth * 0.01,
                left: phoneWidth * 0.01),
            child: const CircleAvatar(
              backgroundImage: AssetImage(
                  'lib/assets/images/blank-profile-photo.png'),
              radius: 30,
            ),
          ),
          Column( // trips
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  DriverName,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white,fontSize: 16),
                ),
              ),
              Container(
                color: Color.fromARGB(2, 3, 5, 7),
                alignment: Alignment.centerLeft,
                child: Text(
                  city,

                  style:
                  TextStyle(color: Colors.white),
                ),
              ),

              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Start 12-01-2022",
                      style: TextStyle(
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        left: phoneWidth * 0.02),
                    child: const Text(
                      "Finish 12-01-2022",
                      style: TextStyle(
                          color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),

          Container(
            alignment: Alignment.centerRight,
            width: phoneWidth * 0.18,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: phoneHeight * 0.01),
                  height: phoneHeight * 0.05,
                  //width: phoneWidth * 0.01,
                  child: const Text("200 TL",style: TextStyle(backgroundColor: Colors.white),
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(
                  top: phoneHeight * 0.03,
                  bottom: phoneHeight*0.01,
                  right: phoneWidth*0.01),
                  height: phoneHeight * 0.025,
                  //width: phoneWidth * 0.4,
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom( backgroundColor: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        "/reviewScreen",
                        arguments: this,
                      );

                    },
                    child: const Text("Review",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black,fontSize: 12),),
                  ),
                ),


              ],
            ),
          ) // en sagdaki butonlar
        ],
      ),
    ); // geçmis seyahat;
  }
}