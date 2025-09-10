// Áp dụng Functional Programming
extension IterableExtensions<E> on Iterable<E> {
  // Tìm phần tử đầu tiên hoặc null thoả mãn điều kiện
  E? firstWhereOrNull(bool Function(E element) test) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }

  // Tìm phần tử cuối cùng hoặc null thoản mãn điều kiện
  E? lastWhereOrNull(bool Function(E element) test) {
    for (var element in toList().reversed) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }

  // Iterable map sang list
  List<R> mapToList<R>(R Function(E element) transform) {
    return map(transform).toList();
  }

  // Iterable map sang list với điều kiện thoả mãn
  List<E> whereToList(bool Function(E element) test) {
    return where(test).toList();
  }

  // Iterable map sang map
  Map<K, V> toMap<K, V>(
    K Function(E element) key,
    V Function(E element) value,
  ) {
    final map = <K, V>{};
    for (var element in this) {
      map[key(element)] = value(element);
    }
    return map;
  }

  // Tổng các phần tử
  num sumBy(num Function(E element) selector) {
    num sum = 0;
    for (var element in this) {
      sum += selector(element);
    }
    return sum;
  }

  // Tính max
  E? maxBy(Comparable Function(E element) compare) {
    if (isEmpty) return null;
    return reduce((a, b) => compare(a).compareTo(compare(b)) > 0 ? a : b);
  }

  // Tính min
  E? minBy(Comparable Function(E element) compare) {
    if (isEmpty) return null;
    return reduce((a, b) => compare(a).compareTo(compare(b)) < 0 ? a : b);
  }
}
