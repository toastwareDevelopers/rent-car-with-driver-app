import 'package:flutter/material.dart';

import '../constants/assets_path.dart';

class ReviewWidget extends StatelessWidget {
  var name = "null";
  var review = "null";
  var rating = "0.0";

  ReviewWidget({
    super.key,
    this.name = "null",
    this.review = "null",
    this.rating = "0.0",
  });

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: phoneWidth*0.7,
      height: phoneHeight*0.1,
      child: Stack(
        alignment: Alignment.topRight,
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
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage(AssetPaths.blankProfilePhotoPath),
                          radius: 15.0,
                        ),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.05,
                        height: phoneHeight * 0.05,
                      ),
                      Container(
                        child: Text(
                          "$name",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: phoneHeight*0.01,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text("$review",style: TextStyle(color: Colors.white),),
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
