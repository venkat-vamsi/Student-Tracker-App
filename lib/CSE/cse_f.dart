import 'package:attendance_app/Home/hod_homepage.dart';
import 'package:attendance_app/iot_2.dart';
import 'package:flutter/material.dart';

class cse_f extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RollNumberPage(),
    );
  }
}

class RollNumberPage extends StatefulWidget {
  @override
  _RollNumberPageState createState() => _RollNumberPageState();
}

class _RollNumberPageState extends State<RollNumberPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> rollNumbers = List.generate(65, (index) {
    int rollNumber = index + 1;
    String formattedRollNumber =
        rollNumber < 10 ? '0$rollNumber' : '$rollNumber';
    return '22241F05$formattedRollNumber';
  });

  List<String> filteredRollNumbers = [];

  @override
  void initState() {
    super.initState();
    filteredRollNumbers = List.from(rollNumbers);
  }

  void _onSearchButtonPressed() {
    String query = _searchController.text;
    setState(() {
      filteredRollNumbers = rollNumbers
          .where((roll) => roll.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => hod_homepage()),
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 159, 76, 31),
        title: Text('Roll Numbers'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Roll Number',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _onSearchButtonPressed,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRollNumbers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(filteredRollNumbers[index]),
                      onTap: () {
                        _onRollNumberTapped(filteredRollNumbers[index]);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onRollNumberTapped(String rollNumber) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => iot_2(),
      ),
    );
  }
}
