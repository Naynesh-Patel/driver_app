import 'package:driver_app/constant/app_color.dart';
import 'package:driver_app/constant/app_text_style.dart';
import 'package:driver_app/constant/assets_path.dart';
import 'package:driver_app/page/experience_tab/currency_convert_tab.dart';
import 'package:driver_app/page/experience_tab/night_life_tab.dart';
import 'package:driver_app/page/experience_tab/restaurant_tab.dart';
import 'package:driver_app/page/experience_tab/shopping_tab.dart';
import 'package:flutter/material.dart';

class ExperienceTab extends StatefulWidget {
  const ExperienceTab({Key? key}) : super(key: key);

  @override
  State<ExperienceTab> createState() => _ExperienceTabState();
}

class _ExperienceTabState extends State<ExperienceTab>  with SingleTickerProviderStateMixin{


  late TabController tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.themeColor,
        title: Text("Experience",style: AppTextStyle.appbarTextStyle,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _tabBar(),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children:const [
                  RestaurantsTab(),
                  NightLifeTab(),
                  ShoppingTab(),
                  CurrencyTab(),
                ]),
          ),
        ],
      ),
    );
  }


  _tabBar(){
    return Container(
      height: 50,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8.0),
      child: TabBar(
        controller: tabController,
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.red,
        labelStyle:AppTextStyle.textStyleBold10.copyWith(color: Colors.black),
        labelColor: Colors.black,
        isScrollable: true,
        unselectedLabelStyle: AppTextStyle.textStyleBold10.copyWith(color: Colors.black),
        unselectedLabelColor:Colors.black,
        // labelPadding: EdgeInsets.symmetric(horizontal: 14.0),
        tabs: [
          Tab(
            text: "Restaurants",
            icon: Image.asset(AssetsPath.icRestaurant,width: 20),
          ),
          Tab(
            text: "Night Life",
            icon: Image.asset(AssetsPath.icNightLife,width: 20),
          ),
          Tab(
            text: "Shopping",
            icon: Image.asset(AssetsPath.icShopping,width: 20),
          ),
          Tab(
            text: "Currency Converter",
            icon: Image.asset(AssetsPath.icCurrencyConverter,width: 20),
          ),
        ],
      ),
    );
  }





}
