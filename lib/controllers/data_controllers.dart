import 'package:bills_app/services/data_services.dart';
import 'package:get/get.dart';

class DataController extends GetxController{

  var list = [].obs; //empty  alive list
  final service = new DataServices();
  var _loading = false.obs;

  get loading=>_loading.value;
  @override
  void onInit(){
    _loadData();
    super.onInit();
  }

  get newList{
  return  list.where((e) => e["status"]).map((e) => e).toList();// if status true then add to list (newList)
  }

_loadData() async {
  _loading.value= false;
 try{
   var info = service.getUsers();
   list.addAll(await info);

 }catch(e){
print("Encountered Error");
print(e);
 }finally{
   _loading.value=true;
 }

}


}