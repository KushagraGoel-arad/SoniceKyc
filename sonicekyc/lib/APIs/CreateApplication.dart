import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Map<String, dynamic> createRequestData({
  required String accountId,
  required String userId,
  required String userName,
  required String email,
  required String phone,
  required String applicationNo,
}) {
  return {
    'accountId': accountId,
    'userId': userId,
    'userName': userName,
    'email': email,
    'phone': phone,
    'applicationNo': applicationNo,
  };
}

Future<Map<String, Object>> makePostRequest() async {
  String getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }

  String requestTime = getCurrentDateTime();
  final url =
      'https://access.axiomprotect.com:6653/AxiomProtect/v1/WD/sonicKYC/CreateApplication?datetime=${requestTime}';

  // Replace with the appropriate data for your API request.
  final requestData = createRequestData(
    accountId: '2965842D-529F-41AA-AE21-4A1392BEA017',
    userId: 'kushagra@1234',
    userName: 'kushagra123',
    email:
        'kushagra.goel@gmail.com', // Using ?? to provide a default value if email is null.
    phone:
        '8851019233', // Using ?? to provide a default value if phone is null.
    applicationNo: '12345678',
    // Add the data needed for your API request here.
  );

  final headers = {
    'Content-Type': 'application/json',
    // Add any other headers required by your API here.
  };

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    final String jwtToken = responseBody['jwtToken'];
    final Map<String, dynamic> policyDetails = responseBody['policyDetails'];
    print('API Response: ${response.body}');
    return {
      'jwtToken': jwtToken,
      'policyDetails': policyDetails,
    };
  } else {
    print('Error: ${response.statusCode}');
    throw Exception('Failed to fetch policy details and token');
  }
}
