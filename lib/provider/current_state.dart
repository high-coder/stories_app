import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../consts /data.dart';
import '../models/stories_model.dart';

class CurrentState extends ChangeNotifier {
  updateAllColor() async {
    await Future.forEach(stories, (element) async {
      element.palette = await updatePaletteGenerator(element.imgLocation);
    });
  }

  late StoriesModel story;
  Future<List<PaletteColor>> updatePaletteGenerator(String asset) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(asset),
    );

    return paletteGenerator.paletteColors;
  }
}
