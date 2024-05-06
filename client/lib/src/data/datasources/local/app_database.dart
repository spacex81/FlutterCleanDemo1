import 'dart:async';

import 'package:client/src/data/datasources/local/converters/source_type_converter.dart';
import 'package:client/src/data/datasources/local/dao/article_dao.dart';
import 'package:client/src/domain/models/article.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters([SourceTypeConverter])
@Database(version: 1, entities: [Article])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
