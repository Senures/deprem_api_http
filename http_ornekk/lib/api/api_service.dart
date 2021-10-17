import 'package:http/http.dart' as http;
import 'dart:async';
import '../models/models.dart';
import 'dart:convert';

class GetApi {
 
  Future<DepremModel> getApi() async {
    final response = await http.get(Uri.parse('https://api.orhanaydogdu.com.tr/deprem/live.php?limit=100'));
   
    if (response.statusCode == 200) {
      return DepremModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load DepremModel');
    }
  }
}