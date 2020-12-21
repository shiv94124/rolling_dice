import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FancyButton extends StatelessWidget {
  FancyButton({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.black,
      splashColor: Colors.black26,
      elevation: 8.0,
      shape: StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.play_arrow_rounded,
              color: Colors.pink[300],
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              "Roll",
              style: TextStyle(
                  color: Colors.pink[300], fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
