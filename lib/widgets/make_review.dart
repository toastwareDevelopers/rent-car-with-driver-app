import 'package:flutter/material.dart';

import '../services/profile.dart';


class MakeReview extends StatelessWidget {
  var skillText = "null";
  var name;
  var age;
  var city;
  var start_time;
  var finish_time;
  var customerId;
  var driverId;
  var tripId;
  MakeReview(var name,var age,var city,var start_time,var finish_time,var tripId,var customerId,var driverId){
    this.name = name;
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
    return Container(
      alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(top : phoneHeight* 0.2975),
      child: Column(

        children: [
          Container(

            color: Color.fromARGB(255, 167, 117, 77),
            width: phoneWidth,
            height: phoneHeight*0.6,
            child: Column(
              children: [
              Container(
              width: phoneWidth,

              padding: EdgeInsets.only(
                bottom: phoneHeight * 0.03,
                top: phoneHeight* 0.03
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
                          name,
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

                  ) // en sagdaki butonlar
                ],
              ),
            ),
              Container(
                //color: Colors.yellow,
                width: phoneWidth,
                height: phoneHeight * 0.025,
                padding: EdgeInsets.only(
                  left: phoneWidth * 0.05
                ),
                child: Text("Review",
                  style: TextStyle(color: Colors.black,fontSize: 16),),

              ),
                Container(
                  //color: Colors.brown,
                  width: phoneWidth,
                  height: phoneHeight*0.25,
                  padding: EdgeInsets.only(
                    left: phoneWidth * 0.07,
                  right: phoneWidth* 0.07,
                  top: phoneHeight * 0.01,),
                  child: SizedBox(
                    width: 100.0,
                    height: phoneHeight * 0.3,

                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      initialValue: "Message",
                      maxLines: 7,

                    ),
                  )
                ),
                Container(
                  //color: Colors.green,
                  width: phoneWidth* 0.25,
                  height: phoneHeight *0.075,
                  child: SizedBox(
                    width: phoneWidth * 0.1,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Rating"),
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                  )
                ),
                Container(
                  width: phoneWidth * 0.3,
                  height: phoneHeight *0.07,
                  margin: EdgeInsets.only(
                    top: phoneWidth * 0.02,
                  ),
                  //color: Colors.red,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Text("Send",
                    style: TextStyle(color: Colors.black),),
                    onPressed: () async {
                      await Future.wait([
                        ProfileService.postCustomerReview(customerId, driverId, "sadsad", "asd", tripId),

                      ]);
                    },
                  ),
                )

        ],
            ),
          )
        ],
      ),
    );
  }
}
