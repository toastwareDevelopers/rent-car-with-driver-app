import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/models/driver.dart';

import '../../../constants/assets_path.dart';
import '../../../widgets/profile_icon_widget.dart';

class EditDriverPersonalScreen extends StatefulWidget {
  const EditDriverPersonalScreen({super.key});
  @override
  State<EditDriverPersonalScreen> createState() =>
      _EditDriverPersonalScreenState();
}

class _EditDriverPersonalScreenState extends State<EditDriverPersonalScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController biographyController = TextEditingController();
  String? locationDropdown;
  String? genderDropdown;
  Size size = WidgetsBinding.instance.window.physicalSize;
  double ratio = WidgetsBinding.instance.window.devicePixelRatio;
  double phoneHeight = 0.0;
  double phoneWidth = 0.0;

  static int flag = 0;

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

  @override
  Widget build(BuildContext context) {
    Driver driver = ModalRoute.of(context)!.settings.arguments
        as Driver; // Receive driver data from previous page
    // double phoneHeight = MediaQuery.of(context).size.height;
    // double phoneWidth = MediaQuery.of(context).size.width;
    if (flag == 0) {
      // Making sure initialization done once
      phoneHeight = size.height / ratio;
      phoneWidth = size.width / ratio;
      nameController.text = driver.name!;
      surnameController.text = driver.surname!;
      birthDateController.text = driver.birthDate!;
      nationalIdController.text = driver.nationalId!;
      if (driver.info?.compareTo("null") != 0) {
        biographyController.text = driver.info!;
      }
      locationDropdown = driver.location;
      genderDropdown = driver.gender;
    }

    flag++;

    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        child: SizedBox(
          height: phoneHeight,
          width: phoneWidth,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(top: phoneHeight * 0.08),
                  child: Text(
                    "Edit Driver",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              //Profile Picture
              Expanded(
                flex: 2,
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
                          //Name - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                hintText: "Name",
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[a-zA-Z]"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Surname - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: surnameController,
                              decoration:
                                  const InputDecoration(hintText: "Surname"),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[a-zA-Z]"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //Birthdate - Gender
                      Row(
                        children: [
                          //Birthdate - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "Birth Date",
                              ),
                              controller: birthDateController,
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Gender - Editable
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 218, 218, 218),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                value: genderDropdown,
                                items: genders
                                    .map(
                                      (value) => DropdownMenuItem(
                                        value: value,
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Text(value,
                                              style: const TextStyle(
                                                  fontSize: 17)),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    genderDropdown = value;
                                  });
                                },
                                dropdownColor:
                                    const Color.fromARGB(255, 218, 218, 218),
                                borderRadius: BorderRadius.circular(10),
                                isExpanded: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //NationalID - Location
                      Row(
                        children: [
                          //NationalID - Editable
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: nationalIdController,
                              decoration: const InputDecoration(
                                  hintText: "National ID"),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Location - Editable
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 218, 218, 218),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                value: locationDropdown,
                                items: cities
                                    .map(
                                      (value) => DropdownMenuItem(
                                        value: value,
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Text(value,
                                              style: const TextStyle(
                                                  fontSize: 17)),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    locationDropdown = value;
                                  });
                                },
                                dropdownColor:
                                    const Color.fromARGB(255, 218, 218, 218),
                                borderRadius: BorderRadius.circular(10),
                                isExpanded: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Biography - Editable
                      TextField(
                        controller: biographyController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration:
                            const InputDecoration(hintText: "Biography"),
                      )
                    ],
                  ),
                ),
              ),
              //Continue Button
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    child: const Text("Continue"),
                    // Get to the  next screen
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        "/editDriverSkills",
                        arguments: Driver(
                          email: driver.email,
                          phoneNumber: driver.phoneNumber,
                          password: driver.password,
                          name: nameController.text.isEmpty
                              ? driver.name
                              : nameController.text,
                          surname: surnameController.text.isEmpty
                              ? driver.surname
                              : surnameController.text,
                          birthDate: birthDateController.text.isEmpty
                              ? driver.birthDate
                              : birthDateController.text,
                          gender: genderDropdown.toString(),
                          nationalId: nationalIdController.text.isEmpty
                              ? driver.nationalId
                              : nationalIdController.text,
                          location: locationDropdown.toString(),
                          info: biographyController.text.isEmpty
                              ? driver.info
                              : biographyController.text,
                          languages: driver.languages,
                          licenceNumber: driver.licenceNumber,
                          licenceYear: driver.licenceYear,
                          rating: driver.rating,
                          hourlyPrice: driver.hourlyPrice,
                          taxNumber: driver.taxNumber,
                          carInfo: driver.carInfo,
                          trips: driver.trips,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
