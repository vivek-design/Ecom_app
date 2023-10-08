import 'package:amazon/features/Accounts/Widgets/single_product.dart';
import 'package:amazon/features/Admin/Screens/add_product_screen.dart';
import 'package:amazon/features/Admin/Sevices/admin_services.dart';
import 'package:flutter/material.dart';

import '../../../Models/product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product> products = [];
  final AdminService adminService = AdminService();

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  //intistate cannot be async
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminService.getAllProducts(context);

    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminService.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final ProductData = products![index];
            return Column(
              children: [
                SizedBox(
                  height: 140,
                  child: SingleProduct(image: ProductData.images[0]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        ProductData.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          deleteProduct(products[index], index);
                        },
                        icon: Icon(Icons.delete_outline)),
                  ],
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToAddProduct();
        },
        child: const Icon(Icons.add),
        //this is the functionality which shows toast when the element is preesed for too long
        tooltip: 'Add a Product',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
