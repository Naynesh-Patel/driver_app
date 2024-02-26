import 'package:get/get.dart';

class HomeController extends GetxController{

  RxBool isDriverOnline = false.obs;

  List<String> tabBarList = ['Today','Upcoming','Complete'];
  List<String> todayRideGuestList = ['Naynesh','Sushant'];
  List<String> upcomingRideGuestList = ['Naynesh','Sushant'];
  List<String> completeRideGuestList = ['Nadine Ames','Luna Maya'];

}