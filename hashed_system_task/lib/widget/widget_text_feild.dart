import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constant_resource.dart';
import '../utils/custom_color.dart';
import '../utils/string_resource.dart';

class WidgetTextField extends StatelessWidget{
  const WidgetTextField({
    Key? key,
    this.hintText,
    required this.showSuffixIcon,
    this.textEditingController,
    this.icon,
    required this.isPasswordVisible,
    this.togglePasswordVisibility,
    this.paddingLeft,
    this.paddingRight
  }):super(key: key);

  final String? hintText;
  final bool showSuffixIcon;
  final TextEditingController? textEditingController;
  final IconData? icon;
  final bool isPasswordVisible;
  final double? paddingLeft;
  final double? paddingRight;
  final Function(bool?)? togglePasswordVisibility;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.only(
              left: paddingLeft ?? ConstantResource.PADDING_TWENTY_FIVE,
              right: paddingRight ?? ConstantResource.PADDING_TWENTY_FIVE),
          child: PhysicalModel(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(ConstantResource.RADIUS_FIVE)),
              shadowColor: Colors.black45,
              elevation: ConstantResource.ELEVATION_FIVE,
              child:Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(icon)),
                    Flexible(
                      child: TextFormField(
                        cursorColor: CustomColors.silver,
                        controller: textEditingController,
                        obscureText: isPasswordVisible,
                        style: const TextStyle(
                          color: CustomColors.silver,
                          fontSize: ConstantResource.FONT_SIZE_FORTEEN,
                          fontFamily: StringResources.INTER,
                          fontWeight: FontWeight.w200,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10), // add padding to adjust text
                          isDense: true,
                          hintText: hintText,
                          hintStyle: TextStyle(color: CustomColors.silver),
                          suffixIcon: showSuffixIcon
                              ? Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: IconButton(
                              icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                              onPressed:(){
                                togglePasswordVisibility?.call(!isPasswordVisible);
                              }, // Call the callback function here
                            ),
                          )
                              : null,
                        ),
                      ),
                    ),
                  ]
              )
          ),
        )
    );
  }
}