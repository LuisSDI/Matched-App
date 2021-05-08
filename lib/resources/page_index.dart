
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class PageIndex extends StatelessWidget {
  bool currentPage;
  PageIndex(this.currentPage);

  Widget pageIndexIndicator(bool isCurrentPage){
    ScreenScaler scaler = ScreenScaler();

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: scaler.getWidth(.5)
      ),
      height: scaler.getWidth(.5),
      width: scaler.getWidth(.5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCurrentPage ? mainColor : greyish
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return pageIndexIndicator(currentPage);
  }
}


