import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constant_resource.dart';
import '../utils/custom_color.dart';
import '../utils/string_resource.dart';

class WidgetElevatedButton extends StatelessWidget{

  const WidgetElevatedButton({
    Key? key,
    this.buttonText,
    required this.onTap,
    this.textEditingController
}):super(key: key);

  final String? buttonText;
  final Function() onTap;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Makes the button take full width
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff5ACD84), // Start color of the gradient
              Color(0xff56AEFF)// End color of the gradient
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(ConstantResource.RADIUS_FIVE),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: ConstantResource.ELEVATION_FIVE, // Elevation-like effect
              offset: Offset(0, ConstantResource.ELEVATION_FIVE / 2), // Shadow position
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(ConstantResource.PADDING_SIXTEEN),
            child: Center(
              child: Text(
                buttonText ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: ConstantResource.FONT_SIZE_FORTEEN,
                  fontFamily: StringResources.INTER,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  }
