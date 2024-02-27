import 'package:driver_app/constant/app_color.dart';
import 'package:driver_app/constant/app_text_style.dart';
import 'package:driver_app/controller/home_controller.dart';
import 'package:driver_app/page/bottom_tab/experience_tab.dart';
import 'package:driver_app/page/bottom_tab/home_tab.dart';
import 'package:driver_app/page/bottom_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{


  HomeController controller = Get.find();

  List<Widget> bodyWidgetList = [
    const HomeTab(),
    const ExperienceTab(),
    const ProfileTab(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : _body(),
       bottomNavigationBar: _bottomBar(),
    );
  }

  _body(){
    return Obx(() => bodyWidgetList.elementAt(controller.position.value));
  }

  _bottomBar(){
    return Obx(()=>BottomNavigationBar(
      unselectedItemColor: AppColor.themeColor,
      selectedItemColor: Colors.red,
      selectedLabelStyle: AppTextStyle.textStyleRegular12,
      unselectedLabelStyle:AppTextStyle.textStyleRegular12,
      // unselectedLabelStyle: TextStyle(letterSpacing:0.5),
      currentIndex: controller.position.value,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color:controller.position.value == 0 ?AppColor.redColor:AppColor.themeColor,),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.language_outlined ,color:controller.position.value == 1 ?AppColor.redColor:AppColor.themeColor,),
          label: "Experience",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded,color:controller.position.value == 2 ?AppColor.redColor:AppColor.themeColor,),
          label: "Profile",
        ),
      ],
      onTap: (val){
        controller.position.value = val;
      },
    ),);
  }




}
