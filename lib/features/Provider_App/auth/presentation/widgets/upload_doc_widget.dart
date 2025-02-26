import 'package:flutter/material.dart';

class UploadDocumentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Text: "Upload Document"
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0), // Space between text and field
          child: Text(
            "Upload Document",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        // Field with Dotted Border
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Dotted border color
              width: 2.0,
              style: BorderStyle.solid, // Use solid for simplicity; dotted requires custom painting
            ),
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: Text(
              "Upload Document (Certificate and certificates)",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(200, 200, 200, 1), // Specified text color
              ),
            ),
          ),
        ),
      ],
    );
  }
}