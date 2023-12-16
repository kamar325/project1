import 'package:flutter/material.dart';
import 'Mass.dart';

class MassDisplay extends StatefulWidget {
  @override
  _MassDisplayState createState() => _MassDisplayState();
}

class _MassDisplayState extends State<MassDisplay> {
  TextEditingController _valueController = TextEditingController();
  String _fromUnit = 'g';
  String _toUnit = 'g';
  double _result = 0;

  @override
  void initState() {
    super.initState();
    _fromUnit = 'g'; // Set an initial value
    _toUnit = 'g'; // Set an initial value
  }

  void _convert() {
    double inputValue = double.tryParse(_valueController.text) ?? 0;
    Mass mass = Mass(inputValue, _fromUnit);
    _result = mass.convertTo(_toUnit);
    setState(() {
      _toUnit = _toUnit; // Update _toUnit inside setState
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mass Conversion'),
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
                  items: ['g', 'kg', 'mg', 'ton'].map<DropdownMenuItem<String>>((String value) {
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
                  items: ['g', 'kg', 'mg', 'ton'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 90), // Add padding here
              child: _result != null
                  ? Text(
                'Result: $_result ${_toUnit.toUpperCase()}',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                ),
              )
                  : Container(),
            ),
            Image.network('data:image/png;base64,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',height: 200,),
          ],
        ),
      ),
    );
  }
}
