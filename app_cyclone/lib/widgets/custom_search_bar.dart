import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.searchController,
    this.onChanged,
  });

  final TextEditingController searchController;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: const BoxConstraints(maxWidth: 350, minHeight: 40),
      controller: searchController,
      hintText: "Search your destination",
      onChanged: onChanged,
      leading: const Icon(Icons.search),
      // decoration: const InputDecoration(prefixIcon: Icon(Icons.search)),
    );
  }
}
