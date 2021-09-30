import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  PictureRecorder pictureRecorder = PictureRecorder();
  Canvas canvas = Canvas(pictureRecorder);
  Paint p = Paint();
  p.strokeWidth = 30;
  p.color = Colors.blue;
  canvas.drawLine(Offset(100, 100), Offset(300, 300), p);
  Picture picture = pictureRecorder.endRecording();
  SceneBuilder sceneBuilder = SceneBuilder();
  sceneBuilder.pushOffset(100, 0);
  sceneBuilder.addPicture(Offset(10, 0), picture);
  sceneBuilder.pop();
  Scene scene = sceneBuilder.build();

  window.onDrawFrame = () {
    window.render(scene);
  };
  window.scheduleFrame();
}
