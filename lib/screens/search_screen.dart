import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/components/layout.dart';
import 'package:fuksiarz/components/loading_component.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/const/texts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  String query = '';
  bool isSearching = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() {
      query = value;
      isSearching = query.length < 3;
    });
  }

  List<String> _getSearchResults() {
    List<String> items = ['Jeden', 'Dwa', 'Trzy'];

    if (query.isEmpty || query.length < 3) {
      return [];
    }
    return items.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalM2, vertical: verticalM3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: searchText.toUpperCase(),
                hintStyle: TextStyles.body_5.copyWith(color: ColorStyle.searchIconColor),
                prefixIcon: IconButton(
                  icon: const Icon(CupertinoIcons.back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorStyle.searchIconColor,
                    width: 1.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorStyle.textColor,
                    width: 1.0,
                  ),
                ),
                isDense: true,
              ),
            ),
            if (isSearching) LoadingComponent(animationController: _animationController),
            if (query.length >= 3) ...[
              const Text(
                'Wyniki wyszukiwania:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ..._getSearchResults().map((result) {
                return ListTile(
                  title: Text(result),
                );
              }),
            ],
          ],
        ),
      ),
    );
  }
}
