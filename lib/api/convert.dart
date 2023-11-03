import 'dart:convert';
import 'package:hackathon_app/constants.dart';
import 'package:hackathon_app/models/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<String> convert(String from, String to, String amount) async {
  String path = "v1/convert";

  final queryParameters = {
    'access_key': '9297371cdeee64cfa05ec2c5b34bb6a4',
    'from': from,
    'to': to,
    'amount': amount,
  };

  try {
    http.Response response = await http.get(
      Uri.parse('$convertURL$path').replace(
        queryParameters: queryParameters,
      ),
    );
    if (response.statusCode == 200) {
      ResponseModel res = ResponseModel.fromJson(json.decode(response.body));
      return res.result.toStringAsFixed(4);
    } else {
      debugPrint("${response.statusCode} ${response.body}");
      return "${response.statusCode} ${response.body}";
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return "error occurred";
}
