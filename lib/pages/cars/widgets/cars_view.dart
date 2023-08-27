import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/car/car_model.dart';

class CarsView extends StatelessWidget {
  const CarsView({
    super.key,
    required this.onSelected,
  });

  final ValueChanged<CarModel> onSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(left: padding / 4, right: padding * 2.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: padding / 4),
              child: Text(
                'Mahmoud Azab',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: carsList.length,
                itemBuilder: (context, index) {
                  final car = carsList.elementAt(index);
                  return Card(
                    color: Colors.white.withOpacity(.8),
                    child: InkWell(
                      onTap: () {
                        onSelected.call(car);
                      },
                      borderRadius: BorderRadius.circular(10),
                      splashColor: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                              image: AssetImage(
                                car.image,
                              ),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
