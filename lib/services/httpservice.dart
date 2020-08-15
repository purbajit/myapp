import 'package:dio/dio.dart';
import 'package:guist/models/Drug.dart';
import 'package:guist/services/api.dart';

class HttpService {
  var dio = Dio();

  Future<Drug> getData({int pageNo}) async {
    try {
      Response response =
          await dio.get(API.baseUrl(userId: 'aizawlesi', pageNo: pageNo));
      return Drug.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
