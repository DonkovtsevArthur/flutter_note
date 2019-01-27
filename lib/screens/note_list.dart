import 'package:flutter/material.dart';
import './note_detail.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: false, title: Text('Notes')),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'Add note',
          onPressed: () {
            print('terer');
            navigationToDetail(context, 'Add Note');
          },
        ),
        body: getNoteListView());
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Icon(Icons.keyboard_arrow_right)),
                title: Text('Dummy Title', style: titleStyle),
                subtitle: Text('Dummy Date'),
                trailing: Icon(Icons.delete, color: Colors.grey),
                onTap: () {
                  print('Delete');
                  navigationToDetail(context, 'Edit Note');
                }));
      },
    );
  }
}

void navigationToDetail(BuildContext context, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NoteDetail(title)),
  );
}
