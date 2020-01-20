import 'package:flutter/material.dart';
import 'package:flutter_app/main4.dart';

import './main2.dart';
import './thank_you_registration.dart';

class MyHomePage3 extends StatefulWidget {
  //final String title;

  //MyHomePage3({Key key, this.title}) : super(key: key);
//  MyHomePage3() {}

  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyHomePage3> {
  var _city = 'カウントアップ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_city)),
      body: _buildBody(context),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('メニュー'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Image.asset('images/tobira.png'),
              title: Text('ログアウト'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).pushNamed("login");
              },
            ),
            ListTile(
              leading: Image.asset('images/cou.png'),
              title: Text('カウントアップ'),
              onTap: () {
                setState(() => _city = 'カウントアップ');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('images/en.png'),
              title: Text('詳細入力'),
              onTap: () {
                setState(() => _city = '詳細入力');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('images/risu.png'),
              title: Text('アニメーション'),
              onTap: () {
                setState(() => _city = 'アニメーション');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    print(_city);

    var aaa = _city;

    if (aaa == 'カウントアップ') {
      return MyHomePage('ww');
    } else if (aaa == '詳細入力') {
      return Registration();
    } else if (aaa == 'アニメーション') {
      return MyHomePage4();
    }
  }
//
//  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
//    return Column(children: [
//      Expanded(
//        child: ListView(
//          padding: const EdgeInsets.only(top: 10.0),
//          children:
//              snapshot.map((data) => _buildListItem(context, data)).toList(),
//        ),
//      ),
////      RaisedButton(
////        onPressed: () => Navigator.of(context).pushNamed("login"),
////        child: new Text('LOGOUT'),
////      )
//      //以下のコマンドでも遷移元に戻れる------------------------------
//      //RaisedButton(onPressed: () => Navigator.pop(context),)
//      //--------------------------------------------------------------
//    ]);
//  }
//
//  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//    final record = Record.fromSnapshot(data);
//
//    return Padding(
//      key: ValueKey(record.name),
//      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//      child: Container(
//        decoration: BoxDecoration(
//          border: Border.all(color: Colors.lightBlue),
//          borderRadius: BorderRadius.circular(5.0),
//        ),
//        child: ListTile(
//          title: Text(record.name),
//          trailing: Text(record.votes.toString()),
//          onTap: () => record.reference.updateData({'votes': record.votes + 1}),
//        ),
//      ),
//    );
//  }
}

//class Record {
//  final String name;
//  final int votes;
//  final DocumentReference reference;
//
//  Record.fromMap(Map<String, dynamic> map, {this.reference})
//      : assert(map['name'] != null),
//        assert(map['votes'] != null),
//        name = map['name'],
//        votes = map['votes'];
//
//  Record.fromSnapshot(DocumentSnapshot snapshot)
//      : this.fromMap(snapshot.data, reference: snapshot.reference);
//
//  @override
//  String toString() => "Record<$name:$votes>";
//}
