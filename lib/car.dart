import 'package:flutter/material.dart';
List<Car> cars = [
  Car('Honda', 10000),
  Car('Toyota', 20000),
  Car('BMW', 30000),
  Car('Hyundai', 8000)
];
class Car {

String model ;
int price;
int warranty  =1;
bool insurance = false;

Car(this.model,this.price);

@override
String toString() {
  return '$model Price: \$$price}';
}
String getTotalPrice()
{
int insuranceAmount = insurance ?1000 :0;
if (warranty == 1)
  return (price * 1.05 + insuranceAmount).toStringAsFixed(0);

  return (price * 1.1 + insuranceAmount).toStringAsFixed(0);;
}

}
class MyDropDownMenuWidget extends StatefulWidget {
  const MyDropDownMenuWidget({required this.updateCar, super.key});
final Function updateCar;
  @override
  State<MyDropDownMenuWidget> createState() => _MyDropDownMenuWidgetState();
}

class _MyDropDownMenuWidgetState extends State<MyDropDownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 210.0,
      initialSelection: cars[0],
      onSelected: (car){
        setState(() {
          widget.updateCar(car as Car);
        });
      },
      dropdownMenuEntries: cars.map<DropdownMenuEntry<Car>>((Car car)
      {
        return DropdownMenuEntry(value: car, label: car.toString());
      }).toList());
  }
}
class WarrantyWidget extends StatefulWidget {

  const WarrantyWidget({required this.updateWarranty, super.key});
  final Function (int) updateWarranty;
  @override
  State<WarrantyWidget> createState() => _WarrantyWidgetState();
}

class _WarrantyWidgetState extends State<WarrantyWidget> {
  int _years = 1;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      const   Text ('Warranty', style: TextStyle(fontSize: 18.0),),
      Radio(
        value: 1,
        groupValue: _years,
        onChanged: (val){
          setState(() {
          _years =val as int;
          widget.updateWarranty(_years);
        });},),
       const Text('1 Year ', style: TextStyle(fontSize: 18.0)),
      Radio(
        value: 5,
        groupValue: _years,
        onChanged: (val){
          setState(() {
            _years =val as int;
            widget.updateWarranty(_years);
          });},),
      const Text('5 Year ', style: TextStyle(fontSize: 18.0)),

  ]);
  }
}

