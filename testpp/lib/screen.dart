import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testpp/bandeau.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final _pinned = true;
  final Map<String, List<double>> cryptoList = {
    "BTC": [32936.81, -2.74],
    "XRP": [0.548437, -1.75],
    "ETH": [351.30, 0.17],
    "BCH": [261.48, 2.31],
    "USDT": [30.897015, -0.01],
    "LTC": [97.25, 1.45]
  };
  final Map<String, List<double>> tokenList = {
    "DENT": [32936.81, -2.74],
    "UNI": [0.548437, -1.75],
    "AAVE": [351.30, 0.17],
    "GALA": [261.48, 2.31],
    "Maker": [30.897015, -0.01],
    "OKB": [97.25, 1.45]
  };
  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            expandedHeight: _heigth * 0.5,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints boxConstraints) {
              return FlexibleSpaceBar(
                title: const Text("Investments",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                titlePadding: EdgeInsetsDirectional.only(
                    bottom: boxConstraints.biggest.height - 44.0),
                background: const BandeauPromotion(),
                centerTitle: true,
              );
            }),
            backgroundColor: Colors.black,
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return createList(context, index.isEven ? cryptoList : tokenList,
                  index.isEven ? "Cryptos" : "Tokens");
            }, childCount: 4),
          ),
        ],
      ),
    ));
  }
}

Widget createList(
    BuildContext context, Map<String, List<double>> liste, String title) {
  final _heigth = MediaQuery.of(context).size.height;
  return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.black,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(color: Colors.white)),
        SizedBox(
          height: _heigth * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: liste.length,
            itemBuilder: (context, index) {
              Color color = (liste.values.elementAt(index).last > 0)
                  ? Colors.greenAccent
                  : Colors.redAccent;
              return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: _heigth * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  title == "Cryptos"
                                      ? liste.keys.elementAt(index)
                                      : liste.keys.elementAt(index),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text("${liste.values.elementAt(index).first} €",
                                  style: const TextStyle(color: Colors.white)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                      flex: 1,
                                      child: Transform.rotate(
                                          angle: (liste.values
                                                      .elementAt(index)
                                                      .last >
                                                  0)
                                              ? 180 * (pi / 4) / 180
                                              : 180 * (2 * pi / 3) / 180,
                                          child: Icon(
                                            Icons.arrow_drop_up,
                                            color: color,
                                          ))),
                                  Flexible(
                                      flex: 1,
                                      child: Text(
                                        "${liste.values.elementAt(index).last}%",
                                        style: TextStyle(color: color),
                                      ))
                                ],
                              )
                            ],
                          )),
                    ],
                  ));
            },
          ),
        )
      ]));
}
