// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:stepup/providers/global_var.dart';
import 'package:stepup/pages/prod_details.dart';
import 'package:stepup/pages/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Puma',
    'Reebok',
    'Skechers'
  ];
  late String selectedFilters;

  @override
  void initState() {
    super.initState();
    selectedFilters = filters[0];
  }

  List<Map<String, Object>> getFilteredProducts() {
    if (selectedFilters == 'All') {
      return products;
    } else {
      return products.where((product) {
        return product['company'] == selectedFilters;
      }).toList();
    }
  }

  void sortProducts(String sortBy) {
    setState(() {
      if (sortBy == 'A-Z') {
        products.sort(
            (a, b) => (a['title'] as String).compareTo(b['title'] as String));
      } else if (sortBy == 'Price Low to High') {
        products.sort(
            (a, b) => (a['price'] as double).compareTo(b['price'] as double));
      } else if (sortBy == 'Price High to Low') {
        products.sort(
            (a, b) => (b['price'] as double).compareTo(a['price'] as double));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // const border = OutlineInputBorder(
    //   borderSide: BorderSide(
    //     color: Color.fromRGBO(225, 225, 225, 1),
    //   ),
    //   borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    // );

    // Get the filtered products based on the selected filter
    final filteredProducts = getFilteredProducts();
    // String? selectedValue = 'A-Z';
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                child: Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              /*const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              )*/
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Theme.of(context).colorScheme.primary,
                  style:  const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 16,fontWeight: FontWeight.bold),
                  iconSize: 30,
                  icon: const Icon(Icons.sort , color: Colors.black,),
                  elevation: 0,
                  enableFeedback: false,
                  isDense: true,
                  isExpanded: false,
                   // This shows the current value
                  items: const [
                    DropdownMenuItem(
                      
                      value: 'A-Z',
                      child: Text('A-Z'),
                    ),
                    DropdownMenuItem(
                      value: 'Price Low to High',
                      child: Text('Price: Low to High'),
                    ),
                    DropdownMenuItem(
                      value: 'Price High to Low',
                      child: Text('Price: High to Low'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      sortProducts(value); // Call your sorting function here
                    }
                  },
                  value: null,
                ),
              )
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilters = filter;
                      });
                    },
                    child: Chip(
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 19,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 12),
                      backgroundColor: selectedFilters == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromARGB(255, 221, 232, 243),
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ProdDetails(product: product);
                      },
                    ));
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 249, 1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
