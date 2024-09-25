class HistoryCurrencyModel {
  Map<String, double> historyCurrency;

  // Factory constructor to create a model from JSON
  factory HistoryCurrencyModel.fromJson(Map<String, dynamic> jsonResponse) {
    // Creating a simple map with the date and exchange rate only
    Map<String, double> dateRateMap = {};

    // Populate the map with date and its corresponding rate
    jsonResponse.forEach((date, rateMap) {
      // Ensure rateMap is a Map before trying to access its first value
      if (rateMap is Map) {
        // Get the first value from rateMap
        double exchangeRate = rateMap.values.first;
        // Add date and exchange rate to the new map
        dateRateMap[date] = exchangeRate;
      }
    });

// Return the extracted map
    return HistoryCurrencyModel(historyCurrency: dateRateMap);
  }

  // Constructor to initialize the model
  HistoryCurrencyModel({required this.historyCurrency});
}
