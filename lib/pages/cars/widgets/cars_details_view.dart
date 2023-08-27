import 'package:flutter/material.dart';
import '../../../constants.dart';

class CarDetailsView extends StatelessWidget {
  final VoidCallback onClose;
  final String id;
  final String name;
  final String image;
  final double height;
  final double weight;
  final String description;

  const CarDetailsView({
    Key? key,
    required this.onClose,
    required this.id,
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TweenAnimationBuilder<double>(
        duration: fastDefaultDuration,
        tween: Tween(begin: 40, end: 0),
        curve: Curves.decelerate,
        builder: (context, value, _) {
          return Transform.translate(
            offset: Offset(value, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: padding * 1.5),
                  child: BackButton(
                    color: Colors.black,
                    onPressed: onClose,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: padding / 4,
                    left: padding * 2.2,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        image,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: padding / 2,
                        ),
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'ID',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                id.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'Height',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                height.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'Weight',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                weight.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
