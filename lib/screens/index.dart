import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music_classification/model/tone_model.dart';
import 'package:music_classification/provider/classification_provider.dart';
import 'package:music_classification/provider/control_tones_provider.dart';
import 'package:provider/provider.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F5F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 55, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tones',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.95,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        buildShowModalBottomSheet(context, index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/img.png'),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            tones[index].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: tones.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

buildShowModalBottomSheet(context, index) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => Container(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  tones[index].name,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.stop,
                        size: 40,
                      ),
                      onPressed: () async {
                        Provider.of<ControlTones>(context, listen: false)
                            .stopTone();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        size: 40,
                      ),
                      onPressed: () {
                        Provider.of<ControlTones>(context, listen: false)
                            .playTone(tones[index].path);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.pause,
                        size: 40,
                      ),
                      onPressed: () {
                        Provider.of<ControlTones>(context, listen: false)
                            .pauseTone();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlineButton(
                          onPressed: () async {
                            Provider.of<ClassificationData>(context,
                                    listen: false)
                                .addclassification(
                              tones[index].name,
                              'noise',
                            );
                            await Fluttertoast.showToast(
                                msg: 'Classified as Noise');
                            Navigator.pop(context);
                            Provider.of<ControlTones>(context, listen: false)
                            .stopTone();
                          },
                          borderSide:
                              BorderSide(color: Color(0xFFADADAD), width: 1.4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                            ),
                            child: Text(
                              'Noise',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () async {
                            Provider.of<ClassificationData>(context,
                                    listen: false)
                                .addclassification(
                              tones[index].name,
                              'music',
                            );
                            await Fluttertoast.showToast(
                                msg: 'Classified as Music');
                            Navigator.pop(context);
                            Provider.of<ControlTones>(context, listen: false)
                            .stopTone();
                          },
                          color: Color(0xffDEDEDE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                            ),
                            child: Text(
                              'Music',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
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
  );
}
