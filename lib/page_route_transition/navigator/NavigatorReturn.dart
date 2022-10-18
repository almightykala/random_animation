import 'package:flutter/material.dart';

class NavigatorReturn extends StatelessWidget {
  final String title;

  const NavigatorReturn({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "Page route transition ended\n",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: "to see the effect again...\n\n",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.black),
                  ),
                ]
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Text(
                "Back",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
