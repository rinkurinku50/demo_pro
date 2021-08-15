
import 'package:dio/dio.dart';

class ApiProvider {
  var BaseUrl;
  var WebSocketUrl;

  BuildType buildType = BuildType.DEV;

 late Dio _dio;
  // IO.Socket socket;

 ApiProvider()  {

   _dio =Dio();
   switch (buildType) {
     case BuildType.DEV:
       BaseUrl = "https://api.unsplash.com";
       WebSocketUrl = "";
       break;
     case BuildType.STAGE:
       BaseUrl = "";
       WebSocketUrl = "";
       break;
     case BuildType.PROD:
       BaseUrl = "";
       WebSocketUrl = "";
       break;
   }



   BaseOptions options = new BaseOptions(
       baseUrl: BaseUrl,
       receiveDataWhenStatusError: true,
       connectTimeout: 2 * 60 * 1000, // 60 seconds
       receiveTimeout: 2 * 60 * 1000 // 60 seconds
   );

   _dio.options=options;

   _dio.interceptors.add(LogInterceptor(
       responseBody: true,
       requestHeader: true,
       request: true,
       requestBody: true));

  }



  Future<Response> getUnSplashData() async {

   String url= BaseUrl + "/photos?page=1&client_id=Lir4jnWJPwqKx8ie1jrLaORrCzeAu9ZcqpKzCTgT9DE&per_page=20";

   return await _dio.get(url);
  }

  



 //  connectSocket(){
 //    socket=IO.io(WebSoketUrl);
 //    socket.connect();
 //    socket.onConnect((data) => print("Connected ${data}"));
 // }
}

enum BuildType { DEV, STAGE, PROD }