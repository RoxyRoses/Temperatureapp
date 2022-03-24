import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../view/firstpage.dart';

class ForecastRepository {
  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid city';
    } else {
      return null;
    }
  }

  Navigator? searchForecast(BuildContext context) {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FirstPage(),
        ),
      );
    } on Exception catch (_) {
      debugPrint('error');
    }
    throw errorTextConfiguration;
  }
}
