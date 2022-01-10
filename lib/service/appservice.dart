import 'package:intl/intl.dart';

class AppService {
  var formater = NumberFormat('###,###');

  String toMoney(double money) {
    return formater.format(money);
  }
}
