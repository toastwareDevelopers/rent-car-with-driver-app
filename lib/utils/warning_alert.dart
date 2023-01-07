import 'package:flutter/material.dart';

class WarningAlert{
  static Future<void> showWarningDialog(BuildContext context,String title,String warning,Function func) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(warning),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                func();
              },
            ),
          ],
        );
      },
    );
  }
}
