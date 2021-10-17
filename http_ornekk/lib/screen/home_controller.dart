import 'package:get/get.dart';
import 'package:http_ornekk/api/api_service.dart';
import 'package:http_ornekk/models/models.dart';

class HomeController extends GetxController{
   List<Result> verilerim = [];
   bool isLoading = false;
  @override
  void onInit() {
    getData();
    super.onInit();
   
  }

  getData(){
    
  GetApi().getApi().then((value) {
 
      verilerim = value.result;
      setIsLoading(true);//verilerim yüklendikten sonra 
    
    });
  }

  setIsLoading(bool b){
    isLoading=b;
    update();
  }
}