import 'package:auto_route/annotations.dart';
import 'package:demo/application/article/detail/article_detail_bloc.dart';
import 'package:demo/infrastructure/di/injection.dart';
import 'package:demo/presentation/pages/article/widgets/article_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({@PathParam('id') required this.articleId});

  final int articleId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.article),
      ),
      body: BlocProvider(
        create: (BuildContext context) => getIt<ArticleDetailBloc>()
          ..add(ArticleDetailEvent.getById(articleId)),
        child: ArticleDetailWidget(),
      ),
    );
  }
}