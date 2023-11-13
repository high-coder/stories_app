import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stories_app/screens/home/home_screen.dart';

import '../../provider/current_state.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentState instance = Provider.of<CurrentState>(context, listen: false);
    instance.updateAllColor();
    return Scaffold(
      body: SizedBox(
        // height: size.height,
        child: Stack(
          children: [
            Opacity(
              opacity: 1,
              child: Container(
                decoration: const BoxDecoration(
                  // gradient: RadialGradient(
                  //   center: Alignment(0.47, 0.49),
                  //   radius: 1.35,
                  //   colors: [Color(0xFF6AF2FC), Color(0x8C3A858A)],
                  // ),
                  // gradient: LinearGradient(
                  //   begin: Alignment(0.26, -0.97),
                  //   end: Alignment(-0.26, 0.97),
                  //   colors: [Color(0xFF4799B8), Color(0xFF1F2C48)],
                  // ),

                  gradient: LinearGradient(
                    begin: Alignment(0.01, -7.00),
                    end: Alignment(-0.01, 1),
                    colors: [Color(0xFF4799B3), Color(0xFF001117)],
                  ),
                ),
              ),
            ),

            // Opacity(
            //   opacity: 0.2,
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       gradient: RadialGradient(
            //         center: Alignment(0.47, 0.49),
            //         radius: 1.35,
            //         colors: [Color(0xFF6AF2FC), Color(0x8C3A858A)],
            //       ),
            //     ),
            //   ),
            // ),

            // Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.topRight,
            //       end: Alignment.bottomLeft,
            //       colors: [
            //         Colors.blue[800]!,
            //         Colors.blue[600]!,
            //         Colors.blue[400]!,
            //         Colors.purple[300]!,
            //         Colors.purple[500]!,
            //       ],
            //     ),
            //   ),
            //   // Rest of your widget tree
            // ),

            Opacity(
              opacity: 0.1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.indigo[900]!,
                      Colors.indigo[700]!,
                      Colors.indigo[500]!,
                      Colors.purple[300]!,
                    ],
                  ),
                ),
                // Rest of your widget tree
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0BC7F0).withOpacity(0.3),
                        blurRadius: 1000,
                        blurStyle: BlurStyle.normal,
                        offset: const Offset(10, 0.60),
                        spreadRadius: 10,
                      )
                    ],
                  ),
                  width: double.infinity,
                  height: 350,
                  child: Image.asset(
                    "assets/2.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Bedtime Stories",
                  style: GoogleFonts.amaticSc(
                    // color: Colors.deepPurple[100],
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    // color: const Color(0xffFFFDDD),
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
                // const SizedBox(
                //   height: 20,
                // ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Listen to magical and bedtime stories for your child based on some fictional characters",
                    style: GoogleFonts.openSans(
                      // color: Colors.purple[100]!.withOpacity(0.5),
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: const Duration(seconds: 1)),
                ),
                const Spacer(),
                Container(
                  child: CustomButton(
                    width: 150,
                    height: 50,
                    animate: true,
                    borderRadius: 20,

                    // backgroundColor: const Color(0xff369FD1),
                    // backgroundColor: Colors.purple[100],
                    // backgroundColor: Colors.white,
                    // backgroundColor: const Color(0xffFFC0CB),
                    backgroundColor: const Color(0xFF88D1CA),
                    shadowColor: const Color(0xffFFFDDD),
                    // shadowColor: Colors.red,
                    isThreeD: true,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: Text(
                      "Begin",
                      style: GoogleFonts.balooBhai2(
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          // color: Colors.deepPurple[400],
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ).animate().slide(
                    duration: const Duration(milliseconds: 1500),
                    begin: const Offset(0, -1),
                    curve: Curves.linear,
                    end: const Offset(0, 0)),
                const Spacer(),
                // const SizedBox(
                //   height: 40,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
