import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fuksiarz/components/layout.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/gen/assets.gen.dart';
import 'package:fuksiarz/services/search/search_http_service.dart';
import 'package:fuksiarz/components/search_screen/ad_gallery.dart';
import 'package:fuksiarz/components/search_screen/loading_component.dart';
import 'package:fuksiarz/components/search_screen/search_result_item.dart';
import 'package:fuksiarz/components/search_screen/search_text_field.dart';
import 'package:fuksiarz/const/texts.dart';

enum SearchState { idle, typing, found, notFound }

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  String query = '';
  List<String> searchResults = [];
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() {
      query = value;

      switch (query.length) {
        case 0:
          currentState = SearchState.idle;
          searchResults = [];
          break;
        case 1:
        case 2:
        case 3:
          currentState = SearchState.typing;
          break;
        default:
          currentState = SearchState.typing;
          SearchService().fetchSearchResults(query).then((results) {
            setState(() {
              searchResults = results;
              currentState = searchResults.isNotEmpty ? SearchState.found : SearchState.notFound;
            });
          }).catchError((error) {
            setState(() {
              currentState = SearchState.notFound;
            });
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalM4, vertical: verticalM5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(onChanged: _onSearchChanged),
            SizedBox(height: verticalM2),
            _buildContent(),
          ],
        ),
      ),
    );
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
        return _buildResults;
      case SearchState.notFound:
        return LoadingComponent(
          iconPath: Assets.icon.warningIcon.path,
          firstText: firstErrorText,
          secondText: secondErrorText,
          enableAnimation: false,
        );
    }
  }

  Widget get _buildResults => Column(
        children: searchResults.map((result) {
          return SearchResultItem(result: result)
              .animate()
              .fadeIn(duration: 700.ms)
              .moveY(begin: -20, end: 0, duration: 300.ms);
        }).toList(),
      );
}
