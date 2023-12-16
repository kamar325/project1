import 'package:flutter/material.dart';
import 'Distance.dart';

class DistanceDisplay extends StatefulWidget {
  @override
  _DistanceDisplayState createState() => _DistanceDisplayState();
}

class _DistanceDisplayState extends State<DistanceDisplay> {
  TextEditingController _valueController = TextEditingController();
  String _fromUnit = 'm';
  String _toUnit = 'm';
  double _result = 0;

  @override
  void initState() {
    super.initState();
    _fromUnit = 'm'; // Set an initial value
    _toUnit = 'm'; // Set an initial value
  }

  void _convert() {
    double inputValue = double.tryParse(_valueController.text) ?? 0;
    Distance distance = Distance(inputValue, _fromUnit);
    _result = distance.convertTo(_toUnit);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distance Conversion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30,),
            TextField(
              controller: _valueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter value'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _fromUnit,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _fromUnit = newValue;
                        _convert(); // Call _convert when "from" unit changes
                      });
                    }
                  },
                  items: ['m', 'km', 'cm', 'mile'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: _toUnit,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _toUnit = newValue;
                        _convert(); // Call _convert when "to" unit changes
                      });
                    }
                  },
                  items: ['m', 'km', 'cm', 'mile'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            _result != null
                ? Padding(
              padding: const EdgeInsets.only(top: 20,left: 86), // Add padding here
              child: Text(
                'Result: $_result ${_toUnit.toUpperCase()}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
                : Container(),
            SizedBox(height: 20),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmiJJlA0n6pklADm_Js36B4DcFYU3BWzTz_Us2asjjywCMIJa5zVfWjHxLuBfcwaurG7w&usqp=CAU",
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
