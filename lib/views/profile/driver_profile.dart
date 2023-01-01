import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/models/review.dart';
import 'package:rentcarmobile/services/profile.dart';
import 'package:rentcarmobile/utils/base64_converter.dart';
import 'package:rentcarmobile/widgets/driver_skill_widget.dart';

import '../../constants/assets_path.dart';
import '../../models/driver.dart';
import '../../widgets/review_widget.dart';
import '../chat/message_screen.dart';

class DriverProfileScreen extends StatefulWidget {
  DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    String driverID = ModalRoute.of(context)!.settings.arguments as String;

    return FutureBuilder(
      future: ProfileService.getDriver(driverID),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          Driver driver = snapshot.data as Driver;
          return Scaffold(
            appBar: AppBar(
              title: const Text("Driver Profile"),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/balanceDriver",
                        arguments: "150");
                  },
                  icon: Icon(Icons.account_balance_wallet),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: RentVanApp.userType == "driver"
                  ? Image.asset(
                      AssetPaths.editIconPath,
                      scale: 0.1,
                      height: 40,
                      width: 40,
                      color: Colors.white,
                    )
                  : Image.asset(
                      AssetPaths.chatIconPath,
                      scale: 0.1,
                      height: 40,
                      width: 40,
                      color: Colors.white,
                    ),
              onPressed: RentVanApp.userType == "driver"
                  ? () {
                      Navigator.pushNamed(context, "/editDriverAuth",
                          arguments: driver);
                    }
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MessageScreen(
                            receiverId: driverID,
                          ),
                        ),
                      );
                    },
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
                        Navigator.pushNamed(context, "/profileDriverCar",
                            arguments: driver);
                      },
                      child: Container(
                        height: phoneHeight * 0.05,
                        width: phoneWidth * 0.15,
                        decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Image.asset(
                          AssetPaths.carIconPath,
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
                        flex: 4,
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
                                          backgroundImage: driver
                                                      .profileImage !=
                                                  "null"
                                              ? Image.memory(Base64Converter
                                                      .decodeImage64(
                                                          driver.profileImage))
                                                  .image
                                              : AssetImage(AssetPaths
                                                  .blankProfilePhotoPath),
                                          radius: 37.0,
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor:
                                            Theme.of(context).highlightColor,
                                        radius: 13,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Colors.green.shade700,
                                          radius: 11,
                                          child: Text(
                                            driver.rating.toString(),
                                            style:
                                                TextStyle(color: Colors.white),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color: Theme.of(context)
                                                .highlightColor,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        height: phoneHeight * 0.03,
                                        width: phoneWidth * 0.20,
                                        child: Center(
                                          child: Text(
                                            "${driver.hourlyPrice}TL",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
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
                      //Biogrophy
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: phoneWidth * 0.04),
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
                                      "Biography",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color:
                                            Color.fromARGB(255, 244, 243, 243),
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
                                  initialValue: driver.bio,
                                  readOnly: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Skills and Languages
                      Expanded(
                        flex: ((driver.languages.length as int) / 4 > 1 &&
                                (driver.skills.length as int) / 4 > 1)
                            ? 5
                            : ((driver.languages.length as int) / 4 > 1 ||
                                    (driver.skills.length as int) / 4 > 1)
                                ? 4
                                : 3,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: phoneWidth * 0.04,
                              right: phoneWidth * 0.04,
                              top: phoneHeight * 0.01),
                          child: Column(
                            children: [
                              Expanded(
                                flex: (driver.skills.length as int) / 4 > 1 &&
                                        (driver.languages.length as int) / 4 <=
                                            1
                                    ? 3
                                    : (driver.skills.length as int) / 4 <= 1 &&
                                            (driver.languages.length as int) /
                                                    4 >
                                                1
                                        ? 2
                                        : 1,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: (driver.skills.length as int) / 4 >
                                                    1 &&
                                                (driver.languages.length
                                                            as int) /
                                                        4 <=
                                                    1
                                            ? 16
                                            : (driver.skills.length as int) /
                                                            4 <=
                                                        1 &&
                                                    (driver.languages.length
                                                                as int) /
                                                            4 >
                                                        1
                                                ? 25
                                                : (driver.skills.length
                                                                    as int) /
                                                                4 >
                                                            1 &&
                                                        (driver.languages.length
                                                                    as int) /
                                                                4 >
                                                            1
                                                    ? 15
                                                    : 30,
                                        child: Container(
                                          child: const Text(
                                            "Skills",
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 244, 243, 243),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 50,
                                        child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  mainAxisSpacing: 10,
                                                  crossAxisSpacing: 10,
                                                  childAspectRatio: 3),
                                          itemCount: driver.skills.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) =>
                                              DriverSkillBar(
                                            skillText:
                                                driver.skills[index] as String,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: (driver.skills.length as int) / 4 > 1 &&
                                        (driver.languages.length as int) / 4 <=
                                            1
                                    ? 2
                                    : (driver.skills.length as int) / 4 <= 1 &&
                                            (driver.languages.length as int) /
                                                    4 >
                                                1
                                        ? 3
                                        : 1,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: (driver.skills.length as int) / 4 >
                                                    1 &&
                                                (driver.languages.length
                                                            as int) /
                                                        4 <=
                                                    1
                                            ? 25
                                            : (driver.skills.length as int) /
                                                            4 <=
                                                        1 &&
                                                    (driver.languages.length
                                                                as int) /
                                                            4 >
                                                        1
                                                ? 16
                                                : (driver.skills.length
                                                                    as int) /
                                                                4 >
                                                            1 &&
                                                        (driver.languages.length
                                                                    as int) /
                                                                4 >
                                                            1
                                                    ? 15
                                                    : 30,
                                        child: Container(
                                          child: const Text(
                                            "Languages",
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 244, 243, 243),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 50,
                                        child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  mainAxisSpacing: 10,
                                                  crossAxisSpacing: 10,
                                                  childAspectRatio: 3),
                                          itemCount: driver.languages.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) =>
                                              DriverSkillBar(
                                            skillText: driver.languages[index]
                                                as String,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Reviews
                      Expanded(
                        flex: ((driver.languages.length as int) / 4 > 1 &&
                                (driver.skills.length as int) / 4 > 1)
                            ? 4
                            : ((driver.languages.length as int) / 4 > 1 ||
                                    (driver.skills.length as int) / 4 > 1)
                                ? 3
                                : 4,
                        child: Container(
                          height: phoneHeight * 0.1,
                          padding: EdgeInsets.symmetric(
                              horizontal: phoneWidth * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 1,
                                      right: 0,
                                      bottom: 5,
                                      top: 0,
                                    ),
                                    child: const Text(
                                      "Reviews",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 244, 243, 243),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: phoneWidth * 0.01,
                                      vertical: phoneHeight * 0.01),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 244, 243, 243),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: FutureBuilder(
                                    future:
                                        ProfileService.getReviewsById(driverID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                              ConnectionState.done &&
                                          (snapshot.data as List<Review>)
                                                  .length >
                                              0) {
                                        List<Review> reviews =
                                            snapshot.data as List<Review>;
                                        return ListView.separated(
                                            itemBuilder: ((context, index) {
                                              return ReviewWidget(
                                                  name: reviews[index]
                                                          .customerName
                                                          .toString() +
                                                      " " +
                                                      reviews[index]
                                                          .customerSurname
                                                          .toString(),
                                                  review: reviews[index]
                                                      .reviewText
                                                      .toString(),
                                                  rating: reviews[index]
                                                      .rating
                                                      .toString(),
                                                  customerProfileImage:
                                                      reviews[index]
                                                          .customerProfilePhoto
                                                          .toString());
                                            }),
                                            separatorBuilder: ((context,
                                                    index) =>
                                                SizedBox(
                                                  height: phoneHeight * 0.01,
                                                )),
                                            itemCount: reviews.length);
                                      } else {
                                        return Container(
                                          child: Center(
                                              child: snapshot.connectionState ==
                                                      ConnectionState.waiting
                                                  ? Text(
                                                      "Reviews are loading..")
                                                  : Text(
                                                      "We couldn't find any review")),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Container(),
          );
        }
      }),
    );
  }
}
