// ignore_for_file: avoid_print

import 'package:faker/faker.dart';

class LazyLoading {
  // for singleton
  static final LazyLoading instance = LazyLoading._internal();
  LazyLoading._internal();

  List<String>? _data;

  List<String> get data {
    // if (_data == null) {
    //   _data = getVenues();
    // }
    // same as this line of code below:
    _data ??= getVenues();

    return _data!;
  }

  getVenues() {
    List<String> items = [];
    for (int i = 0; i < 1000; i++) {
      items.add(faker.lorem.words(2).join(' '));
    }
    return items;
  }
}

void main() {
  LazyLoading lazyLoading = LazyLoading.instance;
  print(lazyLoading._data); // this is null
  lazyLoading.data;
  print(lazyLoading._data); // this is not null

}
