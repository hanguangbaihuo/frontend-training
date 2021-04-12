/*
 * @Author: 明华
 * @Date: 2021-04-08 11:19:43
 * @LastEditors: 明华
 * @LastEditTime: 2021-04-08 11:21:58
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
  findSingle();
}
