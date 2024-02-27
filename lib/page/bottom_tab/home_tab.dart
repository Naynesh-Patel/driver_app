import 'package:driver_app/constant/app_color.dart';
import 'package:driver_app/constant/app_text_style.dart';
import 'package:driver_app/controller/home_controller.dart';
import 'package:driver_app/page/tab/complete_tab.dart';
import 'package:driver_app/page/tab/today_tab.dart';
import 'package:driver_app/page/tab/upcoming_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {

  HomeController controller = Get.find();
  late TabController tabController;

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
        title:  Text("My Activity",style: AppTextStyle.appbarTextStyle,),
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
        ],
        bottom: _appBarBottom(),
      ),
      body: _body(),
    );
  }

  _appBarBottom(){
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
