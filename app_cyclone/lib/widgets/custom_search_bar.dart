import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key,
      required this.searchController,
      this.onChanged,
      this.placeholder});

  final TextEditingController searchController;
  final Function(String)? onChanged;
  final String? placeholder;
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: const BoxConstraints(maxWidth: 350, minHeight: 40),
      controller: searchController,
      hintText: placeholder ?? "Search",
      onChanged: onChanged,
      leading: const Icon(Icons.search),
      // decoration: const InputDecoration(prefixIcon: Icon(Icons.search)),
    );
  }
}
