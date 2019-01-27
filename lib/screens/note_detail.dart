import 'package:flutter/material.dart';
import './note_list.dart';

class NoteDetail extends StatefulWidget {
  String appBarTitle;
  NoteDetail(this.appBarTitle);
  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['Hight', 'Low'];

  String _selectValue;
  String appBarTitle;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.appBarTitle);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return WillPopScope(
        onWillPop: () {
          navigationBack();
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(this.appBarTitle),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  navigationBack();
                }),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
            child: ListView(children: <Widget>[
              // first element
              getListTile(textStyle),
              // Secont element
              getTitleInput(textStyle),
              // Third element
              getDecriptionInput(textStyle),

              // Fourth element
              getSelect(),
            ]),
          ),
        ));
  }

  void navigationBack() {
    Navigator.pop(context);
  }

  Widget getListTile(textStyle) {
    return ListTile(
      title: DropdownButton<String>(
        items: _priorities.map((String dropDownStringItem) {
          return DropdownMenuItem<String>(
              value: dropDownStringItem, child: Text(dropDownStringItem));
        }).toList(),
        style: textStyle,
        value: _selectValue,
        onChanged: (valueSelectByUser) {
          setState(() {
            _selectValue = valueSelectByUser;
          });
        },
      ),
    );
  }

  Widget getTitleInput(textStyle) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
        child: TextField(
          controller: titleController,
          style: textStyle,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            print('text');
          },
          decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: textStyle,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          // validator: (String value) {
          //   if (value.isEmpty) {
          //     return 'Please, write text';
          //   }
          // },
        ));
  }

  Widget getDecriptionInput(textStyle) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
        child: TextField(
          controller: descriptionController,
          style: textStyle,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            print('texestpdft');
          },
          decoration: InputDecoration(
              labelText: 'Description',
              labelStyle: textStyle,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          // validator: (String value) {
          //   if (value.isEmpty) {
          //     return 'Please, write text';
          //   }
          // },
        ));
  }

  Widget getSelect() => Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryColorLight,
              child: Text(
                'Save',
                textScaleFactor: 1.5,
              ),
              onPressed: () {
                setState(() {
                  print('save');
                });
              },
            )),
            Container(
              width: 5.0,
            ),
            Expanded(
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).primaryColorLight,
                child: Text(
                  'Reset',
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  setState(() {
                    print('reset');
                  });
                },
              ),
            ),
          ],
        ),
      );
}
