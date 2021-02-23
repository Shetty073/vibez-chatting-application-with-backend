import 'package:flutter/material.dart';

class DialogBoxes {
  static Future<void> infoBox(BuildContext context, String title, String content) async {
    double screenWidth = MediaQuery.of(context).size.width;
    String titleWithEmoji = title + ' 😢';
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleWithEmoji,
            style: TextStyle(
              fontSize: (0.08 * screenWidth),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  content,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
