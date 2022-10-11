import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type':'application/json',
          }
      ),
    );
  }
  static Future<Response> getData ({
    required String url,
    Map<String,dynamic>? query,
    required  String token ,
  }) async
  {
    dio.options.headers= {
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token' ,
    };
    return await dio.get(url, queryParameters : query,);
  }

  static Future<Response> postData({
    required String url,
    Map<String,dynamic>? query,
    Map<String,dynamic>? data,
    String? token  ,
  }) async{
    dio.options.headers={
      'Content-Type' : 'application/json',
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token' ,
    };
    return await dio.post(
        url,
        queryParameters: query,
        data: data,
    );
  }

  static Future<Response> patchData({
    required String url,
    required Map<String,dynamic> data,
    required String? token ,
  }) async{
    dio.options.headers={
      'Content-Type' : 'application/json',
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.patch(
      url,
      data: data,
    );
  }

}