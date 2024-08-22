import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test/model.dart';

class MaineController extends GetxController {
Future<List<FetchModel>> fetchData() async {
  var request =
      http.Request('GET', Uri.parse('https://backend.dealsabaad.com/cities'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String reasonPhrase = await response.stream.bytesToString();
    List<dynamic> jsonn = json.decode(reasonPhrase);
    return jsonn.map((e) => FetchModel.fromJson(e)).toList();
  } else {
    print(response.reasonPhrase);
  }
  print(response.reasonPhrase);
  throw Exception("Failed to load data");
}
}