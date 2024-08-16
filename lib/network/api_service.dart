import 'dart:convert';

import 'package:beni_http/model/quote_exception.dart';
import 'package:beni_http/model/quote_response.dart';
import 'package:beni_http/network/constant.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static ApiService api = ApiService._();

  Future<QuoteResponse> fetchQuotes() async {
    Uri uri = Uri.parse('$baseUrl$endPoint');
    http.Response response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return QuoteResponse.fromJson(jsonData);
    } else {
      var quoteResponse = QuoteResponse.fromJson(jsonData);
      throw QuoteException(
          quoteResponse.statusCode, quoteResponse.statusMessage!);
    }
  }
}
