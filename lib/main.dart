import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Planner',
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class Trip {
  final String destination;
  final String dateRange;
  final String itinerary;
  final String imageUrl;

  Trip({
    required this.destination,
    required this.dateRange,
    required this.itinerary,
    required this.imageUrl,
  });
}

class Destination {
  final String name;
  final String country;
  final String description;
  final String imageUrl;

  Destination({
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
  });
}

class TripRepository {
  final List<Trip> _trips = [
    Trip(
      destination: 'Paris',
      dateRange: '10-15 Oct 2024',
      itinerary:
          'Visit Eiffel Tower, Louvre Museum, and stroll through Montmartre.',
      imageUrl:
          'https://images.pexels.com/photos/338515/pexels-photo-338515.jpeg',
    ),
    Trip(
      destination: 'Tokyo',
      dateRange: '20-25 Nov 2024',
      itinerary: 'See Shibuya Crossing, visit Senso-ji, and explore Harajuku.',
      imageUrl:
          'https://images.pexels.com/photos/2506923/pexels-photo-2506923.jpeg',
    ),
    Trip(
      destination: 'New York',
      dateRange: '5-10 Dec 2024',
      itinerary: 'Visit Central Park, Statue of Liberty, and Times Square.',
      imageUrl:
          'https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg',
    ),
    Trip(
      destination: 'Rome',
      dateRange: '15-20 Jan 2025',
      itinerary: 'Tour the Colosseum, Roman Forum, and Vatican City.',
      imageUrl:
          'https://images.pexels.com/photos/356854/pexels-photo-356854.jpeg',
    ),
    Trip(
      destination: 'Sydney',
      dateRange: '25-30 Feb 2025',
      itinerary:
          'See the Opera House, climb the Harbour Bridge, and relax at Bondi Beach.',
      imageUrl:
          'https://images.pexels.com/photos/2193300/pexels-photo-2193300.jpeg',
    ),
    Trip(
      destination: 'Rio de Janeiro',
      dateRange: '10-15 Mar 2025',
      itinerary:
          'Visit Christ the Redeemer, Sugarloaf Mountain, and Copacabana Beach.',
      imageUrl:
          'https://images.pexels.com/photos/756781/pexels-photo-756781.jpeg',
    ),
    Trip(
      destination: 'Cape Town',
      dateRange: '20-25 Apr 2025',
      itinerary: 'Explore Table Mountain, V&A Waterfront, and Robben Island.',
      imageUrl:
          'https://images.pexels.com/photos/167473/pexels-photo-167473.jpeg',
    ),
  ];

  List<Trip> getAllTrips() {
    return _trips;
  }
}

class DestinationRepository {
  final List<Destination> _destinations = [
    Destination(
      name: 'Paris',
      country: 'France',
      description:
          'The City of Lights, famous for its culture and architecture.',
      imageUrl:
          'https://images.pexels.com/photos/338515/pexels-photo-338515.jpeg',
    ),
    Destination(
      name: 'Tokyo',
      country: 'Japan',
      description:
          'A city blending tradition with modern technology, and full of vibrant districts.',
      imageUrl:
          'https://images.pexels.com/photos/739407/pexels-photo-739407.jpeg',
    ),
    Destination(
      name: 'New York',
      country: 'USA',
      description:
          'The city that never sleeps, known for its iconic skyline and landmarks.',
      imageUrl:
          'https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg',
    ),
    Destination(
      name: 'Rome',
      country: 'Italy',
      description:
          'A city steeped in history, with ancient ruins and Renaissance art.',
      imageUrl:
          'https://images.pexels.com/photos/356854/pexels-photo-356854.jpeg',
    ),
    Destination(
      name: 'Sydney',
      country: 'Australia',
      description:
          'Known for its Sydney Opera House, Harbour Bridge, and beautiful beaches.',
      imageUrl:
          'https://images.pexels.com/photos/2193300/pexels-photo-2193300.jpeg',
    ),
    Destination(
      name: 'Rio de Janeiro',
      country: 'Brazil',
      description:
          'Famous for its Carnival, Christ the Redeemer, and breathtaking beaches.',
      imageUrl:
          'https://images.pexels.com/photos/756781/pexels-photo-756781.jpeg',
    ),
    Destination(
      name: 'Cape Town',
      country: 'South Africa',
      description:
          'A port city beneath Table Mountain, known for its stunning landscapes.',
      imageUrl:
          'https://images.pexels.com/photos/167473/pexels-photo-167473.jpeg',
    ),
  ];

  List<Destination> getAllDestinations() {
    return _destinations;
  }

  List<Destination> getFavoriteDestinations() {
    return [_destinations[0], _destinations[1]];
  }
}

class FavoritesRepository {
  final List<Destination> _favorites = [
    Destination(
      name: 'New York',
      country: 'USA',
      description:
          'The city that never sleeps, known for its iconic skyline and landmarks.',
      imageUrl:
          'https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg',
    ),
    Destination(
      name: 'Rome',
      country: 'Italy',
      description:
          'A city steeped in history, with ancient ruins and Renaissance art.',
      imageUrl:
          'https://images.pexels.com/photos/356854/pexels-photo-356854.jpeg',
    ),
    Destination(
      name: 'Cape Town',
      country: 'South Africa',
      description:
          'A port city beneath Table Mountain, known for its stunning landscapes.',
      imageUrl:
          'https://images.pexels.com/photos/167473/pexels-photo-167473.jpeg',
    ),
  ];

  List<Destination> getFavorites() {
    return _favorites;
  }

  void addFavorite(Destination destination) {
    if (!_favorites.contains(destination)) {
      _favorites.add(destination);
      log('${destination.name} added to favorites');
    }
  }

  void removeFavorite(Destination destination) {
    _favorites.remove(destination);
    log('${destination.name} removed from favorites');
  }

  bool isFavorite(Destination destination) {
    return _favorites.contains(destination);
  }
}

class SettingsRepository {
  bool _darkMode = false;
  String _fontSize = 'Medium';
  String _language = 'English';
  bool _privacyMode = false;
  String _distanceUnit = 'Kilometers';

  bool getDarkMode() => _darkMode;
  String getFontSize() => _fontSize;
  String getLanguage() => _language;
  bool getPrivacyMode() => _privacyMode;
  String getDistanceUnit() => _distanceUnit;

  void setDarkMode(bool value) {
    _darkMode = value;
    log('Dark Mode set to: $_darkMode');
  }

  void setFontSize(String value) {
    _fontSize = value;
    log('Font Size set to: $_fontSize');
  }

  void setLanguage(String value) {
    _language = value;
    log('Language set to: $_language');
  }

  void setPrivacyMode(bool value) {
    _privacyMode = value;
    log('Privacy Mode set to: $_privacyMode');
  }

  void setDistanceUnit(String value) {
    _distanceUnit = value;
    log('Distance Unit set to: $_distanceUnit');
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  final FavoritesRepository favoritesRepository = FavoritesRepository();
  final TripRepository tripRepository = TripRepository();

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(
        favoritesRepository: widget.favoritesRepository,
        tripRepository: widget.tripRepository,
      ),
      ExploreScreen(),
      FavoritesScreen(
        favoritesRepository: widget.favoritesRepository,
      ),
      const SettingsScreen(),
    ];
  }

  final List<String> _appBarTitles = [
    'Home',
    'Explore Destinations',
    'Favorite Destinations',
    'Settings',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitles[_selectedIndex],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal[700],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => const TextStyle(color: Colors.white),
          ),
          indicatorColor: Colors.teal,
        ),
        child: NavigationBar(
          backgroundColor: Colors.teal[800],
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home, color: Colors.white70),
              selectedIcon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore, color: Colors.white70),
              selectedIcon: Icon(Icons.explore, color: Colors.white),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite, color: Colors.white70),
              selectedIcon: Icon(Icons.favorite, color: Colors.white),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings, color: Colors.white70),
              selectedIcon: Icon(Icons.settings, color: Colors.white),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final TripRepository tripRepository;
  final FavoritesRepository favoritesRepository;

  const HomeScreen(
      {super.key,
      required this.tripRepository,
      required this.favoritesRepository});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final trips = widget.tripRepository.getAllTrips();
    final favoriteDestinations = widget.favoritesRepository.getFavorites();
    final secretTip = trips.isNotEmpty ? trips[0] : null;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recommended Trips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Carousel(
            trips: trips,
            secretTip: secretTip,
            favoriteDestination: favoriteDestinations.isNotEmpty
                ? favoriteDestinations[0]
                : null,
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Explore Popular Destinations',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: trips.length > 3 ? 3 : trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return TripCard(
                trip: trip,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TripDetailsScreen(trip: trip)),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Upcoming Trips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: trips.length > 5 ? 5 : trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return ListTile(
                title: Text(trip.destination),
                subtitle: Text(trip.dateRange),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(trip.imageUrl),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TripDetailsScreen(trip: trip)),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  final List<Trip> trips;
  final Trip? secretTip;
  final Destination? favoriteDestination;

  const Carousel(
      {super.key,
      required this.trips,
      this.secretTip,
      this.favoriteDestination});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView(
        controller: PageController(viewportFraction: 0.8),
        children: [
          if (secretTip != null)
            CarouselItem(trip: secretTip!, label: 'Secret Tip!'),
          if (favoriteDestination != null)
            CarouselItem(
                destination: favoriteDestination!,
                label: 'From Your Favorites'),
          ...trips.map((trip) => CarouselItem(trip: trip)),
        ],
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final Trip? trip;
  final Destination? destination;
  final String? label;

  const CarouselItem({super.key, this.trip, this.destination, this.label});

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        trip != null ? trip!.imageUrl : destination!.imageUrl;
    final String title = trip != null ? trip!.destination : destination!.name;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => trip == null
            ? DestinationDetailsScreen(destination: destination!)
            : TripDetailsScreen(trip: trip!),
      )),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (label != null)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  label!,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  final DestinationRepository destinationRepository = DestinationRepository();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final destinations = destinationRepository.getAllDestinations();

    return ListView.builder(
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        final destination = destinations[index];
        return DestinationCard(
          destination: destination,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DestinationDetailsScreen(destination: destination)),
            );
          },
        );
      },
    );
  }
}

class FavoritesScreen extends StatefulWidget {
  final FavoritesRepository favoritesRepository;

  const FavoritesScreen({super.key, required this.favoritesRepository});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    List<Destination> favorites = widget.favoritesRepository.getFavorites();

    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final destination = favorites[index];
        return FavoriteCard(
          destination: destination,
          favoritesRepository: widget.favoritesRepository,
          onRemove: () {
            setState(() {});
          },
        );
      },
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsRepository settingsRepository = SettingsRepository();

  @override
  Widget build(BuildContext context) {
    bool darkMode = settingsRepository.getDarkMode();
    String fontSize = settingsRepository.getFontSize();
    String language = settingsRepository.getLanguage();
    bool privacyMode = settingsRepository.getPrivacyMode();
    String distanceUnit = settingsRepository.getDistanceUnit();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Settings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            SwitchListTile(
              title: const Text('Dark Mode'),
              subtitle: const Text('Enable dark theme for the app'),
              value: darkMode,
              onChanged: (bool value) {
                setState(() {
                  settingsRepository.setDarkMode(value);
                });
              },
              activeColor: Colors.teal,
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Font Size'),
              subtitle: const Text('Adjust the font size in the app'),
              trailing: DropdownButton<String>(
                value: fontSize,
                items: <String>['Small', 'Medium', 'Large'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    settingsRepository.setFontSize(newValue!);
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Language'),
              subtitle: const Text('Choose app language'),
              trailing: DropdownButton<String>(
                value: language,
                items: <String>['English', 'Spanish', 'French', 'German']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    settingsRepository.setLanguage(newValue!);
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Privacy Mode'),
              subtitle: const Text('Hide sensitive trip details'),
              value: privacyMode,
              onChanged: (bool value) {
                setState(() {
                  settingsRepository.setPrivacyMode(value);
                });
              },
              activeColor: Colors.teal,
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Distance Unit'),
              subtitle: const Text('Choose between kilometers or miles'),
              trailing: DropdownButton<String>(
                value: distanceUnit,
                items: <String>['Kilometers', 'Miles'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    settingsRepository.setDistanceUnit(newValue!);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripDetailsScreen extends StatelessWidget {
  final Trip trip;

  const TripDetailsScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.destination),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(trip.imageUrl, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text('Dates: ${trip.dateRange}',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              const Text('Itinerary:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(trip.itinerary, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[600]),
                child: const Text(
                  'Go Back',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteDetailsScreen extends StatelessWidget {
  final Destination destination;
  final FavoritesRepository favoritesRepository;

  const FavoriteDetailsScreen(
      {super.key,
      required this.destination,
      required this.favoritesRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(destination.imageUrl, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text('Country: ${destination.country}',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              const Text('Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(destination.description,
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  favoritesRepository.removeFavorite(destination);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'Remove from Favorites',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DestinationDetailsScreen extends StatelessWidget {
  final Destination destination;

  const DestinationDetailsScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(destination.imageUrl, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text('Country: ${destination.country}',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              const Text('Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(destination.description,
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[600]),
                child: const Text(
                  'Go Back',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final Trip trip;
  final VoidCallback onTap;

  const TripCard({super.key, required this.trip, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      color: Colors.blueGrey[50],
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(trip.imageUrl,
                    width: 80, height: 80, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(trip.destination,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(trip.dateRange,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback onTap;

  const DestinationCard(
      {super.key, required this.destination, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.teal.shade300, width: 2),
      ),
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(destination.imageUrl,
                    width: 80, height: 80, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(destination.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(destination.country,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback onRemove;
  final FavoritesRepository favoritesRepository;

  const FavoriteCard({
    super.key,
    required this.destination,
    required this.onRemove,
    required this.favoritesRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      color: Colors.amber[100],
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteDetailsScreen(
                    destination: destination,
                    favoritesRepository: favoritesRepository,
                  ),
                ),
              ).then((_) => onRemove()); // Refresh list when navigating back
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(destination.imageUrl,
                        width: 80, height: 80, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(destination.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(destination.country,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700])),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                favoritesRepository.removeFavorite(destination);
                onRemove(); // Callback to refresh the list
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
