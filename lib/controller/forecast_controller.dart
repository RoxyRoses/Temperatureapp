import 'package:flutter/cupertino.dart';
import 'package:temperatureapp/model/forcast_repository.dart';
import 'package:temperatureapp/model/forecast_model.dart';

class ForecastController {
  ForecastsModel forecast = ForecastsModel();

  final ForecastRepository repository;
  ForecastController(this.repository);

  final formKey = GlobalKey<FormState>();

  set forecastName(String value) {
    forecast.name = value;
  }
}
