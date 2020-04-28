import 'package:covid19_flutter/widgets/chart_container.dart';
import 'package:flutter/material.dart';

class Charts extends StatelessWidget {
  String country = "Perú";
  String countryCode = "PE";
  String slug = "peru";
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width);
    //final widthToggleButton = (width - 75) * .5;
    //final fontSizeCardTitle = width * .035;
    final fontSizeCardNumber = width * .05;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: DraggableScrollableSheet(
        builder: (context, scrollController) {
          return Container(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Statistics",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  color: Colors.black),
                            ),
                            Text(
                              "Coronavirus",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.lightBlue[900],
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      children: <Widget>[
                        //copy same button
                        Container(
                          child: Text(
                            "Bottom",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.grey[900]),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[200],
                                    blurRadius: 10.0,
                                    spreadRadius: 4.5)
                              ]),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),

                        SizedBox(
                          width: 16,
                        ),

                        Container(
                          child: Text(
                            "Bottom",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.grey[900]),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[200],
                                    blurRadius: 10.0,
                                    spreadRadius: 4.5)
                              ]),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      ],
                    ),
                  ),

                  //Container for card
                  SizedBox(
                    height: 16,
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  //chequearrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
                  Container(
                    child: buildContainerChart(width, fontSizeCardNumber),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Color.fromRGBO(243, 245, 248, 1),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
          );
        },
        initialChildSize: 0.95,
        maxChildSize: 0.95,
      ),
    );
  }

  ContainerChart buildContainerChart(double width, double fontSizeCardNumber) {
    return ContainerChart(
      countryCode: countryCode,
      fontSizeCardNumber: fontSizeCardNumber,
      width: width,
      slug: slug,
    );
  }
}
