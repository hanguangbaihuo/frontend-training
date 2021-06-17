/*
 * @Author: 明华
 * @Date: 2021-04-08 11:19:43
 * @LastEditors: 明华
 * @LastEditTime: 2021-06-08 15:23:05
 * @Description: 
 * @FilePath: /frontend-training/dart/test.dart
 */

void findSingle() {
  List arr = [1, 2, 3, 4, 5, 4, 3, 2, 1];
  int t = arr[0];
  for (int i = 1; i < arr.length; i++) {
    t ^= arr[i];
    print(t);
  }
  print("single  = ${t}");
}

void main() {
  // findSingle();

  // try {
  //   Future.delayed(new Duration(seconds: 2), () {
  //     return 'hi world';
  //     // throw AssertionError('Error');
  //   }).then((value) {
  //     print(value);
  //   }).catchError((e) {
  //     print(e);
  //   }).whenComplete(() {
  //     print('future complete');
  //   });

  //   throw AssertionError('try catch error');
  // } catch (e) {
  //   print('try:');
  //   print(e);
  // }

  // Future.wait([
  //   Future.delayed(new Duration(seconds: 2), () {
  //     return 'hi';
  //   }),
  //   Future.delayed(new Duration(seconds: 4), () {
  //     return 'word';
  //   }),
  // ]).then((results) {
  //   print('${results[0]} ${results[1]}');
  // });

  Stream.fromFutures([
    Future.delayed(new Duration(seconds: 1), () {
      // print('hello 1');
      return 'hello 1';
    }),
    Future.delayed(new Duration(seconds: 2), () {
      throw AssertionError('Error');
    }),
    Future.delayed(new Duration(seconds: 3), () {
      // print('hello 3');
      return 'hello 3';
    }),
  ]).listen((event) {
    print('listen: ${event}');
  }, onError: (e) {
    print('error ${e}');
  }, onDone: () {
    print('done');
  });
}
