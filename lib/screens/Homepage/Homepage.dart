import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vkonnect/constants/Constantcolors.dart';
import 'package:vkonnect/screens/Chatroom/Chatroom.dart';
import 'package:vkonnect/screens/Feed/Feed.dart';
import 'package:vkonnect/screens/Homepage/HomepageHelpers.dart';
import 'package:vkonnect/screens/Profile/Profile.dart';
import 'package:vkonnect/services/FirebaseOperations.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  
  ConstantColors constantColors = ConstantColors();
  final PageController homepageController = PageController();
  int pageIndex = 0;

  @override
  void initState(){
    Provider.of<FirebaseOperations>(context, listen: false).initUserData(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: PageView(
        controller: homepageController,
        children: [Feed(),Chatroom(),Profile()],
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (page){
          setState((){
            pageIndex
            = page;
          });
        }
      )
      bottomNavigationBar: Provider.of<HomepageHelpers>(context,listen: false)
      .bottomNavBar(context, pageIndex, homepageController));
  }
}
