import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio();

  Future sendRequest(String filePath, String endPoint) async {
    dio.options.headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final file = await MultipartFile.fromFile(filePath, filename: 'fileName');
    final formData = FormData.fromMap({'file': file});
    final response = await dio.post(
      'http://192.168.1.187:8082/$endPoint',
      data: formData,
    );

    return response.data;
  }
}
