import 'package:driver_app/constant/app_color.dart';
import 'package:driver_app/constant/app_text_style.dart';
import 'package:driver_app/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.themeColor,
        title: Text("Profile",style: AppTextStyle.appbarTextStyle,),
      ),
      body: _body(),
    );
  }

  _body(){
    return Column(
      children: [
        _tileItems(
          leading: Icon(Icons.person),
          title: Text("Name"),
          subtitle: Text("Nanesh Patel")
        ),
        const Divider(),
        _tileItems(
            leading: const Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("nayneshpatel41118@gmail.com")
        ),
        const Divider(),
        _tileItems(
            leading: Icon(Icons.pedal_bike_rounded),
            title: Text("Vehical Type"),
            subtitle: Text("Innova Reborn")
        ),
        const Divider(),
        _tileItems(
            leading: Icon(Icons.color_lens),
            title: Text("Vehical Color"),
            subtitle: Text("White")
        ),
        const Divider(),
        _tileItems(
            leading: Icon(Icons.credit_card_rounded),
            title: Text("Vehical Licence"),
            subtitle: Text("CA78934")
        ),
        const Divider(),
      ],
    );
  }

  _tileItems({Widget? leading,Widget? title,Widget? subtitle}){
    return ListTile(
      leading: leading,
      title:title,
      titleTextStyle: AppTextStyle.textStyleRegular12,
      subtitle:subtitle,
      subtitleTextStyle: AppTextStyle.textStyleBold12,
    );
  }

}
