import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';
import '../provider/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).jfun();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BHAGAVAD GITA",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff3F2622),
        actions: [
          Consumer<ThemeProvider>(
            builder:
                (BuildContext context, ThemeProvider value, Widget? child) {
              return InkWell(
                onTap: () {
                  value.changetheme();
                },
                child: Icon(
                  value.theme == ThemeMode.light
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: Colors.white,
                ),
              );
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Consumer<HomeProvider>(
        builder:
            (BuildContext context, HomeProvider value, Widget? child) {
          return ListView.builder(
            itemCount: value.alist.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> item = value.alist[index];
              return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "detail_page",
                        arguments: value.alist[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff3F2622),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Image.network("${item["img"]}",fit: BoxFit.cover,),
                          ),
                          title: Text("${item["adhay_name"]}",style: TextStyle(color: Colors.white),),
                          subtitle: Text("${item["adhay_no"]??""}",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}
