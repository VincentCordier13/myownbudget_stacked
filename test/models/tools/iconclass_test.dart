import 'package:flutter_test/flutter_test.dart';
import 'package:myownbudget_stacked/models/tools/icon_tool.dart';

void main() {
  group('IconClass - ', () {
    group('ImageColorEnum - ', () {
      ImageColorEnum imageColorEnum = ImageColorEnum.black;
      String data = "black";
      
      print("fromData ***********");
      ImageColorEnum imageColorEnumFromData = ImageColorEnum.white;
      print("imageColorEnumFromData $imageColorEnumFromData");
      imageColorEnumFromData.fromData = data;
      print("imageColorEnumFromData $imageColorEnumFromData");
      print("toData ***********");
      String imageColorEnumToData;
      print("imageColorEnumToData $imageColorEnumToData");
      imageColorEnumToData = imageColorEnum.toData;
      print("imageColorEnumToData $imageColorEnumToData");

      test('fromData', () {
        print("imageColorEnum : $imageColorEnum");
        print("imageColorEnumFromData : $imageColorEnumFromData");
        expect(imageColorEnum, imageColorEnumFromData);
      });
      test('toData', () {
        print("data : $data");
        print("imageColorEnumToData : $imageColorEnumToData");
        expect(data, imageColorEnumToData);
      });
    });
  });

  // IconClass icon = new IconClass();
  // String data = "assets/icons/flutter.png@white@black";
  // IconClass iconFromData = new IconClass.fromData(data: data);
  // String iconToData = icon.toData();
  // test('fromData', () {
  //   expect(icon, iconFromData);
  // });
  // test('toData', () {
  //   expect(data, iconToData);
  // });
}
