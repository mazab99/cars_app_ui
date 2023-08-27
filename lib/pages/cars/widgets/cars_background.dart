import 'package:flutter/material.dart';
import '../../../constants.dart';

class CarsBackground extends StatelessWidget {
  const CarsBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: -size.width,
          child: Row(
            children: [
              Container(
                width: (size.width * 2) - padding,
                height: size.height,
                color: Colors.red,
              ),
              Container(
                width: (size.width * 2) - padding,
                height: size.height,
                color: Colors.white,
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: size.width - padding * 1.3,
          child: Container(
            width: padding / 2,
            height: size.height,
            color: Colors.black,
          ),
        ),
        Positioned(
          top: size.height / 2 - padding,
          left: size.width - padding * 2,
          child: const CircleAvatar(
            radius: padding - 1,
            backgroundColor: Colors.red,
            child: CircleAvatar(
              radius: padding - 20,
              backgroundColor: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
