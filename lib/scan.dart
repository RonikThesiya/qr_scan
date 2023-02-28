import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';



class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  String scanBarcode = '';

  
  Future<void> scanQR() async {
    
    String scanResult;
    
    try {

      scanResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

    }

    on PlatformException {
      scanResult = 'Failed to get platform version.';
    }

    setState(() {
      scanBarcode = scanResult;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('QR code scan')),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                    onPressed: () => scanQR(),
                    child: const Text('Start QR scan')),

                TextButton(onPressed: ()async{

                    dynamic url = "${Uri.parse(scanBarcode)}";

                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: false, forceWebView: false);
                    } else {
                      throw 'Could not launch $url';
                    }


                }, child:  Text('\n ${Uri.parse(scanBarcode)}',
                    style: const TextStyle(fontSize: 20))),

              ]
          ),
        ),
      ),
    );
  }
}