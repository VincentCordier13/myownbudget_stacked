import 'package:flutter/cupertino.dart';

class IconClass {
  String image;
  ImageColorEnum imageColor;
  BackColorEnum backColor;

  IconClass.setNull() {
    this.image = "assets/icons/cadie.png";
    this.imageColor = ImageColorEnum.values[1];
    this.backColor = BackColorEnum.values[2];
  }

  IconClass({@required this.image, @required this.imageColor, @required this.backColor});

  IconClass.fromData({@required String data}) {
    List<String> datas = data.split("@");
    this.image = "assets/icons/" + datas[0] + ".png";
    this.imageColor = this.imageColor.fromData(datas[1]);
    this.backColor = this.backColor.fromData(datas[2]);
  }

  String toData() {
    return this.image + "@" + this.imageColor.toStringValue() + "@" + this.backColor.toStringValue();
  }

  getBackColor() {
    return this.backColor.toColorValue();
  }

  getImageColor() {
    return this.imageColor.toColorValue();
  }
}
  
enum ImageColorEnum {
  white,
  black,
}

extension on ImageColorEnum {

  Color toColorValue() {
    switch (this) {
      case ImageColorEnum.white :
        return Color(0xFFFFFFFF);
      case ImageColorEnum.black :
        return Color(0xFF000000);
      default:
        return Color(0x00000000);
    }
  }

  String toStringValue() {
    return this.toString().substring(this.toString().indexOf('.') + 1);
  }

  ImageColorEnum fromData(String string) {
    return ImageColorEnum.values.firstWhere((e) => e.toString() == string);
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

  Color toColorValue() {
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

  String toStringValue() {
    return this.toString().substring(this.toString().indexOf('.') + 1);
  }

  BackColorEnum fromData(String string) {
    return BackColorEnum.values.firstWhere((e) => e.toString() == string);
  }
}