import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:my_hero_academia/web/controller/villain_controller.dart';
import 'package:my_hero_academia/web/providers/villain_provider.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class WebCreateVillainScreen extends StatefulWidget {
  const WebCreateVillainScreen({Key? key}) : super(key: key);

  @override
  State<WebCreateVillainScreen> createState() => _WebCreateVillainScreenState();
}

class _WebCreateVillainScreenState extends State<WebCreateVillainScreen> {
  VillainController? villainController;

  TextEditingController trueNameController = TextEditingController(text: "");
  TextEditingController lastNameController = TextEditingController(text: "");
  TextEditingController villainNameController = TextEditingController(text: "");
  TextEditingController villainRankController = TextEditingController(text: "");
  TextEditingController villainAgeController = TextEditingController(text: "");
  Map<String, dynamic>? fileToUpload;
  Uint8List? bytes;
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
    villainController = VillainController(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerVillain = context.watch<VillainProvider>();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
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
              )
        ],
        centerTitle: true,
        title: Container(
          child: Stack(
            children: <Widget>[
              // Stroked text as border.
              Container(
                color: Colors.transparent,
                child: Text(
                  "Create Villain",
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
                "Create Villain",
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
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("./assets/villains/all-for-one-helping.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          //padding: EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Container(
                height: screenSize.height * 0.8,
                width: screenSize.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
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
                child: providerVillain.isLoading != null &&
                        providerVillain.isLoading!
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
                                  providerVillain.setTrueName(value),
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                hintText: "TrueName",
                                hintStyle: TextStyle(
                                  color: Colors.yellow,
                                ),
                                labelText: "TrueName",
                                labelStyle: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: Colors.yellow, width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.1,
                            margin: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 20,
                            ),
                            child: TextFormField(
                              controller: lastNameController,
                              onChanged: (value) =>
                                  providerVillain.setLastName(value),
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                hintText: "LastName",
                                hintStyle: TextStyle(
                                  color: Colors.yellow,
                                ),
                                labelText: "LastName",
                                labelStyle: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: Colors.yellow, width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.1,
                            margin: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 20,
                            ),
                            child: TextFormField(
                              controller: villainNameController,
                              onChanged: (value) =>
                                  providerVillain.setVillainName(value),
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                hintText: "VillainName",
                                hintStyle: TextStyle(
                                  color: Colors.yellow,
                                ),
                                labelText: "VillainName",
                                labelStyle: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: Colors.yellow, width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.1,
                            margin: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 20,
                            ),
                            child: TextFormField(
                              controller: villainRankController,
                              onChanged: (value) => providerVillain
                                  .setVillainRank(int.tryParse(value)),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                hintText: "VillainRank",
                                hintStyle: TextStyle(
                                  color: Colors.yellow,
                                ),
                                labelText: "VillainRank",
                                labelStyle: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: Colors.yellow, width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.1,
                            margin: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 20,
                            ),
                            child: TextFormField(
                              controller: villainAgeController,
                              onChanged: (value) => providerVillain
                                  .setVillainAge(int.tryParse(value)),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                hintText: "Age",
                                hintStyle: TextStyle(
                                  color: Colors.yellow,
                                ),
                                labelText: "Age",
                                labelStyle: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      color: Colors.yellow, width: 1),
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
                                  "Choose a thumb for this villain",
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
                                "Create Villain",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () async =>
                                  villainController?.createVillain(
                                providerVillain.sendVillainInfoToAPI()!,
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
