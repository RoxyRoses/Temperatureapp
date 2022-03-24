import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:temperatureapp/model/forcast_repository.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();
  final controllerCity = TextEditingController();

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
                key: _formKey,
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
                        validator: (value) =>
                            ForecastRepository().validateCity(value),
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
                                            const Color(0xff918AE2)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: const BorderSide(
                                                color: Color(0xff918AE2))))
                                    // foreground
                                    ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const FirstPage(),
                                      ),
                                    );
                                  }
                                },
                                child: const Text('Confirm'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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
