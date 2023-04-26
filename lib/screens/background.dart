import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
         image: DecorationImage(
           image: AssetImage('assets/images/3pae4flbryaputyl.jpg'),
           fit: BoxFit.cover
         )
        ),
      ),
    );
  }
}
