import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widgets/profile_icon_widget.dart';
import 'edit_driver_auth.dart';

class EditDriverPersonalScreen extends StatefulWidget {
  EditDriverPersonalScreen({super.key});

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
  void initState() {
    super.initState();
    phoneHeight = size.height / ratio;
    phoneWidth = size.width / ratio;
    nameController.text = EditDriverAuthScreen.editDriver.name;
    surnameController.text = EditDriverAuthScreen.editDriver.surname;
    birthDateController.text = EditDriverAuthScreen.editDriver.birthDate.toString().length > 10 ?
    EditDriverAuthScreen.editDriver.birthDate.substring(0, 10) :
    EditDriverAuthScreen.editDriver.birthDate;
    nationalIdController.text = EditDriverAuthScreen.editDriver.nationalId;
    if (EditDriverAuthScreen.editDriver.info.compareTo("null") != 0) {
      biographyController.text = EditDriverAuthScreen.editDriver.info;
    }
    locationDropdown = EditDriverAuthScreen.editDriver.location;
    genderDropdown = EditDriverAuthScreen.editDriver.gender;
    _profileIcon.selectedImage = EditDriverAuthScreen.editDriver.profileImage;
  }

  @override
  Widget build(BuildContext context) {
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

              _profileIcon,

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
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.name = value;
                              },
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
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.surname = value;
                              },
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
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.birthDate = value;
                              },
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
                                onChanged: (value) async {
                                  setState(() {
                                    genderDropdown = value;
                                    EditDriverAuthScreen.editDriver.gender = genderDropdown.toString();
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
                              onChanged: (String value) async {
                                EditDriverAuthScreen.editDriver.nationalId = value;
                              },
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
                                onChanged: (value) async {
                                  setState(() {
                                    locationDropdown = value;
                                    EditDriverAuthScreen.editDriver.location = locationDropdown.toString();
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
                        onChanged: (String value) async {
                          EditDriverAuthScreen.editDriver.info = value;
                        },
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
                      EditDriverAuthScreen.editDriver.name = nameController.text;
                      EditDriverAuthScreen.editDriver.surname = surnameController.text;
                      EditDriverAuthScreen.editDriver.birthDate = birthDateController.text;
                      EditDriverAuthScreen.editDriver.gender = genderDropdown.toString();
                      EditDriverAuthScreen.editDriver.nationalId = nationalIdController.text;
                      EditDriverAuthScreen.editDriver.info = biographyController.text;
                      EditDriverAuthScreen.editDriver.location = locationDropdown.toString();
                      EditDriverAuthScreen.editDriver.profileImage = _profileIcon.selectedImage;
                      Navigator.of(context).pushNamed('/editDriverSkills');
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
