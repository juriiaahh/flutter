import 'package:flutter/material.dart';
import 'package:tugas_akhir_flutter/add_holiday_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> holidays = [];

  void addHoliday(String name, String imageUrl) {
    setState(() {
      holidays.add({'name': name, 'image': imageUrl});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Holiday List'),
      ),
      body: holidays.isEmpty
          ? Center(child: Text('No holidays added yet!'))
          : ListView.builder(
              itemCount: holidays.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.network(
                        holidays[index]['image']!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          holidays[index]['name']!,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddHolidayPage(onAddHoliday: addHoliday),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
