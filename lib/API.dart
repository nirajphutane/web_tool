/*This code is personal property of np_group.*/
/*Made by Niraj Phutane a developer*/
/*https://github.com/nirajphutane*/

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIs {

  static const String GetMethod = 'GET';
  static const String PostMethod = 'POST';

  String httpMethod, url, getRequestParams, postRequestParams;
  int defaultTimeout = 90, timeout;

  APIs({@required this.httpMethod, @required this.url, this.getRequestParams, this.postRequestParams, this.timeout});

  Future<String> fetchAPI() async {
    var _response;
    try{
      if(httpMethod == PostMethod){
        if(getRequestParams != null){
          url = url+'?'+getRequestParams;
        }
        _response = await http.post(
          Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Connection': 'Keep-Alive',
            'User-Agent': 'Pigeon'
          },
          body: postRequestParams,
        ).timeout(Duration(seconds: timeout == null || timeout < defaultTimeout? defaultTimeout: timeout));
      } else {
        if(getRequestParams != null){
          url = url+'?'+getRequestParams;
        }
        _response = await http.get(Uri.parse(url)).timeout(Duration(seconds: timeout == null || timeout < defaultTimeout? defaultTimeout: timeout));
      }
      return _response.body;
    } on HttpException catch (e) {
      throw 'HttpException: '+e.toString();
    } on SocketException catch(e) {
      throw 'SocketException: '+e.toString();
    } on TimeoutException catch (e) {
      throw 'TimeoutException: '+e.toString();
    } on FormatException catch (e) {
      throw 'Invalid Format: '+e.toString();
    } on Exception catch (e) {
      throw 'Exception: '+e.toString();
    }
  }
}