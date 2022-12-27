import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/services/auth.dart';
import 'package:rentcarmobile/utils/input_validator.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';
import 'package:rentcarmobile/widgets/customer_trip_widget.dart';
import 'package:rentcarmobile/widgets/make_review.dart';

import '../../constants/assets_path.dart';
import '../../models/customer.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

enum SingingCharacter { nationalNumber, passportNumber }

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
      leadingWidth: phoneWidth * 0.1,),
      body: SingleChildScrollView(

        child: Container(
          width: phoneWidth,
          height: phoneHeight,

          alignment: Alignment.bottomLeft,

          child: MakeReview(customerTrip.driverName,customerTrip.age,customerTrip.city,customerTrip.start_time,customerTrip.finish_time,
          customerTrip.tripId,customerTrip.customerId,customerTrip.driverId),
        ),
      )
    );
  }
}
