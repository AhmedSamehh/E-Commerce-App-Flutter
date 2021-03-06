import 'package:ECommerce/constant.dart';
import 'package:ECommerce/model/cart_product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database _database;

  Future<Database> get database async{
    if(_database != null){
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  initDb() async{
    String path = join(await getDatabasesPath(), 'CartProducts.db');

    return await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async{
        await db.execute('''
        CREATE TABLE $TABLE_CART_PRODUCTS
        ($COLUMN_ID TEXT NOT NULL,
         $COLUMN_TITLE TEXT NOT NULL,
         $COLUMN_IMAGEURL TEXT NOT NULL,
         $COLUMN_PRICE TEXT NOT NULL,
         $COLUMN_QUANTITY INTEGER NOT NULL)
         ''');
      }
    );
  }

  insertProduct(CartProductModel cartProduct) async{
    var dbClient = await database;
    await dbClient.insert(
        TABLE_CART_PRODUCTS,
        cartProduct.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<CartProductModel>> getAllProducts() async{
    var dbClient = await database;

    List<Map> maps = await dbClient.query(TABLE_CART_PRODUCTS);
    List<CartProductModel> productsList = maps.isNotEmpty?
        maps.map((product) => CartProductModel.fromJson(product)).toList()
        :[];
    return productsList;
  }

  updateProduct(CartProductModel cartProduct) async{
    var dbClient = await database;
    return await dbClient.update(TABLE_CART_PRODUCTS, cartProduct.toJson(),
    where: '$COLUMN_ID = ?', whereArgs: [cartProduct.productId]);
  }
}