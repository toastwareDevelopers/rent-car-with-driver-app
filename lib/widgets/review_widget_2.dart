import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rentcarmobile/models/review.dart';
import 'package:flutter/material.dart';
import '../constants/assets_path.dart';
import '../utils/base64_converter.dart';

class ReviewWidget2 extends StatelessWidget {
  var name;
  var comment;
  String image = "null";
  String rating = "0.0";

  ReviewWidget2(var name, var comment, String image,String rating) {
    this.name = name;
    this.comment = comment;
    this.image = image;
    this.rating = rating;
  }
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        left: phoneWidth * 0.02,
        right: phoneWidth * 0.02,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 167, 117, 77),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: CircleAvatar(
                          backgroundImage: image != "null"
                              ? Image.memory(
                                      Base64Converter.decodeImage64(image))
                                  .image
                              : AssetImage(AssetPaths.blankProfilePhotoPath),
                          radius: 22.0,
                        ),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.01,
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: phoneWidth * 0.03,
                      vertical: phoneHeight * 0.01),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    comment,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
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
                rating,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
