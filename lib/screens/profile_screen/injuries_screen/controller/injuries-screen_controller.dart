import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InjuiresScreenController extends GetxController{

Map<String, String> svgPaths =
    {
      'front_head': 'assets/img/svg/body/Front svg/head.svg',
      'front_shoulder_L': 'assets/img/svg/body/Front svg/shoulder L.svg',
      'front_shoulder_R': 'assets/img/svg/body/Front svg/shoulder R.svg',
      'front_chest_L': 'assets/img/svg/body/Front svg/chest L.svg',
      'front_chest_R': 'assets/img/svg/body/Front svg/chest R.svg',
      'front_stomach_L': 'assets/img/svg/body/Front svg/stomach L.svg',
      'front_stomach_R': 'assets/img/svg/body/Front svg/stomach R.svg',
      'front_arm_L': 'assets/img/svg/body/Front svg/arm L.svg',
      'front_arm_R': 'assets/img/svg/body/Front svg/arm R.svg',
      'front_forearm_L': 'assets/img/svg/body/Front svg/forearm L.svg',
      'front_forearm_R': 'assets/img/svg/body/Front svg/forearm R.svg',
      'front_wrist_L': 'assets/img/svg/body/Front svg/wrist L.svg',
      'front_wrist_R': 'assets/img/svg/body/Front svg/wrist R.svg',
      'front_tigh_L': 'assets/img/svg/body/Front svg/tigh L.svg',
      'front_tigh_R': 'assets/img/svg/body/Front svg/tigh R.svg',
      'front_knee_L': 'assets/img/svg/body/Front svg/knee L.svg',
      'front_knee_R': 'assets/img/svg/body/Front svg/knee R.svg',
      'front_lower_leg_L': 'assets/img/svg/body/Front svg/lower leg L.svg',
      'front_lower_leg_R': 'assets/img/svg/body/Front svg/lower leg R.svg',
      'front_ankle_L': 'assets/img/svg/body/Front svg/ankle L.svg',
      'front_ankle_R': 'assets/img/svg/body/Front svg/ankle R.svg',
      'back_shoulder_L': 'assets/img/svg/body/Back svg/shoulder L.svg',
      'back_shoulder_R': 'assets/img/svg/body/Back svg/shoulder R.svg',
      'back_L': 'assets/img/svg/body/Back svg/back L.svg',
      'back_R': 'assets/img/svg/body/Back svg/back R.svg',
      'back_hip_L': 'assets/img/svg/body/Back svg/hip L.svg',
      'back_hip_R': 'assets/img/svg/body/Back svg/hip R.svg',
      'back_arm_L': 'assets/img/svg/body/Back svg/arm L.svg',
      'back_arm_R': 'assets/img/svg/body/Back svg/arm R.svg',
      'back_forearm_L': 'assets/img/svg/body/Back svg/forearm L.svg',
      'back_forearm_R': 'assets/img/svg/body/Back svg/forearm R.svg',
      'back_wrist_L': 'assets/img/svg/body/Back svg/wrist L.svg',
      'back_wrist_R': 'assets/img/svg/body/Back svg/wrist R.svg',
      'back_thigh_L': 'assets/img/svg/body/Back svg/tigh L.svg',
      'back_thigh_R': 'assets/img/svg/body/Back svg/tigh R.svg',
      'back_elbow_L': 'assets/img/svg/body/Back svg/elbow L.svg',
      'back_elbow_R': 'assets/img/svg/body/Back svg/elbow R.svg',
      'back_over_hip_L': 'assets/img/svg/body/Back svg/over hip L.svg',
      'back_over_hip_R': 'assets/img/svg/body/Back svg/over hip R.svg',
      'back_lower_leg_L': 'assets/img/svg/body/Back svg/lower leg L.svg',
      'back_lower_leg_R': 'assets/img/svg/body/Back svg/lower leg R.svg',
      'back_ankle_L': 'assets/img/svg/body/Back svg/ankle L.svg',
      'back_ankle_R': 'assets/img/svg/body/Back svg/ankle R.svg',

    }
  ;

  int isSelected = 0;
  RxInt currentPageIndex = 0.obs;

  PageController pageController =PageController();
  List<String> painTypesItem = [
    'Spasm',
    'Soreness',
    'Numbness',
    'Tightness',
    'Stiffness',
    'Sharp pain',
    'Swelling',
    'Burning',
    'Radiatiing pain',
    'Clicking',
  ];
  List<String> selectedIndex = [];

  void changeBackAndFrontPage(){
    if(currentPageIndex.value==0){
      pageController.animateToPage(duration: Duration(milliseconds: 500),1, curve: Curves.linear);
      currentPageIndex.value=1;
    }
    else{
      pageController.animateToPage(duration: Duration(milliseconds: 500),0, curve: Curves.linear);
      currentPageIndex.value=0;
    }

    print('page index changed');
  }


}