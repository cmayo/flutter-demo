import 'package:demo/application/article/list/article_list_bloc.dart';
import 'package:demo/infrastructure/di/injection.dart';
import 'package:demo/presentation/pages/article/widgets/article_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: BlocProvider(
        create: (BuildContext context) => getIt<ArticleListBloc>()
          ..add(ArticleListEvent.getAll()),
        child: ArticleList(),
      ),
    );
  }
}