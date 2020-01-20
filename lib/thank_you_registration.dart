import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Registration extends StatefulWidget {
  //画面遷移パラメタ受け取り
  String _name = '';
//  Registration(String name) {
//    this._name = name;
//  }
  Registration() {}

  @override
  State<StatefulWidget> createState() {
    return MyTextFormViewState(this._name);
  }
}

class Grade {
  final String name;
  const Grade(this.name);
}

class MyTextFormViewState extends State<Registration> {
  List<Grade> grades = const [
    Grade('樋浦 一郎'),
    Grade('樋浦 二郎'),
    Grade('樋浦 三郎'),
    Grade('樋浦 四郎'),
    Grade('樋浦 五郎'),
    Grade('樋浦 六郎')
  ];

  List<String> _selected = [];

  bool _sort = true;

  var _labelText = (DateFormat('yyyy/MM/dd')).format(DateTime.now());
  var _checkBox2 = false;
  List<bool> inputs = new List<bool>();

  //画面遷移パラメタ受け取り
  String _name = '';
  MyTextFormViewState(String name) {
    this._name = name;
  }
  void initState() {
    // TODO: implement initState
    setState(() {
      for (int i = 0; i < 3; i++) {
        inputs.add(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> columnWidget = [
      Expanded(
        child: _scrollableTextField(),
      )
    ];

    return Scaffold(
//      appBar: AppBar(
//        title: Text('内容設定'),
//      ),
      body: Container(
        child: Column(
          children: columnWidget,
        ),
      ),
    );
  }

  Widget _scrollableTextField() {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2999),
        locale: Localizations.localeOf(context),
      );
      if (selected != null) {
        setState(() {
          _labelText = (DateFormat('yyyy/MM/dd')).format(selected);
        });
      }
    }

    // ListViewにいれてあげることで、テキストフォームの高さが広がるに応じてスクロールできる

    Map ssss = ModalRoute.of(context).settings.arguments;

    return ListView(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
          child: Text('FROM：' + ssss['name'] + ssss['bbb'] + ssss['bbb']),
        ),
//        Container(
//          margin: const EdgeInsets.all(10.0),
//          child: TextFormField(
//            decoration:
//                InputDecoration(border: InputBorder.none), //テキストフォーム下の下線
//            initialValue: _name,
//            keyboardType: TextInputType.multiline,
//            maxLines: null,
//            textAlign: TextAlign.left,
//            readOnly: true,
//          ),
//        ),
        Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
          child: Text('日付'),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Center(
            child: Row(
              children: <Widget>[
                Text(_labelText),
                IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () => _selectDate(context),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
          child: Text('イベント'),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.pink[100],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: TextField(
            decoration:
                InputDecoration(border: InputBorder.none), //テキストフォーム下の下線
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
          child: Text('コンテンツ'),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.pink[100],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: TextField(
            decoration:
                InputDecoration(border: InputBorder.none), //テキストフォーム下の下線
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textAlign: TextAlign.left,
          ),
        ),
//        Container(
//          child: StreamBuilder<QuerySnapshot>(
//              stream: Firestore.instance.collection('user').snapshots(),
//              builder: (BuildContext context,
//                  AsyncSnapshot<QuerySnapshot> snapshot) {
//                if (!snapshot.hasData) return const Text('Loading...');
//                return ListView.builder(
//                  itemCount: snapshot.data.documents.length,
//                  itemBuilder: (context, int index) {
//                    return Padding(
//                        child: Text(
//                      snapshot.data.documents[index]['name'],
//                    ));
//                  },
//                );
//              }
////          child: ListView.builder(
////            itemCount: inputs.length,
////            itemBuilder: (BuildContext context, int index) {
////              return new CheckboxListTile(
////                  value: inputs[index],
////                  title: new Text('item ${index}'),
////                  controlAffinity: ListTileControlAffinity.leading,
////                  onChanged:(bool val){ItemChange(val, index);}
////              );
////            },
////          ),
//              ),
//        ),
        DataTable(
          columns: [
            const DataColumn(
              label: Text('名前'),
            ),
          ],
          rows: [
            for (var grade in grades)
              DataRow(
                  selected: _selected.contains(grade.name),
                  onSelectChanged: (bool value) {
                    setState(() {
                      if (value) {
                        _selected.add(grade.name);
                      } else {
                        _selected.remove(grade.name);
                      }
                    });
                  },
                  cells: [
                    DataCell(
                      Text(grade.name),
                    ),
                  ]),
          ],
        ),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.android),
            title: Text(document['name']),
          ),
        ],
      ),
    );
  }

  void ItemChange(bool val, int index) {
    setState(() {
      inputs[index] = val;
    });
  }
}
