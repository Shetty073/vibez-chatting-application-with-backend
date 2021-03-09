import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NewChatScreen extends StatefulWidget {
  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> with SingleTickerProviderStateMixin {
  TextEditingController _searchController;
  Animation animation;
  AnimationController animationController;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<int> _items = [12, 33, 26, 87, 93];
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

    // TextEditingController
    _searchController = TextEditingController();

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
        height: (0.14 * screenHeight),
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
                        'New Chat',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: (0.09 * screenWidth),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (0.02 * screenHeight),
                    ),
                    TextField(
                      controller: _searchController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
                        hintText: 'Search user@example.com',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            FocusManager.instance.primaryFocus.unfocus();
                            print('Search');
                            // _searchUser()
                          },
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus.unfocus();
                        print('Search Editing Complete');
                        // _searchUser()
                      },
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
      ),
    );
  }
}

