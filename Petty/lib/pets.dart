import 'package:flutter/material.dart';
import 'doctors.dart';

void main() {
  runApp(petty());
}

class Pet {
  String name;
  String age;
  String imageUrl;
  bool isVaccinated;

  Pet({required this.name, required this.age, required this.imageUrl, this.isVaccinated = false});
}

class petty extends StatelessWidget {
  final List<Pet> pets = [
    Pet(name: 'Fluffy', age: '2 years', imageUrl: 'assets/images/catty.jpg', isVaccinated: true),
    Pet(name: 'Buddy', age: '1 year 6 months', imageUrl: 'assets/images/doggy.jpg'),
    Pet(name: 'Fluffy', age: '2 years', imageUrl: 'assets/images/catty.jpg', isVaccinated: true),
    Pet(name: 'Buddy', age: '1 year 6 months', imageUrl: 'assets/images/doggy.jpg'),
    Pet(name: 'Fluffy', age: '2 years', imageUrl: 'assets/images/catty.jpg', isVaccinated: true),
    Pet(name: 'Buddy', age: '1 year 6 months', imageUrl: 'assets/images/doggy.jpg'),
    Pet(name: 'Fluffy', age: '2 years', imageUrl: 'assets/images/catty.jpg', isVaccinated: true),
    Pet(name: 'Buddy', age: '1 year 6 months', imageUrl: 'assets/images/doggy.jpg'),
    // Add more pets as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pet Adoption App',
            style: TextStyle(
              fontFamily: 'Pacifico',
            ),
          ),
          backgroundColor: Colors.deepPurple[100],
        ),
        drawer: Drawer(
          child: Container(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('John Doe',
                    style: TextStyle(
                    fontFamily: 'Pacifico',
                  ),),
                  accountEmail: Text('john.doe@example.com', style: TextStyle(
                    fontFamily: 'Pacifico',
                  ),),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/propic.jpg'),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/cover_photo.jpg'), // Replace with your cover photo path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white, // Set the lower section color
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.deepPurple),
                        title: Text('123 Main Street, Cityville'),
                        onTap: () {
                          // Handle address section tap
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.exit_to_app, color: Colors.deepPurple),
                        title: Text('Log Out'),
                        onTap: () {
                          // Handle log out tap
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        body: ListView.builder(
          itemCount: pets.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.deepPurple[100],
              elevation: 3, // Set the elevation for the card
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Adjust margin as needed
              child: ListTile(
                contentPadding: EdgeInsets.all(16), // Adjust padding as needed
                leading: CircleAvatar(
                  backgroundImage: AssetImage(pets[index].imageUrl),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pets[index].name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Vaccinated:'),
                        SizedBox(width: 5),
                        pets[index].isVaccinated
                            ? Icon(Icons.check, color: Colors.green)
                            : Icon(Icons.clear, color: Colors.red),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Age: ${pets[index].age}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Add your logic for the accept button
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Request Sent to Owner',
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                          ),
                        ),
                        backgroundColor: Colors.deepPurple,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: Text('Accept'),
                ),
              ),
            );
          },
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital, color: Colors.deepPurple),
              label: 'Doctors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Colors.deepPurple),
              label: 'Day Care',
            ),
          ],
          onTap: (index) {
            // Handle BottomNavigationBarItem taps
            if (index == 0) {
              // Navigate to DoctorAppointmentApp page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorAppointmentApp()),
              );
            } else {
              // Handle other tabs if needed
            }
          },
        ),
      ),
    );
  }
}

