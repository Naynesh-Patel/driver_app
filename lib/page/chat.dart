import 'dart:convert';
import 'package:driver_app/constant/app_color.dart';
import 'package:driver_app/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController mesg = TextEditingController();
  bool isLoading = false;

  List<dynamic> msglist = [];

   Map message1  = {
     "name":"Naynesh",
     "message":"Hello"
  };
  Map message2  = {
    "name":"Driver",
    "message":"Hiiiii"
  };

  Map message3  = {
    "name":"Naynesh",
    "message":"Hello"
  };
  Map message4  = {
    "name":"Driver",
    "message":"Hi"
  };
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    msglist.addAll([message1,message2,message3,message4]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.themeColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Chat",
          style: AppTextStyle.appbarTextStyle,
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView.separated(
              controller: scrollController,
              itemCount: msglist.length,
              padding: const EdgeInsets.only(bottom: 60),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Align(
                  alignment:
                      msglist[index]['name'] == "Driver"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.85),
                    margin: EdgeInsets.symmetric(
                        horizontal:
                            msglist[index]['name'] == "2" ? 8 : 16),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                        color: msglist[index]['id'] == "Driver"
                            ? Color(0xffF5F5F5)
                            : Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                          msglist[index]['name'] =="Driver"
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                      children: [
                        msglist[index]['name'] == "Driver"
                            ?  Text(
                          "You",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.redAccent
                                  .withOpacity(1.0)),
                        )
                            : Text(
                                msglist[index]['name'],
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue),
                              ),
                        Text(
                          msglist[index]['message'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 2,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8.0,
                    ),
                  ]),
              child: TextField(
                controller: mesg,
                onTap: () {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type something",
                    suffixIcon: IconButton(
                      onPressed: () {

                      },
                      icon: const Icon(Icons.send),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
