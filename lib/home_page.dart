import 'package:amexwallet/provider/auth_provider.dart';
import 'package:amexwallet/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'screens/welcome_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text("Dashboard"),
            actions: [
              IconButton(
                onPressed: () {
                  ap.userSignOut().then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        ),
                      );
                },
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: Text(
                    "Explore!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('View Profile Information'),
                  onTap: () {
                    // add logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading : Image.asset('lib/icons/transaction.png'),
                  title: const Text("View Wallet History"),
                ),
                // ListTile(
                //   leading: Icon(Icons.contact_phone),
                //   title: Text('Contact Us'),
                //   onTap: () {
                //     // add logic here
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ContactUs(),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                // Container(
                //   color: Colors.purple,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: const [
                //         // Container(
                //         //   child: Drawer(
                //         //     child: ListView(
                //         //       padding: EdgeInsets.zero,
                //         //       children: [
                //         //         DrawerHeader(
                //         //           child: Text('Hi User'),
                //         //           decoration: BoxDecoration(
                //         //             color: Colors.blue,
                //         //           ),
                //         //         ),
                //         //         ListTile(
                //         //           title: Text('View Profile'),
                //         //           onTap: () {
                //         //             // Update the UI by swapping the widget in the main content area
                //         //             Navigator.push(
                //         //               context,
                //         //               MaterialPageRoute(
                //         //                 builder: (context) => const HomeScreen(),
                //         //               ),
                //         //             );
                //         //           },
                //         //         ),
                //         //         // ListTile(
                //         //         //   title: Text('Item 2'),
                //         //         //   onTap: () {
                //         //         //     // Update the UI by swapping the widget in the main content area
                //         //         //   },
                //         //         // ),
                //         //         // ListTile(
                //         //         //   title: Text('Item 3'),
                //         //         //   onTap: () {
                //         //         //     // Update the UI by swapping the widget in the main content area
                //         //         //   },
                //         //         // ),
                //         //       ],
                //         //     ),
                //         //   ),
                //         // ),
                //         Padding(
                //           padding: EdgeInsets.all(8.0),
                //           child: Text(
                //             'Dashboard',
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 26,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //         Icon(Icons.exit_to_app),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(height: 10),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Balance',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Rs. 2500.30',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '**** 1234',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '10/24',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                //list tiles for add money, pay money etc
                Expanded(
                  child: ListView(
                    children: [
                      Material(
                        child: ListTile(
                          leading: Image.asset(
                            'lib/icons/money.png',
                            width: 58.0,
                            height: 58.0,
                          ),
                          title: const Text(
                            'Add Money',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_right),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                        child: ListTile(
                          leading: Image.asset(
                            'lib/icons/send-money.png',
                            width: 58.0,
                            height: 58.0,
                          ),
                          title: const Text(
                            'Send Money',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_right),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
