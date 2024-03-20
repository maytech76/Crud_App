import 'package:flutter/material.dart';


class InputDecorations{

             static InputDecoration authInputDecoration({
                    required String hintText,
                    required String labelText,
                    IconData? prefixIcon
             }){
                return  InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 25, 213, 7)
                      ),
                    ),

                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 198, 9, 9)
                      )
                    ),

                    hintText: hintText,
                    hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w200),

                    labelText: labelText,
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 35, 35, 35),
                      fontSize: 20, fontWeight: FontWeight.w300
                    ),

                    prefixIcon: prefixIcon !=null 
                    ? Icon(prefixIcon, color: const Color.fromARGB(255, 5, 24, 130))
                    :null

                );
              }
}