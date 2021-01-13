import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentCard extends StatefulWidget {
  final Color backColor;
  final String title;
  final String startDate;
  final String endDate;
  final String document;
  final String icon;

  DocumentCard(
      {this.backColor,
      this.title,
      this.startDate,
      this.endDate,
      this.document,
      this.icon});

  @override
  _DocumentCardState createState() => _DocumentCardState();
}

class _DocumentCardState extends State<DocumentCard> {
  String get imgIcon {
    return (widget.backColor == Colors.white)
        ? 'assets/Icons/card_icons/${widget.icon.toString()}.png'
        : 'assets/Icons/card_icons/${widget.icon.toString()}3.png';
  }

  String get paperIcon {
    return (widget.backColor == Colors.white)
        ? 'assets/Icons/card_icons/paper.png'
        : 'assets/Icons/card_icons/paper3.png';
  }

  Color get textColor {
    return (widget.backColor == Colors.white) ? Colors.black87 : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: widget.backColor,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imgIcon, scale: 3),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    widget.title,
                    style: TextStyle(color: textColor),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/Icons/card_icons/paper.png',
                  scale: 3,
                  color: Colors.transparent,
                ),
                SizedBox(width: 10),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.startDate + " to\n" + widget.endDate,
                        style: TextStyle(fontSize: 13, color: textColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  paperIcon,
                  scale: 3,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: InkWell(
                    onTap: () async {
                      print(widget.document);
                      var url =
                          'https://www.travezl.com/assets/uploads/itinerary_documents/Test%20document_1604474745.pdf?/assets/uploads/itinerary_documents/${widget.document}';
                      if (await canLaunch(url)) {
                        await launch(url);
                        showToast("Download Success");
                      } else {
                        showToast("Download Failed");
                        throw 'Could not launch $url';
                        
                      }
                    },
                    child: Text(
                      widget.document,
                      style: TextStyle(
                        color: (widget.backColor == Colors.white)
                            ? Color(0xFF61AAE6)
                            : Colors.yellow[200],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
