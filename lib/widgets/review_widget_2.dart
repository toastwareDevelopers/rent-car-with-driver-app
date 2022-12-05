import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rentcarmobile/models/review.dart';
import 'package:flutter/material.dart';
import '../constants/assets_path.dart';

class review_widget extends StatelessWidget {
  var name;
  var comment;

  review_widget(var name,var comment){
    this.name = name;
    this.comment = comment;
  }
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery
        .of(context)
        .size
        .height;
    double phoneWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
        padding: EdgeInsets.only(
          left: phoneWidth * 0.01,
          right: phoneWidth * 0.02,

        ),
        margin: EdgeInsets.only(
          bottom: phoneWidth * 0.03,
        ),
        child: Container(
            width: phoneWidth * 0.8,
            height: phoneHeight * 0.1,

            decoration: BoxDecoration(
              color: Color.fromARGB(255, 167, 117, 77),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        right: phoneWidth * 0.01,
                        left: phoneWidth * 0.01,
                        top: phoneHeight * 0.01,

                      ),

                      child: const CircleAvatar(
                        backgroundImage: AssetImage(
                            'lib/assets/images/blank-profile-photo.png'),
                        radius: 25,
                      ),
                    ),
                    Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              name,
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.white,fontSize: 16),
                            ),
                          ),

                        ],
                      ),
                    ),
                    

                  ],
                ),
                Row(

                  children: [

                    Container(
                      padding: EdgeInsets.only(left: phoneWidth * 0.01),
                      child: Text(comment,
                        style: TextStyle(color: Colors.white),),
                    ),


                  ],
                ),

              ],
            )
        )
    );
  }
}