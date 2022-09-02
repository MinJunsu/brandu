import 'package:intl/intl.dart';

DateFormat baseDateFormat = DateFormat("yyyy/MM/dd");

final currencyFormat = NumberFormat.currency(
  locale: "ko_KR",
  symbol: '',
);
