import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:temperatureapp/model/forecast_repository.dart';
import 'package:temperatureapp/model/forecast_model.dart';

import '../view/forecast_page.dart';

class ForecastController {
  ForecastsModel forecast = ForecastsModel();

  final ForecastRepository repository;
  ForecastController(this.repository);

  final formKey = GlobalKey<FormState>();

  forecastName(String value) => forecast.name = value;

  Future<void> searchForecast(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      forecast = await ForecastRepository().fetchForecast(forecast);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ForecastPage(forecast: forecast)));
    }
  }
}
