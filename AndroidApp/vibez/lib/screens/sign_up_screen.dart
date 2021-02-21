import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
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
                      child: Column(
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
                                // TODO: Sign Up
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

