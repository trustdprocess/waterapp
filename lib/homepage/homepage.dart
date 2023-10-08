import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterapp/login/login.dart';
import 'package:waterapp/theme/theme.dart';
import 'package:waterapp/themeChanger/mode.dart';

class ServiceItem {
  final String title;
  final String imageAsset;
  final String route; // Add route to navigate to

  ServiceItem(this.title, this.imageAsset, this.route);
}

class homepage extends StatefulWidget {
  const homepage({Key? key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
    int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
   
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  late String greeting;
  int _currentindex = 0;
    Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => loginpage()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;

    if (currentHour < 12) {
      greeting = 'Good morning';
    } else if (currentHour < 17) {
      greeting = 'Good afternoon';
    } else {
      greeting = 'Good evening';
    }
  }

  final List<ServiceItem> services = [
    ServiceItem(
        "Water Cycle",
        "https://i.pinimg.com/originals/8f/70/26/8f7026c2c1c526e0fbc09655fba472ed.jpg",
        '/watersystem'),
    ServiceItem(
        "Fresh Water",
        "https://hpfreshwaterbiome.weebly.com/uploads/5/7/1/8/57185433/9699331_orig.jpg",
        '/freshwater'), // Navigate to '/plumber' route
    ServiceItem(
        "Global Warming",
        "https://media.meer.com/attachments/dde569675ec6995b257e28105b069680a5867625/store/fill/860/645/3f79b8e7adc92e7a32ee43a95294de6da0173de68b87eb84382dd65547e7/Re-thinking-global-warming.jpg",
        '/globalwarming'), // Navigate to '/carpenter' route
    ServiceItem(
        "Impact",
        "https://images.pexels.com/photos/11996445/pexels-photo-11996445.jpeg",
        '/solution'), // Navigate to '/barber' route
  ];

  @override
  Widget build(BuildContext context) {
      final theme = Provider.of<themeChanger>(context);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
      
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Quiz',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      
      appBar: AppBar(
       elevation: 0,
        actions: [
          IconButton(
              onPressed: _logout,
              
              icon: theme.defaultTheme == lightmode
                  ? Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    )),
          IconButton(
            onPressed: () {
              theme.toggle();
            },
            icon: theme.defaultTheme == darkmode
                ? Icon(
                    CupertinoIcons.moon,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.sunny,
                    color: Colors.yellow,
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 4.0, bottom: 2.0),
                child:theme.defaultTheme==lightmode?
                Text(
                  "Hello" + ",",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ): Text(
                  "Hello" + ",",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 2.0, bottom: 16.0),
                child: Text(
                 
                  "$greeting!",
                  style:theme.defaultTheme==lightmode?TextStyle(

                      fontSize: 30,
                      
                      color: Colors.black,
                      fontWeight: FontWeight.bold): TextStyle(

                      fontSize: 30,
                      
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "How Can We Help You?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(height: 40),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: services.map((service) {
                return InkWell(
                  onTap: () {
                    // Navigate to the specified route when tapped
                    Navigator.pushNamed(context, service.route);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(service.imageAsset,height: 250,width: 300,fit: BoxFit.cover,)),
                          SizedBox(height: 10),
                          Text(
                            service.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
