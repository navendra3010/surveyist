import 'package:intl/intl.dart';

class DateFormate {
  static void currentDateAndTime() {
    DateTime now = DateTime.now();
    // var formatter = DateFormat('HH:mm:ss');
  
    String formattedDate = DateFormat('dd MM yyyy').format(now);
    String formattedTime =  DateFormat('HH:mm:ss').format(now);
    print(formattedDate);
    print(formattedTime);
  }
}
