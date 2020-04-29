import 'package:flutter/material.dart';

class TopBanner extends StatelessWidget {
  final bool isBack;
  TopBanner({@required this.isBack});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 130.0,
          color: Color(0xFFFCFC00),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/network-architect-logo.png',
                                ),
                                fit: BoxFit.fill))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Network Architects',
                          style: TextStyle(
                              color: Color(0xFF2B2DFE),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Warranty Included!',
                          style: TextStyle(
                              color: Color(0xFFF52700),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Singapore-Kuala Lumpur',
                      style: TextStyle(
                          color: Color(0xFFF52700),
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            height: 40.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/ukas-iso-logo.png',
                                    ),
                                    fit: BoxFit.fill))
//                                child: Image.asset('assets/ukas-iso-logo.png',),
//                                decoration: BoxDecoration(),
                        ),
                        Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/bizsafe-logo.png',
                                    ),
                                    fit: BoxFit.fill))
//                                child: Image.asset('assets/ukas-iso-logo.png',),
//                                decoration: BoxDecoration(),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
//                    left: 10.0,
          top: 0.0,
          child: GestureDetector(
            onTap: () {
              if (isBack) {
                Navigator.pop(context,false);
              }
            },
            child: Icon(
              Icons.arrow_back,
              size: 30.0,
              color: isBack ? Colors.black : Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}