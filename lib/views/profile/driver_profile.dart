import 'package:flutter/material.dart';
import 'package:rentcarmobile/widgets/driver_skill_widget.dart';

import '../../constants/assets_path.dart';

class DriverProfileScreen extends StatefulWidget {
  DriverProfileScreen({super.key});
  var skills = ["Ivme Kontrolü", "Virajlar", "Kondisyon", "Kondisyon"];
  var languages = ["Türkçe", "Ingilizce", "Ingilizce", "Ingilizce"];
  var name = "Lewis Hamilton";
  var price = 150;
  var rating = 7.8;
  var location = "Istanbul";
  var gender = "Male";
  var age = 37;
  var biography =
      "Selamlar ben Lewis Hamilton , sizin 1 numaralı soforunuz olabilirim. Uzun yıllar yarıs arabasi pilotlugu yaptım ancak son yıldaki performansımdan dolayı Mercedes beni şutladı ve ben de simdi Istanbula tasindim ve size soforluk yapmak icin buradayım lutfen beni kiralayın.";
  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Profile Screen"),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: phoneHeight * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Profile Photo and Name
            Expanded(
              flex: 4,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(right: 5),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundColor: Theme.of(context).highlightColor,
                              radius: 40,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    AssetPaths.blankProfilePhotoPath),
                                radius: 37.0,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Theme.of(context).highlightColor,
                              radius: 13,
                              child: CircleAvatar(
                                backgroundColor: Colors.green.shade700,
                                radius: 11,
                                child: Text(
                                  widget.rating.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.name} (${widget.age})",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            Text(
                              "${widget.location}, ${widget.gender}",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).highlightColor,
                                  borderRadius: BorderRadius.circular(3)),
                              height: phoneHeight * 0.03,
                              width: phoneWidth * 0.20,
                              child: Center(
                                child: Text(
                                  "${widget.price}TL",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Biogrophy
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 1, right: 0, bottom: 5, top: 0),
                          child: const Text(
                            "Biography",
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 244, 243, 243),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 7,
                        initialValue: widget.biography,
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Skills and Languages
            Expanded(
              flex: (widget.languages.length / 4 > 1 &&
                      widget.skills.length / 4 > 1)
                  ? 5
                  : (widget.languages.length / 4 > 1 ||
                          widget.skills.length / 4 > 1)
                      ? 4
                      : 3,
              child: Container(
                padding: EdgeInsets.only(
                    left: phoneWidth * 0.04,
                    right: phoneWidth * 0.04,
                    top: phoneHeight * 0.01),
                child: Column(
                  children: [
                    Expanded(
                      flex: widget.skills.length / 4 > 1 &&
                              widget.languages.length / 4 <= 1
                          ? 3
                          : widget.skills.length / 4 <= 1 &&
                                  widget.languages.length / 4 > 1
                              ? 2
                              : 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: widget.skills.length / 4 > 1 &&
                                      widget.languages.length / 4 <= 1
                                  ? 16
                                  : widget.skills.length / 4 <= 1 &&
                                          widget.languages.length / 4 > 1
                                      ? 25
                                      : widget.skills.length / 4 > 1 &&
                                              widget.languages.length / 4 > 1
                                          ? 15
                                          : 30,
                              child: Container(
                                child: const Text(
                                  "Skills",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 244, 243, 243),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 50,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 3),
                                itemCount: widget.skills.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => DriverSkillBar(
                                  skillText: widget.skills[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: widget.skills.length / 4 > 1 &&
                              widget.languages.length / 4 <= 1
                          ? 2
                          : widget.skills.length / 4 <= 1 &&
                                  widget.languages.length / 4 > 1
                              ? 3
                              : 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: widget.skills.length / 4 > 1 &&
                                      widget.languages.length / 4 <= 1
                                  ? 25
                                  : widget.skills.length / 4 <= 1 &&
                                          widget.languages.length / 4 > 1
                                      ? 16
                                      : widget.skills.length / 4 > 1 &&
                                              widget.languages.length / 4 > 1
                                          ? 15
                                          : 30,
                              child: Container(
                                child: const Text(
                                  "Languages",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 244, 243, 243),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 50,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 3),
                                itemCount: widget.languages.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => DriverSkillBar(
                                  skillText: widget.languages[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Reviews
            Expanded(
              flex: (widget.languages.length / 4 > 1 &&
                      widget.skills.length / 4 > 1)
                  ? 4
                  : (widget.languages.length / 4 > 1 ||
                          widget.skills.length / 4 > 1)
                      ? 3
                      : 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 1,
                            right: 0,
                            bottom: 5,
                            top: 0,
                          ),
                          child: const Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 244, 243, 243),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 244, 243, 243),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
