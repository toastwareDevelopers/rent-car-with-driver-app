import 'package:flutter/material.dart';
import 'package:rentcarmobile/constants/assets_path.dart';

class RegisterDriverScreen extends StatefulWidget {
  const RegisterDriverScreen({super.key});

  @override
  State<RegisterDriverScreen> createState() => _RegisterDriverScreenState();
}

class _RegisterDriverScreenState extends State<RegisterDriverScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: <Widget>[
          //Register as a Driver yazan başlık
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(top: phoneHeight * 0.08),
              child: Text(
                "Register as a Driver",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          //Profil fotoğrafı yükleme alanı
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).highlightColor,
                      radius: 40,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage(AssetPaths.blankProfilePhotoPath),
                        radius: 37.0,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).highlightColor,
                      radius: 13,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage(AssetPaths.uploadPhotoIconPath),
                        radius: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Form inputları alanı
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.only(
                  left: phoneWidth * 0.07, right: phoneWidth * 0.07),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Name - Surname
                  Row(
                    children: [
                      //Name
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(hintText: "Name"),
                        ),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.04,
                      ),
                      //Surname
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(hintText: "Surname"),
                        ),
                      ),
                    ],
                  ),
                  //Birthdate - Gender
                  Row(
                    children: [
                      //Birthdate
                      const Expanded(
                        flex: 1,
                        child: TextField(decoration: InputDecoration(hintText: "Birthdate"),),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.04,
                      ),
                      //Gender
                      const Expanded(
                        flex: 1,
                        child: TextField(decoration: InputDecoration(hintText: "Gender"),),
                      ),
                    ],
                  ),
                  //NationalID - Location
                  Row(
                    children: [
                      //NationalID
                      const Expanded(
                        flex: 1,
                        child: TextField(decoration: InputDecoration(hintText: "NationalID"),),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.04,
                      ),
                      //Location
                      const Expanded(
                        flex: 1,
                        child: TextField(decoration: InputDecoration(hintText: "Location"),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //Continue butonu alanı
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                child: const Text("Continue"),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
