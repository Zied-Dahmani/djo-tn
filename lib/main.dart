import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child:Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child:  AppBar(backgroundColor: const Color(0xff064282),)
          ),
          body:  WebView(
            initialUrl: "https://www.djo.tn/djo",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  initState()  {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.push(this.context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.all(20),
          child:Image.asset('assets/splash.png')
      ),
    );
  }
}


