//JSON 데이터 인코딩 예

import 'dart:convert';

void main(List<String> args) {
  var scores = [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null}
  ];

  var jsonText = jsonEncode(scores);
  print(jsonText ==
      [
        {"score": 40},
        {"score": 80},
        {"score": 100, "overtime": true, "special_guest": null}
      ]); //true 출력
}

//실행을 했는데 false가 나옴.
//여러가지 시도 해봤는데 왜그런지 모르겠음.