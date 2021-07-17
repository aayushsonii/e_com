import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.text, this.isLoading, this.onPressed, this.outLineButton});
  final String text;
  final Function onPressed;
  final bool isLoading;
  final bool outLineButton;
  @override
  Widget build(BuildContext context) {
    bool _outLineButton = outLineButton ?? false;
    var _isLoading = isLoading ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
        height: MediaQuery.of(context).size.height * .07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: _outLineButton ? Colors.transparent : Colors.black,
          border:
              outLineButton ? Border.all(width: 2, color: Colors.black) : null,
        ),
        child: Stack(
          children: [
            Visibility(
              visible: _isLoading ? false : true,
              child: Center(
                child: Text(
                  text ?? "text",
                  style: TextStyle(
                    color: _outLineButton ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isLoading ? true : false,
              child: Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
