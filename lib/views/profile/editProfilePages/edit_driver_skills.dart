import 'package:flutter/material.dart';

import 'edit_driver_auth.dart';

class EditDriverSkillsScreen extends StatefulWidget {
  EditDriverSkillsScreen({super.key});

  @override
  State<EditDriverSkillsScreen> createState() => _EditDriverSkillsScreenState();
}

class _EditDriverSkillsScreenState extends State<EditDriverSkillsScreen> {
  List<String> skills = [];
  TextEditingController skillController = TextEditingController();
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
    "Punjabi",
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
  String? languageDropdown;
  Size size = WidgetsBinding.instance.window.physicalSize;
  double ratio = WidgetsBinding.instance.window.devicePixelRatio;
  double phoneHeight = 0.0;
  double phoneWidth = 0.0;

  @override
  void initState() {
    super.initState();
    phoneHeight = size.height / ratio;
    phoneWidth = size.width / ratio;
    skills = EditDriverAuthScreen.editDriver.skills;
    addedLanguages = EditDriverAuthScreen.editDriver.languages;
    languageDropdown = languages[0];
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(
                    top: phoneHeight * 0.08,
                  ),
                  child: Text(
                    "Edit Driver",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
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
                      //Add Skills - Editable
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
                                controller: skillController,
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
                                      if (!skills
                                          .contains(skillController.text)) {
                                        skills.add(skillController.text);
                                        skillController.text = "";
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
                      //Skills List - Editable
                      Expanded(
                        flex: 6,
                        child: listSkillsWidget(phoneWidth, phoneHeight),
                      ),
                      // Space
                      Expanded(
                        flex: 2,
                        child: Container(),
                      ),
                      //Add Languages - Editable
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
                                  color:
                                      const Color.fromARGB(255, 218, 218, 218),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DropdownButton(
                                  value: languageDropdown,
                                  items: languages
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
                                      languageDropdown = value;
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
                                      if (!addedLanguages.contains(
                                          languageDropdown.toString())) {
                                        addedLanguages
                                            .add(languageDropdown.toString());
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
                      // Space
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              //Continue Button
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    child: const Text("Continue"),
                    // Get to the next screen
                    onPressed: () {
                      EditDriverAuthScreen.editDriver.skills = skills;
                      EditDriverAuthScreen.editDriver.languages =
                          addedLanguages;
                      Navigator.of(context).pushNamed('/editDriverCar');
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
      padding: EdgeInsets.only(
          left: phoneWidth * 0.03,
          right: phoneWidth * 0.03,
          top: phoneHeight * 0.01),
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
                  skills[index],
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                style: ListTileStyle.list,
                trailing: InkWell(
                  onTap: () {
                    setState(
                      () {
                        skills.removeAt(index);
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
        itemCount: skills.length,
      ),
    );
  }

  Container listLanguagesWidget(double phoneWidth, double phoneHeight) {
    return Container(
      padding: EdgeInsets.only(
          left: phoneWidth * 0.03,
          right: phoneWidth * 0.03,
          top: phoneHeight * 0.01),
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
                  addedLanguages[index],
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                style: ListTileStyle.list,
                trailing: InkWell(
                  onTap: () {
                    setState(
                      () {
                        addedLanguages.removeAt(index);
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
        itemCount: addedLanguages.length,
      ),
    );
  }
}
