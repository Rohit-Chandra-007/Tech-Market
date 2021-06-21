import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'app_theme.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Catalog  App'.text.xl5.bold.color(AppTheme.darkBluishColor).make(),
        'Trending Product'.text.xl2.make(),
      ],
    );
  }
}
