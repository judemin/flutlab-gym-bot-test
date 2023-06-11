import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:core';

class LocalStorageAPI {
  String _NAToken = "N/A";

  Future setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? _NAToken;
    return token;
  }

  Future expireToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', _NAToken);
  }
}
