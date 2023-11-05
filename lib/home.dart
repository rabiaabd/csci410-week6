import 'package:flutter/material.dart';
import 'car.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String totalPrice = cars.first.getTotalPrice();
  Car car = cars.first;
  bool insurance = false;

  void updateCar(Car car) {
    // updates car price when the user selects a car form the dropdown
    setState(() {
      this.car = car;
      totalPrice = car.getTotalPrice();
    });
  }
  void updateWarranty(int warranty) {
    // updates warranty years when the user clicks on a radio buttons
    setState(() {
      car.warranty = warranty;
      totalPrice = car.getTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column (
          children: [
            const SizedBox(height: 20.0),
            const Text('select Model',style: TextStyle(fontSize: 18.0)),
            const SizedBox(height: 10.0),
            MyDropDownMenuWidget(updateCar: updateCar),const SizedBox(height: 10.0),
            WarrantyWidget(updateWarranty: updateWarranty),const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Insurance', style: TextStyle(fontSize: 18.0)),
              Checkbox(
                  value: insurance,
                  onChanged: (bool? value)
              {
                setState(() {
                  insurance  = value as bool;
                  car.insurance = insurance;
                  totalPrice = car.getTotalPrice();
                });
              })
            ],
          ),
            const SizedBox(height: 10.0),
            Text('Total Price: $totalPrice', style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    );
  }
}
