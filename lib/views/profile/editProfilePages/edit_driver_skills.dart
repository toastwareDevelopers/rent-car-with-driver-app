import 'package:flutter/material.dart';

import '../../../models/driver.dart';

class EditDriverSkillsScreen extends StatefulWidget {
  EditDriverSkillsScreen({super.key});
  List<String> skills = [];
  var skillController = TextEditingController();
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

  @override
  State<EditDriverSkillsScreen> createState() =>
      _EditDriverSkillsScreenState();
}

class _EditDriverSkillsScreenState
    extends State<EditDriverSkillsScreen> {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Register as a Driver yazan başlık
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(
                    top: phoneHeight * 0.08,
                  ),
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
                    left: phoneWidth * 0.07,
                    right: phoneWidth * 0.07,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Add Skills
                      Expanded(
                        flex: 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //Enter a Skill Input Area
                            Expanded(
                              flex: 3,
                              child: TextField(
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                  hintText: "Enter A Skill",
                                ),
                                controller: widget.skillController,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(
                                  bottom: phoneHeight * 0.022,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (!widget.skills
                                          .contains(widget.skillController.text)) {
                                        widget.skills
                                            .add(widget.skillController.text);
                                        widget.skillController.text = "";
                                      }
                                    });
                                  },
                                  child: const Text("Add"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Skills List
                      Expanded(
                        flex: 6,
                        child: listSkillsWidget(phoneWidth, phoneHeight),
                      ),
                      //Boşluk
                      Expanded(
                        flex: 2,
                        child: Container(),
                      ),
                      //Add Languages
                      Expanded(
                        flex: 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Select a Language Input Area
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 218, 218, 218),
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
                                              style: const TextStyle(fontSize: 17),
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
                                  dropdownColor:
                                      const Color.fromARGB(255, 218, 218, 218),
                                  borderRadius: BorderRadius.circular(10),
                                  isExpanded: true,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    height: phoneHeight * 0.06),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (!widget.addedLanguages.contains(
                                          widget.languageDropdown.toString())) {
                                        widget.addedLanguages.add(
                                            widget.languageDropdown.toString());
                                      }
                                    });
                                  },
                                  child: const Text("Add"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Language List
                      Expanded(
                        flex: 6,
                        child: listLanguagesWidget(phoneWidth, phoneHeight),
                      ),
                      //Boşluk
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              //Continue butonu alanı
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    child: const Text("Continue"),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        "/registerDriverCar",
                        arguments: Driver(
                          email: driver.email,
                          phoneNumber: driver.phoneNumber,
                          password: driver.password,
                          name: driver.name,
                          surname: driver.surname,
                          birthDate: driver.birthDate,
                          gender: driver.gender,
                          nationalId: driver.nationalId,
                          location: driver.location,
                          bio: driver.bio,
                          skills: widget.skills,
                          languages: widget.addedLanguages,
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

  Container listSkillsWidget(double phoneWidth, double phoneHeight) {
    return Container(
      padding: EdgeInsets.only(left: phoneWidth * 0.03,right : phoneWidth * 0.03,top: phoneHeight*0.01),
      height: phoneHeight * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 218, 218, 218),
      ),
      child: ListView.separated(
        itemBuilder: ((context, index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 167, 117, 77),
              ),
              child: ListTile(
                title: Text(
                  widget.skills[index],
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                style: ListTileStyle.list,
                trailing: InkWell(
                  onTap: () {
                    setState(
                      () {
                        widget.skills.removeAt(index);
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 40, 40, 40),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 218, 218, 218),
                      size: 35,
                    ),
                  ),
                ),
              ),
            )),
        separatorBuilder: (context, index) => SizedBox(
          height: phoneHeight * 0.01,
        ),
        itemCount: widget.skills.length,
      ),
    );
  }

  Container listLanguagesWidget(double phoneWidth, double phoneHeight) {
    return Container(
      padding: EdgeInsets.only(left: phoneWidth * 0.03,right : phoneWidth * 0.03,top: phoneHeight*0.01),
      height: phoneHeight * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 218, 218, 218),
      ),
      child: ListView.separated(
        itemBuilder: ((context, index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 167, 117, 77),
              ),
              child: ListTile(
                title: Text(
                  widget.addedLanguages[index],
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                style: ListTileStyle.list,
                trailing: InkWell(
                  onTap: () {
                    setState(
                      () {
                        widget.addedLanguages.removeAt(index);
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 40, 40, 40),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 218, 218, 218),
                      size: 35,
                    ),
                  ),
                ),
              ),
            )),
        separatorBuilder: (context, index) => SizedBox(
          height: phoneHeight * 0.01,
        ),
        itemCount: widget.addedLanguages.length,
      ),
    );
  }
}
