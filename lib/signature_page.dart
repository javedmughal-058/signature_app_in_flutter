import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signature/signature.dart';
import 'package:signature_app_in_flutter/overlay_page.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.transparent,
  );

  GlobalKey<SignatureState> _signatureKey = GlobalKey<SignatureState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              child: Container(
                // height: 300,
                width: size.width,
                decoration: const BoxDecoration(
                  // image: DecorationImage(image: AssetImage('assets/images/image.jpg')),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/image.jpg'),
                    Signature(
                      controller: _controller,
                      height: 300,
                      width: size.width,
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: ()=> _controller.clear(), icon: const Icon(Icons.clear)),
                  IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ImageOverlayExample()));
                    }, icon: const Icon(Icons.done)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


