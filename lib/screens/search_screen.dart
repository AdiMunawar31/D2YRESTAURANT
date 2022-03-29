import 'package:d2yrestaurant/common/search_restaurant_list.dart';
import 'package:d2yrestaurant/data/api/search_restaurant_api_service.dart';
import 'package:d2yrestaurant/provider/search_restaurants_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search_screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchRestaurantsProvider>(
        create: (_) => SearchRestaurantsProvider(
            searchRestaurantApiService: SearchRestaurantApiService()),
        child:
            Consumer<SearchRestaurantsProvider>(builder: (context, state, _) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        child: IconButton(
                          icon: const Icon(
                            CupertinoIcons.back,
                            size: 24,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 16.0),
                          width: double.infinity,
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: const Offset(2, 2),
                                )
                              ],
                              border: Border.all(width: 0.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))),
                          child: TextFormField(
                            controller: _controller,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  query = value;
                                });
                                state.fetchRestaurantSearch(query);
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Search restaurant or menu",
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.search),
                                  color: Colors.red,
                                  onPressed: () {},
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                    const EdgeInsets.only(left: 15, top: 15)),
                          )),
                      (query.isEmpty)
                          ? Center(
                              child: Container(
                                  margin: const EdgeInsets.only(top: 150.0),
                                  height: 150,
                                  child:
                                      Image.asset('assets/images/search.png')))
                          : const SearchRestaurantList(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.clear();
  }
}
