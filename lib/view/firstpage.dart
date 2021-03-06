import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:temperatureapp/controller/forecast_controller.dart';
import 'package:temperatureapp/model/forecast_model.dart';

import '../model/forecast_repository.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final controllerCity = TextEditingController();

  late ForecastController controller;

  @override
  void initState() {
    super.initState();
    controller = ForecastController(ForecastRepository());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: null,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/rain.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          // make sure we apply clip it properly
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 350 / size.height),
                        child: Text(
                          "City",
                          style: TextStyle(
                              fontSize: size.height * 35 / size.height,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 20 / size.width,
                          right: size.width * 20 / size.width),
                      child: TextFormField(
                        onChanged: (value) => controller.forecastName(value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a valid city';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'City',
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 23, 130, 231),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 23, 130, 231),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 25 / size.width,
                          right: size.width * 25 / size.width),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: size.height * 40 / size.height,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(255, 23, 130, 231),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 23, 130, 231),
                                      ),
                                    ),
                                  ),
                                  // foreground
                                ),
                                onPressed: () {
                                  controller.searchForecast();
                                },
                                child: const Text('Confirm'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
