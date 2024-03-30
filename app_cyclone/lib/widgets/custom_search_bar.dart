import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: const BoxConstraints(maxWidth: 400, minHeight: 40),
      controller: searchController,
      hintText: "Search your destination",
      leading: const Icon(Icons.search),
      // decoration: const InputDecoration(prefixIcon: Icon(Icons.search)),
    );
  }
}
