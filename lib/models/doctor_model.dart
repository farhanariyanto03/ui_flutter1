import 'package:ui/models/service_model.dart';

class DoctorModel {
  String name;
  String image;
  List<String> service;
  int distance;

  DoctorModel({
    required this.name,
    required this.image,
    required this.service,
    required this.distance,
  });
}

var doctors = [
  DoctorModel(
    name: 'Dr. Abhishek Mishra',
    image: 'doctor1.jpg',
    service: [Services.vaccine, Services.surgery],
    distance: 10,
  ),
  DoctorModel(
    name: 'Dr. Farhan Ariyanto',
    image: 'doctor1.jpg',
    service: [Services.vaccine, Services.spaAndTreatment],
    distance: 11,
  ),
  DoctorModel(
    name: 'Dr. Putri Ismi Hindun',
    image: 'doctor1.jpg',
    service: [Services.consultation, Services.surgery],
    distance: 12,
  ),
];
