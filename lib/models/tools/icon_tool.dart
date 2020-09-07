import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IconClass {
  String _image;
  ImageColorEnum _imageColor;
  BackColorEnum _backColor;

  static const String imageRepository = "assets/icons/";

  IconClass() {
    this._image = null;
    this._imageColor = null;
    this._backColor = null;
  }

  IconClass.fromData({@required String data}) {
    print("IconClass.fromData");
    List<String> datas = data.split("@");
    this._image = imageRepository + datas[0];
    this._imageColor = imageColorFromData(data: datas[1]);
    this._backColor = backColorFromData(data: datas[2]);
  }

  String toData() {
    return this._image.split("/").last + "@" + this._imageColor.toData() + "@" + this._backColor.toData();
  }

  String get image => this._image = imageRepository + _image;
  IconClass.setImage({@required String image}) {
    _image = imageRepository + image;
    _imageColor = null;
    _backColor = null;
  }

  Color get getImageColor => this._imageColor.toColorValue;
  set setImageColor(ImageColorEnum imageColorEnum) => this._imageColor = imageColorEnum;

  Color get getBackColor => this._backColor.toColorValue;
  set setBackColor(BackColorEnum backColorEnum) => this._backColor = backColorEnum;
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
