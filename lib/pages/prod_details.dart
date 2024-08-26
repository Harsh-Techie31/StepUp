import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepup/providers/cartProvider.dart';

class ProdDetails extends StatefulWidget {
  final Map<String, Object> product;

  const ProdDetails({
    super.key,
    required this.product,
  });

  @override
  State<ProdDetails> createState() => _ProdDetailsState();
}

class _ProdDetailsState extends State<ProdDetails> {
  int? selectedSize =0;
  @override
  //void initState() {
  //  super.initState();
  //  selectedSize = 59894;
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(
            flex: 3,
          ),
          Container(
            //padding:const EdgeInsets.all(10.00),
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(227, 232, 236, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text("\$ ${widget.product['price'].toString()}",
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                label: Text(size.toString()),
                                labelStyle: const TextStyle(
                                  fontSize: 15,
                                ),
                                //labelPadding: const EdgeInsets.all(5),
                                backgroundColor: selectedSize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                              )),
                        );
                      }),
                ),
                //const SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    //decoration: const BoxDecoration(
                    //  color: Colors.yellow,
                    //),

                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.black,
                              minimumSize: const Size(double.infinity, 50)),
                          onPressed: () {
                            if (selectedSize != 0) {
                              Provider.of<CartProvider>(context, listen: false)
                                  .addProduct({
                                'id': widget.product['id'],
                                'title': widget.product['title'],
                                'price': widget.product['price'],
                                'imageUrl': widget.product['imageUrl'],
                                'company': widget.product['company'],
                                'size': selectedSize,
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                    duration: Duration(milliseconds: 500),
                                content: Text("Product Added!"),
                              ));

                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Choose a size !"),
                              ));
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Add  To  Cart",
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          )),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
