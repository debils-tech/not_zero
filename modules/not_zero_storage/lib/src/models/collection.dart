import 'package:sembast/sembast.dart';

/// Abstract logical collection.
/// The only implementation is [SembastStoreCollection].
///
/// Due to the fact that sembast is mostly used for storing key-value pairs, key
/// is really neccessary and by has to be a string.
/// Any object that will be passed to a collection has to have a key field.
/// By default key field name is "id".
///
/// This abstraction contains simple operations over the data:
/// - finding data using complex finder (filters, limits, offsets and sorting).
///   If filtering isn't used, all entries will be returned;
/// - finding data using primary key (the most efficient way in many cases);
/// - inserting data (with autodetection of the key);
/// - deleting data using complex finder. If filtering isn't used, all entries
///   will be erased;
/// - deleting data using primary key;
/// - counting collection entries using complex filter. If filtering isn't
///   used, method will return total amount of entries in the database.
abstract class Collection {
  String get name;

  String get primaryKey;

  Future<void> drop();

  Future<Map<String, dynamic>?> findByKey(String key);

  Future<Iterable<Map<String, dynamic>>> find({Finder? finder});

  Future<void> insert(Map<String, dynamic> data);

  Future<void> deleteByKey(String key);

  Future<void> delete(Finder? finder);

  Future<int> count(Filter? filter);
}
