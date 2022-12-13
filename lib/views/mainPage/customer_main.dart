import 'package:flutter/material.dart';
import 'package:rentcarmobile/widgets/driver_list_driver_widget.dart';
import 'package:rentcarmobile/widgets/filter_slider_widget.dart';

import '../../constants/assets_path.dart';

class CustomerMainScreen extends StatefulWidget {
  CustomerMainScreen({super.key});
  String? locationDropdown = "Adana";
  String? genderDropdown = "Male";
  final List<String> cities = [
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
  final List<String> genders = ["Male", "Female"];
  final List<String> languages = [
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
  List<String> addedLanguages = [];
  String? languageDropdown = "Turkish";
  int startPrice = 0;
  int endPrice = 10000;

  @override
  State<CustomerMainScreen> createState() => _CustomerMainScreenState();
}

class _CustomerMainScreenState extends State<CustomerMainScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    var drivers = [
      DriverListDriver(
          driverName: "Lewis Hamilton",
          driverAge: "37",
          driverLocation: "Istanbul",
          driverDescription: "Guzel bir yolc..",
          driverPrice: "150"),
      DriverListDriver(
          driverName: "Ahmet Kasabalı",
          driverAge: "20",
          driverLocation: "Istanbul",
          driverDescription: "Selamlar benimle yolc..",
          driverPrice: "150"),
      DriverListDriver(
          driverName: "Ahmet Kasabalı",
          driverAge: "20",
          driverLocation: "Istanbul",
          driverDescription: "Ben süper bir..",
          driverPrice: "150")
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rent Car App"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/profileCustomer");
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).highlightColor,
              radius: 24,
              child: CircleAvatar(
                backgroundImage: AssetImage(AssetPaths.blankProfilePhotoPath),
                radius: 21.0,
              ),
            ),
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
                        Expanded(
                          flex: 3,
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, "/profileDriverPersonal"),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).highlightColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
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
                                        backgroundImage: AssetImage(
                                            AssetPaths.blankProfilePhotoPath),
                                        radius: 27.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: phoneWidth * 0.05,
                                      height: phoneHeight * 0.05,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Lewis Hamilton (27)",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          "Istanbul",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "Start : 25.05.22 - Finish : 27.05.22",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
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
                                  ],
                                ),
                              ),
                            ),
                          ),
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
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: phoneWidth * 0.02,
                                  vertical: phoneHeight * 0.01),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                    color: Theme.of(context).highlightColor,
                                    width: 5),
                              ),
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: phoneHeight * 0.01,
                                ),
                                itemCount: drivers.length,
                                itemBuilder: ((context, index) {
                                  return DriverListDriver(
                                    driverName: drivers[index].driverName,
                                    driverAge: drivers[index].driverAge,
                                    driverLocation:
                                        drivers[index].driverLocation,
                                    driverDescription:
                                        drivers[index].driverDescription,
                                    driverPrice: drivers[index].driverPrice,
                                  );
                                }),
                              ),
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
                  showFilters(context, phoneHeight);
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

  void editPrice(double startPrice,double endPrice){
    widget.startPrice = startPrice.toInt();
    widget.endPrice = endPrice.toInt();
  }

  Future<dynamic> showFilters(BuildContext context, double phoneHeight) {
    return showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: ((BuildContext context) => Container(
                    height: phoneHeight*0.75,
                    decoration: BoxDecoration(color: Theme.of(context).highlightColor),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  //Location Dropdown
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 218, 218, 218),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: DropdownButton(
                                        value: widget.locationDropdown,
                                        items: widget.cities
                                            .map(
                                              (value) => DropdownMenuItem(
                                                value: value,
                                                child: Container(
                                                  padding: const EdgeInsets.only(
                                                      left: 12),
                                                  child: Text(value,
                                                      style: const TextStyle(
                                                          fontSize: 17)),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            widget.locationDropdown = value;
                                          });
                                        },
                                        dropdownColor: const Color.fromARGB(
                                            255, 218, 218, 218),
                                        borderRadius: BorderRadius.circular(10),
                                        isExpanded: true,
                                      ),
                                    ),
                                  ),
                                  //Gender Dropdown
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 218, 218, 218),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: DropdownButton(
                                        value: widget.genderDropdown,
                                        items: widget.genders
                                            .map(
                                              (value) => DropdownMenuItem(
                                                value: value,
                                                child: Container(
                                                  padding: const EdgeInsets.only(
                                                      left: 12),
                                                  child: Text(value,
                                                      style: const TextStyle(
                                                          fontSize: 17)),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            widget.genderDropdown = value;
                                          });
                                        },
                                        dropdownColor: const Color.fromARGB(
                                            255, 218, 218, 218),
                                        borderRadius: BorderRadius.circular(10),
                                        isExpanded: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  //Language Dropdown
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 218, 218, 218),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: DropdownButton(
                                        value: widget.languageDropdown,
                                        items: widget.languages
                                            .map(
                                              (value) => DropdownMenuItem(
                                                value: value,
                                                child: Container(
                                                  padding: const EdgeInsets.only(
                                                      left: 12),
                                                  child: Text(
                                                    value,
                                                    style: const TextStyle(
                                                        fontSize: 17),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            widget.languageDropdown = value;
                                          });
                                        },
                                        dropdownColor: const Color.fromARGB(
                                            255, 218, 218, 218),
                                        borderRadius: BorderRadius.circular(10),
                                        isExpanded: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [Expanded(child: FilterSlider("Price", editPrice))],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [Expanded(child: FilterSlider("Rating", editPrice))],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [Expanded(child: FilterSlider("Age", editPrice))],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [Expanded(child: FilterSlider("Car Year", editPrice))],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                );
  }
}
