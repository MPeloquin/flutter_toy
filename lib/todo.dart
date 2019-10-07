import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({Key key, this.name}) : super(key: key);

  final String name;

  @override
  State<StatefulWidget> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool done = false;

  void _markItemDone() {
    setState(() {
      done = !done;
    });
  }

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: () {
        _markItemDone();
      },
      title: Text(widget.name, style: done ? TextStyle(color: Colors.red) : null),

    );
  }
}

class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<TodoItem> todoItems = List<TodoItem>();
  String todoItemName;

  void _addItem() {
    setState(() {
      if (todoItemName == "") return;

      todoItems.add(TodoItem(name: todoItemName));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app ${(new DateTime.now().millisecondsSinceEpoch)}"),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Container(
              width: 150,
              child: TextField(
                onChanged: (String value) {
                  todoItemName = value;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            Container(
              width: 150,
              child: ListView(
                children: todoItems.map((TodoItem item) {
                  return TodoItem(name: item.name);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItem();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
