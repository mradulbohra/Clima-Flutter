import 'package:http/http.dart' as http ;
import 'dart:convert';

class NetworkUtil{
  final String url;
  NetworkUtil({this.url});

  Future getData() async
  {
    http.Response response = await http.get(url);
    //  print(response.statusCode);
    if(response.statusCode==200)
    {
      String data = response.body;
      // print(data);
      return jsonDecode(data);
      }
    else{
      print(response.statusCode);
    }
  }

}