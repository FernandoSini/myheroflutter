// ignore: duplicate_import
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../models/VillainModel.dart';

class VillainThumbnailWidget extends StatefulWidget {
  const VillainThumbnailWidget({Key? key, this.villain}) : super(key: key);
  final VillainModel? villain;

  @override
  State<VillainThumbnailWidget> createState() => _VillainThumbnailWidgetState();
}

class _VillainThumbnailWidgetState extends State<VillainThumbnailWidget> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
       QR.toName("HeroDetails", params: {'heroName':widget.villain!.villainName},);
      },
      child: Container(
        height: screenSize.height * 0.15,
        width: screenSize.width * 0.09,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 12,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
