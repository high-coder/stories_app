import 'package:palette_generator/palette_generator.dart';

class StoriesModel {
  String title;
  String imgLocation;
  List<PaletteColor>? palette;
  double? progress;
  String content;
  String oneLiner;
  StoriesModel({
    required this.title,
    required this.imgLocation,
    this.palette,
    this.progress,
    required this.content,
    required this.oneLiner,
  });
}
