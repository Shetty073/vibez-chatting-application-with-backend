import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:vibez/constants.dart';
import 'package:http/http.dart' as http;

class Auth {
  String signUpEndPoint = REG_URL;
  String signInEndPoint = LOGIN_URL;

  Future signUp({@required Map<String, String> data}) async {
    // Map<String, String> headers = {"Content-type": "application/json"};
    var response;
    try {
      response = await http.post(
          signUpEndPoint,
          body: {
            'name': data['name'],
            'email': data['email'],
            'password': data['password']
          }
      );
    } on SocketException catch(_) {
      return {
        // Internet is off
        'userId': null,
        'message': 'Internet connection not available. Please check your connection and retry.'
      };
    }


    if(response.statusCode == 200) {
      // request was successful
      final Map responseBody = json.decode(response.body);
      if(responseBody['success']) {
        Map responseData = {
          'userId': responseBody['userId'],
          'authToken': response.headers['authorization']
        };

        return responseData;
      } else {
        return {
          'userId': null,
          'message': responseBody['message']
        };
      }
    } else {
      // request failed
      return {
        'userId': null,
        'message': 'Server error! Please try again later'
      };
    }

  }

  Future signIn({@required Map<String, String> data}) async {
    // Map<String, String> headers = {"Content-type": "application/json"};
    var response;
    try {
      response = await http.post(
          signInEndPoint,
          body: {
            'email': data['email'],
            'password': data['password']
          }
      );
    } on SocketException catch(_) {
      // Internet is off
      return {
        'userId': null,
        'message': 'Internet connection not available. Please check your connection and retry.'
      };
    }


    if(response.statusCode == 200) {
      // request was successful
      final Map responseBody = json.decode(response.body);
      if(responseBody['success']) {
        Map responseData = {
          'userId': responseBody['userId'],
          'authToken': response.headers['authorization']
        };

        return responseData;
      } else {
        return {
          'userId': null,
          'message': responseBody['message']
        };
      }
    } else {
      // request failed
      return {
        'userId': null,
        'message': 'Server error! Please try again later'
      };
    }
  }
}
