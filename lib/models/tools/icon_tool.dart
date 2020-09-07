import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IconClass {
  String _image;
  ImageColorEnum _imageColor;
  BackColorEnum _backColor;

  static const String imageRepository = "assets/icons/";

  IconClass() {
    print("IconClass");
    _image = null;
    _imageColor = null;
    _backColor = null;
  }

  IconClass.fromData({@required String data}) {
    print("IconClass.fromData");
    List<String> datas = data.split("@");
    _image = datas[0];
    _imageColor = imageColorFromData(data: datas[1]);
    _backColor = backColorFromData(data: datas[2]);
  }

  String toData() {
    print("IconClass toData");
    return _image + "@" + _imageColor.toData() + "@" + _backColor.toData();
  }

  String get getImage => imageRepository + _image;
  IconClass.setImage({@required String image}) {
    _image = image;
    _imageColor = null;
    _backColor = null;
  }

  Color get getImageColor => _imageColor.toColorValue;
  set setImageColor(ImageColorEnum imageColorEnum) => _imageColor = imageColorEnum;

  Color get getBackColor => _backColor.toColorValue;
  set setBackColor(BackColorEnum backColorEnum) => _backColor = backColorEnum;
}

enum ImageColorEnum {
  white,
  black,
}

extension ImageColorEnumExtension on ImageColorEnum {

  Color get toColorValue {
    switch (this) {
      case ImageColorEnum.white :
        return Color(0xFFFFFFFF);
      case ImageColorEnum.black :
        return Color(0xFF000000);
      default:
        return Color(0x00000000);
    }
  }

  String toData() => describeEnum(this);
}

ImageColorEnum imageColorFromData({@required String data}) => ImageColorEnum.values.firstWhere((e) => describeEnum(e) == data);


enum BackColorEnum {
  white,
  black,
  blue,
  green,
  red,
  yellow,
  orange,
  pink,
  // ....
}

extension BackColorEnumExtension on BackColorEnum {

  Color get toColorValue {
    switch (this) {
      case BackColorEnum.white :
        return Color(0xFFFFFFFF);
      case BackColorEnum.black :
        return Color(0xFF000000);
      case BackColorEnum.blue :
        return Color(0xFF0070FF);
      case BackColorEnum.red :
        return Color(0xFFFF0000);
      case BackColorEnum.green :
        return Color(0xFF00FF0F);
      case BackColorEnum.yellow :
        return Color(0xFFFFF700);
      default:
        return Color(0x00000000);
    }
  }

  String toData() => describeEnum(this);
}

BackColorEnum backColorFromData({@required String data}) => BackColorEnum.values.firstWhere((e) => describeEnum(e) == data);
