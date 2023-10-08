import 'package:amazon/Constants/global_variable.dart';
import 'package:amazon/Models/product.dart';
import 'package:amazon/home/Search/services/search_searvices.dart';
import 'package:amazon/home/widgets/address_box.dart';
import 'package:amazon/home/widgets/searhed_product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/searchscreen';
  final String searchQuery;

  SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchedPeoduct();
  }

  void fetchSearchedPeoduct() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
  setState(() {
    
  });
  
  }

    void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return products==null?const CircularProgressIndicator(): Scaffold(

    appBar:   PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            //we do not have gradient feature in appbar
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: Golobal_variable.appBarGradient,
              ),
            ),

            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        height: 42,
                        margin: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(7),
                          elevation: 1,
                          child: TextFormField(
                            onFieldSubmitted: navigateToSearchScreen,
                            decoration: InputDecoration(
                                prefixIcon: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                        size: 23,
                                      )),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1)),
                                hintText: 'Search Amazon.in',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                )),
                          ),
                        )),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 42,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.mic,
                      color: Colors.black,
                      size: 23,
                    ),
                  )
                ]),
          ),
        ),

      body: Column(
        children: [
          const AddressBox(),
          const SizedBox(
             height: 10,
          ),
          Expanded(child:
          ListView.builder(itemCount: products!.length,itemBuilder:((context, index){
               
               return SearchedProduct(product: products![index]);

          })
          )
          ),

        ],
      )
    );
  }
}
