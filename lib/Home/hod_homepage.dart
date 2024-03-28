/*import 'package:attendance_app/CSE/cse_a.dart';
import 'package:attendance_app/CSE/cse_b.dart';
import 'package:attendance_app/CSE/cse_c.dart';
import 'package:attendance_app/CSE/cse_d.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class hod_homepage extends StatelessWidget {
  const hod_homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeatureScreen(),
    );
  }
}

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({Key? key}) : super(key: key);

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  bool isHelpPressed = false;
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["CSE-A", "assets/efil.png", true],
    ["CSE-B", "assets/cstatus.png", false],
    ["CSE-C", "assets/calender.png", false],
    ["CSE-D", "assets/repository.png", false],
  ];

  // power button switched

  void toggleHelpPressed() {
    setState(() {
      isHelpPressed = !isHelpPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 215, 160),
      drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    border: Border.symmetric(),
                    //color: Color.fromARGB(255, 183, 179, 179)
                    color: Color.fromARGB(255, 159, 76, 31),
                  ),
                  child: Center(
                    child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 159, 76, 31),
                        radius: 150,
                        child: Center(
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage:
                                AssetImage('assets/images/griet_logo.png'),
                            backgroundColor: Colors.transparent,
                          ),
                        )),
                  )),
              //Image.asset('assets/images/profile.jpg')),
              ListBody(
                children: [
                  Padding(padding: EdgeInsets.only(left: 100, top: 10)),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            'Home',
                            style: TextStyle(
                                color: Color.fromARGB(255, 43, 45, 47),
                                fontSize: 20),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text(
                            'Profile',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 48, 50, 51),
                                fontSize: 20),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text(
                            'Settings',
                            style: TextStyle(
                                color: Color.fromARGB(255, 47, 48, 48),
                                fontSize: 20),
                          ),
                          onTap: () {},
                        ),
                      ])
                ],
              )
            ],
          )),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("GRIET"),
        backgroundColor: Color.fromARGB(255, 159, 76, 31),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_outlined),
            onPressed: toggleHelpPressed,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),

            const SizedBox(height: 20),

            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome ,",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                  Text(
                    'HOD',
                    style: GoogleFonts.bebasNeue(fontSize: 72),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 107, 105, 105),
              ),
            ),

            const SizedBox(height: 25),

            // smart devices grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            ),
            const SizedBox(height: 10),

            // grid
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                //physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;

  SmartDeviceBox({
    Key? key,
    required this.smartDeviceName,
    required this.iconPath,

    // Include onChanged as an optional parameter
  }) : super(key: key);

  void _navigateToDevicePage(BuildContext context) {
    // Define a map to associate device names with their respective page classes
    final devicePageRoutes = {
      "CSE-A": cse_a(),
      "CSE-B": cse_b(),
      "CSE-C": cse_c(),
      "CSE-D": cse_d(),
    };

    // Get the corresponding page based on the device name
    final devicePage = devicePageRoutes[smartDeviceName];

    if (devicePage != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => devicePage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDevicePage(context),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.grey[900],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // icon

                    // smart device name + switch
                    Row(
                      children: [
                        Center(
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, left: 45, top: 60),
                              child: Text(
                                smartDeviceName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/

/*import 'package:attendance_app/CSE/cse_a.dart';
import 'package:attendance_app/CSE/cse_b.dart';
import 'package:attendance_app/CSE/cse_c.dart';
import 'package:attendance_app/CSE/cse_d.dart';
import 'package:attendance_app/CSE/cse_e.dart';
import 'package:attendance_app/CSE/cse_f.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class hod_homepage extends StatelessWidget {
  const hod_homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeatureScreen(),
    );
  }
}

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({Key? key}) : super(key: key);

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  bool isHelpPressed = false;
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["CSE-A", "assets/efil.png", true],
    ["CSE-B", "assets/cstatus.png", false],
    ["CSE-C", "assets/calender.png", false],
    ["CSE-D", "assets/repository.png", false],
    ["CSE-E", "assets/device_e.png", false], // Added CSE-E
    ["CSE-F", "assets/device_f.png", false], // Added CSE-F
  ];

  // power button switched

  void toggleHelpPressed() {
    setState(() {
      isHelpPressed = !isHelpPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 215, 160),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer content here
            // ...
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("GRIET"),
        backgroundColor: Color.fromARGB(255, 159, 76, 31),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_outlined),
            onPressed: toggleHelpPressed,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App bar
            // ...

            const SizedBox(height: 20),

            // Welcome home
            // ...

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 107, 105, 105),
              ),
            ),

            const SizedBox(height: 25),

            // Smart devices grid
            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;

  SmartDeviceBox({
    Key? key,
    required this.smartDeviceName,
    required this.iconPath,
  }) : super(key: key);

  void _navigateToDevicePage(BuildContext context) {
    // Define a map to associate device names with their respective page classes
    final devicePageRoutes = {
      "CSE-A": cse_a(),
      "CSE-B": cse_b(),
      "CSE-C": cse_c(),
      "CSE-D": cse_d(),
      "CSE-E": cse_e(), // Replace cse_e() with your actual CSE-E page class
      "CSE-F": cse_f(), // Replace cse_f() with your actual CSE-F page class
    };

    // Get the corresponding page based on the device name
    final devicePage = devicePageRoutes[smartDeviceName];

    if (devicePage != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => devicePage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDevicePage(context),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.grey[900],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icon or other visual representation of the device
                    // ...

                    // Smart device name
                    Row(
                      children: [
                        Center(
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                                left: 45,
                                top: 60,
                              ),
                              child: Text(
                                smartDeviceName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/

import 'package:attendance_app/CSE/cse_a.dart';
import 'package:attendance_app/CSE/cse_b.dart';
import 'package:attendance_app/CSE/cse_c.dart';
import 'package:attendance_app/CSE/cse_d.dart';
import 'package:attendance_app/CSE/cse_e.dart';
import 'package:attendance_app/CSE/cse_f.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class hod_homepage extends StatelessWidget {
  const hod_homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeatureScreen(),
    );
  }
}

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({Key? key}) : super(key: key);

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  bool isHelpPressed = false;
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["CSE-A", "assets/efil.png", true],
    ["CSE-B", "assets/cstatus.png", false],
    ["CSE-C", "assets/calender.png", false],
    ["CSE-D", "assets/repository.png", false],
    ["CSE-E", "assets/device_e.png", false], // Added CSE-E
    ["CSE-F", "assets/device_f.png", false], // Added CSE-F
  ];

  // power button switched

  void toggleHelpPressed() {
    setState(() {
      isHelpPressed = !isHelpPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 215, 160),
      drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    border: Border.symmetric(),
                    //color: Color.fromARGB(255, 183, 179, 179)
                    color: Color.fromARGB(255, 159, 76, 31),
                  ),
                  child: Center(
                    child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 159, 76, 31),
                        radius: 150,
                        child: Center(
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage:
                                AssetImage('assets/images/griet_logo.png'),
                            backgroundColor: Colors.transparent,
                          ),
                        )),
                  )),
              //Image.asset('assets/images/profile.jpg')),
              ListBody(
                children: [
                  Padding(padding: EdgeInsets.only(left: 100, top: 10)),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            'Home',
                            style: TextStyle(
                                color: Color.fromARGB(255, 43, 45, 47),
                                fontSize: 20),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text(
                            'Profile',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 48, 50, 51),
                                fontSize: 20),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text(
                            'Settings',
                            style: TextStyle(
                                color: Color.fromARGB(255, 47, 48, 48),
                                fontSize: 20),
                          ),
                          onTap: () {},
                        ),
                      ])
                ],
              )
            ],
          )),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("GRIET"),
        backgroundColor: Color.fromARGB(255, 159, 76, 31),
        actions: [
          /*IconButton(
            icon: const Icon(Icons.help_outline_outlined),
            onPressed: toggleHelpPressed,
          ),*/
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App bar
            // ...

            const SizedBox(height: 50),

            // Welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome,",
                    style: TextStyle(fontSize: 25, color: Colors.grey.shade800),
                  ),
                  Text(
                    'DR.B.Sankara Babu',
                    style: GoogleFonts.bebasNeue(fontSize: 45),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 107, 105, 105),
              ),
            ),

            const SizedBox(height: 25),

            // Smart devices grid
            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;

  SmartDeviceBox({
    Key? key,
    required this.smartDeviceName,
    required this.iconPath,
  }) : super(key: key);

  void _navigateToDevicePage(BuildContext context) {
    // Define a map to associate device names with their respective page classes
    final devicePageRoutes = {
      "CSE-A": cse_a(),
      "CSE-B": cse_b(),
      "CSE-C": cse_c(),
      "CSE-D": cse_d(),
      "CSE-E": cse_e(), // Replace cse_e() with your actual CSE-E page class
      "CSE-F": cse_f(), // Replace cse_f() with your actual CSE-F page class
    };

    // Get the corresponding page based on the device name
    final devicePage = devicePageRoutes[smartDeviceName];

    if (devicePage != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => devicePage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDevicePage(context),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.grey[900],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Center(
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, left: 30, top: 45),
                              child: Text(
                                smartDeviceName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Define your CSE-A, CSE-B, CSE-C, CSE-D, CSE-E, and CSE-F page classes here
