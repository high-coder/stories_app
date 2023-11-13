import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stories_app/provider/audio_provider.dart';
import 'package:stories_app/provider/current_state.dart';
import 'package:stories_app/widgets/audio_player.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  void initState() {
    super.initState();

    AudioProvider ap = Provider.of<AudioProvider>(context, listen: false);
    ap.initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    CurrentState instance = Provider.of<CurrentState>(context, listen: false);
    AudioProvider ap = Provider.of<AudioProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        await ap.stop();
        return true;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 3,
              colors: List.generate(
                  instance.story.palette?.length ?? 0,
                  (index) =>
                      instance.story.palette?[index].color ?? Colors.white),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
                  onPressed: () {
                    ap.stop();
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                  ),
                  Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(instance.story.imgLocation),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    instance.story.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: instance.story.palette![4].bodyTextColor,
                    ),
                  ),
                  AudioPlayer(
                    bgColor: instance.story.palette?[0].color ?? Colors.black,
                  ),
                ],
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.15,
                minChildSize: 0.1,
                maxChildSize: 1.0,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: instance.story.palette?[0].color,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        Text(
                          "Story",
                          style: TextStyle(
                              color: instance.story.palette![2].bodyTextColor),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          instance.story.content,
                          style: TextStyle(
                              color: instance.story.palette![2].bodyTextColor),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
