import 'package:flutter/material.dart';
import 'package:temperatureapp/model/forecast_model.dart';

class ForecastPage extends StatelessWidget {
  final ForecastsModel forecast;

  const ForecastPage({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(child: Text(forecast.description.toString())),
    );
  }
}
