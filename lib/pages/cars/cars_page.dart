import 'package:cars_app_ui/pages/cars/widgets/cars_details_view.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/car/car_model.dart';
import 'widgets/cars_background.dart';
import 'widgets/cars_view.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  CarModel selectedCar = CarModel(
    name: '1',
    image: 'assets/1.jpeg',
    height: 100,
    weight: 500,
    description: 'This is car 1',
    id: 1,
  );
  bool detailsMode = false;

  void toggleDetailsMode() {
    setState(() {
      detailsMode = !detailsMode;
    });
  }

  void onSelectCar(CarModel carModel) {
    setState(() {
      selectedCar = carModel;
      detailsMode = true;
    });
  }

  final car = carsList.map((e) => e);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.red,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeInOutBack,
              top: 0,
              left: detailsMode ? (size.width - padding * 2) * -1 : 0,
              right: 0,
              bottom: 0,
              child: const CarsBackground(),
            ),
            IgnorePointer(
              ignoring: detailsMode ? false : true,
              child: AnimatedOpacity(
                opacity: detailsMode ? 1 : 0,
                duration: fastDefaultDuration,
                child: CarDetailsView(
                  onClose: toggleDetailsMode,
                  id: selectedCar.id.toString(),
                  name: selectedCar.name,
                  image: selectedCar.image,
                  height: selectedCar.height,
                  weight: selectedCar.weight,
                  description: selectedCar.description,
                ),
              ),
            ),
            IgnorePointer(
              ignoring: detailsMode ? true : false,
              child: AnimatedOpacity(
                opacity: detailsMode ? 0 : 1,
                duration: defaultDuration,
                child: CarsView(
                  onSelected: onSelectCar,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
