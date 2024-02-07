import 'package:flutter/material.dart';

class DoctorAppointmentApp extends StatelessWidget {
  const DoctorAppointmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Appointment',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: DoctorListPage(),
    );
  }
}

class Doctor {
  final String name;
  final String specialty;
  final String imageAsset;

  Doctor({required this.name, required this.specialty, required this.imageAsset});
}

List<Doctor> doctors = []; // Your list of doctors
List<Doctor> favoriteDoctors = [];
List<Doctor> appointedDoctors = [];

class DoctorListPage extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(name: 'Dr. John Doe', specialty: 'Veterinary', imageAsset: 'assets/doctor_1.jpg'),
    Doctor(name: 'Dr. Jane Smith', specialty: 'Veterinary', imageAsset: 'assets/doctor_2.jpg'),
    Doctor(name: 'Dr. Michael Johnson', specialty: 'Veterinary', imageAsset: 'assets/doctor_3.jpg'),
    Doctor(name: 'Dr. Emily Williams', specialty: 'Veterinary', imageAsset: 'assets/doctor_4.jpg'),

    // Add more doctors to the list
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctors List',
          style: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ),
        backgroundColor: Colors.deepPurple[100],
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (BuildContext context, int index) {
          return DoctorCard(doctor: doctors[index]);
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(doctor.imageAsset),
          radius: 30,
        ),
        title: Text(doctor.name),
        subtitle: Text(doctor.specialty),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.deepPurple),
              onPressed: () {
                // Add doctor to favorites list
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Added to favorites',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                      ),
                    ),
                    backgroundColor: Colors.deepPurple,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_today, color: Colors.deepPurple),
              onPressed: () {
                // Add doctor to favorites list
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Added to appoinment',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                      ),
                    ),
                    backgroundColor: Colors.deepPurple,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

