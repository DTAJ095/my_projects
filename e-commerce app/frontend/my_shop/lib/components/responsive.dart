import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget desktopBody;
  const Responsive(
      {super.key,
      required this.mobileBody,
      this.tabletBody,
      required this.desktopBody});
  
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static isSmallDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static isLargeDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static isLargeMobile(BuildContext context) {
    return MediaQuery.of(context).size.width >= 400 &&
        MediaQuery.of(context).size.width < 600;
  }

  static isSmallMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 400;
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width < 600) {
      return mobileBody;
    } else if (size.width >= 600 && size.width < 1200) {
      return tabletBody ?? mobileBody;
    } else {
      return desktopBody;
    }
  }
}
