import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'profile_screen.dart'; // pastikan file ini ada

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> services = const [
    {"icon": Icons.local_taxi, "label": "Transport"},
    {"icon": Icons.fastfood, "label": "Food"},
    {"icon": Icons.local_grocery_store, "label": "Mart"},
    {"icon": Icons.local_hospital, "label": "Health"},
    {"icon": Icons.phone_android, "label": "Pulsa"},
    {"icon": Icons.more_horiz, "label": "More"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GoLife",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          // Banner
          Container(
            margin: const EdgeInsets.all(12),
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green[200],
              image: const DecorationImage(
                image: NetworkImage("https://picsum.photos/400/200"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Grid menu
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: services.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          title: services[index]["label"],
                          description:
                              "Ini adalah detail dari layanan ${services[index]["label"]}.",
                          imageUrl: "https://picsum.photos/400/200",
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green[100],
                        child: Icon(
                          services[index]["icon"],
                          size: 30,
                          color: Colors.green[800],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        services[index]["label"],
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 2) {
            // Kalau pencet Account, pindah ke ProfileScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Activity",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
