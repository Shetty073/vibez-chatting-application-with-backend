import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vibez/models/helper/secure_storage_helper.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final secureStorageHelper = SecureStorageHelper();

  void getToken() async {
    String token = await secureStorageHelper.readVal(key: 'authToken');
    if(token == null) {
      // Navigator.pushReplacementNamed(context, '/sign_in');
      Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400],
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitWave(
              size: (0.05 * screenWidth),
              color: Colors.white,
            ),
            SizedBox(
              height: (0.01 * screenHeight),
            ),
            Text(
              'vibez chat',
              style: TextStyle(
                color: Colors.white,
                fontSize: (0.1 * screenWidth),
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

