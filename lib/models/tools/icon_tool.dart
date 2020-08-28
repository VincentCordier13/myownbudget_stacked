import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class IconClass {
  String image;
  ImageColorEnum imageColor;
  BackColorEnum backColor;

  IconClass() {
    this.image = "assets/icons/flutter.png";
    this.imageColor = ImageColorEnum.values[0]; //white
    this.backColor = BackColorEnum.values[1]; //black
  }

  IconClass.fromData({@required String data}) {
    print("IconClass.fromData");
    List<String> datas = data.split("@");
    this.image = "assets/icons/" + datas[0] + ".png";
    this.imageColor.fromData = datas[1];
    this.backColor.fromData = datas[2];
  }

  String toData() {
    return this.image + "@" + this.imageColor.toData + "@" + this.backColor.toData;
  }

  getBackColor() {
    return this.backColor.toColorValue;
  }

  getImageColor() {
    return this.imageColor.toColorValue;
  }
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

  String get toData => describeEnum(this);

  set fromData(String data) {
    ImageColorEnum response = ImageColorEnum.values.firstWhere((e) {
      print("");
      print("e $e");
      print("data $data");
      print("describeEnum(e) ${describeEnum(e)}");
      print(describeEnum(e) == data ? true : false);
      print("");
      return describeEnum(e) == data ? true : false ;
    });
    print("response $response");
  }
}


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

extension on BackColorEnum {

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

  String get toData => describeEnum(this);

  set fromData(String data) => BackColorEnum.values.firstWhere((e) => describeEnum(e) == data);
}