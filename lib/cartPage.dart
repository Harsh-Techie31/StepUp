import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepup/cartProvider.dart';

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                ),
                trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        showDialog(
                          barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                
                                title: Text(
                                  "Delete Item",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                content: Text(
                                  "Are you sure you want to remove this product from cart ?",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                actions:  [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      }, child: const Text("No",style: TextStyle(
                                        fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold,
                                      ),)),
                                  TextButton(onPressed: (){
                                      Provider.of<CartProvider>(context , listen: false).removeProduct(cartItem);
                                      Navigator.of(context).pop();
                                  }, child: const Text("Yes",style: TextStyle(
                                        fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold,
                                      )))
                                ],
                              );
                            });
                        //Provider.of<CartProvider>(context , listen: false).removeProduct(cartItem);
                      });
                    },
                    child: const Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.red,
                    )),
                title: Text(cartItem['title'] as String),
                titleTextStyle: Theme.of(context).textTheme.bodySmall,
                subtitle: Text("Size : ${cartItem['size'].toString()}"),
              );
            }));
  }
}
