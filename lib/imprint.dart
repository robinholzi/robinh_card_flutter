

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:robinh_card/main.dart';

class ImprintPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ImprintPageState();
  }

}

// TODO; multi lang support

class ImprintPageState extends State<ImprintPage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardWidth = 500;
    double imageHeight = 200;

    double scale = 1.5;
    if(width < 1000) {
      scale = 1.4;
    }
    if(width < 800) {
      scale = 1.25;
    }
    if(width < 600) {
      scale = 1.0;
    }
    if(width < 450) {
      scale = 0.8;
    }
    if(width < 350) {
      scale = 0.6;
    }

    if(height < 1000) {
      scale = min(scale, 1.3);
    }
    if(height < 850) {
      scale = min(scale, 1.15);
    }
    if(height < 700) {
      scale = min(scale, 1.0);
    }

    double footerFontSize = 15;
    Color footerFontColor = darkTheme
        ? Color.fromARGB(255, 150, 150, 150)
        : Color.fromARGB(255, 100, 100, 100);
    TextStyle footerTextStyle = TextStyle(
      color: footerFontColor,
      fontSize: footerFontSize,
      fontFamily: 'Helvetica',
    );

    List<Widget> children = <Widget>[

      Container(
        margin: EdgeInsets.all((height < 700 || width < 600) ? 25 : 50),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: RawMaterialButton(
                child: Container(
                  padding: EdgeInsets.all(15),
                  color: darkTheme ? bgDark : bgLight,
                  child: Icon(Icons.arrow_back, color: darkTheme ? bgLight : bgDark,),
                ),
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(minWidth: 0, minHeight: 0),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),

      CardItem(width, height, cardWidth, imageHeight, scale),
      (height < 700) ? SizedBox(height: 30,) : SizedBox(height: 50,),
      Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.only(bottom: 12),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Copyright © Robin Holzinger", style: footerTextStyle),
              SizedBox(width: 8),
              Text("|", style: footerTextStyle),
              SizedBox(width: 8),
              Text("Imprint", style: footerTextStyle),
            ]),
      ),
      (height < 700) ? SizedBox(height: 0,) : SizedBox(height: 40,),
    ];

    return Scaffold(
      backgroundColor: darkTheme
          ? bgLight
          : bgDark,

      body: ListView(
        children: children,
        shrinkWrap: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Container(
        margin: EdgeInsets.all((height < 700 || width < 600) ? 25 : 50),
        child: FloatingActionButton(
          backgroundColor: darkTheme ? bgDark : bgLight,
          child: Icon(Icons.color_lens_rounded, color: darkTheme ? bgLight : bgDark,),
          onPressed: () {
            setState(() {
              darkTheme = !darkTheme;
            });
          },
        ),
      ),
    );
  }

}

class CardItem extends StatelessWidget {

  CardItem(this.width, this.height, this.cardWidth, this.imageHeight, this.scale);

  final double width;
  final double height;
  final double cardWidth;
  final double imageHeight;
  final double scale;

  @override
  Widget build(BuildContext context) {
    double workaroundPadding = 450;

    if(height < 1200) {
      workaroundPadding = 300;
    }
    if(height < 1000) {
      workaroundPadding = 250;
    }
    if(height < 800) {
      workaroundPadding = 150;
    }
    if(height < 700) {
      workaroundPadding = 50;
    }
    if(height < 200) {
      workaroundPadding = 30;
    }

    Map<String, Style> htmlTextStyle = {
      "*": Style(
          color: darkTheme ? Colors.white : Colors.black
      )
    };

    Widget unscaled = Container(
      padding: EdgeInsets.symmetric(vertical: workaroundPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: darkTheme
                      ? Color.fromARGB(200, 0, 0, 0)
                      : Color.fromARGB(200, 0, 0, 0),
                  offset: new Offset(0.0, 0.0),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                decoration: BoxDecoration(
                  color: darkTheme
                      ? Color.fromARGB(255, 30, 30, 40)
                      : Colors.white,
                ),
                child: Container(
                  width: cardWidth,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 50, horizontal: 50),
                      child: Column(children: [
                        Text("Imprint",
                            style: TextStyle(
                                color: darkTheme ? Colors.white : Colors.black,
                                fontSize: 19,
                                letterSpacing: 3,
                                fontWeight: darkTheme ? FontWeight.bold : FontWeight.bold,
                                fontFamily: 'Helvetica')),
                        SizedBox(height: 12),
                        Text("Robin Holzinger",
                            style: TextStyle(
                                color: darkTheme ? Colors.white : Colors.black,
                                fontSize: 14,
                                letterSpacing: 2,
                                fontWeight: darkTheme ? FontWeight.normal : FontWeight.bold,
                                fontFamily:
                                'Helvetica')), // Source Code Pro
                        SizedBox(height: 22),
                        Html(
                            style: htmlTextStyle,
                            data: """
                              <h1>Legal Disclosure</h1>
                              Information in accordance with Section 5 TMG
                              <br><br>Robin Holzinger<br>Oberneureuth 17<br>94164 Sonnen<br><br>
                              <h2>Contact Information</h2>"""
                        ),
                        Row(
                          children: [
                            SizedBox(width: 8,),
                            PreButtonText("Telephone:  ", allowBold: false,),
                            HyperLinkButton("+49 174 9769452", url: ""),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 8,),
                            PreButtonText("Email:  ", allowBold: false,),
                            HyperLinkButton("robin.holzinger@tum.de", url: "mailto:robin.holzinger@tum.de"),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 8,),
                            PreButtonText("Internet address: ", allowBold: false,),
                            HyperLinkButton("https://robinh.xyz", url: "https://robinh.xyz"),
                          ],
                        ), // """ + textColor + """
                        Html(
                            style: htmlTextStyle,
                            data: """<div>
                          <br>
                              <h2 style="color: rgb(100,100,100)">Disclaimer</h2>
                              Accountability for content<br>
                              The contents of our pages have been created with the utmost care. However, we cannot guarantee the contents'
                              accuracy, completeness or topicality. According to statutory provisions, we are furthermore responsible for
                              our own content on these web pages. In this matter, please note that we are not obliged to monitor
                              the transmitted or saved information of third parties, or investigate circumstances pointing to illegal activity.
                              Our obligations to remove or block the use of information under generally applicable laws remain unaffected by this as per
                              §§ 8 to 10 of the Telemedia Act (TMG).

                              <br><br>Accountability for links<br>
                              Responsibility for the content of
                              external links (to web pages of third parties) lies solely with the operators of the linked pages. No violations were
                              evident to us at the time of linking. Should any legal infringement become known to us, we will remove the respective
                              link immediately.<br><br>Copyright<br> Our web pages and their contents are subject to German copyright law. Unless
                              expressly permitted by law, every form of utilizing, reproducing or processing
                              works subject to copyright protection on our web pages requires the prior consent of the respective owner of the rights.
                              Individual reproductions of a work are only allowed for private use.
                              The materials from these pages are copyrighted and any unauthorized use may violate copyright laws.

                              <br><br>
                              <i>Source: </i><a href="http://www.translate-24h.de" target="_blank">impressum generator at translate-24h.de</a> <br><br>
                          </div>
                            """
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

    Widget card = Transform.scale(
      scale: scale,
      child: unscaled,
    );

    return card;
  }
}