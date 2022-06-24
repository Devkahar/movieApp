import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/data/data_source/unauthorized_exception.dart';

class ApiClient {
  final Client _client;
  ApiClient(this._client);
  dynamic get(String path, {Map<String, dynamic>? params}) async {
    final response = await _client.get(
      getPath(path,params),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
  dynamic post(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.post(
      getPath(path, null),
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic deleteWithBody(String path, {Map<dynamic, dynamic>? params}) async {
    Request request = Request('DELETE', getPath(path, null));
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode(params);
    final response = await _client.send(request).then(
          (value) => Response.fromStream(value),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
  Uri getPath(String path,Map<String, dynamic>? params){
    String paramString ='';
    if(params!=null){
      params.forEach((key, value) {
        paramString+= '&$key=$value';
      });
    }
    // print('${ApiConstanst.BASE_URL}$path?api_key=${ApiConstanst.API_KEY}$paramString');
    return Uri.parse('${ApiConstanst.BASE_URL}$path?api_key=${ApiConstanst.API_KEY}$paramString');
  }
}