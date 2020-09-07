import 'package:flutter_test/flutter_test.dart';
import 'package:myownbudget_stacked/models/tools/money_tool.dart';

void main() {
  group('MoneyClass -', () {
    group('CurrencyEnum -', () {
      CurrencyEnum currencyEnum = CurrencyEnum.cad;
      String string = "CAD\$";
      String data = "cad";
      
      String currencyToString = currencyEnum.toCurrencyString;
      CurrencyEnum currencyEnumFromData = currencyFromData(data: data);
      String currencyEnumToData = currencyEnum.toData();

      test('toCurrencyString', () {
        expect(string, currencyToString);
      });
      test('fromData', () {
        expect(currencyEnum, currencyEnumFromData);
      });
      test('toData', () {
        expect(data, currencyEnumToData);
      });
    });

    
    MoneyClass money = new MoneyClass.setCurrency(currency: CurrencyEnum.cad);
    money.setAmount = 1000.00;
    String string = "CAD\$ 1000.00";
    String data = "1000.00@cad";
    String moneyToString = money.toString();
    MoneyClass moneyFromData = new MoneyClass.fromData(data: data);
    String moneyToData = money.toData();

    test('toString', () {
      expect(string, moneyToString);
    });
    group('fromData -', () {
      test('amount', () => expect(money.getAmount, moneyFromData.getAmount));
      test('currency', () => expect(money.getCurrency, moneyFromData.getCurrency));
    });
    test('toData', () {
      expect(data, moneyToData);
    });

  });
}
