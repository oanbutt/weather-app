
import 'package:flutter/material.dart';


 InputDecoration kTextField = InputDecoration(
    filled: true,
    hintText: 'Enter the city',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
   enabledBorder: OutlineInputBorder(
     borderRadius: BorderRadius.circular(20),
     borderSide: BorderSide(color: Color(0xffC8A58A), width: 1),
   ),
   focusedBorder: OutlineInputBorder(
     borderRadius: BorderRadius.circular(20),
     borderSide: BorderSide(color: Color(0xffC8A58A),width: 2),
   ),


);