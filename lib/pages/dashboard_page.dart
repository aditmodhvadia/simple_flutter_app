import 'package:flutter/material.dart';
import 'package:simple_flutter_app/custom_widgets/CustomAppBar.dart';

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dashboard',
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.grey,
      body: DashBoardBody(),
    );
  }
}

class DashBoardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}

//Cupertino styles page.... just for fun
/*CupertinoPageScaffold(
navigationBar: CupertinoNavigationBar(
backgroundColor: Colors.amber,
leading: Icon(CupertinoIcons.back,color: Colors.white,),
previousPageTitle: 'Login',
),
child: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Container(
height: 100,
width: 100,
color: Colors.red,
),
CupertinoButton(child: Text('Cupertino'), onPressed: () {})
],
),
))*/
