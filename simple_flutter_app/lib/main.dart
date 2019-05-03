import 'package:flutter/material.dart';
import 'package:simple_flutter_app/routes/route_generator.dart';
import 'package:simple_flutter_app/custom_widgets/CustomAppBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteGenerator.SPLASH_ROUTE,
      onGenerateRoute: RouteGenerator.generateRoute,
//      home: SplashPage(title: 'Flutter Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Splash',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome',
              style: TextStyle(fontSize: 28),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteGenerator.LOGIN_ROUTE,
//                  arguments: 'testing',
                    ModalRoute.withName(RouteGenerator.SPLASH_ROUTE));
              },
              child: Text(
                'Go',
                style: TextStyle(fontSize: 21),
              ),
            )
          ],
        ),
      ),
    );
  }
}
