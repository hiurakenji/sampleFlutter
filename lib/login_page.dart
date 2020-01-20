import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  String name = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ログイン画面test'),
        leading: Container(),
      ),
      body: ListView(children: <Widget>[
        Form(
          key: _formKey,
          child: Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  //Text('ユーザID'),
                  Image.asset('images/takefu.png'),
                  new TextFormField(
                    controller: textController1,
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                    decoration: const InputDecoration(
                      hintText: 'ユーザIDを入力してください。',
                      labelText: 'ユーザID',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '必須です。';
                      }
                      return null;
                    },
                  ),

                  //Text('パスワード'),
                  new TextFormField(
                    controller: textController2,
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                    //入力値をマスク
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'パスワードを入力してください。',
                      labelText: 'パスワード',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '必須です。';
                      }
                      return null;
                    },
                  ),

//                  RaisedButton(
//                    child: Text('LOGIN'),
//                    onPressed: () async {
//                      if (_formKey.currentState.validate()) {
////                        //ユーザIDまたはパスワードが未入力の場合エラー
////                        if (textController1.text == "" ||
////                            textController2.text == "") {
////                          //認証失敗 ダイアログを表示
////                          var result = await showDialog<int>(
////                            context: context,
////                            barrierDismissible: false,
////                            builder: (BuildContext context) {
////                              return AlertDialog(
////                                title: Text('必須エラー'),
////                                content: Text('ユーザID、パスワードを入力してください。'),
////                                actions: <Widget>[
////                                  RaisedButton(
////                                    child: Text('OK'),
////                                    onPressed: () =>
////                                        Navigator.of(context).pop(0),
////                                  ),
////                                ],
////                              );
////                            },
////                          );
////                          return;
////                        }
//
//                        //認証
//                        DocumentSnapshot docSnapshot = await Firestore.instance
//                            .collection('user')
//                            .document(textController1.text)
//                            .get();
//                        Map record = docSnapshot.data;
//                        if (record != null &&
//                            textController2.text == record['password']) {
//                          //認証成功
//                          name = record['name'];
//                          //.of(context).pushNamed("/registration:"+ name);
//                          Navigator.pushNamed(
//                            context,
//                            "/registration",
//                            arguments: <String, String>{
//                              'name': 'ww',
//                              'bbb': 'び',
//                            },
//                          );
////                          Navigator.push(
////                              context,
////                              new MaterialPageRoute<Null>(
////                                  settings: const RouteSettings(
////                                      name: "/registration"),
////                                  builder: (BuildContext context) =>
////                                      new Registration(name)));
//
//                          return;
//                        }
//                        print('userid: ' + textController1.text);
//                        print('password: ' + textController2.text);
//
//                        //認証失敗 ダイアログを表示
//                        var result = await showDialog<int>(
//                          context: context,
//                          barrierDismissible: false,
//                          builder: (BuildContext context) {
//                            return AlertDialog(
//                              title: Text('認証エラー'),
//                              content: Text('ユーザIDまたはパスワードが違います。'),
//                              actions: <Widget>[
//                                RaisedButton(
//                                  child: Text('OK'),
//                                  onPressed: () => Navigator.of(context).pop(0),
//                                ),
//                              ],
//                            );
//                          },
//                        );
//                      }
//                    },
//                  ),
                  RaisedButton(
                    child: Text('ログイン'),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        //認証
                        try {
                          DocumentSnapshot docSnapshot = await Firestore
                              .instance
                              .collection('user')
                              .document(textController1.text)
                              .get();

                          Map record = docSnapshot.data;
                          if (record != null &&
                              textController2.text == record['password']) {
                            //認証成功
                            name = record['name'];
                            //.of(context).pushNamed("/registration:"+ name);
                            Navigator.pushNamed(
                              context,
                              "/home3",
                              arguments: <String, String>{
                                'name': 'ww',
                                'bbb': 'び',
                              },
                            );

                            return;
                          }
                        } catch (e) {
                          print(e);
                        }
                        print('userid: ' + textController1.text);
                        print('password: ' + textController2.text);

                        //認証失敗 ダイアログを表示
                        var result = await showDialog<int>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('認証エラー'),
                              content: Text('ユーザIDまたはパスワードが違います。'),
                              actions: <Widget>[
                                RaisedButton(
                                  child: Text('OK'),
                                  onPressed: () => Navigator.of(context).pop(0),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
