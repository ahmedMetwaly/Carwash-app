class CarTypeModel {
  final String type;
  final String img;

  CarTypeModel({required this.type, required this.img});
}

List<CarTypeModel> carType = [
  CarTypeModel(
      type: 'Micro',
      img: 'assets/images/Screenshot from 2024-09-09 21-36-25.png'),
  CarTypeModel(
      type: 'Cope',
      img: 'assets/images/Screenshot from 2024-09-09 21-35-31.png'),
  CarTypeModel(
      type: 'Hatchback',
      img: 'assets/images/Screenshot from 2024-09-09 21-35-50.png'),
  CarTypeModel(
      type: 'Sedan',
      img: 'assets/images/Screenshot from 2024-09-09 21-35-16.png'),
  CarTypeModel(
      type: 'Minivan',
      img: 'assets/images/Screenshot from 2024-09-09 21-36-13.png'),
  CarTypeModel(
      type: 'Truck',
      img: 'assets/images/Screenshot from 2024-09-09 21-36-01.png'),
];
