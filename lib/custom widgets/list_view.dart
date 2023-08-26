import 'package:flutter/material.dart';

class ListViews extends StatefulWidget {
  const ListViews({Key? key}) : super(key: key);

  @override
  State<ListViews> createState() => _ListViewsState();
}

class _ListViewsState extends State<ListViews> {
  TextEditingController todo_List = TextEditingController();
  List<bool> isLineThroughList = [];
  List<bool> isCheckedList = [];
  List<String> todoItem = [];

  @override
  void initState() {
    super.initState();
    // Initialize the lists with default values.
    isLineThroughList = [];
    isCheckedList = [];
  }

  // Toggle the line-through text for a specific item.
  void toggleLineThrough(int index) {
    setState(() {
      isLineThroughList[index] = !isLineThroughList[index];
    });
  }

  // Toggle the checkbox for a specific item.
  void toggleCheckbox(int index) {
    setState(() {
      isCheckedList[index] = !isCheckedList[index];
    });
  }

  // Add a new task to the list.
  void addTask(String task) {
    setState(() {
      todoItem.add(task);
      isLineThroughList.add(false); // Initialize new task as not crossed out.
      isCheckedList.add(false); // Initialize new task as unchecked.
    });
  }

  // Delete a task from the list.
  void deleteTask(int index) {
    setState(() {
      todoItem.removeAt(index);
      isLineThroughList.removeAt(index);
      isCheckedList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          margin: EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            itemCount: todoItem.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  toggleLineThrough(index);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                tileColor: Colors.white,
                leading: IconButton(
                  icon: Icon(
                    isCheckedList[index]
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                  ),
                  color: Color.fromARGB(255, 50, 26, 205),
                  onPressed: () {
                    toggleCheckbox(index);
                  },
                ),
                title: Text(
                  todoItem[index],
                  style: TextStyle(
                    color: Color(0xFF3a3a3a),
                    decoration: isLineThroughList[index]
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: Container(
                  height: 35,
                  width: 35,
                  margin: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 190, 44, 33),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.white,
                    iconSize: 18,
                    onPressed: () {
                      deleteTask(index);
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        addTask(value);
                        todo_List.clear();
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Add a new ToDo item",
                      border: InputBorder.none,
                    ),
                    controller: todo_List,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                    if (todo_List.text.isNotEmpty) {
                      addTask(todo_List.text);
                      todo_List.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 50, 26, 205),
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
