class Liquid {
  double value;
  String unit;

  Liquid(this.value, this.unit);

  double convertTo(String targetUnit) {
    if (unit == 'ml' && targetUnit == 'l') {
      return value / 1000; // Convert milliliters to liters
    } else if (unit == 'l' && targetUnit == 'ml') {
      return value * 1000; // Convert liters to milliliters
    } else {
      throw Exception('Unsupported conversion: $unit to $targetUnit');
    }
  }
}