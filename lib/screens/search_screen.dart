import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/components/search_screen/ad_gallery.dart';
import 'package:fuksiarz/components/layout.dart';
import 'package:fuksiarz/components/search_screen/loading_component.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/gen/assets.gen.dart';

enum SearchState { idle, typing, found, notFound }

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  String query = '';
  bool isSearching = false;
  late AnimationController _animationController;
  SearchState currentState = SearchState.idle;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  void _onSearchChanged(String value) {
    setState(() {
      query = value;

      if (query.isEmpty) {
        currentState = SearchState.idle;
      } else if (query.length < 3) {
        currentState = SearchState.typing;
      } else {
        final results = _getSearchResults();
        currentState = results.isNotEmpty ? SearchState.found : SearchState.notFound;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<String> _getSearchResults() {
    List<String> items = ['Jeden', 'Dwa', 'Trzy'];

    if (query.isEmpty || query.length < 3) {
      return [];
    }
    return items.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
  }

  Widget _buildContent() {
    switch (currentState) {
      case SearchState.idle:
        return AdGallery(
          imagePaths: [
            Assets.icon.add1.path,
            Assets.icon.add2.path,
            Assets.icon.add3.path,
            Assets.icon.add4.path,
            Assets.icon.add5.path,
          ],
        );
      case SearchState.typing:
        return LoadingComponent(
          animationController: _animationController,
          iconPath: Assets.icon.loopIcon.path,
          firstText: firstLoadingText,
          secondText: secondLoadingText,
        );
      case SearchState.found:
        return Text('find');
      case SearchState.notFound:
        return LoadingComponent(
          iconPath: Assets.icon.warningIcon.path,
          firstText: firstErrorText,
          secondText: secondErrorText,
          enableAnimation: false,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalM4, vertical: verticalM5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textField(context),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _textField(BuildContext context) {
    return TextField(
      onChanged: _onSearchChanged,
      decoration: InputDecoration(
        hintText: searchText.toUpperCase(),
        hintStyle: TextStyles.body_5.copyWith(color: ColorStyle.searchIconColor),
        prefixIcon: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: ColorStyle.searchIconColor,
          ),
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
        filled: true,
        fillColor: ColorStyle.whiteColor,
      ),
    );
  }
}
