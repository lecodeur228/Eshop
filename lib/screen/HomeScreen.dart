
import 'package:ecommerce/models/data.dart';
import 'package:ecommerce/screen/detailScreen.dart';
import 'package:ecommerce/widgets/InkWellWidget.dart';
import 'package:ecommerce/widgets/cardWidget.dart';
import 'package:ecommerce/widgets/columnCardWidget.dart';
import 'package:ecommerce/widgets/containerWidget.dart';
import 'package:ecommerce/widgets/iconWidget.dart';
import 'package:ecommerce/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List dataProd = [];
  Map items = {};
  String selectedValue = 'Option 1';
  String newValue = '';
  int proIndex = 0;
  //recuperer les données depuis api

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Data().getApiData().then((value) {
      setState(() {
        dataProd = value;
        print("ok");
      });
    });
  }

  void changeValue() {
    setState(() {
      selectedValue = newValue;
    });
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final heigth = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        leading: IconWidget(Icons.sort, Colors.black, 30),
        actions: [
          IconButton(
            onPressed: null,
            icon: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -12),
              badgeContent: const Text(
                '2',
                style: TextStyle(color: Colors.white),
              ),
              child: IconWidget(Icons.shopping_bag, Colors.black, 30),
            ),
          )
        ],
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            text: 'E - ',
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(text: 'S H O P ', style: TextStyle(color: Colors.redAccent)),
            ],
          ),
          textAlign: TextAlign.left,  // Aligner le texte à gauche
        ),
      ),
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          "Produit", Colors.black87, 18, FontWeight.w400, 1),
                      Row(
                        children: [
                          ContainerWidget(5.0, 8.0, 8.0, Colors.grey.shade300,
                              IconWidget(LineIcons.apple, Colors.black, 20)),
                          InkWelWidget(ContainerWidget(
                              5.0,
                              8.0,
                              8.0,
                              Colors.grey.shade300,
                              IconWidget(LineIcons.list, Colors.black, 20))),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  height: heigth,
                  width: width,
                  child: GridView.builder(
                    itemCount: dataProd.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        mainAxisSpacing: 2),
                    itemBuilder: ((context, index) {
                      String image = dataProd[index]['image'];
                      String title = dataProd[index]['title'];
                      var price = dataProd[index]['price'];
                      return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  items = dataProd[index];
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            DetailScreen( items))));
                              },
                              child: CardWidget(
                                  4.0,
                                  90,
                                  90,
                                  ColumnCardWidget(image.toString(), heigth / 2,
                                      width, title, price.toString()),
                                  Colors.white,
                                  8)));
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
