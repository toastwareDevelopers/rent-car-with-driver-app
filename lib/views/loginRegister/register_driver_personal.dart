import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/models/driver.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';

import '../../widgets/profile_icon_widget.dart';

class RegisterDriverPersonalScreen extends StatefulWidget {
  RegisterDriverPersonalScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController biographyController = TextEditingController();
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

  final ProfileIcon _profileIcon = ProfileIcon(key: null, selectedImage: "null");

  @override
  State<RegisterDriverPersonalScreen> createState() =>
      _RegisterDriverPersonalScreenState();
}

class _RegisterDriverPersonalScreenState
    extends State<RegisterDriverPersonalScreen> {
  @override
  Widget build(BuildContext context) {
    Driver driver = ModalRoute.of(context)!.settings.arguments as Driver;
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        child: Container(
          height: phoneHeight,
          width: phoneWidth,
          child: Column(
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
              widget._profileIcon,
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
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.nameController,
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
                          //Surname
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.surnameController,
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
                          //Birthdate
                          Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "Birth Date",
                              ),
                              controller: widget.birthDateController,
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.04,
                          ),
                          //Gender
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 218, 218, 218),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                value: widget.genderDropdown,
                                items: widget.genders
                                    .map(
                                      (value) => DropdownMenuItem(
                                        value: value,
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 12),
                                          child: Text(value,
                                              style: const TextStyle(fontSize: 17)),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    widget.genderDropdown = value;
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
                          //NationalID
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: widget.nationalIdController,
                              decoration:
                                  const InputDecoration(hintText: "National ID"),
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
                          //Location
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 218, 218, 218),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                value: widget.locationDropdown,
                                items: widget.cities
                                    .map(
                                      (value) => DropdownMenuItem(
                                        value: value,
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 12),
                                          child: Text(value,
                                              style: const TextStyle(fontSize: 17)),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    widget.locationDropdown = value;
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
                      //Biography
                      TextField(
                        controller: widget.biographyController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: InputDecoration(hintText: "Biography"),
                      )
                    ],
                  ),
                ),
              ),
              //Continue butonu alanı
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    child: const Text("Continue"),
                    onPressed: () {
                      if (!controlInputsAreNotEmpty(
                          widget.nameController.text,
                          widget.surnameController.text,
                          widget.birthDateController.text,
                          widget.nationalIdController.text,
                          widget.biographyController.text)) {
                        WarningAlert.showWarningDialog(
                            context, "Please fill all inputs",(){Navigator.pop(context);});
                      } else {
                        Navigator.of(context).pushNamed(
                          "/registerDriverSkills",
                          arguments: Driver(
                              email: driver.email,
                              phoneNumber: driver.phoneNumber,
                              password: driver.password,
                              name: widget.nameController.text,
                              surname: widget.surnameController.text,
                              birthDate: widget.birthDateController.text,
                              gender: widget.genderDropdown.toString(),
                              nationalId: widget.nationalIdController.text,
                              location: widget.locationDropdown.toString(),
                              bio: widget.biographyController.text,
                              profileImage: widget._profileIcon.selectedImage),
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
    );
  }

  bool controlInputsAreNotEmpty(String name, String surname, String birthDate,
      String nationalId, String bio) {
    return name.isNotEmpty &&
        surname.isNotEmpty &&
        birthDate.isNotEmpty &&
        nationalId.isNotEmpty &&
        bio.isNotEmpty;
  }
}
