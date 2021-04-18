import "package:flutter/widgets.dart";
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  double _screenWidth;
  double _screenHeight;
  double _blockSizeHorizontal;
  double _blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = _screenWidth / 15;
    _blockSizeVertical = _screenHeight / 32.5;
  }

  double get screenWidth => _screenWidth;

  double get screenHeight => _screenHeight;

  double get blockSizeHorizontal=> _blockSizeHorizontal;

  double get blockSizeVertical => _blockSizeVertical;
}
