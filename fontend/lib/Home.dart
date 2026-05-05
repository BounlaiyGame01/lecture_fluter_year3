import 'package:flutter/material.dart';
import 'package:my_applecture/MenuPage/DrawwerPage.dart';
import 'package:my_applecture/Page/MenuBasePage.dart';
import 'package:my_applecture/Page/showMyModalButtonSheet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.wifi,
                          size: 30,
                          color: const Color.fromARGB(255, 0, 255, 191),
                        ),
                      ),
                      title: Text("Wi-Fi"),
                      onTap: () {
                        Navigator.pop(context);
                        // Add Wi-Fi settings functionality
                      },
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.settings,
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text("Settings"),
                      onTap: () {
                        Navigator.pop(context);
                        // Add settings functionality
                      },
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.account_circle,
                          size: 30,
                          color: Colors.green,
                        ),
                      ),
                      title: Text("Account"),
                      onTap: () {
                        Navigator.pop(context);
                        // Add account settings functionality
                      },
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.orange,
                        ),
                      ),
                      title: Text("Notifications"),
                      onTap: () {
                        Navigator.pop(context);
                        // Add notifications settings
                      },
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.language,
                          size: 30,
                          color: Colors.purple,
                        ),
                      ),
                      title: Text("Language"),
                      onTap: () {
                        Navigator.pop(context);
                        // Add language settings
                      },
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.help, size: 30, color: Colors.teal),
                      ),
                      title: Text("Help & Support"),
                      onTap: () {
                        Navigator.pop(context);
                        // Add help functionality
                      },
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.logout, size: 30, color: Colors.red),
                      ),
                      title: Text("Logout"),
                      onTap: () {
                        Navigator.pop(context);
                        // Add logout functionality
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
          backgroundColor: Colors.blueAccent,
          title: const Text("Home Page", style: TextStyle(color: Colors.white)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    icon: Icon(Icons.folder, color: Colors.blueAccent),
                    text: "ຈັດການຂໍ້ມູນພື້ນຖານ",
                  ),
                  Tab(
                    icon: Icon(Icons.shopping_bag, color: Colors.blueAccent),
                    text: "ຂາຍ",
                  ),
                  Tab(
                    icon: Icon(Icons.import_export, color: Colors.blueAccent),
                    text: "ນຳເຂົ້າ",
                  ),
                  Tab(
                    icon: Icon(Icons.search, color: Colors.blueAccent),
                    text: "ຄົ້ນຫາ",
                  ),
                  Tab(
                    icon: Icon(Icons.edit_document, color: Colors.blueAccent),
                    text: "ລາຍງານ",
                  ),
                  Tab(
                    icon: Icon(Icons.info, color: Colors.blueAccent),
                    text: "About",
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawwerpage(),
        backgroundColor: Colors.grey.shade300,
        body: TabBarView(
          children: [
            MenuBasePage(),
            Text("ຂາຍ"),
            Text("ນຳເຂົ້າ"),
            Text("ຄົ້ນຫາ"),
            Text("ລາຍງານ"),
            Text("About"),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: Colors.transparent,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
              if (index == 2) {
                showMyModalButtonSheet(context);
              }
            },
            selectedItemColor: Colors.white,
            selectedFontSize: 14,
            type: BottomNavigationBarType.fixed,
            elevation: 10,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 30),
                label: "Setting",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_repair_service, size: 30),
                label: "Service",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
