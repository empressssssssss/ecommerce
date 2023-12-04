// Flutter imports:
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  // Constructor for the Message widget.
  final String message; // A message to be displayed.
  
  // Default constructor values.
  const Message({
    this.message = 'Something went wrong.', // Default message text.
    Key? key, // Optional widget key for identification.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Create a container with 20-pixel margin on all sides.
      margin: const EdgeInsets.all(20),
      child: Center(
        // Center the content within the container.
        child: Text(message), // Display the provided or default message.
      ),
    );
  }
}
