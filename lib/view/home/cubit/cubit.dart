import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/core/network/dio_helper.dart';
import 'package:plants_app/core/network/end_point.dart';
import 'package:plants_app/models/seeds_model.dart';
import 'package:plants_app/view/home/cubit/states.dart';
import 'package:sqflite/sqflite.dart';
import '../../../core/utils/constant.dart';
import '../../../models/plants_model.dart';
import '../../../models/products_model.dart';
import '../../../models/tools_model.dart';


class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(InitHomeState());
  static HomeCubit get(context) =>BlocProvider.of(context);
//TODO PLANTS
  List<PlantsModel> plantsList=[];
 void getPlants(){
   emit(LoadingPlantsState());
    DioHelper.getData(
        url: plants, token: token,
    ).then((value) {
    List test = value.data['data'];
    for (var element in test) {
      plantsList.add(PlantsModel.fromJson(element));
    }
     emit(SuccessPlantsState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorPlantsState(error.toString()));
    });
  }
//TODO SEEDS
  List<SeedsModel> seedsList=[];
  void getSeeds(){
    emit(LoadingSeedsState());
    DioHelper.getData(
      url: seeds, token: token,
    ).then((value) {
      List test = value.data['data'];
      for (var element in test) {
        seedsList.add(SeedsModel.fromJson(element));
      }
      emit(SuccessSeedsState());
    }).catchError((error){
      print('====================================');
      print(error.toString());
      emit(ErrorSeedsState(error.toString()));
    });
  }

//TODO tools
  List<ToolsModel> toolsList=[];
  void getTools(){
    emit(LoadingToolsState());
    DioHelper.getData(
      url: tools, token: token,
    ).then((value) {
      List test = value.data['data'];
      for (var element in test) {
        toolsList.add(ToolsModel.fromJson(element));
      }
      emit(SuccessToolsState());
    }).catchError((error){
      print('====================================');
      print(error.toString());
      emit(ErrorToolsState(error.toString()));
    });
  }
//TODO products
  List<ProductModel> productsList=[];
  void getProducts(){
    emit(LoadingProductsState());
    DioHelper.getData(
      url: products, token: token,
    ).then((value) {
      List test = value.data['data'];
      for (var element in test) {
        productsList.add(ProductModel.fromJson(element));
      }
      emit(SuccessProductsState());
    }).catchError((error){
      print('====================================');
      print(error.toString());
      emit(ErrorProductsState(error.toString()));
    });
  }
  // TODO SEARCH

  List<ProductModel>searchList=[];
  void searchPlants(String text){
    searchList.clear();
    for(int i=0 ;i< productsList.length ;i++ ){
      if(productsList[i].name!.contains(text)){
        searchList.add(productsList[i]);
      }
    }
   emit(SuccessPlantsState());
  }

//TODO card database
  Database? database ;
  void createDatabase()async{
    database =await openDatabase(
        'cart.db',
        version: 1 ,
        onCreate: (database,version){
          database.execute(
              'create table product(id integer primary key,text text,price int,image text,count int,total int)')
              .then((value){
            print('product table creating');
          }).catchError((error){
            print('error on creating table${error.toString()}');
          });
          print('cart database created');
        },
        onOpen: (database){
          getDatabase(database);
          print(' cart database opened');
        }
    );
  }

  Future insertDatabase({
    required String name,
    required int price ,
    required String image ,
  }){
    return database!.transaction((txn){
      return txn.rawInsert(
          'insert into product (text,price,image,count,total) values ("$name",$price,"$image",${1},$price)')
          .then((value){
        getDatabase(database);
        emit(SuccessInsertState());
        print('$value insert success');
      }).catchError((error){
        print('error on insert table${error.toString()}');
        emit(ErrorInsertState(error.toString()));
      }) ;
    });
  }
  List<Map> cart=[];
  int total =0  ;
  Future getDatabase(database)async{
    cart = await database!.rawQuery('select *,(price*count) as total from product');
    print(cart);
    emit(GetProductState());
  }

  void countPrice(){
    total =0;
    for(int i=0; i<cart.length ;i++ ){
      total = total+cart[i]['total'] as int;
    }
    emit(TotalPriceState());
  }

  Future deleteDatabase({required id})async{
    await database!
        .rawDelete('DELETE FROM product WHERE id = $id ',
    ).then((value){
      getDatabase(database);
      emit(DeleteProductState());
    }).catchError((error){
      print('error when delete product :$error');
    });
  }

  Future updateDatabase({
    required int id ,
    int? count,
  })async{
    await database!.rawUpdate(
      'UPDATE product SET count = ? WHERE id = ?',
      ['$count','$id'],
    ).then((value){
      print('update product  done');
      getDatabase(database);
      emit(UpdateProductState());
    }).catchError((error){
      print('Error when update product database$error');
    });
  }
  /*Future totalPrice(database)async{
    getDatabase(database);
    List<Map> result = await database!.rawQuery('select sum(total) as total_price from product');
    for(int i=0 ;i<result.length;i++){
      total=result[0]['total_price'] ;
    }
    print('print total of price $total');
    emit(TotalPriceState());
  }*/

}
