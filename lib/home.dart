import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foil/foil.dart';
import 'package:niemanswebsite/introduction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.microtask(() {
        SystemChrome.setApplicationSwitcherDescription(
            ApplicationSwitcherDescription(
          label: 'Pluto - Private Underground Events in Asheville, NC',
          primaryColor: Colors.black.value,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.01),
      child: SizedBox(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 1000) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.024),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      50, 0, 0, 0), // Set the background color to black
                  borderRadius: BorderRadius.circular(
                      8.0), // Set the border radius for rounded corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Roll(
                      crinkle: Crinkle.vivacious,
                      child: Foil(
                        gradient: Foils.linearRainbow.copyWith(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: List.from(Foils.linearRainbow.colors)),
                        opacity: 0.6,
                        scalar: Scalar.identity,
                        speed: const Duration(milliseconds: 100000),
                        duration: const Duration(milliseconds: 100000),
                        child: const Text(
                          "Nieman",
                          textScaleFactor: 4.5,
                          style: TextStyle(
                            fontFamily: 'FjallaOne',
                            // letterSpacing: 10.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.07),
                      child: const Introduction(
                          word:
                              'Senior Software Engineer & Architect | XR & Multiverse Specialist | Cross-Platform Development Leader',
                          textScaleFactor: 1.5),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.024),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      50, 0, 0, 0), // Set the background color to black
                  borderRadius: BorderRadius.circular(
                      8.0), // Set the border radius for rounded corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.032),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Roll(
                            crinkle: Crinkle.twinkling,
                            child: Foil(
                              gradient: Foils.linearRainbow.copyWith(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors:
                                      List.from(Foils.linearRainbow.colors)),
                              opacity: 0.6,
                              scalar: Scalar.identity,
                              speed: const Duration(seconds: 100),
                              duration: const Duration(seconds: 100),
                              child: const Text(
                                "Nieman",
                                textScaleFactor: 4.5,
                                style: TextStyle(
                                  fontFamily: 'FjallaOne',
                                  // letterSpacing: 10.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Introduction(
                              word:
                                  'Senior Software Engineer & Architect | XR & Multiverse Specialist | Cross-Platform Development Leader',
                              textScaleFactor: 1.5),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
