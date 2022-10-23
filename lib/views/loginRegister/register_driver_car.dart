import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/services/auth.dart';

import '../../models/driver.dart';

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
  State<RegisterDriverCarScreen> createState() =>
      _RegisterDriverCarScreenState();
}

class _RegisterDriverCarScreenState extends State<RegisterDriverCarScreen> {
  @override
  Widget build(BuildContext context) {
    Driver driver = ModalRoute.of(context)!.settings.arguments as Driver;
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
          //Form inputları alanı
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.only(
                  left: phoneWidth * 0.07, right: phoneWidth * 0.07),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Driver Lisence Number - Car Lisence Number
                  Row(
                    children: [
                      //Driver Lisence Number
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Driver Lisence Number ",
                            hintMaxLines: 2,
                            isDense: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.04,
                      ),
                      //Car Lisence Number
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Car Lisence Number",
                            hintMaxLines: 2,
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Driver Lisence Year - Car Age
                  Row(
                    children: [
                      //Driver Lisence Year
                      Expanded(
                        flex: 1,
                        child: TextField(
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          maxLength: 4,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9]"),
                            ),
                          ],
                          decoration: const InputDecoration(
                            hintText: "Driver Lisence Year ",
                            hintMaxLines: 2,
                            isDense: true,
                            counterText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.04,
                      ),
                      //Car Model Year
                      Expanded(
                        flex: 1,
                        child: TextField(
                          maxLength: 4,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9]"),
                            ),
                          ],
                          decoration: const InputDecoration(
                            hintText: "Model Year",
                            counterText: "",
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Car Brand - Car Model
                  Row(
                    children: [
                      //Car Brand
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Car Brand ",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.04,
                      ),
                      //Car Model
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(hintText: "Car Model"),
                        ),
                      ),
                    ],
                  ),
                  //Car Color - Car Registration Plate
                  Row(
                    children: [
                      //Car Color
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Car Color",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.04,
                      ),
                      //Car Registration Plate
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Car Registration Plate",
                            hintMaxLines: 2,
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Hourly Price - Tax Number
                  Row(
                    children: [
                      //Hourly Price
                      Expanded(
                        flex: 1,
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9]"),
                            ),
                          ],
                          decoration: const InputDecoration(
                            hintText: "Hourly Price (TL)",
                            hintMaxLines: 2,
                            isDense: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.04,
                      ),
                      //Tax Number
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Tax Number",
                          ),
                        ),
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
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                child: const Text("Register"),
                onPressed: () {
                  AuthService.registerDriver(
                    Driver(
                      bio: driver.bio,
                      birthDate: driver.birthDate,
                      email: driver.email,
                      gender: driver.gender,
                      hourlyPrice: 0,
                      languages: driver.languages,
                      licenceNumber: "",
                      licenceYear: "",
                      location: driver.location,
                      name: driver.name,
                      nationalId: driver.nationalId,
                      passportNumber: driver.passportNumber,
                      password: driver.password,
                      phoneNumber: driver.phoneNumber,
                      rating: 0,
                      skills: driver.skills,
                      surname: driver.surname,
                      taxNumber: "",
                      carInfo: {
                        "lisenceNumber": "",
                        "lisenceYear": "",
                        "plateNumber": "",
                        "brand": "",
                        "model": "",
                        "year": "",
                        "color": "",
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
