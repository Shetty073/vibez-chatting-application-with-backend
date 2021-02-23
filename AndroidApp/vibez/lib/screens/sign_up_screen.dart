import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vibez/models/helper/auth_helper.dart';
import 'package:vibez/widgets/dialog_boxes.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  TextEditingController _nameController, _emailController, _passwordController;
  AuthHelper _authHelper;
  bool _isLoading;

  @override
  void initState() {
    super.initState();

    _isLoading = false;

    // Fade animations
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Curves.fastOutSlowIn
      ),
    );
    animationController.forward();

    // initialize AuthHelper
    _authHelper = AuthHelper();

    // initialize TextEditingControllers
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  // function for handling signup btn click
  void handleSignUp() async {
    // show loading icon
    setState(() {
      _isLoading = true;
    });

    Map<String, String> data = {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    // perform signUp()
    _authHelper.signUp(data: data).then((value) {
      if(value['userId'] != null) {
        // Go to home
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      } else {
        // stop loading indicator
        setState(() {
          _isLoading = false;

          // display error message
          DialogBoxes.infoBox(context, 'Error', value['message']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: (0.1 * screenHeight),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeTransition(
                      opacity: animationController.drive(CurveTween(curve: Curves.easeOut)),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: (0.11 * screenWidth),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (0.01 * screenHeight),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: (0.01 * screenWidth)),
                      child: FadeTransition(
                        opacity: animationController.drive(CurveTween(curve: Curves.easeOut)),
                        child: Text(
                          'Hi, there.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: (0.04 * screenWidth),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0), topRight: Radius.circular(60.0)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: _isLoading ? Container(
                        margin: EdgeInsets.only(top: (0.15 * screenHeight)),
                        child: Column(
                          children: [
                            Center(
                              child: SpinKitWave(
                                size: (0.06 * screenWidth),
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              'Sign up in progress. Please wait...',
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyText1.color,
                                fontWeight: FontWeight.w500,
                                fontSize: (0.04 * screenWidth),
                              ),
                            ),
                          ],
                        ),
                      )
                          :
                      Column(
                        children: [
                          SizedBox(
                            height: (0.03 * screenHeight),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10),
                                )]
                            ),
                            child: FadeTransition(
                              opacity: animationController.drive(CurveTween(curve: Curves.easeOut)),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey[200],
                                        ),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        hintText: 'Name',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey[200],
                                        ),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey[200],
                                        ),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: (0.04 * screenHeight),
                          ),
                          FadeTransition(
                            opacity: animationController.drive(CurveTween(curve: Curves.easeOut)),
                            child: GestureDetector(
                              child: Container(
                                height: 50.0,
                                margin: EdgeInsets.symmetric(horizontal: 50.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.orange[900],
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                handleSignUp();
                              },
                            ),
                          ),
                          SizedBox(
                            height: (0.04 * screenHeight),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: (0.02 * screenHeight),
                          ),
                          FadeTransition(
                            opacity: animationController.drive(CurveTween(curve: Curves.easeOut)),
                            child: GestureDetector(
                              child: Container(
                                height: 50.0,
                                margin: EdgeInsets.symmetric(horizontal: 50.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.grey[900],
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/sign_in');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

