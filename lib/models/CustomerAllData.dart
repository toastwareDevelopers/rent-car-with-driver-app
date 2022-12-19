
import 'package:rentcarmobile/models/customer.dart';
import 'package:rentcarmobile/models/review.dart';
import 'package:rentcarmobile/models/trip.dart';

class CustomerData {
  Customer customer = Customer();
  List<Trip> listTrips = [];
  List<Review> listReview = [];
  CustomerData(Customer customer, List<Trip> trip,List<Review> review){
    this.customer = customer;
    this.listTrips = trip;
    this.listReview = review;
  }

}