import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:apifm/apifm.dart' as Apifm;
import 'package:flutterdemo/bean/BannerBean.dart';
import 'dart:convert' show json;

import 'package:flutterdemo/bean/CategoryBean.dart';
class HomePage extends StatefulWidget {
  List<String> picList= new List();

  List<CategoryBean> catelogList= new List();
  @override
  State<StatefulWidget> createState() {
    var homePageState = HomePageState();

     var banners = Apifm.banners({'type':'app'});
     banners.then((res){
       // print("日志信息"+res.toString());
       List list = res['data'];
       for (var value in list) {
         var picUrl = value['picUrl'];
         picList.add(picUrl);
       }
       // print("日志信息222"+picList.toString());
       homePageState.setData(picList);
     });


     var goodsCategory = Apifm.goodsCategory();
    goodsCategory.then((res){
      List list = res['data'];
      for (var value in list) {
        print("日志信息222"+list.toString());
        var categoryBean = CategoryBean();
        categoryBean.url= value['icon'];
        categoryBean.title= value['name'];
        catelogList.add(categoryBean);

      }
      homePageState.setCatelog(catelogList);
    });

    return homePageState;
  }
}

class HomePageState extends State<HomePage> {
  List<String> _picList;
  List<CategoryBean> _catelogList;
  HomePageState();


  setData(List<String> list) {
    setState(() {
      this._picList=list;
    });
  }

  void setCatelog(List<CategoryBean> catelogList) {
   setState(() {
     _catelogList=catelogList;
   });
  }

  @override
  Widget build(BuildContext context) {
    print("日志信息"+_picList.toString());
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(child:
          Column(children: <Widget>[
            Container(
                height: 150,
                child: Swiper(
                  itemCount:(_picList==null||_picList.length<=1)?1:_picList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if((_picList==null||_picList.length<=1)){
                      return Image.network("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3437217665,1564280326&fm=26&gp=0.jpg",
                          fit: BoxFit.fitWidth);
                    }
                    return Image.network(_picList[index],
                        fit: BoxFit.fitWidth);
                  },
                  pagination: new SwiperPagination(),
                  autoplay: true,
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/images/notice.png",
                  width: 25,
                  height: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                      "商城店铺开张，优惠多多，快来抢购。",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )),

                Text("更多 > "),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: _getCatologItem(_catelogList),),
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/images/live.jpg',fit:BoxFit.fitWidth,),
            Row(children: <Widget>[
              Expanded(child: Divider(height: 1,color:Colors.grey ,) ,),
              Text("限时秒杀"),
              Expanded(child: Divider(height: 1,color:Colors.grey ,) ,),
            ],),
            Row(children: <Widget>[
              Container(child: Image.network("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3437217665,1564280326&fm=26&gp=0.jpg"),width: 100,height: 100,),
              SizedBox(width: 10,),

              Expanded(child: Column(children: <Widget>[
                Text("学生山东噶三等奖国学生山东噶三等奖国家建立山东噶三等奖国家建家建立山东噶三等奖国家建",maxLines: 3,overflow:TextOverflow.ellipsis),

                Row(children: <Widget>[
                  Text("开始时间: 2021-05-18 09:22:23",textAlign: TextAlign.right,style: TextStyle(color: Colors.red),),
                ],),
                Row(children: <Widget>[
                  // Expanded(child: Row(children: <Widget>[
                  //   Text("Y ",textAlign: TextAlign.start,style: TextStyle(color: Colors.red),),
                  //   Container(child: Text("43",textAlign: TextAlign.start,style: TextStyle(color: Colors.red),),)
                  // ],)),
                  // RaisedButton(child: Text("立即抢购",),color: Colors.red,textColor: Colors.white, onPressed: () {},),
                  // SizedBox(width: 10,)

                  Text("Y ",textAlign: TextAlign.start,style: TextStyle(color: Colors.red),),
                  Container(child: Text("43",textAlign: TextAlign.start,style: TextStyle(color: Colors.red),),),
                  Expanded(child: Row(children: <Widget>[
                    SizedBox()
                  ],)),
                  RaisedButton(child: Text("立即抢购",),color: Colors.red,textColor: Colors.white, onPressed: () {},),
                  SizedBox(width: 10,)
                ],)
              ],))

              // Column(children: <Widget>[
              //
              // ],)
            ],),
            Row(children: <Widget>[
              Expanded(child: Divider(height: 1,color:Colors.grey ,) ,),
              Text("爆品推荐"),
              Expanded(child: Divider(height: 1,color:Colors.grey ,) ,),
            ],),


          ],)

          ,),
      ),
    );
  }

  ///目录项
  List<Widget> _getCatologItem(List<CategoryBean> catelogList){
    List<Widget> list = new List();
    if(catelogList==null){
      return list;
    }
    print("日志信息444"+catelogList.toString());
    var screnWidth = MediaQuery.of(context).size.width;
    var d = screnWidth-60;
    var devWidth = d/5;


    for (var value in catelogList) {
      list.add(Column(children: <Widget>[
        Image.network(value.url==''?"http://via.placeholder.com/350x150":value.url,height: 40,width: devWidth,),
        SizedBox(height: 2,),
        Text(value.title)
      ],));

    }
    return list;
  }




}
