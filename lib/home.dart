import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foil/foil.dart';
import 'package:niemanswebsite/avita.dart';
import 'package:niemanswebsite/contact_me.dart';
import 'package:niemanswebsite/installer.dart';
import 'package:niemanswebsite/introduction.dart';
import 'package:niemanswebsite/multiverse.dart';
import 'package:niemanswebsite/resumedownload.dart';
import 'package:niemanswebsite/teams.dart';

import 'about.dart';
import 'gd_project.dart';
import 'mentor.dart';

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
          label: "Nieman's Website",
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
                child: Padding(
                  padding: EdgeInsets.all(height * 0.04),
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
                          speed: const Duration(seconds: 200),
                          duration: const Duration(milliseconds: 100000),
                          child: const Text(
                            "Nieman's Website",
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
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(height * 0.01),
                        child: Center(child: ResumeDownloadButton()),
                      ),
                      About(fontSize: 15),
                      Padding(
                        padding: EdgeInsets.all(height * 0.04),
                        child: Center(
                          child: Text(
                            "Professional Showcase",
                            style: TextStyle(
                              fontSize:
                                  28.0, // Adjust as per your design requirement
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.onPrimary,
                              letterSpacing: 2.0,
                              fontFamily: 'SourceCodePro',
                              shadows: [
                                Shadow(
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(29, 165, 0, 143)
                                      .withOpacity(0.3),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GDProject(
                        fontSize: 15,
                        isMobile: true,
                      ),
                      Avita(
                        fontSize: 15,
                        isMobile: true,
                      ),
                      Multiverse(
                        fontSize: 15,
                        isMobile: true,
                      ),
                      Installer(fontSize: 15, isMobile: true),
                      Mentor(fontSize: 15, isMobile: true),
                      Teams(fontSize: 15, isMobile: true),
                      const ContactMe()
                    ],
                  ),
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(height * 0.07),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        50, 0, 0, 0), // Set the background color to black
                    borderRadius: BorderRadius.circular(
                        8.0), // Set the border radius for rounded corners
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.032),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(height * 0.04),
                          child: Roll(
                            crinkle: Crinkle.twinkling,
                            child: Foil(
                              gradient: Foils.linearRainbow.copyWith(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors:
                                      List.from(Foils.linearRainbow.colors)),
                              opacity: 0.6,
                              scalar: Scalar.identity,
                              speed: const Duration(seconds: 200),
                              duration: const Duration(seconds: 100),
                              child: const Text(
                                "Nieman's Website",
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
                        ),
                        const Introduction(
                            word:
                                'Senior Software Engineer & Architect | XR & Multiverse Specialist | Cross-Platform Development Leader',
                            textScaleFactor: 1.5),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(height * 0.01),
                          child: Center(child: ResumeDownloadButton()),
                        ),
                        About(fontSize: 15),
                        Padding(
                          padding: EdgeInsets.all(height * 0.04),
                          child: Center(
                            child: Text(
                              "Professional Showcase",
                              style: TextStyle(
                                fontSize:
                                    28.0, // Adjust as per your design requirement
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.onPrimary,
                                letterSpacing: 2.0,
                                fontFamily: 'SourceCodePro',
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(29, 165, 0, 143)
                                        .withOpacity(0.3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flex(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: GDProject(
                                fontSize: 15,
                                isMobile: false,
                              ),
                            ),
                            Expanded(
                                child: Avita(
                              fontSize: 15,
                              isMobile: false,
                            )),
                          ],
                        ),
                        Flex(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: Multiverse(
                                fontSize: 15,
                                isMobile: false,
                              ),
                            ),
                            Expanded(
                                child: Installer(
                              fontSize: 15,
                              isMobile: false,
                            )),
                          ],
                        ),
                        Flex(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: Mentor(
                                fontSize: 15,
                                isMobile: false,
                              ),
                            ),
                            Expanded(
                                child: Teams(
                              fontSize: 15,
                              isMobile: false,
                            )),
                          ],
                        ),
                        const ContactMe()
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
