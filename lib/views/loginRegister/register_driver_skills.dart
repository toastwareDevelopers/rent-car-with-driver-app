import 'package:flutter/material.dart';

class RegisterDriverSkillsScreen extends StatefulWidget {
  RegisterDriverSkillsScreen({super.key});
  var skills = [];
  var languages = [];
  var skillController = TextEditingController();
  var languageController = TextEditingController();

  @override
  State<RegisterDriverSkillsScreen> createState() =>
      _RegisterDriverSkillsScreenState();
}

class _RegisterDriverSkillsScreenState
    extends State<RegisterDriverSkillsScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //Register as a Driver yazan başlık
          Expanded(
            flex: 3,
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
            flex: 10,
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
                              bottom: phoneHeight * 0.01,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  widget.skills.add(widget.skillController.text);
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
                    child: Container(
                      height: phoneHeight * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 218, 218, 218),
                      ),
                      child: ListView.builder(
                        itemBuilder: ((context, index) => Container(
                              child: Text(
                                widget.skills[index],
                              ),
                            )),
                        itemCount: widget.skills.length,
                      ),
                    ),
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Enter a Language Input Area
                        Expanded(
                          flex: 3,
                          child: TextField(
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              hintText: "Enter A Language",
                            ),
                            controller: widget.languageController,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(
                              bottom: phoneHeight * 0.01,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  widget.languages.add(widget.languageController.text);
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
                    child: Container(
                      height: phoneHeight * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 218, 218, 218),
                      ),
                      child: ListView.builder(
                        itemBuilder: ((context, index) => Container(
                              child: Text(
                                widget.languages[index],
                              ),
                            )),
                        itemCount: widget.languages.length,
                      ),
                    ),
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
            flex: 2,
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                child: const Text("Continue"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/registerDriverCar");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
