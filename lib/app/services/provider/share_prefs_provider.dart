import 'package:get_storage/get_storage.dart';

//getx shared preferences
class SharPrefsProvider {
 late GetStorage storage;

  SharPrefsProvider() {
    //name of container in shared pres
    storage = GetStorage();
  }

//write value
  setValue(String key, dynamic value) async {
   await storage.write(key, value);
  }

  //read value
  getValue(String key) async {
    return await storage.read(key);
  }

  //delete value
  removeValue(String key) async {

   await storage.remove(key);
  }

  //set value only when if null
  setValueIfNull(String key, dynamic value) async {
   await storage.write(key, value);
  }

  //check this key has data
  checkHasData(String key) async {
   return await storage.hasData(key);
  }

  //all data delete
  removeAll() async {
    await storage.erase();
  }
}
