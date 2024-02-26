import 'package:driver_app/constant/app_color.dart';
import 'package:driver_app/constant/app_text_style.dart';
import 'package:driver_app/constant/assets_path.dart';
import 'package:driver_app/controller/home_controller.dart';
import 'package:driver_app/page/profile.dart';
import 'package:driver_app/page/tab/complete_tab.dart';
import 'package:driver_app/page/tab/today_tab.dart';
import 'package:driver_app/page/tab/upcoming_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{


  late TabController tabController;
  HomeController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: controller.tabBarList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
         backgroundColor: AppColor.themeColor,
         title: Text("My Activity",style: AppTextStyle.appbarTextStyle,),
         actions: [
           Obx(() => Transform.scale(
             scale: 0.6,
             child: Switch(
               activeColor: Colors.green,
               value: controller.isDriverOnline.value,
               onChanged: (bool value) {
                 controller.isDriverOnline.value = value;
               },
             ),
           ),),

           InkWell(
             borderRadius: BorderRadius.circular(10.0),
               onTap: (){
                 Get.to(const Profile());
               },
               child: Image.asset(AssetsPath.icDriverProfile,height: 28,)),
           const SizedBox(
             width: 16.0,
           ),
         ],
         bottom: _widgetTabBar(),
       ),
      body: _body(),
    );
  }

   _widgetTabBar(){
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: TabBar(
        controller:tabController,
        labelStyle: AppTextStyle.textStyleRegular14.copyWith(color: Colors.white),
        unselectedLabelStyle:AppTextStyle.textStyleRegular14.copyWith(color: Colors.white),
        indicatorColor: Colors.red,
        tabs: List.generate(controller.tabBarList.length, (index){
          return Tab(
            child: Text(controller.tabBarList[index]),
          );
        })
      ),
    );
  }

  _body(){
    return TabBarView(
      controller: tabController,
        children:const  [
          TodayTab(),
          UpcomingTab(),
          CompleteTab(),
        ]
    );
  }



}
