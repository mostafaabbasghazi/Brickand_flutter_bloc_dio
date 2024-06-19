import 'package:bolc_persons/consts/strings.dart';
import 'package:dio/dio.dart';

class WbServers{
  late Dio dio;
  WbServers(){
    BaseOptions baseOptions=BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout:const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20)

    );
    dio=Dio(baseOptions);
  }

  Future <List<dynamic>> getAllPersons()async{
    try {
    Response response=await dio.get("/character/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16");
    print(response.data.toString());
    return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
  
}