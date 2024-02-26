import 'package:driver_app/constant/app_text_style.dart';
import 'package:driver_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteTab extends StatefulWidget {
  const CompleteTab({Key? key}) : super(key: key);

  @override
  State<CompleteTab> createState() => _CompleteTabState();
}

class _CompleteTabState extends State<CompleteTab> {

  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade200
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: controller.completeRideGuestList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _keyValue(key: "Guest Name",value: controller.completeRideGuestList[index]),
                      _keyValue(key: "Date",value: "27-FEB-2024"),
                      _keyValue(key: "Time",value: "12:00 PM"),
                      _keyValue(key: "No Of Person",value: "4"),
                      const Divider(),
                      _widgetPickUpDropUp(),
                      const SizedBox(
                        height: 16.0,
                      ),
                      // _btnChatStart(index: index),
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 16.0,
              );
            },),
          )
        ],
      ),
    );
  }

  _widgetPickUpDropUp(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pick Up",style: AppTextStyle.textStyleBold14.copyWith(color: Colors.black),),
        const SizedBox(
          height: 6.0,
        ),
        Row(
          children: [
            const Icon(Icons.circle,color: Colors.blue,size: 10,),
            const SizedBox(
              width: 6.0,
            ),
            Text("Budget Hotels, Bali",style: AppTextStyle.textStyleRegular12,),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text("Drop Up",style: AppTextStyle.textStyleBold14.copyWith(color: Colors.black),),
        const SizedBox(
          height: 6.0,
        ),
        Row(
          children: [
            const Icon(Icons.location_on_outlined,color: Colors.red,size: 13,),
            const SizedBox(
              width: 6.0,
            ),
            Text("Ananta Legian Hotel,Seminyak, Bali",style: AppTextStyle.textStyleRegular12,),
          ],
        ),
      ],
    );
  }

  _btnChatStart({index}){
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _pageButton(color: Colors.blue.shade300,buttonText: "Chat",onTap: (){})),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(child: _pageButton(color: Colors.green.shade300,buttonText: index == 0 ? "Start" :"End",onTap: (){})),
      ],
    );
  }

  Widget _pageButton({required Color color,required String buttonText,Function()? onTap}){
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(child: Text(buttonText,style: AppTextStyle.textStyleBold12.copyWith(color: Colors.white),)),
        ),
      ),
    );
  }


  _keyValue({key,value}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("$key : ",style: AppTextStyle.textStyleRegular14,),
        Flexible(
            child: Text("$value",/*textAlign: TextAlign.end,*/style: AppTextStyle.textStyleRegular14,)),
      ],
    );
  }

}
