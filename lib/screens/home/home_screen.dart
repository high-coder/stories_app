import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stories_app/consts%20/data.dart';
import 'package:stories_app/provider/current_state.dart';
import 'package:stories_app/screens/story/story_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentState instance = Provider.of<CurrentState>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
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
              SafeArea(
                child: SingleChildScrollView(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    children: [
                      Container(
                        width: double.infinity,
                      ),
                      ...List.generate(
                          stories.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  instance.story = stories[index];
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const StoryPage(),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        stories[index].imgLocation,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      left: 20,
                                      child: Text(
                                        stories[index].title,
                                        style: GoogleFonts.openSans(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Positioned(
                                      top: 30,
                                      left: 20,
                                      child: SizedBox(
                                        width: size.width - 40,
                                        child: Text(
                                          stories[index].oneLiner,
                                          style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              // fontWeight: FontWeight.w200,
                                              fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
