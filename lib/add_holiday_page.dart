import 'package:flutter/material.dart';

class AddHolidayPage extends StatefulWidget {
  final Function(String, String) onAddHoliday;

  AddHolidayPage({required this.onAddHoliday});

  @override
  _AddHolidayPageState createState() => _AddHolidayPageState();
}

class _AddHolidayPageState extends State<AddHolidayPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  void _submitHoliday() {
    final name = _nameController.text;
    final imageUrl = _imageUrlController.text;

    if (name.isNotEmpty && imageUrl.isNotEmpty) {
      widget.onAddHoliday(name, imageUrl);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Holiday'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Holiday Name'),
              onSubmitted: (_) => _submitHoliday(),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
              onSubmitted: (_) => _submitHoliday(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitHoliday,
              child: Text('Add Holiday'),
            ),
          ],
        ),
      ),
    );
  }
}
