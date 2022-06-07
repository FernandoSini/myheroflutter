import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:my_hero_academia/web/controller/hero_controller.dart';
import 'package:my_hero_academia/web/models/hero.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../providers/hero_provider.dart';

class WebCreateHeroScreen extends StatefulWidget {
  const WebCreateHeroScreen({Key? key}) : super(key: key);

  @override
  State<WebCreateHeroScreen> createState() => _WebCreateHeroScreenState();
}

class _WebCreateHeroScreenState extends State<WebCreateHeroScreen> {
  ControllerHero? heroController;

  TextEditingController trueNameController = TextEditingController(text: "");
  TextEditingController lastNameController = TextEditingController(text: "");
  TextEditingController heroNameController = TextEditingController(text: "");
  TextEditingController heroRankController = TextEditingController(text: "");
  TextEditingController heroAgeController = TextEditingController(text: "");
  HeroModel? hero;
  Uint8List? bytes;

  Map<String, dynamic>? fileToUpload;
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      //allowedExtensions: ["jpg", "jpeg", "png"],
      withData: true,
    );

    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;

      String fileName = result.files.first.name;
      setState(() {
        bytes = fileBytes;
        fileToUpload = {"bytes": bytes, "fileName": fileName};
      });
    }
  }

  Future<void> clearThumb() async {
    setState(() {
      bytes = null;
    });
  }

  @override
  void initState() {
    heroController = ControllerHero(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerHero = context.watch<HeroProvider>();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //  extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        leadingWidth: 300,
        leading: Material(
          type: MaterialType.transparency,
          elevation: 0,
          child: InkWell(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              QR.navigator.replaceAll("/");
            },
            child: Image.asset(
              "assets/logo/my_hero_academia_logo.png",
              isAntiAlias: true,
              height: 150,
              width: 150,
            ),
          ),
        ),
        actions: [
          Container(
              //color: Colors.green,
              ),
        ],
        centerTitle: true,
        title: Container(
          child: Stack(
            children: <Widget>[
              // Stroked text as border.
              Container(
                color: Colors.transparent,
                child: Text(
                  "Create Hero",
                  style: TextStyle(
                    wordSpacing: 5,
                    fontFamily: 'MyHeroFont',
                    fontSize: 50,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 5
                      ..color = Colors.black,
                  ),
                ),
              ),
              // Solid text as fill.
              Text(
                "Create Hero",
                style: const TextStyle(
                  wordSpacing: 5,
                  fontFamily: 'MyHeroFont',
                  fontSize: 50,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 120),
        height: screenSize.height,
        width: screenSize.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "./assets/heroes/background/all-might-midoriya-bakugo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          //padding: EdgeInsets.only(top: ),
          child: Column(
            children: [
              Container(
                height: screenSize.height * 0.8,
                width: screenSize.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: providerHero.isLoading! && providerHero.isLoading != null
                    ? Container(
                        height: screenSize.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 200,
                                child: LoadingIndicator(
                                  strokeWidth: 5,
                                  indicatorType:
                                      Indicator.ballClipRotateMultiple,
                                  colors: [
                                    Colors.yellow,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView(
                        padding: EdgeInsets.only(top: 30),
                        children: [
                          Container(
                            width: screenSize.width * 0.1,
                            margin: EdgeInsets.only(left: 50, right: 50),
                            child: TextFormField(
                              controller: trueNameController,
                              onChanged: (value) =>
                                  providerHero.setTrueName(value),
                              style: TextStyle(
                                color: const Color(0xff1418FA),
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                hintText: "TrueName",
                                hintStyle: TextStyle(
                                  color: const Color(0xff1418FA),
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: "TrueName",
                                labelStyle: TextStyle(
                                  color: const Color(0xff1418FA),
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: const Color(0xff1418FA), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: const Color(0xff1418FA), width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.1,
                            margin:
                                EdgeInsets.only(left: 50, right: 50, top: 20),
                            child: TextFormField(
                              controller: lastNameController,
                              onChanged: (value) =>
                                  providerHero.setLastName(value),
                              style: TextStyle(
                                color: const Color(0xff1418FA),
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                hintText: "LastName",
                                hintStyle: TextStyle(
                                  color: const Color(0xff1418FA),
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: "LastName",
                                labelStyle: TextStyle(
                                  color: const Color(0xff1418FA),
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: const Color(0xff1418FA), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: const Color(0xff1418FA), width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.1,
                            margin:
                                EdgeInsets.only(left: 50, right: 50, top: 20),
                            child: TextFormField(
                              controller: heroNameController,
                              onChanged: (value) =>
                                  providerHero.setHeroName(value),
                              style: TextStyle(
                                color: const Color(0xff1418FA),
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  color: const Color(0xff1418FA),
                                  fontWeight: FontWeight.bold,
                                ),
                                hintText: "HeroName",
                                labelText: "HeroName",
                                labelStyle: TextStyle(
                                  color: const Color(0xff1418FA),
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: const Color(0xff1418FA), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: const Color(0xff1418FA), width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.1,
                            margin:
                                EdgeInsets.only(left: 50, right: 50, top: 20),
                            child: TextFormField(
                              controller: heroRankController,
                              onChanged: (value) =>
                                  providerHero.setHeroRank(int.tryParse(value)),
                              style: TextStyle(
                                color: const Color(0xff1418FA),
                                fontWeight: FontWeight.bold,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "HeroRank",
                                hintStyle: TextStyle(
                                  color: const Color(0xff1418FA),
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: "HeroRank",
                                labelStyle: TextStyle(
                                  color: const Color(0xff1418FA),
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: const Color(0xff1418FA), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: const Color(0xff1418FA), width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.1,
                            margin:
                                EdgeInsets.only(left: 50, right: 50, top: 20),
                            child: TextFormField(
                              controller: heroAgeController,
                              onChanged: (value) =>
                                  providerHero.setHeroAge(int.tryParse(value)),
                              style: TextStyle(
                                color: const Color(0xff1418FA),
                                fontWeight: FontWeight.bold,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Age",
                                hintStyle: TextStyle(
                                  color: const Color(0xff1418FA),
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: "Age",
                                labelStyle: TextStyle(
                                  color: const Color(0xff1418FA),
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: const Color(0xff1418FA), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: const Color(0xff1418FA), width: 1),
                                ),
                              ),
                            ),
                          ),
                          if (bytes == null)
                            Container(
                              height: 50,
                              width: screenSize.width * 0.1,
                              margin: EdgeInsets.only(
                                left: 50,
                                right: 50,
                                top: 30,
                              ),
                              child: ElevatedButton(
                                child: Text(
                                  "Choose a thumb for this hero",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: pickFile,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.yellow,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            )
                          else
                            Container(
                              margin: EdgeInsets.only(
                                left: 50,
                                right: 50,
                              ),
                              child: Wrap(
                                children: [
                                  Container(
                                    width: screenSize.width * 0.5,
                                    height: 50,
                                    margin: EdgeInsets.only(top: 50),
                                    child: ElevatedButton(
                                      child: Text(
                                        "Clear Thumb",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: clearThumb,
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.yellow,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Image.memory(
                                    bytes!,
                                    height: 150,
                                    width: 150,
                                  )
                                ],
                              ),
                            ),
                          Container(
                            height: 50,
                            width: screenSize.width * 0.1,
                            margin: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 30,
                              bottom: 20,
                            ),
                            child: ElevatedButton(
                              child: Text(
                                "Create Hero",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () async => heroController?.createHero(
                                providerHero.sendHeroInfoToAPI()!,
                                fileToUpload != null ? fileToUpload! : null,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
