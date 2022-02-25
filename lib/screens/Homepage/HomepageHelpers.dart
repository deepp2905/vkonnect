import 'dart:js';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vkonnect/constants/Constantcolors.dart';
import 'package:vkonnect/services/FirebaseOperations.dart';

class HomepageHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  Widget bottomNavBar(
      BuildContext context, int index, PageController pageController) {
    return CustomNavigationBar(
        currentIndex: index,
        bubbleCurve: Curves.bounceIn,
        scaleCurve: Curves.decelerate,
        selectedColor: ConstantColors.blueColor,
        unselectedColor: ConstantColors.whiteColor,
        strokeColor: ConstantColors.blueColor,
        scaleFactor: 0.5,
        iconSize: 30.0,
        onTap: (val) {
          index = val;
          pageController.jumpToPage(val);
          notifyListeners();
        },
        backgroundColor: Color(0xff040307),
        items: [
          CustomNavigationBarItem(icon: Icon(EvaIcons.home)),
          CustomNavigationBarItem(icon: Icon(Icons.message_rounded)),
          CustomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 35.0,
                  backgroundColor: constantColor.blueGrayColor,
                  backgroundImage: NetworkImage(
                      Provider.of<FirebaseOperations>(context, listen: false)
                          .getinitUserImage))),
        ]);
  }
}
