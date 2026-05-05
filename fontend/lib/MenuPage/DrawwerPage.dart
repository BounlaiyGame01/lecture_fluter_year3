import 'package:flutter/material.dart';

class Drawwerpage extends StatelessWidget {
  const Drawwerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue.shade300),
              accountName: Text(
                "Script Store",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text("Bounlaiyhi14@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("Image/icon.png"),
                backgroundColor: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.folder,
                color: const Color.fromARGB(255, 0, 204, 255),
              ),
              title: Text(
                "ຈັດການຂໍ້ມູນພື້ນຖານ",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: const Color.fromARGB(255, 0, 204, 255),
              ),
              title: Text("ຂາຍ", style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.arrow_forward,
                color: const Color.fromARGB(255, 0, 204, 255),
              ),
              title: Text("ສັ່ງຊື້", style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.download,
                color: const Color.fromARGB(255, 0, 204, 255),
              ),
              title: Text("ນຳເຂົ້າ", style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.search,
                color: const Color.fromARGB(255, 0, 204, 255),
              ),
              title: Text("ຄົ້ນຫາ", style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.description,
                color: const Color.fromARGB(255, 0, 204, 255),
              ),
              title: Text("ລາຍງານ", style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
