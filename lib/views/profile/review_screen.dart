import 'package:flutter/material.dart';
import 'package:rentcarmobile/widgets/customer_trip_widget.dart';
import '../../constants/assets_path.dart';
import '../../utils/base64_converter.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    CustomerTrip customerTrip = ModalRoute.of(context)!.settings.arguments as CustomerTrip;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make Review"),
        centerTitle: true,
      leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pushReplacementNamed(context, "/profileCustomer",arguments: customerTrip.customerId);},),
      leadingWidth: phoneWidth * 0.1,),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: phoneWidth*0.1),
        child: Column(
          children: [
            Expanded(flex : MediaQuery.of(context).viewInsets.bottom != 0 ? 0 : 4,child: Container()),
            // Driver Information
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Photo
                    Container(
                      padding: EdgeInsets.only(
                          right: phoneWidth * 0.01,
                          left: phoneWidth * 0.01),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 32,
                        child: CircleAvatar(
                          backgroundImage: customerTrip.driverProfileImage != "null"
                              ? Image.memory(Base64Converter.decodeImage64(
                              customerTrip.driverProfileImage))
                              .image
                              : AssetImage(AssetPaths.blankProfilePhotoPath),
                          radius: 30.0,
                        ),
                      ),
                    ),
                    //Other Information
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            customerTrip.driverName,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Container(
                          color: Color.fromARGB(2, 3, 5, 7),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            customerTrip.city,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Start : ${customerTrip.start_time.substring(0, 10)}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                  left: phoneWidth * 0.02),
                              child: Text(
                                "End : ${customerTrip.finish_time.substring(0, 10)}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Review Message Box
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Review",
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          decoration:
                          InputDecoration(hintText: "Message"),
                          maxLines: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Rating and Send button
            Expanded(
              flex : 2,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Container(
                          alignment: Alignment.center,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(hintText: "Rating"),
                            style:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: phoneWidth*0.3,),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,),
                          child: Text(
                            "Send",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: ()  {
                            /*
                                    await Future.wait([
                                      ProfileService.postCustomerReview(
                                          customerId, driverId, "sadsad", "asd", tripId),
                                    ]);*/
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex : MediaQuery.of(context).viewInsets.bottom != 0 ? 0 : 4 ,child: Container()),
          ],
        ),
      )
    );
  }
}
