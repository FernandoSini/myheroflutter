import 'package:flutter/material.dart';

import 'dart:html' as html;

import 'package:fluttericon/font_awesome_icons.dart';

class FloatingBar extends StatefulWidget {
  const FloatingBar({Key? key}) : super(key: key);

  @override
  _FloatingBarState createState() => _FloatingBarState();
}

class _FloatingBarState extends State<FloatingBar> {
  bool hoverData = false;
  bool hoverData2 = false;
  bool hoverFacebook = false;
  bool hoverYt = false;
  bool hoverTwitch = false;
  List<bool> characterHover = [false,false,false,false,false];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onHover: (value) {
              setState(() {
                hoverData = value;
              });
            },
            onTap: () {
              html.window.open("https://www.instagram.com/podpahpodcast", "");
            },
            child: Container(
              margin: EdgeInsets.only(left: !hoverData ? 30 : 8, right: 1),
              height: 60,
              width: hoverData ? 80 : 60,
              child: Icon(
                FontAwesome.instagram,
                color: !hoverData ? Colors.white : Colors.pink[400],
                size: 25,
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                hoverData2 = value;
              });
            },
            onTap: () {
              html.window.open("https://www.twitter.com/podpahpodcast", "");
            },
            child: Container(
              margin:
              EdgeInsets.only(top: 2, left: !hoverData2 ? 30 : 8, right: 1),
              height: 60,
              width: hoverData2 ? 80 : 60,
              child: Icon(
                FontAwesome.twitter,
                color: !hoverData2 ? Colors.white : Colors.blue,
                size: 25,
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                hoverFacebook = value;
              });
            },
            onTap: () {
              html.window.open("https://www.facebook.com/oficialpodpah", "");
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: 2, left: !hoverFacebook ? 30 : 8, right: 1),
              height: 60,
              width: hoverFacebook ? 80 : 60,
              child: Icon(
                FontAwesome.facebook,
                color: !hoverFacebook ? Colors.white : Colors.blue[900],
                size: 25,
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                hoverYt = value;
              });
            },
            onTap: () {
              html.window.open("https://www.youtube.com/podpah", "");
            },
            child: Container(
              margin:
              EdgeInsets.only(top: 2, left: !hoverYt ? 30 : 8, right: 1),
              height: 60,
              width: hoverYt ? 80 : 60,
              child: Icon(
                FontAwesome.youtube_play,
                color: !hoverYt ? Colors.white : Colors.red,
                size: 25,
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                hoverTwitch = value;
              });
            },
            onTap: () {
              html.window.open("https://www.twitch.tv/podpah", "");
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: 2, left: !hoverTwitch ? 30 : 8, right: 1),
              height: 60,
              width: hoverTwitch ? 80 : 60,
              child: Icon(
                FontAwesome.twitch,
                color: !hoverTwitch ? Colors.white : Colors.purple,
                size: 25,
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
