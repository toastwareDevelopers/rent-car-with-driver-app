import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PersonChat extends StatelessWidget {
  var skillText = "null";
  var name;
  var surname;
  var last_response;
  var last_speak_time;

  PersonChat(var name , var last_response,var last_speak_time){
    this.name = name;
    this.surname = surname;
    this.last_response =last_response;
    this.last_speak_time = last_speak_time;
  }

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return Container(
      //color: Colors.red,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: phoneWidth * 0.03),
      height: phoneHeight * 0.1,
      width: phoneWidth,
      child: Row(
        children: [
          Container(
            height: phoneHeight*0.08,
            width: phoneWidth*0.15,
            //color: Colors.blue,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              top: phoneHeight * 0.01, left: phoneWidth * 0.02,
              bottom: phoneHeight * 0.01, right: phoneWidth * 0.02,),
            child: const CircleAvatar(
              backgroundImage: AssetImage(
                  'lib/assets/images/blank-profile-photo.png'),
              radius: 30,
            ),
          ),
          Container(
            height: phoneHeight*0.06,
            width: phoneWidth*0.6,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              top: phoneHeight * 0.02,
              bottom: phoneHeight * 0.02,


            ),
            //color: Colors.amber,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        name,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        last_response,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),



              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: phoneHeight*0.08,
            width: phoneWidth*0.2,
            margin: EdgeInsets.only(top: phoneHeight * 0.02,bottom: phoneHeight * 0.02),
           // color: Colors.green,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      margin: EdgeInsets.only(top: phoneHeight * 0.02,bottom: phoneHeight * 0.02),
                      alignment: Alignment.center,

                      child: Text(
                        last_speak_time,
                          textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),



              ],
            ),
          ),
        ],
      ),
    ); // geçmis seyahat;
  }
}