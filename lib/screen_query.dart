// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:pdp_flutter/breakpoints.dart';

class ScreenBreakpoint {
  double maxScreenWidth = 0;
  double maxScreenHeight = 0;
  bool isMobile = false;
  bool isTablet = false;
  bool isDesktop = false;
  
  ScreenBreakpoint(BuildContext context) {
    maxScreenWidth = MediaQuery.of(context).size.width;
    maxScreenHeight = MediaQuery.of(context).size.height;
    if (maxScreenWidth >= Breakpoints.tablet) {
      isDesktop = true;
    } else if (maxScreenWidth <= Breakpoints.mobile) {
      isMobile = true;
    } else {
      isTablet = true;
    }
  }
}
