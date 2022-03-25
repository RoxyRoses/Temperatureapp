import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:temperatureapp/model/forecast_model.dart';

class ForecastRepository {
  Future<ForecastsModel> fetchForecast(ForecastsModel model) async {
    try {
      final response = await http.get(
        Uri.parse('https://goweather.herokuapp.com/weather/' + model.name),
      );
      await Future.delayed(const Duration(seconds: 2));
      model = ForecastsModel.fromJson(jsonDecode(response.body));
      return model;
    } on Exception catch (_) {
      throw Exception('Failed to load forecast');
    }
  }
}
