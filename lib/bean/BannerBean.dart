import 'BannerDetailBean.dart';

import 'package:json_annotation/json_annotation.dart';
part 'BannerBean.g.dart';
@JsonSerializable()
class BannerBean{
   BannerBean();
   String code;
   List<BannerDetailBean> data;
   String msg;
   factory BannerBean.fromJson(Map<String, dynamic> json) =>
       _$BannerBeanFromJson(json);

   Map<String, dynamic> toJson() => _$BannerBeanToJson(this);
}
Map<String, dynamic> _$BannerBeanToJson(BannerBean instance) =>
    <String, dynamic>{
       'code': instance.code,
       'data': instance.data,
       'msg': instance.msg
    };
BannerBean _$BannerBeanFromJson(Map<String, dynamic> json) {
   return BannerBean()
      ..code = json['code'] as String
      ..data = (json['data'] as List)
          ?.map((e) => e == null
          ? null
          : BannerDetailBean.fromJson(e as Map<String, dynamic>))
          ?.toList()
      ..msg = json['msg'] as String;
}