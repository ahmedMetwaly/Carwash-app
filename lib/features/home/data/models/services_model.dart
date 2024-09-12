class ServicesModel {
  final String icon;
  final String title;

  ServicesModel({required this.icon, required this.title});
}

List<ServicesModel> servicesList = [
  ServicesModel(
      icon: 'assets/images/car-service_2052442.png', title: 'Interior Washing'),
  ServicesModel(
      icon: 'assets/images/car-service_2052438.png', title: 'Vacuum Cleaning'),
  ServicesModel(
      icon: 'assets/images/car-wash_2052428.png', title: 'Casino'),
  ServicesModel(
      icon: 'assets/images/seat_2052451.png', title: 'Exterior Washing'),
  ServicesModel(
      icon: 'assets/images/polish_2052443.png', title: 'Oil Changing'),
  ServicesModel(
      icon: 'assets/images/tire_2052454.png', title: 'Tire Wash'),
      ServicesModel(
      icon: 'assets/images/tire_2052455.png', title: 'Car Wash'),
      ServicesModel(
      icon: 'assets/images/vacuum-cleaner_2052459.png', title: 'Detailing'),
      ServicesModel(
      icon: 'assets/images/air-blower_2052425.png', title: 'Car Care'),
      ServicesModel(
      icon: 'assets/images/car-service.png', title: 'Car Wash'),
      ServicesModel(
      icon: 'assets/images/car-servicesl.png', title: 'Car Wash'),
];

class ServicesPlan {
  final String title;
  final List<String> services;
  final String price;

  ServicesPlan({
    required this.title,
    required this.services,
    required this.price,
  });
}

Map<String, List<String>> plans = {
  'Standard': [
    'Exterior Wash',
    'Vacuuming',
    'Tyre Cleaning',
    'Hand Drying',
  ],
  'Deluxe': [
    'Standard Wash',
    'Tyre Cleaning',
    'Engine Detailing',
    'Hand Waxing',
  ],
  'Premium': [
    'Deluxe Wash',
    'Full Detailing',
    'Deep Cleaning',
    'Headlight Restoration',
  ],
};
List<ServicesPlan> servicePlan = [
  ServicesPlan(
    title: 'Standard Wash',
    services: plans['Standard']!,
    price: '500',
  ),
  ServicesPlan(
    title: 'Deluxe Wash',
    services: plans['Deluxe']!,
    price: '1000',
  ),
  ServicesPlan(
    title: 'Premium Wash',
    services: plans['Premium']!,
    price: '1500',
  ),
];