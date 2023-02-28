import 'package:flutter/material.dart';
import 'package:qr_scan/scan.dart';

/* if not run go to main.dart >>>>>
Edit Configurations... >>>>
additional run arg >>>>> p
aste --no-sound-null-safety
after save do run again
*/
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => ScanScreen(),
    },
  ));
}