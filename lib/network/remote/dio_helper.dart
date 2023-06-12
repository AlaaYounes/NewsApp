import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class DioHelper {
  static Dio? dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response?> getData({
    required String url,
    required Map<String, dynamic> query,
}) async {
    return await dio!.get(url, queryParameters: query,);
  }
}


// class Http {
//
//   Future<void> get() async {
//     print("mfmkvnflkbnlkgbnlk");
//     String api = "https://newsapi.org/v2/everything?q=tesla&from=2023-02-19&sortBy=publishedAt&apiKey=e172161cdd0b4f07923708e6da5d145c";
//     api = "https://jsonplaceholder.typicode.com/posts/1";
//     http.Response response = await http.get(Uri.parse(api));
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//
//     // print(await http.read(Uri.https("https://newsapi.org/")));
//   }
