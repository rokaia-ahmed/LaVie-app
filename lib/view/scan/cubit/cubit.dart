import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/core/network/dio_helper.dart';
import 'package:plants_app/core/network/end_point.dart';
import 'package:plants_app/view/scan/cubit/state.dart';
import '../../../core/utils/constant.dart';
import '../../../models/blogs_model.dart';

class ScannerCubit extends Cubit<ScannerStates>{
  ScannerCubit() :super(InitScannerState());
 static ScannerCubit get(context)=>BlocProvider.of(context);

 Future<void> scanCode()async{
 await FlutterBarcodeScanner.scanBarcode(
      '#2A99CF',
      'cancel', true,
      ScanMode.QR,
  ).then((value){
    print('data of scanner $value');
     emit(SuccessScannerState());
  }).catchError((error){
   emit(ErrorScannerState(error.toString()));
   print(error.toString());
  });
 }
  List<BlogsModel> allBlogs=[];
 void getBlogs(){
   emit(LoadingBlogsState());
   DioHelper.getData(
       url: blogs,
       token: token,
   ).then((value){
     List test= value.data['data']['plants'];
     for (var element in test) {
       allBlogs.add(BlogsModel.fromJson(element));
     }
     emit(SuccessBlogsState());
   }).catchError((error){
     emit(ErrorBlogsState(error.toString()));
     print(error.toString());
   });
 }
}