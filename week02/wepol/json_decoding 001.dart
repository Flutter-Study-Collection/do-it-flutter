// json 데이터 디코딩 예
import 'dart:convert';

void main(List<String> args) {
  var jsonString = '''
    [
      {"score": 40},
      {"score": 80}
    ]
  ''';

  var scores = jsonDecode(jsonString);
  print(scores is List); // true 출력

  var firstScore = scores[0];
  print(firstScore is Map); // true 출력
  print(firstScore['score'] == 40); // true 출력
}
