import 'package:flutter/cupertino.dart';
import 'package:vibez/models/services/auth.dart';
import 'secure_storage_helper.dart';

class AuthHelper {
  final auth = Auth();
  final secureStorageHelper = SecureStorageHelper();

  Future signUp({@required Map<String, String> data}) async {
    Map responseData = await auth.signUp(data: data);

    // store the userId and authToken in secure_storage
    if (responseData['userId'] != null) {
      await secureStorageHelper.writeVal(data: responseData);
    }

    return responseData;
  }


  Future signIn({@required Map<String, String> data}) async {
    Map responseData = await auth.signIn(data: data);

    // store the userId and authToken in secure_storage
    if (responseData['userId'] != null) {
      await secureStorageHelper.writeVal(data: responseData);
    }

    return responseData;
  }

}