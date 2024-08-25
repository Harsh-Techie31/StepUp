import 'package:flutter/material.dart';
import 'package:stepup/global_var.dart';

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart' , style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: ListView.builder(
        
        itemCount: cart.length,
        itemBuilder: (context,index){
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),),
              trailing: GestureDetector(
                onTap: (){
                  setState(() {
                    cart.removeAt(index);
                  }); 
                },
                child: const Icon(Icons.delete , size: 30,color: Colors.red,)),
            title: Text(cartItem['title'] as String),
            titleTextStyle: Theme.of(context).textTheme.bodySmall,
            subtitle : Text("Size : ${cartItem['size'].toString()}"),
          );
        })
      );
    
  }
}