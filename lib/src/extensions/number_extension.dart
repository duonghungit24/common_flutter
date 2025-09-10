import 'package:intl/intl.dart';

extension NumExtension on num {
  num plus(num other) {
    return this + other;
  }

  num minus(num other) {
    return this - other;
  }

  num times(num other) {
    return this * other;
  }

  num divide(num other) {
    return this / other;
  }
}

extension IntExtension on int {
  int plus(int other) {
    return this + other;
  }

  int minus(int other) {
    return this - other;
  }

  int times(int other) {
    return this * other;
  }

  double divide(int other) {
    return this / other;
  }

  // Chuyển sang format tiền tệ với dấu (.) ngăn cách 3 phần tử
  String toCurrencyFormat({String? unit}) {
    return '${toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match.group(1)}.')}${unit ?? 'đ'}';
  }

  // Chuyển sang format tiền tệ với dấu (,) ngăn cách 3 phần tử
  String toCurrencyFormat2() {
    return toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match match) => '${match.group(1)},',
    );
  }

  // Chuyển từ số phút sang format giờ: hh:mm
  String minuteToHourFormat({
    String? mid,
    bool isPad = true,
    String pad = '',
    bool showZeroMinutes = true,
  }) {
    int hours = this ~/ 60;
    int minutes = this % 60;
    String hourStr =
        isPad ? hours.toString().padLeft(2, '0') : hours.toString();
    String minuteStr =
        (minutes == 0 && !showZeroMinutes)
            ? ''
            : minutes.toString().padLeft(2, '0');
    return "$hourStr${mid ?? ":"}$minuteStr$pad";
  }

  // Chuyển từ số thời gian num từ số phút sang DateTime
  DateTime toTime() {
    return DateTime(DateTime.now().year, 1, 1, this ~/ 60, this % 60);
  }

  // Trả về số an toàn để có thể chia
  int toSafeNum() {
    return this < 1 ? 1 : this;
  }

  String formatTimeHome() {
    final hours = this ~/ 60;
    final remainingMinutes = this % 60;
    final fakeTime = DateTime(2023, 1, 1, hours, remainingMinutes);
    return DateFormat('HH\'h\'mm').format(fakeTime);
  }
}

extension DoubleExtension on double {
  double plus(double other) {
    return this + other;
  }

  double minus(double other) {
    return this - other;
  }

  double times(double other) {
    return this * other;
  }

  double divide(double other) {
    return this / other;
  }

  // Trả về số an toàn để có thể chia
  double toSafeNum() {
    return this < 1 ? 1 : this;
  }

  // Chuyển sang định dạng tiền số double Ex: 1.000.000,5
  String toCurrencyFormat({
    int decimalPlaces = 1,
    // Số chữ số sau dấu thập phân nếu có (mặc định: 1)
    String thousandSeparator = '.',
    // Ký tự ngăn cách nhóm 3 số (mặc định: '.')
    String decimalSeparator = ',',
    // Ký tự ngăn cách phần nguyên & thập phân (mặc định: ',')
  }) {
    // Định dạng số với phần thập phân mong muốn
    String fixedNumber = toStringAsFixed(decimalPlaces);

    // Tách phần nguyên & phần thập phân
    List<String> parts = fixedNumber.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '';

    // Format phần nguyên (thêm dấu ngăn cách mỗi 3 số)
    String formattedInteger = integerPart.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match match) => '${match.group(1)}$thousandSeparator',
    );

    // Nếu số thập phân bằng 0, loại bỏ phần sau dấu `,`
    return decimalPlaces > 0 && decimalPart.isNotEmpty && decimalPart != '0'
        ? '$formattedInteger$decimalSeparator$decimalPart'
        : formattedInteger;
  }

  double roundToThousand() {
    return (this / 1000).ceil() * 1000;
  }

  String formatMoneyString() {
    if (this >= 1000000000) {
      return '${(this / 1000000000).toStringAsFixed(1).replaceAll('.0', '')}b';
    } else if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1).replaceAll('.0', '')}m';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1).replaceAll('.0', '')}k';
    }
    return toString();
  }
}
