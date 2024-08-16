import 'dart:convert';

import 'package:acote_task/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AcoteApiService {
  static final AcoteApiService _instance = AcoteApiService._();
  AcoteApiService._();

  factory AcoteApiService() {
    return _instance;
  }

  Future<List<T>> get<T>(
      String path, T Function(Map<String, dynamic>) fromJson) async {
    final url = Uri.parse('$baseUrl$path');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => fromJson(item)).toList();
      } else {
        throw Exception('Failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('$error');
      rethrow;
    }
  }
}
