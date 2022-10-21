import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/constants/assets_path.dart';

class RegisterDriverCarScreen extends StatefulWidget {
  RegisterDriverCarScreen({super.key});
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

  @override
  State<RegisterDriverCarScreen> createState() => _RegisterDriverCarScreenState();
}

class _RegisterDriverCarScreenState extends State<RegisterDriverCarScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    TextEditingController birthDateController = TextEditingController();

    return Scaffold(
      body: Column(
        children: <Widget>[
          //Register as a Driver yazan başlık
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(top: phoneHeight * 0.08),
              child: Text(
                "Register as a Driver Car",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          //Profil fotoğrafı yükleme alanı
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
                          controller: birthDateController,
                          onTap: () async {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return Theme(
                                    data: Theme.of(context),
                                    child: AlertDialog(
                                      actions: [
                                        CalendarDatePicker(
                                          firstDate:
                                              DateTime.parse("1900-01-01"),
                                          initialDate:
                                              birthDateController.text != ""
                                                  ? DateTime.parse(
                                                      birthDateController.text)
                                                  : DateTime.now(),
                                          lastDate: DateTime.now(),
                                          onDateChanged: (DateTime value) {
                                            birthDateController.text =
                                                "${value.year}-${value.month < 10 ? "0${value.month}" : value.month}-${value.day < 10 ? "0${value.day}" : value.day}";
                                          },
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("OK"),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
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
                  const TextField(
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
              padding: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                child: const Text("Register"),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
