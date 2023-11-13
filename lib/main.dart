import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stories_app/provider/audio_provider.dart';
import 'package:stories_app/provider/current_state.dart';

import 'screens/hero/hero.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CurrentState(),
        ),
        ChangeNotifierProvider(
          create: (context) => AudioProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HeroScreen(),
      ),
    );
  }
}
