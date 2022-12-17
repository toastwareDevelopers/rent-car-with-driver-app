import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/models/activeRentingCustomer.dart';
import 'package:rentcarmobile/models/customer.dart';
import 'package:rentcarmobile/models/driver.dart';
import 'package:rentcarmobile/services/mains.dart';
import 'package:rentcarmobile/services/profile.dart';
import 'package:rentcarmobile/widgets/driver_list_driver_widget.dart';
import 'package:rentcarmobile/widgets/filter_slider_widget.dart';

import '../../constants/assets_path.dart';
import '../../models/driverFilter.dart';

class CustomerMainScreen extends StatefulWidget {
  String locationDropdown = "Select";
  String genderDropdown = "Select";
  String languageDropdown = "Select";
  final List<String> cities = [
    "Select",
    "Adana",
    "Adiyaman",
    "Afyon",
    "Agri",
    "Aksaray",
    "Amasya",
    "Ankara",
    "Antalya",
    "Ardahan",
    "Artvin",
    "Aydin",
    "Balikesir",
    "Bartin",
    "Batman",
    "Bayburt",
    "Bilecik",
    "Bingol",
    "Bitlis",
    "Bolu",
    "Burdur",
    "Bursa",
    "Canakkale",
    "Cankiri",
    "Corum",
    "Denizli",
    "Diyarbakir",
    "Duzce",
    "Edirne",
    "Elazig",
    "Erzincan",
    "Erzurum",
    "Eskisehir",
    "Gaziantep",
    "Giresun",
    "Gumushane",
    "Hakkari",
    "Hatay",
    "Igdir",
    "Isparta",
    "Istanbul",
    "Izmir",
    "Kahramanmaras",
    "Karabuk",
    "Karaman",
    "Kars",
    "Kastamonu",
    "Kayseri",
    "Kilis",
    "Kirikkale",
    "Kirklareli",
    "Kirsehir",
    "Kocaeli",
    "Konya",
    "Kutahya",
    "Malatya",
    "Manisa",
    "Mardin",
    "Mersin",
    "Mugla",
    "Mus",
    "Nevsehir",
    "Nigde",
    "Ordu",
    "Osmaniye",
    "Rize",
    "Sakarya",
    "Samsun",
    "Sanliurfa",
    "Siirt",
    "Sinop",
    "Sirnak",
    "Sivas",
    "Tekirdag",
    "Tokat",
    "Trabzon",
    "Tunceli",
    "Usak",
    "Van",
    "Yalova",
    "Yozgat",
    "Zonguldak"
  ];
  final List<String> genders = ["Select", "Male", "Female"];
  final List<String> languages = [
    "Select",
    "Afrikaans",
    "Arabic",
    "Bengali",
    "Bulgarian",
    "Catalan",
    "Cantonese",
    "Croatian",
    "Czech",
    "Danish",
    "Dutch",
    "Lithuanian",
    "Malay",
    "Malayalam",
    "Panjabi",
    "Tamil",
    "English",
    "Finnish",
    "French",
    "German",
    "Greek",
    "Hebrew",
    "Hindi",
    "Hungarian",
    "Indonesian",
    "Italian",
    "Japanese",
    "Javanese",
    "Korean",
    "Norwegian",
    "Polish",
    "Portuguese",
    "Romanian",
    "Russian",
    "Serbian",
    "Slovak",
    "Slovene",
    "Spanish",
    "Swedish",
    "Telugu",
    "Thai",
    "Turkish",
    "Ukrainian",
    "Vietnamese",
    "Welsh",
    "Sign language",
    "Algerian",
    "Aramaic",
    "Armenian",
    "Berber",
    "Burmese",
    "Bosnian",
    "Brazilian",
    "Bulgarian",
    "Cypriot",
    "Corsica",
    "Creole",
    "Scottish",
    "Egyptian",
    "Esperanto",
    "Estonian",
    "Finn",
    "Flemish",
    "Georgian",
    "Hawaiian",
    "Indonesian",
    "Inuit",
    "Irish",
    "Icelandic",
    "Latin",
    "Mandarin",
    "Nepalese",
    "Sanskrit",
    "Tagalog",
    "Tahitian",
    "Tibetan",
    "Gypsy",
    "Wu"
  ];

  int startPrice = 0;
  int endPrice = 5000;
  double startRating = 0.0;
  double endRating = 10.0;
  int startAge = 18;
  int endAge = 70;
  int startCarYear = 1990;
  int endCarYear = DateTime.now().year;
  DriverFilter filter = DriverFilter(
      ageStart: 18,
      ageEnd: 70,
      carYearStart: 1990,
      carYearEnd: DateTime.now().year,
      gender: "null",
      location: "null",
      language: "null",
      hourlyPriceStart: 0,
      hourlyPriceEnd: 5000,
      ratingEnd: 10.0,
      ratingStart: 0.0);

  CustomerMainScreen({super.key}) {}

  @override
  State<CustomerMainScreen> createState() => _CustomerMainScreenState();
}

class _CustomerMainScreenState extends State<CustomerMainScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rent Car App"),
        centerTitle: true,
        actions: [
          FutureBuilder(
            future: ProfileService.getCustomer(RentVanApp.userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                String customerPhoto =
                    (snapshot.data as Customer).profileImage as String;
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/profileCustomer",
                        arguments: RentVanApp.userId);
                  },
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).highlightColor,
                    radius: 24,
                    child: CircleAvatar(
                      backgroundImage: customerPhoto == "null"
                          ? AssetImage(AssetPaths.blankProfilePhotoPath)
                          : Image.memory(base64Decode(customerPhoto)).image,
                      radius: 21.0,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          AssetPaths.chatIconPath,
          scale: 0.1,
          height: 35,
          width: 35,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pushNamed(context, "/allChats"),
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                //Active Renting
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: phoneWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Active Renting",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: phoneHeight * 0.005,
                        ),
                        FutureBuilder(
                          future: MainService.getCustomerActiveTrip(
                              RentVanApp.userId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasData) {
                              ActiveRentingCustomer renting =
                                  snapshot.data as ActiveRentingCustomer;
                              if (renting.id != "null") {
                                return Expanded(
                                  flex: 3,
                                  child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        InkWell(
                                          onTap: () => Navigator.pushNamed(
                                              context, "/profileDriverPersonal",
                                              arguments: renting.driverId),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .highlightColor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: ListTile(
                                              style: ListTileStyle.list,
                                              title: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 30,
                                                    child: CircleAvatar(
                                                      backgroundImage: renting
                                                                  .driverProfileImage ==
                                                              "null"
                                                          ? AssetImage(AssetPaths
                                                              .blankProfilePhotoPath)
                                                          : Image.memory(base64Decode(
                                                                  renting.driverProfileImage
                                                                      as String))
                                                              .image,
                                                      radius: 27.0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: phoneWidth * 0.05,
                                                    height: phoneHeight * 0.05,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "${renting.driverName} ${renting.driverSurname}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17),
                                                      ),
                                                      Text(
                                                        renting.location
                                                            as String,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14),
                                                      ),
                                                      Text(
                                                        "Start : ${renting.startDate?.substring(0, 10).replaceAll("-", "/")} - Finish : ${renting.endDate?.substring(0, 10).replaceAll("-", "/")}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(right: phoneWidth*0.01,top: phoneHeight*0.005),
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              child: Text("150TL"),
                                            ),
                                          ),
                                        )
                                      ]),
                                );
                              } else {
                                return Expanded(
                                  flex: 3,
                                  child: Container(
                                    color: Theme.of(context).highlightColor,
                                  ),
                                );
                              }
                            } else {
                              return Expanded(
                                flex: 3,
                                child: Container(
                                  color: Theme.of(context).highlightColor,
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
                //Drivers
                Expanded(
                  flex: 15,
                  child: Container(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: phoneWidth * 0.05,
                          right: phoneWidth * 0.05,
                          bottom: phoneHeight * 0.03),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Find A Driver",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: phoneHeight * 0.005,
                          ),
                          Expanded(
                            flex: 10,
                            child: FutureBuilder(
                              future:
                                  MainService.getFilteredDrivers(widget.filter),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.hasData) {
                                  List<Driver> drivers =
                                      snapshot.data as List<Driver>;
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: phoneWidth * 0.02,
                                        vertical: phoneHeight * 0.01),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      border: Border.all(
                                          color:
                                              Theme.of(context).highlightColor,
                                          width: 5),
                                    ),
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        height: phoneHeight * 0.01,
                                      ),
                                      itemCount: drivers.length,
                                      itemBuilder: ((context, index) {
                                        return DriverListDriver(
                                          driverId: drivers[index].id,
                                          driverName: drivers[index].name +
                                              " " +
                                              drivers[index].surname,
                                          driverAge:
                                              "${DateTime.now().year - int.parse(drivers[index].birthDate.toString().substring(0, 4))}",
                                          driverLocation:
                                              drivers[index].location,
                                          driverDescription:
                                              drivers[index].info,
                                          driverPrice: drivers[index]
                                              .hourlyPrice
                                              .toString(),
                                          driverRating:
                                              drivers[index].rating.toString(),
                                          driverPhoto:
                                              drivers[index].profileImage,
                                        );
                                      }),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ), //Filter Button
            Positioned(
              top: phoneHeight * 0.84,
              left: phoneWidth * 0.35,
              child: InkWell(
                onTap: () {
                  showFilters(
                      context, refreshWithFilter, phoneHeight, phoneWidth);
                },
                child: Container(
                  width: phoneWidth * 0.3,
                  height: phoneHeight * 0.045,
                  decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: Center(
                    child: Text(
                      "Filter",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void refreshWithFilter() {
    setState(() {});
  }

  void editPrice(double startPrice, double endPrice) {
    widget.startPrice = startPrice.toInt();
    widget.endPrice = endPrice.toInt();
  }

  void editRating(double startRating, double endRating) {
    widget.startRating = startRating;
    widget.endRating = endRating;
  }

  void editAge(double startAge, double endAge) {
    widget.startAge = startAge.toInt();
    widget.endAge = endAge.toInt();
  }

  void editCarYear(double startCarYear, double endCarYear) {
    widget.startCarYear = startCarYear.toInt();
    widget.endCarYear = endCarYear.toInt();
  }

  Future<dynamic> showFilters(BuildContext context, Function refreshWithFilter,
      double phoneHeight, double phoneWidth) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: ((BuildContext context) => StatefulBuilder(
            builder: (context, setState) => Container(
              padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.1),
              height: phoneHeight * 0.75,
              decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                          child: Text(
                        "Filter Drivers",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        //Location Dropdown
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButton(
                              value: widget.locationDropdown,
                              items: widget.cities
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  widget.locationDropdown = value.toString();
                                });
                              },
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              isExpanded: true,
                            ),
                          ),
                        ),
                        SizedBox(width: phoneWidth * 0.05),
                        //Gender Dropdown
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButton(
                              value: widget.genderDropdown,
                              items: widget.genders
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Text(value,
                                            style:
                                                const TextStyle(fontSize: 17)),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  print(value);
                                  widget.genderDropdown = value.toString();
                                });
                              },
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              isExpanded: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Language Dropdown
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: phoneWidth * 0.2),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                value: widget.languageDropdown,
                                items: widget.languages
                                    .map(
                                      (value) => DropdownMenuItem(
                                        value: value,
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Text(
                                            value,
                                            style:
                                                const TextStyle(fontSize: 17),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    widget.languageDropdown = value.toString();
                                  });
                                },
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                isExpanded: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: FilterSlider(
                                        "Price",
                                        editPrice,
                                        0,
                                        5000,
                                        widget.startPrice.toDouble(),
                                        widget.endPrice.toDouble()),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: FilterSlider(
                                        "Rating",
                                        editRating,
                                        0.0,
                                        10.0,
                                        widget.startRating,
                                        widget.endRating),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: FilterSlider(
                                        "Age",
                                        editAge,
                                        18,
                                        70,
                                        widget.startAge.toDouble(),
                                        widget.endAge.toDouble()),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: FilterSlider(
                                        "Car Year",
                                        editCarYear,
                                        1990,
                                        DateTime.now().year.toDouble(),
                                        widget.startCarYear.toDouble(),
                                        widget.endCarYear.toDouble()),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: phoneHeight * 0.01),
                      child: Center(
                        child: ElevatedButton(
                          child: Text(
                            "Filter",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Colors.white,
                            ),
                            minimumSize: MaterialStatePropertyAll(
                                Size.fromWidth(phoneWidth * 0.3)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();

                            widget.filter.ageStart = widget.startAge;
                            widget.filter.ageEnd = widget.endAge;
                            widget.filter.carYearStart = widget.startCarYear;
                            widget.filter.carYearEnd = widget.endCarYear;
                            widget.filter.gender =
                                widget.genderDropdown != "Select"
                                    ? widget.genderDropdown.toString()
                                    : "null";
                            widget.filter.language =
                                widget.languageDropdown != "Select"
                                    ? widget.languageDropdown.toString()
                                    : "null";
                            widget.filter.location =
                                widget.locationDropdown != "Select"
                                    ? widget.locationDropdown.toString()
                                    : "null";
                            widget.filter.ratingStart = widget.startRating;
                            widget.filter.ratingEnd = widget.endRating;
                            widget.filter.hourlyPriceStart = widget.startPrice;
                            widget.filter.hourlyPriceEnd = widget.endPrice;

                            refreshWithFilter();
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
