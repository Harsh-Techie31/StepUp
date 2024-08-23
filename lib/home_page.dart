import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(225, 225, 225, 1),
                      ),
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(50)),
                    );
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: Text(
                    "Shoes\nCollection",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: border,
                    focusedBorder: border,
                    
                  )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
