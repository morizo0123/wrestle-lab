import 'package:wrestle_lab/routes/route_path_name.dart';

String getTitleFromLocation(String location) {
  if (location.startsWith(RoutePathName.events)) return 'イベント';
  if (location.startsWith(RoutePathName.organizations)) return '団体';
  if (location.startsWith(RoutePathName.youtube)) return 'YouTube';
  if (location.startsWith(RoutePathName.myHistory)) return 'My履歴';
  if (location.startsWith(RoutePathName.news)) return 'ニュース';
  return 'Home';
}