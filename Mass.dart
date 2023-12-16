class Mass {
  double value;
  String unit;

  Mass(this.value, this.unit);

  double convertTo(String targetUnit) {
    switch (unit) {
      case 'g':
        return _convertGrams(targetUnit);
      case 'kg':
        return _convertKilograms(targetUnit);
      case 'mg':
        return _convertMilligrams(targetUnit);
      case 'ton':
        return _convertTons(targetUnit);
      default:
        throw Exception('Unsupported unit: $unit');
    }
  }

  double _convertGrams(String targetUnit) {
    switch (targetUnit) {
      case 'kg':
        return value / 1000; // Convert grams to kilograms
      case 'mg':
        return value * 1000; // Convert grams to milligrams
      case 'ton':
        return value / 1e6; // Convert grams to tons
      default:
        throw Exception('Unsupported conversion from grams to $targetUnit');
    }
  }

  double _convertKilograms(String targetUnit) {
    switch (targetUnit) {
      case 'g':
        return value * 1000; // Convert kilograms to grams
      case 'mg':
        return value * 1e6; // Convert kilograms to milligrams
      case 'ton':
        return value / 1000; // Convert kilograms to tons
      default:
        throw Exception('Unsupported conversion from kilograms to $targetUnit');
    }
  }

  double _convertMilligrams(String targetUnit) {
    switch (targetUnit) {
      case 'g':
        return value / 1000; // Convert milligrams to grams
      case 'kg':
        return value / 1e6; // Convert milligrams to kilograms
      case 'ton':
        return value / 1e9; // Convert milligrams to tons
      default:
        throw Exception('Unsupported conversion from milligrams to $targetUnit');
    }
  }

  double _convertTons(String targetUnit) {
    switch (targetUnit) {
      case 'g':
        return value * 1e6; // Convert tons to grams
      case 'kg':
        return value * 1000; // Convert tons to kilograms
      case 'mg':
        return value * 1e9; // Convert tons to milligrams
      default:
        throw Exception('Unsupported conversion from tons to $targetUnit');
    }
  }
}