import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:apifm/apifm.dart' as Apifm;
import 'package:flutterdemo/bean/BannerBean.dart';
import 'dart:convert' show json;

import 'package:flutterdemo/bean/CategoryBean.dart';
import 'package:flutterdemo/bean/SecKillBean.dart';
class HomePage extends StatefulWidget {
  List<String> picList= new List();

  List<CategoryBean> catelogList= new List();
  List<SecKillBean> killList= new List();

  @override
  State<StatefulWidget> createState() {
    var homePageState = HomePageState();

     var banners = Apifm.banners({'type':'app'});
     banners.then((res){
       if (picList.length>0) {
         picList.clear();
       }
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
      if (catelogList.length>0) {
        catelogList.clear();
      }
      List list = res['data'];
      for (var value in list) {

        var categoryBean = CategoryBean();
        categoryBean.url= value['icon'];
        categoryBean.title= value['name'];
        catelogList.add(categoryBean);

      }
      homePageState.setCatelog(catelogList);
    });

    //限时秒杀
    Apifm.goods().then((res){
      List list = res['data'];
      if (killList.length>0) {
        killList.clear();
      }
      for (var value in list) {
        var secKillBean = SecKillBean();
        secKillBean.name=value['name'];
        secKillBean.pic=value['pic'];
        secKillBean.dateAdd=value['dateAdd'];
        secKillBean.originalPrice=value['originalPrice'];
        killList.add(secKillBean);
      }
      homePageState.setKillList(killList);


    });

    return homePageState;
  }
}

class HomePageState extends State<HomePage> {
  List<String> _picList;
  List<CategoryBean> _catelogList;
  List<SecKillBean> _killList;
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
  void setKillList(List<SecKillBean> killList) {
    setState(() {
      _killList=killList;
    });
  }


  @override
  Widget build(BuildContext context) {
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
            Column(children:getKillWidget(_killList),),
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
    // print("日志信息444"+catelogList.toString());
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

  ///秒杀布局
  List<Widget>  getKillWidget(List<SecKillBean> killList) {
    // print("日志信息444"+killList.toString());
    List<Widget> list = new List();
    if(killList==null){
      return list;
    }

    for (var value in killList) {
      var row = Row(children: <Widget>[
        Container(child: Image.network(value.pic),width: 100,height: 100,),
        SizedBox(width: 10,),
        Expanded(child: Column(children: <Widget>[
          Text(value.name,maxLines: 3,overflow:TextOverflow.ellipsis),
          Row(children: <Widget>[
            Text(value.dateAdd,textAlign: TextAlign.right,style: TextStyle(color: Colors.red),),
          ],),
          Row(children: <Widget>[
            Text("Y ",textAlign: TextAlign.start,style: TextStyle(color: Colors.red),),
            Container(child: Text(value.originalPrice.toString(),textAlign: TextAlign.start,style: TextStyle(color: Colors.red),),),
            Expanded(child: Row(children: <Widget>[
              SizedBox()
            ],)),
            RaisedButton(child: Text("立即抢购",),color: Colors.red,textColor: Colors.white, onPressed: () {},),
            SizedBox(width: 10,)
          ],)
        ],))
      ],);
      list.add(row);
    }
    return list;
  }




}
