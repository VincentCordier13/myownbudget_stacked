import 'package:flutter_test/flutter_test.dart';
import 'package:myownbudget_stacked/models/tools/icon_tool.dart';

void main() {
  group('IconClass -', () {
    group('ImageColorEnum -', () {
      ImageColorEnum imageColorEnum = ImageColorEnum.black;
      String data = "black";
      
      ImageColorEnum imageColorEnumFromData = imageColorFromData(data: data);
      String imageColorEnumToData = imageColorEnum.toData();

      test('fromData', () {
        expect(imageColorEnum, imageColorEnumFromData);
      });
      test('toData', () {
        expect(data, imageColorEnumToData);
      });
    });

    group('BackColorEnum -', () {
      BackColorEnum backColorEnum = BackColorEnum.black;
      String data = "black";
      
      BackColorEnum backColorEnumFromData = backColorFromData(data: data);
      String backColorEnumToData = backColorEnum.toData();

      test('fromData', () {
        expect(backColorEnum, backColorEnumFromData);
      });
      test('toData', () {
        expect(data, backColorEnumToData);
      });
    });

    IconClass icon = new IconClass.setImage(image: "flutter.png");
    icon.setImageColor = ImageColorEnum.white;
    icon.setBackColor = BackColorEnum.black;
    String data = "flutter.png@white@black";
    IconClass iconFromData = new IconClass.fromData(data: data);
    String iconToData = icon.toData();
    group('fromData -', () {
      test('image', () => expect(icon.image, iconFromData.image));
      test('imageColor', () => expect(icon.getImageColor, iconFromData.getImageColor));
      test('backColor', () => expect(icon.getBackColor, iconFromData.getBackColor));
    });
    test('toData', () {
      expect(data, iconToData);
    });
  });

  


}
