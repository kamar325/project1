import 'package:flutter/material.dart';
import 'DistanceDisplay.dart';
import 'LiquidDisplay.dart';
import 'MassDisplay.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // Adjust the horizontal padding as needed
            child: Text(
              'Which conversion do you want?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Customize text color
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // Adjust the horizontal padding as needed
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LiquidDisplay()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Button background color
                onPrimary: Colors.white, // Text color
                padding: EdgeInsets.all(20), // Padding inside the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Button border radius
                ),
              ),
              child: Text(
                'Liquid Conversion',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // Adjust the horizontal padding as needed
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MassDisplay()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Button background color
                onPrimary: Colors.white, // Text color
                padding: EdgeInsets.all(20), // Padding inside the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Button border radius
                ),
              ),
              child: Text(
                'Mass Conversion',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // Adjust the horizontal padding as needed
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DistanceDisplay()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Button background color
                onPrimary: Colors.white,
                padding: EdgeInsets.all(20), // Padding inside the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Button border radius
                ),
              ),
              child: Text(
                'Distance Conversion',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
