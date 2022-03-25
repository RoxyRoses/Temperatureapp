import 'package:flutter/cupertino.dart';
import 'package:temperatureapp/model/forecast_repository.dart';
import 'package:temperatureapp/model/forecast_model.dart';

class ForecastController {
  ForecastsModel forecast = ForecastsModel();

  final ForecastRepository repository;
  ForecastController(this.repository);

  final formKey = GlobalKey<FormState>();

  forecastName(String value) => forecast.name = value;

  void searchForecast() {
    if (formKey.currentState!.validate()) {
      ForecastRepository().fetchForecast(forecast);
    }
  }
}
