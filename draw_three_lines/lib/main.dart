import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  PictureRecorder pictureRecorder = PictureRecorder();
  Canvas canvas = Canvas(pictureRecorder);
  Paint p = Paint();
  p.strokeWidth = 20;
  p.color = Colors.cyan;
  canvas.drawLine(Offset(10, 10), Offset(300, 300), p);
  canvas.drawLine(Offset(300, 10), Offset(10, 300), p);
  Picture picCross = pictureRecorder.endRecording();

  window.onDrawFrame = () {
    int i = DateTime.now().millisecond;
    PictureRecorder pictureRecorder = PictureRecorder();
    Canvas canvas = Canvas(pictureRecorder);
    canvas.drawLine(Offset(i * 0.2, 275), Offset(540 - i * 0.2, 275), p);
    Picture picLine = pictureRecorder.endRecording();
    SceneBuilder sceneBuilder = SceneBuilder();
    sceneBuilder.pushOffset(0, 0);
    sceneBuilder.pushOpacity(128);
    sceneBuilder.addPicture(Offset(0, 0), picCross);
    //sceneBuilder.pop();
    sceneBuilder.pushOffset(0, 0.5 * (i - 500));
    sceneBuilder.addPicture(Offset(0, 0), picLine);
    //sceneBuilder.pop();
    //sceneBuilder.pop();
    Scene scene = sceneBuilder.build();
    window.render(scene);
    scene.dispose();
    window.scheduleFrame();
  };
  window.scheduleFrame();
}
