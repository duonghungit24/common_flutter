import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  // DateTime to format dd/MM/yyyy
  String toFormattedStandard() {
    return "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year";
  }

  // DateTime to format dd/MM
  String toFormattedDayMonth() {
    return "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}";
  }

  // DateTime to format MM/yyyy
  String toFormattedMonthYear() {
    return "${month.toString().padLeft(2, '0')}/$year";
  }

  String toFormattedQuarterYear() {
    int quarterStartMonth = ((month - 1) ~/ 3) + 1;

    return "$quarterStartMonth/$year";
  }

  // DateTime to format dd/MM/yyyy hh:mm
  String toFormattedWithTime() {
    final hours = hour.toString().padLeft(2, '0');
    final minutes = minute.toString().padLeft(2, '0');
    return "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year $hours:$minutes";
  }

  // DateTime to format hh:mm:ss dd/MM/yyyy
  String toFormattedWithTimeDetail() {
    final hours = hour.toString().padLeft(2, '0');
    final minutes = minute.toString().padLeft(2, '0');
    final milliseconds = millisecond.toString().padLeft(3, '0');
    return "$hours:$minutes:$milliseconds ${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year";
  }

  // DateTime to format hh/mm
  // isPaddingBetween padđing với ký tự :
  String toFormattedTime({
    bool isPaddingBetween = true,
    String between = ':',
    bool isPad = true,
  }) {
    return "${isPad ? hour.toString().padLeft(2, '0') : hour}${isPaddingBetween ? ' $between ' : between}${minute.toString().padLeft(2, '0')}";
  }

  String formatTimeMonthYear() {
    String month = DateFormat.M().format(this);
    String year = DateFormat.y().format(this);
    return 'Tháng $month năm $year';
  }
  // Làm rõ thời gian so với hiện tại
  // String toDifferentOfNow() {
  //   final now = DateTime.now();
  //   final difference = now.difference(this);

  //   if (difference.inSeconds < 60) {
  //     return '${difference.inSeconds} ${S.current.giay_truoc}';
  //   } else if (difference.inMinutes < 60) {
  //     return '${difference.inMinutes} ${S.current.phut_truoc}';
  //   } else if (difference.inHours < 24) {
  //     return '${difference.inHours} ${S.current.gio_truoc}';
  //   } else if (difference.inDays < 30) {
  //     return '${difference.inDays} ${S.current.ngay_truoc}';
  //   } else {
  //     return '${difference.inDays ~/ 30} ${S.current.i_thang_truoc}';
  //   }
  // }

  // Validate với thời gian hiện tại + check năm >1900
  bool validateByNow() {
    return isBefore(DateTime.now()) && year > 1900;
  }

  // Lấy thời gian bắt đầu 1 ngày bắt đầu từ 0h00
  DateTime toStartDay() {
    return DateTime(year, month, day);
  }

  // Lấy thời gian cuối 1 ngày 23h59
  DateTime toEndDay() {
    return DateTime(
      year,
      month,
      day,
    ).add(const Duration(hours: 23, minutes: 59));
  }

  // Lấy thời gian bắt đầu 1 tháng bắt đầu từ ngày 1 0h00
  DateTime toStartMonth() {
    return DateTime(year, month);
  }

  // Lấy thời gian kết thúc 1 tháng bắt đầu từ ngày 1 0h00
  DateTime toEndMonth() {
    return DateTime(year, month + 1).subtract(const Duration(seconds: 1));
  }

  DateTime toStartQuarter() {
    int quarterStartMonth = ((month - 1) ~/ 3) * 3 + 1;
    return DateTime(year, quarterStartMonth);
  }

  // Lấy thời gian kết thúc 1 quý bắt đầu từ ngày 1 0h00
  DateTime toEndQuarter() {
    final startQuater = toStartQuarter();
    return DateTime(
      startQuater.year,
      startQuater.month + 3,
    ).subtract(const Duration(seconds: 1));
  }

  // Lấy thời gian bắt đầu 1 năm bắt đầu từ tháng 1 ngày 1 0h00
  DateTime toStartYear() {
    return DateTime(year);
  }

  // laáy ngày đầu tháng
  DateTime firstDayOfMonth() {
    return DateTime(year, month, 1);
  }

  // lấy ngày cuối tháng
  DateTime endDayOfMonth() {
    return DateTime(year, month + 1, 0);
  }

  // Lấy ra số phút (chỉ tính từ giờ và phút)
  int toMinutes() {
    return hour * 60 + minute;
  }

  // Ex: Thứ Hai, Thứ Ba, Monday, Tuesday
  String toDayInWeek() {
    DateFormat dateFormat = DateFormat.EEEE();
    return dateFormat.format(this);
  }

  // Ex: Thứ 2, Thứ 3, Monday...
  String toDayInWeek2() {
    DateFormat dateFormat = DateFormat.E();
    return dateFormat.format(this);
  }

  // this là startDate, lấy ra list các ngày giữa start và end, mỗi thứ chỉ lấy 1 ngày
  List<DateTime> getUniqueWeekdaysInRange(DateTime endDate) {
    Map<int, DateTime> uniqueWeekdays = {};
    DateTime currentDate = toStartDay();

    while (!currentDate.isAfter(endDate.toStartDay())) {
      int weekday = currentDate.weekday;

      if (!uniqueWeekdays.containsKey(weekday)) {
        uniqueWeekdays[weekday] = currentDate;
      }

      currentDate = currentDate.add(Duration(days: 1));
    }
    final convert = uniqueWeekdays.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    return convert.map((e) => e.value).toList();
  }

  // Hàm tính có bao nhiêu ngày trong tuần từ khoảng start đến end
  int countWeekdaysBetween({DateTime? endInit, required int weekdayTarget}) {
    final start = this, end = endInit;
    if (end == null || start.isAfter(end)) return 0;

    int count = 0;
    DateTime current = start;

    while (!current.toStartDay().isAfter(end.toStartDay())) {
      if (current.weekday == weekdayTarget) {
        count++;
      }
      current = current.add(Duration(days: 1));
    }

    return count;
  }

  // Hàm lấy tất cả các ngày thoả mãn có weekDay nằm trong weekdayTargets từ khoảng start đến end
  List<DateTime> getAllWeekdaysBetween({
    DateTime? endInit,
    required List<int> weekdayTargets, //2-8
  }) {
    final start = this, end = endInit;
    if (end == null || start.isAfter(end)) return [];

    List<DateTime> items = [];
    DateTime current = start;

    while (!current.toStartDay().isAfter(end.toStartDay())) {
      //weekday 1-7 => 2-8
      if (weekdayTargets.contains(current.weekday + 1)) {
        items.add(current);
      }
      current = current.add(Duration(days: 1));
    }

    return items;
  }

  // Đưa ra định dạng 15/5/2024-1/3/2025 (Khác năm),
  // 1/3-2/3(/ nếu là năm nay thì ko hiện thị năm, ko phải thì hiển thị năm)(Cùng năm)
  // Nếu 2 ngày trùng nhau thì chỉ đưa ra 1 ngày
  // Cho hiển thị năm
  String toDisplayWith(DateTime? other, {bool isRequireYear = false}) {
    if (other == null || toStartDay().isAtSameMomentAs(other.toStartDay())) {
      return toFormattedStandard();
    }

    if (year != other.year && isRequireYear) {
      return "${toFormattedStandard()}-${other.toFormattedStandard()}";
    }
    if (year == DateTime.now().year || !isRequireYear) {
      return "${toFormattedDayMonth()}-${other.toFormattedDayMonth()}";
    }
    return "${toFormattedDayMonth()}-${other.toFormattedStandard()}";
  }

  // lấy ra số phút từ khoảng 2 ngày format 2025-06-04T18:12:23.337
  int timeDifferenceExtension() {
    DateTime now = DateTime.now();
    int minutes = now.difference(this).inSeconds;
    return minutes;
  }
}

extension DateTimeListExt on List<DateTime> {
  // Hàm lấy ra ngày gần nhất với compareWith (default là now) trong list datetime (this)
  // Các ngày gần nhất trươcs hiện tại
  DateTime? getNearestDay({DateTime? compareWith}) {
    final now = DateTime.now();
    final allTime = where((i) => !i.isAfter(now));
    if (allTime.isEmpty) return null;
    final compare = compareWith ?? now;
    return allTime.reduce(
      (a, b) =>
          (a.difference(compare).abs() < b.difference(compare).abs()) ? a : b,
    );
  }
}

extension StringDateTimeExtension on String {
  // String format dd/MM/yyyy sang DateTime
  DateTime? toFormattedStandard() {
    try {
      final parts = split('/');
      if (parts.length != 3) return null;

      final day = int.tryParse(parts[0]);
      final month = int.tryParse(parts[1]);
      final year = int.tryParse(parts[2]);

      if (day == null || month == null || year == null) return null;

      return DateTime(year, month, day);
    } catch (e) {
      return null;
    }
  }
}
