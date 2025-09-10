extension StringExtension on String {
  // Viết hoa chữ đầu, Ex: tHiep => Thiep
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  // Parce format tiền tề sang double
  double parseCurrency({
    String thousandSeparator = '.',
    // Ký tự ngăn cách nhóm 3 số (mặc định: '.')
    String decimalSeparator = ',',
    // Ký tự ngăn cách phần nguyên & thập phân (mặc định: ',')
  }) {
    // Chỉ giữ lại số và các dấu phân tách
    String allowedChars = '0-9$thousandSeparator$decimalSeparator';
    String cleanedString = replaceAll(RegExp('[^$allowedChars]'), '');

    // Loại bỏ ký tự ngăn cách phần ngàn
    cleanedString = cleanedString.replaceAll(thousandSeparator, '');

    // Chuyển dấu phân cách phần thập phân thành `.`
    cleanedString = cleanedString.replaceAll(decimalSeparator, '.');

    // Chuyển chuỗi thành double
    return double.tryParse(cleanedString) ?? 0.0;
  }

  String removeDiacritics() {
    const withDiacritics =
        'áàảãạăắằẳẵặâấầẩẫậéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵđ';
    const withoutDiacritics =
        'aaaaaăaaaaaâaaaaaeeeeeêeeeeeiiiiioooooôoooooơoooooouuuuuưuuuuuyyyyyđ';

    String result = this;
    for (int i = 0; i < withDiacritics.length; i++) {
      result = result.toLowerCase().replaceAll(
        withDiacritics[i],
        withoutDiacritics[i],
      );
    }
    return result;
  }
}

extension StringNullExtension on String? {
  String display({String? error}) {
    if (this == null || this?.trim().isEmpty == true) {
      return error ?? 'Không có';
    }
    return this ?? error ?? 'Không có';
  }
}
