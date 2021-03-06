import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibez/screens/new_chat_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<int> _items = [1, 3, 6, 8, 9];
  int counter = 0;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    animationController.dispose();

    super.dispose();
  }

  @override
  void initState() {
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

    super.initState();
  }

  Widget _chatItems(BuildContext context, int index, animation) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int item = _items[index];
    TextStyle textStyle = Theme.of(context).textTheme.headline4;

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(animation),

      child: SizedBox(
        height: (0.16 * screenHeight),
        child: Card(
          elevation: 0.0,
          color: Colors.white70,
          child: Center(
            child: Text('Item $item', style: textStyle),
          ),
        ),
      ),
    );
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
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeTransition(
                      opacity: animationController.drive(CurveTween(curve: Curves.easeOut)),
                      child: Text(
                        'Chats',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: (0.09 * screenWidth),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: (0.03 * screenHeight)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                  ),
                  child: AnimatedList(
                    key: listKey,
                    initialItemCount: _items.length,
                    itemBuilder: (context, index, animation) {
                      return _chatItems(context, index, animation);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: OpenContainer(
          closedBuilder: (_, openContainer) {
            return FloatingActionButton(
              child: Icon(
                Icons.message,
              ),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: openContainer,
            );
          },
          openBuilder: (_, closeContainer) {
            return NewChatScreen();
          },
        ),
      ),
    );
  }
}

