import 'package:flutter/material.dart';

class Distance {
  double value;
  String unit;

  Distance(this.value, this.unit);

  double convertTo(String targetUnit) {
    switch (unit) {
      case 'm':
        return _convertMeters(targetUnit);
      case 'km':
        return _convertKilometers(targetUnit);
      case 'cm':
        return _convertCentimeters(targetUnit);
      case 'mile':
        return _convertMiles(targetUnit);
      default:
        throw Exception('Unsupported unit: $unit');
    }
  }

  double _convertMeters(String targetUnit) {
    switch (targetUnit) {
      case 'km':
        return value / 1000; // Convert meters to kilometers
      case 'cm':
        return value * 100; // Convert meters to centimeters
      case 'mile':
        return value / 1609.34; // Convert meters to miles
      default:
        throw Exception('Unsupported conversion from meters to $targetUnit');
    }
  }

  double _convertKilometers(String targetUnit) {
    switch (targetUnit) {
      case 'm':
        return value * 1000; // Convert kilometers to meters
      case 'cm':
        return value * 100000; // Convert kilometers to centimeters
      case 'mile':
        return value / 1.60934; // Convert kilometers to miles
      default:
        throw Exception('Unsupported conversion from kilometers to $targetUnit');
    }
  }

  double _convertCentimeters(String targetUnit) {
    switch (targetUnit) {
      case 'm':
        return value / 100; // Convert centimeters to meters
      case 'km':
        return value / 100000; // Convert centimeters to kilometers
      case 'mile':
        return value / 160934; // Convert centimeters to miles
      default:
        throw Exception('Unsupported conversion from centimeters to $targetUnit');
    }
  }

  double _convertMiles(String targetUnit) {
    switch (targetUnit) {
      case 'm':
        return value * 1609.34; // Convert miles to meters
      case 'km':
        return value * 1.60934; // Convert miles to kilometers
      case 'cm':
        return value * 160934; // Convert miles to centimeters
      default:
        throw Exception('Unsupported conversion from miles to $targetUnit');
    }
  }
}