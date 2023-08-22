import 'package:flutter/material.dart';
import 'package:todo_app/custom%20widgets/list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEFF5),
      appBar: AppBar(
        backgroundColor: Color(0xffEEEFF5),
        leading: const Icon(
          Icons.menu,
          color: Color(0xFF3a3a3a),
          size: 30,
        ),
        elevation: 0,
        actions: const [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.yellow,
              backgroundImage: NetworkImage(
                  "https://pps.whatsapp.net/v/t61.24694-24/340601717_617569403273567_543769420099955658_n.jpg?ccb=11-4&oh=01_AdRrMzbp3AqdqUOGxxUTVBlaTzUtzb3HiQdZzsCxkzYA4g&oe=64F0E509&_nc_cat=109"),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF3a3a3a),
                      size: 20,
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      minWidth: 25,
                    ),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    margin: EdgeInsets.only(top: 40, bottom: 20),
                    child: const Text(
                      "All ToDos",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                ListViews(),
                ListViews(),
                ListViews(),
                ListViews(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
