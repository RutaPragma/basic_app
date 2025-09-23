import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

part 'app_database.g.dart';

class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  RealColumn get price => real()();
  TextColumn get description => text()();
  TextColumn get category => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [Items])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Item>> getAll() async {
    final rows = await select(items).get();
    return rows;
  }

  Future<int> insertItem(ItemsCompanion companion) =>
      into(items).insert(companion);

  Future<Item?> getItemById(int id) async {
    final row = await (select(
      items,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'basic_app_db.sqlite'));
    return NativeDatabase(file);
  });
}
