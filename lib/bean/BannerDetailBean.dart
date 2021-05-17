
import 'package:json_annotation/json_annotation.dart';

part 'BannerDetailBean.g.dart';
@JsonSerializable()
class BannerDetailBean{
   BannerDetailBean();
   String businessId;
   String dateAdd;
   String dateUpdate;
   String id;
   String linkUrl;
   String paixu;
   String picUrl;
   String remark;
   String status;
   String statusStr;
   String title;
   String type;
   String userId;
   factory BannerDetailBean.fromJson(Map<String, dynamic> json) =>
       _$BannerDetailBeanFromJson(json);
   Map<String, dynamic> toJson() => _$BannerDetailBeanToJson(this);
}
BannerDetailBean _$BannerDetailBeanFromJson(Map<String, dynamic> json) {
   return BannerDetailBean()
      ..businessId = json['businessId'] as String
      ..dateAdd = json['dateAdd'] as String
      ..dateUpdate = json['dateUpdate'] as String
      ..id = json['id'] as String
      ..linkUrl = json['linkUrl'] as String
      ..paixu = json['paixu'] as String
      ..picUrl = json['picUrl'] as String
      ..remark = json['remark'] as String
      ..status = json['status'] as String
      ..statusStr = json['statusStr'] as String
      ..title = json['title'] as String
      ..type = json['type'] as String
      ..userId = json['userId'] as String;
}
Map<String, dynamic> _$BannerDetailBeanToJson(BannerDetailBean instance) =>
    <String, dynamic>{
       'businessId': instance.businessId,
       'dateAdd': instance.dateAdd,
       'dateUpdate': instance.dateUpdate,
       'id': instance.id,
       'linkUrl': instance.linkUrl,
       'paixu': instance.paixu,
       'picUrl': instance.picUrl,
       'remark': instance.remark,
       'status': instance.status,
       'statusStr': instance.statusStr,
       'title': instance.title,
       'type': instance.type,
       'userId': instance.userId
    };
