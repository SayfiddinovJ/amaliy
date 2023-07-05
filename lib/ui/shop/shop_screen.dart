import 'package:amaliy/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

import '../../data/local/db/local_database.dart';
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: FutureBuilder<List<ProductModelSql>>(
        future: LocalDatabase.getAllProducts(),
        builder: (
            context,
            AsyncSnapshot<List<ProductModelSql>> rowData,
            ) {
          if (rowData.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (rowData.hasData) {
            List<ProductModelSql> products = rowData.data!;
            return ListView(
              padding: const EdgeInsets.all(15),
              children: List.generate(
                products.length,
                    (index) => GestureDetector(
                      onLongPress: (){
                        setState(() {
                          LocalDatabase.deleteProduct(products[index].id!);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 100,height: 100,child: Image.asset(products[index].image)),
                            const SizedBox(width: 5,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(products[index].name,style: const TextStyle(
                                    color: Colors.black,
                                  ),),
                                  const Text('Lorem',style: TextStyle(
                                    color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20,),
                            IconButton(onPressed: (){setState(() {
                              if(products[index].count>1){
                                LocalDatabase.updateProductCount(
                                    id: products[index].id!,
                                    count: products[index].count-1
                                );
                              }
                            });}, icon: const Text('-',style: TextStyle(
                              color: Colors.black,
                              fontSize: 25
                            ),),),
                            Text(products[index].count.toString(),style: const TextStyle(
                              color: Colors.black,
                            ),),
                            IconButton(onPressed: (){setState(() {
                                LocalDatabase.updateProductCount(
                                    id: products[index].id!,
                                    count: products[index].count+1
                                );
                            });}, icon: const Text('+',style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),),),
                          ],
                        ),
                      ),
                    ),
              ),
            );
          }
          return Center(child: Text(rowData.error.toString()));
        },
      ),
    );
  }
}