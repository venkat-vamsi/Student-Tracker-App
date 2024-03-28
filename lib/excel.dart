import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class excel extends StatelessWidget {
  const excel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 76, 31),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        /*actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ],*/
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: GestureDetector(
          onTap: () {},
          child: Text('Student-Entry'),
        ),
        /*titleTextStyle: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),*/

        //backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: WebView(
        initialUrl: 'https://1drv.ms/x/s!AlaEOBTau5lcgwP15G0hQqTBERLs?e=v6pDQO',
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          // You can use the webViewController to interact with the WebView
        },
        onPageStarted: (String url) {
          // Handle page loading started
        },
        onPageFinished: (String url) {
          // Handle page loading finished
        },
        onWebResourceError: (WebResourceError error) {
          // Handle web resource errors
          print("Web resource error: $error");
        },
      ),
    );
  }
}
