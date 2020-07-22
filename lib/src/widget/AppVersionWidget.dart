import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AppVersionWidget extends StatefulWidget {
  AppVersionWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppVersionWidgetState createState() => _AppVersionWidgetState();
}

class _AppVersionWidgetState extends State<AppVersionWidget> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Center(
        child: Text(
          'Version ${_packageInfo.version} (${_packageInfo.buildNumber})',
        ),
      ),
    );
  }
}
