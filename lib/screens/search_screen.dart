import 'package:d2yrestaurant/containers/search_restaurant_list.dart';
import 'package:d2yrestaurant/provider/search_restaurants_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search_screen';
  static const String searchText = 'Search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchRestaurantsProvider>(builder: (context, state, _) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16.0),
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(color: Colors.grey),
                Container(
                    margin: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    ),
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
                          contentPadding: const EdgeInsets.only(left: 15, top: 15)),
                    )),
                (query.isEmpty)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset('assets/images/search.png', height: 150),
                              const Text(
                                'Finding restaurant for you. Please Wait!',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SearchRestaurantList(),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.clear();
  }
}
