// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Create a container with vertical margin to position it in the middle of the screen.
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        // Center the content within the container.
        child: kIsWeb || Platform.isAndroid
            // Check if the platform is web or Android. Use a CircularProgressIndicator if true.
            ? const CircularProgressIndicator()
            // Use a CupertinoActivityIndicator if it's not web or Android (presumably iOS or other platforms).
            : const CupertinoActivityIndicator(),
      ),
    );
  }
}
