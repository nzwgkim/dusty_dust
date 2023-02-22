import 'package:dio/dio.dart';
import 'package:dusty_dust/const/data.dart';
import 'package:dusty_dust/model/stat_model.dart';

class StatRepository {
  static Future<List<StatModel>> fetchData() async {
    final response = await Dio().get(
        'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
        queryParameters: {
          'serviceKey': serviceKey,
          'returnType': 'json',
          'numOfRows': 30,
          'pageNo': 1,
          'itemCode': 'PM10',
          'dataGubun': 'HOUR',
          'searchCondition': 'WEEK',
        });
    // body는 response의 data로 받을 수 있다.
    List<dynamic> items = response.data['response']['body']['items'];
    // print(items);

    return items.map((e) => StatModel.fromJson(json: e)).toList();
  }
}
