import 'package:last_1/dbhelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoService {
  Future<void> storeFileReference(String s3Url) async {
    // Connect to your MongoDB database
    var db = await Db.create(MONGO_CONN_URL);
    await db.open();

    // Insert the file reference into your 'appointments' collection
    var collection = db.collection('appointments');
    await collection.insertOne({'fileUrl': s3Url});

    // Close the database connection
    await db.close();
  }
}