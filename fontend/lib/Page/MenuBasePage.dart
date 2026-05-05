import 'package:flutter/material.dart';
import 'package:my_applecture/Sub_Menu_Page/Unitpage.dart';
import 'package:my_applecture/Page/BookPage.dart';

double size_icon = 100;
List color = [Colors.blue];
List icon = [
  Icon(Icons.ac_unit, size: size_icon, color: color[0]),
  Icon(Icons.category, size: size_icon, color: color[0]),
  Icon(Icons.folder_outlined, size: size_icon, color: color[0]),
  Icon(Icons.account_balance, size: size_icon, color: color[0]),
  Icon(Icons.delivery_dining_outlined, size: size_icon, color: color[0]),
  Icon(Icons.currency_exchange, size: size_icon, color: color[0]),
  Icon(Icons.book, size: size_icon, color: color[0]),
];

List data = [
  "ຫົວໜວຍ",
  "ປະເພດສິນຄ້າ",
  "ສິນຄ້າ",
  "ຜູ້ສະໜອງສິນຄ້າ",
  "ພະນັກງານ",
  "ອັດຕາແລກປ່ຽນ",
  "ຈັດການຂໍ້ມູນປື້ມ",
];

double font_size = 20;
String font = 'NotoSansLao';

class MenuBasePage extends StatefulWidget {
  const MenuBasePage({super.key});

  @override
  State<MenuBasePage> createState() => _MenuBasePageState();
}

class _MenuBasePageState extends State<MenuBasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (c, idx) {
            return InkWell(
              onTap: () {
                Widget page;
                if (data[idx] == "ຈັດການຂໍ້ມູນປື້ມ") {
                  page = Bookpage();
                } else {
                  page = Unitpage();
                }
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => page,
                );
                Navigator.of(context).push(route);
              },
              child: Card(
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    icon[idx],
                    Spacer(),
                    Text(
                      data[idx],
                      style: TextStyle(
                        fontSize: font_size,
                        fontFamily: font,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
