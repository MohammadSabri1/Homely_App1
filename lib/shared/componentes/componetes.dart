
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



Widget  defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type ,
  required String? Function(String?) validator,
  required String label,
  IconData? prefixIcon,
  bool obscureText=false,
  IconData? suffix,
  Function()? suffixPressed,
  Function()? onTab,
  Function(String)? onChanged,
})=> TextFormField(

  onChanged: onChanged,
  textDirection: TextDirection.rtl,
  controller: controller,
  keyboardType:type,
  obscureText: obscureText,
  decoration: InputDecoration(
      labelText:label,
      prefixIcon: Icon(prefixIcon),
      suffixIcon:suffix!=null ?IconButton(
          onPressed: suffixPressed,
          icon:  Icon(suffix)):null,
      border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(7.0)
      ),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.deepOrangeAccent
          )
      )
  ),
  validator:validator,
  onTap:onTab ,
);


Widget defaultButton( {
  double width = double.infinity,
  Color background = Colors.deepOrangeAccent,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: background,
      ),
    );

void navigatorTo(context,Widget
    )=>Navigator.push(
    context,MaterialPageRoute(
  builder: (context) => Widget,
)
);
void pushAndRemoveUntil(context,Widget
    )=>Navigator.pushAndRemoveUntil(
    context,MaterialPageRoute(
  builder: (context) => Widget,
),
        (Route<dynamic>rout)=>false
);

final String applicationName='homly';
void showToast({
  required String text,
  required toastState state,
}){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor:choostToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum toastState {success,error,warning}
Color? choostToastColor(toastState state)
{
  Color color;
  switch(state)
  {
    case toastState.success:
      color=Colors.green;
      break;
    case toastState.warning:
      color=Colors.amber;
      break;
    case toastState.error:
      color=Colors.red;
      break;
  }
  return color;
}

String uid ='';