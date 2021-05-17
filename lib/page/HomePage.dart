import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
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
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network("http://via.placeholder.com/350x150",
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
              children: _getCatologItem(),),
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
  List<Widget> _getCatologItem(){
    var screnWidth = MediaQuery.of(context).size.width;
    var d = screnWidth-60;
    var devWidth = d/5;
    List<Widget> list = new List();
    for (int i = 0; i < 10; i++) {
      list.add(Column(children: <Widget>[
        Image.network("http://via.placeholder.com/350x150",height: 80,width: devWidth,),
        SizedBox(height: 5,),
        Text("上装")
      ],));
    }
    return list;
  }


}
