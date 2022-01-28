import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BandeauPromotion extends StatelessWidget {
  const BandeauPromotion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: _height * 0.35,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/AKTIOCoin.jpg"),
                  fit: BoxFit.cover)),
          child: const Text("AKT Token",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                    "\nPurchase our exclusive token with 25% bonus\n& get your lifetime Elite membership now\n",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center),
                Center(
                    child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ElevatedButton(
                      onPressed: () async {
                        const url = "https://launch.akt.io/";
                        try {
                          await launch(url);
                        } catch (e) {
                          if (kDebugMode) {
                            print("Cannot connect");
                          }
                        }
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Learn more"),
                            Icon(Icons.arrow_forward)
                          ])),
                )),
              ],
            ))
      ],
    );
  }
}
