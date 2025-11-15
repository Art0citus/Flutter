import 'package:flutter/material.dart';
import 'package:todo_list/utils/dialog_box.dart';
import 'package:todo_list/utils/todo_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _controller = TextEditingController();
  
  List TodoList = [
    ["TODO", false],
    ["TODO", false],
    ["TODO", false],
    ["TODO", false],
    ["TODO", false],
  ];
    

    void checkBoxChanged(bool? value, int index){
      setState(() {
        TodoList[index][1] = !TodoList[index][1];
      }
      );
    }

    void onChanged(bool? value){
      setState(() {
        
      });
    }

    void saveNewTask(){
      setState(() {
        TodoList.add([_controller.text, false]);
        _controller.clear();
        Navigator.of(context).pop();
      });
    }

    void createNewTask(){
      showDialog(context: context, builder: (context){
        return DialogBox(
          controller: _controller, 
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      });
  }
  
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 162, 251),
      appBar: AppBar(
        title: Text("To Do"),
        backgroundColor: Colors.deepPurple,
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask, child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: TodoList.length,
        itemBuilder: (context, index){
          return TodoItem(
            isChecked: TodoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            todoText: TodoList[index][0]);
        }
        )
      );
  }
}