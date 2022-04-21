// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:robinh_card/imprint.dart';

void main() => runApp(MyApp());

bool darkTheme = false;

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

void htmlOpenLink(String url) {
  html.window.open(url, '_blank');
}

Color bgDark = Color.fromARGB(255, 30, 30, 40);
Color bgLight = Color.fromARGB(255, 245, 245, 245);

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Robin Holzinger",
      home: LandingPage(),
    );
  }

}

class LandingPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return LandingPageState();
  }

}

class LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardWidth = 350;
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
      (height < 700) ? SizedBox(height: 40,) : SizedBox(height: 0,),
      CardItem(width, height, cardWidth, imageHeight, scale),
      (height < 700) ? SizedBox(height: 30,) : SizedBox(height: 0,),
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
              RawMaterialButton(
                child: Text("Imprint", style: footerTextStyle),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ImprintPage()));
                },
              ),
            ]),
      ),
      (height < 700) ? SizedBox(height: 0,) : SizedBox(height: 0,),
    ];

    return Scaffold(
      backgroundColor: darkTheme
          ? bgLight
          : bgDark,

      body: height < 700
          ? ListView(
        children: children,
        shrinkWrap: false,
      )
          : Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
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

    Widget card = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: scale,
          child: Container(
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
                  child: Stack(
                    children: [
                      Container(
                        width: cardWidth,
                        height: imageHeight,
                        child: Image.asset(
                          'assets/background.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 125),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                border:
                                Border.all(color: Colors.white, width: 3),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5000),
                                child: Container(
                                    height: 100,
                                    child: Image.asset('assets/profile_picture.jpg')),
                              ),
                            ),
                            SizedBox(height: 22),
                            Text("Robin Holzinger",
                                style: TextStyle(
                                    color: darkTheme ? Colors.white : Colors.black,
                                    fontSize: 19,
                                    letterSpacing: 3,
                                    fontWeight: darkTheme ? FontWeight.bold : FontWeight.bold,
                                    fontFamily: 'Helvetica')),
                            SizedBox(height: 16),
                            PositionWidget(
                              title: "CS Student",
                              linkText: "TUM",
                              href: "https://www.tum.de/",
                            ),
                            SizedBox(height: 12),
                            PositionWidget(
                              title: "Software Engineering Intern",
                              linkText: "FINN",
                              href: "https://www.finn.auto/",
                            ),
                            SizedBox(height: 22),
                            Table(
                              columnWidths: {
                                0: FlexColumnWidth(1.5),
                                1: FlexColumnWidth(2.5),
                              },
                              children: [
                                LinkItem.makeRow(
                                    "Email", "robin.holzinger@tum.de",
                                    url: "mailto:robin.holzinger@tum.de"),
                                LinkItem.makeRow("LinkedIn", "Robin Holziger",
                                    url: "https://www.linkedin.com/in/robin-holzinger"),
                                LinkItem.makeRow("GitHub", "NeroTyc",
                                    at: true, url: "https://github.com/Nerotyc"),
                                LinkItem.makeRow("Website", "robinh.xyz",
                                    url: "https://robinh.xyz"),
                                // LinkItem.makeRow("Blog", "nerotecs.com"),
                              ],
                            ),
                            SizedBox(height: 20,),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );

    return (height < 700) ? card : Expanded(child: card,);
  }
}

class PositionWidget extends StatelessWidget {
  PositionWidget({
    Key? key,
    this.title = "",
    this.linkText = "",
    this.href = "/",
  }) : super(key: key) {
    titleStyle = TextStyle(
        color: darkTheme ? Colors.white : Colors.black,
        fontSize: 12,
        letterSpacing: 1,
        fontWeight: darkTheme ? FontWeight.normal : FontWeight.bold,
        fontFamily: 'Helvetica'
    );
    linkStyle = titleStyle.copyWith(color: Colors.orangeAccent, );
  }

  late final TextStyle titleStyle, linkStyle;
  final String? title;
  final String? linkText;
  final String? href;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title ?? "", style: titleStyle),
        SizedBox(width: 5,),
        RawMaterialButton(
          constraints: BoxConstraints(minWidth: 0, minHeight: 0),
          padding: EdgeInsets.all(0),
          elevation: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Color.fromARGB(0, 0, 0, 0),
          onPressed: () {
            htmlOpenLink(href ?? "/");
          },
          child: Text(linkText!=null ? ("@ $linkText") : "", style: linkStyle),
        )
      ],
    );
  }
}


class LinkItem {
  static TableRow makeRow(String title, String linkText, {bool at = false, String url = ''}) {

    return TableRow(
      children: [
        TableCell(
          child: PreButtonText(title + ":"),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: HyperLinkButton(linkText, at: at, url: url),
        ),
      ],
    );
  }
}

class PreButtonText extends StatelessWidget {

  PreButtonText(this.title, {this.allowBold = true});

  final String title;
  final allowBold;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(title,
          style: TextStyle(
              color: darkTheme ? Colors.white : Colors.black,
              fontSize: 11,
              letterSpacing: 1,
              fontWeight: (darkTheme || !allowBold) ? FontWeight.normal : FontWeight.bold,
              fontFamily: 'Helvetica')),
    );
  }
}


class HyperLinkButton extends StatelessWidget {

  HyperLinkButton(this.linkText, {this.at = false, this.url = ''});

  final String linkText;
  final bool at;
  final String url;

  @override
  Widget build(BuildContext context) {

    Widget tableCellRight = Container(
      margin: EdgeInsets.only(top: 10),
      child: Text((at ? "@" : "") + linkText,
          style: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 10,
              letterSpacing: 1,
              fontWeight: darkTheme ? FontWeight.normal : FontWeight.bold,
              fontFamily: 'Helvetica')),
    );

    return url.isEmpty
        ? tableCellRight
        : Row(
      children: [
        RawMaterialButton(
          constraints: BoxConstraints(minWidth: 0, minHeight: 0),
          padding: EdgeInsets.all(0),
          elevation: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Color.fromARGB(0, 0, 0, 0),
          onPressed: () {
            htmlOpenLink(url);
          },
          child: tableCellRight,
        )
      ],
    );
  }

}