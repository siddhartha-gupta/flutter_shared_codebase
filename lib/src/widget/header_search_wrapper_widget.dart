import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class HeaderSearchWrapperWidget extends StatefulWidget {
  final IconData leftIcon;
  final Function() leftIconCallback;
  final String text;
  final String selectedText;
  final Map<IconData, Function> actionButtons;
  final Function() onSearchCancelled;
  final Function(String text) onSearch;
  final int numOfItemsSelected;
  final Function openDrawer;

  HeaderSearchWrapperWidget({
    Key key,
    @required this.leftIcon,
    @required this.leftIconCallback,
    @required this.text,
    @required this.selectedText,
    @required this.actionButtons,
    @required this.onSearchCancelled,
    @required this.onSearch,
    @required this.numOfItemsSelected,
    @required this.openDrawer,
  }) : super(key: key);

  @override
  HeaderSearchWrapperWidgetState createState() =>
      HeaderSearchWrapperWidgetState();
}

class HeaderSearchWrapperWidgetState extends State<HeaderSearchWrapperWidget> {
  TextEditingController searchController = TextEditingController();
  bool _searchIsExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  void activateSearch() {
    setState(() {
      _searchIsExpanded = true;
    });
  }

  void handleBackButton() {
    if (searchController.text != '') {
      searchController.text = '';
    } else {
      cancelSearch();
    }
  }

  void cancelSearch() {
    FocusScope.of(context).unfocus();
    setState(() {
      searchController.clear();
      _searchIsExpanded = false;
    });
    widget.onSearchCancelled();
  }

  Widget navigationIconWidget() {
    if (widget.numOfItemsSelected == 0) {
      return GestureDetector(
        onTap: () {
          widget.openDrawer();
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
          child: Icon(Icons.menu),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          widget.leftIconCallback();
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
          child: new Icon(widget.leftIcon),
        ),
      );
    }
  }

  Widget headerTextWidget() {
    return new Text(
      widget.numOfItemsSelected == 0
          ? widget.text
          : '${widget.numOfItemsSelected} ${widget.selectedText} selected',
      overflow: TextOverflow.ellipsis,
      style: new TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget searchBarWidget() {
    final textStyle = new TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SizedBox(
        height: 25.0,
        child: TextField(
          controller: searchController,
          maxLines: 1,
          onChanged: (value) {
            widget.onSearch(value);
            // handleSearch(value);
          },
          autofocus: true,
          keyboardType: TextInputType.text,
          style: textStyle,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search notes',
            hintStyle: textStyle,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
          ),
        ),
      ),
    );
  }

  Widget actionButtonWidgets() {
    if (widget.numOfItemsSelected == 0) {
      return GestureDetector(
        onTap: () {
          _searchIsExpanded ? cancelSearch() : activateSearch();
        },
        child: new Padding(
          padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
          child: Icon(
            _searchIsExpanded ? Icons.cancel : Icons.search,
          ),
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: widget.actionButtons.entries.map((entry) {
          return GestureDetector(
            onTap: () {
              entry.value();
            },
            child: new Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
              child: Icon(
                entry.key,
              ),
            ),
          );
        }).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.numOfItemsSelected > 0) {
      this._searchIsExpanded = false;
    }

    return WillPopScope(
      onWillPop: () {
        var closeApp = !_searchIsExpanded;

        handleBackButton();

        return Future<bool>.value(closeApp);
      },
      child: Material(
        elevation: 1,
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                if (_searchIsExpanded) ...[
                  new Expanded(
                    child: searchBarWidget(),
                  ),
                ] else ...[
                  navigationIconWidget(),
                  new Expanded(
                    child: headerTextWidget(),
                  ),
                ],
                actionButtonWidgets(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
