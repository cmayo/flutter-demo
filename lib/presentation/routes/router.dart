import 'package:auto_route/annotations.dart';
import 'package:demo/presentation/pages/article/article_detail_page.dart';
import 'package:demo/presentation/pages/article/articles_list_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(page: ArticleListPage, initial: true),
    MaterialRoute(page: ArticleDetailPage, path: '/articles/:id')
  ]
)
class $AppRouter {}