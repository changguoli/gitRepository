//
//  Function_introduce.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/22.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#ifndef Function_introduce_h
#define Function_introduce_h
/*  关注资料
 自从Notification被引入之后，苹果就不断的更新优化，但这些更新优化只是小打小闹，直至现在iOS 10开始真正的进行大改重构，这让开发者也体会到UserNotifications的易用，功能也变得非常强大。
 
 iOS 9 以前的通知
 
 1.在调用方法时，有些方法让人很难区分，容易写错方法，这让开发者有时候很苦恼。
 
 2.应用在运行时和非运行时捕获通知的路径还不一致。
 
 3.应用在前台时，是无法直接显示远程通知，还需要进一步处理。
 
 4.已经发出的通知是不能更新的，内容发出时是不能改变的，并且只有简单文本展示方式，扩展性根本不是很好。
 
 iOS 10 开始的通知
 
 1.所有相关通知被统一到了UserNotifications.framework框架中。
 
 2.增加了撤销、更新、中途还可以修改通知的内容。
 
 3.通知不在是简单的文本了，可以加入视频、图片，自定义通知的展示等等。
 
 4.iOS 10相对之前的通知来说更加好用易于管理，并且进行了大规模优化，对于开发者来说是一件好事。
 
 5.iOS 10开始对于权限问题进行了优化，申请权限就比较简单了(本地与远程通知集成在一个方法中)。

 */

#endif /* Function_introduce_h */
/*结构
 CustomUI：当前模块自定义UI
 Manager：ViewModel  逻辑层
 Model ： 数据层
 VC ： 控制器层
 */


#pragma mark --图表工具

/*charts   图表工具
 WSPieChart *pie = [[WSPieChart alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, self.view.frame.size.width)];
 pie.valueArr = @[@50,@20,@33,@22,@32,@33,@66,@10];
 pie.descArr = @[@"1月份",@"2月份",@"3月份",@"4月份",@"5月份",@"6月份",@"7月份",@"8月份",];
 pie.backgroundColor = [UIColor whiteColor];
 [self.view addSubview:pie];
 pie.positionChangeLengthWhenClick = 20;
 pie.showDescripotion = YES;
 [pie showAnimation];
 */
#pragma mark --YTKNetwork
//YTKrequest  基类
/*设置主机主接口 #import "YTKNetworkConfig.h"

 YTKNetworkConfig *config = [YTKNetworkConfig sharedInstance];
 config.baseUrl = @"http://yuantiku.com";
 config.cdnUrl = @"http://fen.bi";
  NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
 YTKUrlArgumentsFilter *urlFilter = [YTKUrlArgumentsFilter filterWithArguments:@{@"version": appVersion}];
 [config addUrlFilter:urlFilter];
 
 */





/*
 
 1.通过覆盖requestUrl方法,我们表示详细的url。因为在YTKNetworkConfig主机地址,我们不应该写requestUrl主机地址的方法。
 2.通过覆盖requestMethod方法,我们使用POST方法
 3.通过覆盖requestArgument方法,我们提供了POST数据。如果用户名和密码参数包含任何特征应该逃,图书馆会自动。
 
 
 */






 /*我们覆盖cacheTimeInSeconds方法,那么我们的API为指定的时间会自动缓存数据。如果缓存数据没有过期,api的开始和startWithCompletionBlockWithSuccess将直接返回缓存的数据结果。
  
  - (NSInteger)cacheTimeInSeconds {
  // cache 3 minutes, which is 60 * 3 = 180 seconds
  return 60 * 3;
  }
*/

/*你需要使用CDN地址在你的请求
 - (BOOL)useCDN {
 return YES;
 }
 */

/*验证响应JSON
 - (id)jsonValidator {
 return @{
 @"nick": [NSString class],
 @"level": [NSNumber class]
 };
 }
 
 */
/*初始化实例后,可以调用它的启动或startWithCompletionBlockWithSuccess方法发送请求到网络请求队列。
 [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
 // you can use self here, retain cycle won't happen
 NSLog(@"succeed");
 
 } failure:^(YTKBaseRequest *request) {
 // you can use self here, retain cycle won't happen
 NSLog(@"failed");
 }];
 
 */

/*
 要启动断点续传功能，只需要覆盖 resumableDownloadPath方法
 
 */

/*设置一个3分钟的缓存，3分钟内调用调Api的start方法，实际上并不会发送真正的请求。
 - (NSInteger)cacheTimeInSeconds {
 // 3分钟 = 180 秒
 return 60 * 3;
 }
 */

/*请求多个类 不用
 YTKBatchRequest
 */

/*依赖请求
 YTKChainRequest
 */

/*请求上次内容
 具体的方法是直接使用 YTKRequest 的 - (BOOL)loadCacheWithError: 方法，即可获得上次缓存的内容。当然，你需要把 - (NSInteger)cacheTimeInSeconds 覆盖，返回一个大于等于 0 的值，这样才能开启 YTKRequest 的缓存功能，否则默认情况下，缓存功能是关闭的。
 - (void)loadCacheData {
 NSString *userId = @"1";
 GetUserInfoApi *api = [[GetUserInfoApi alloc] initWithUserId:userId];
 if ([api loadCacheWithError:nil]) {
 NSDictionary *json = [api responseJSONObject];
 NSLog(@"json = %@", json);
 // show cached data
 }
 [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
 NSLog(@"update ui");
 } failure:^(YTKBaseRequest *request) {
 NSLog(@"failed");
 }];
 }
 
 */

/*上传文件
 我们可以通过覆盖 constructingBodyBlock 方法，来方便地上传图片等附件，如下是一个示例：
 - (AFConstructingBlock)constructingBodyBlock {
 return ^(id<AFMultipartFormData> formData) {
 NSData *data = UIImageJPEGRepresentation(_image, 0.9);
 NSString *name = @"image";
 NSString *formKey = @"image";
 NSString *type = @"image/jpeg";
 [formData appendPartWithFileData:data name:formKey fileName:name mimeType:type];
 };
 }
 
 - (id)jsonValidator {
 return @{ @"imageId": [NSString class] };
 }
 
 - (NSString *)responseImageId {
 NSDictionary *dict = self.responseJSONObject;
 return dict[@"imageId"];
 }

 */

/*设置header
 requestHeaderFieldValueDictionary 方法返回一个 dictionary 对象来自定义请求的 HeaderField，返回的 dictionary，其 key 即为 HeaderField 的 key，value 为 HeaderField 的 Value，需要注意的是 key 和 value 都必须为 string 对象。
 */

/*充血request方法
 // 若这个方法返回非 nil 对象，会忽略 requestUrl, requestArgument, requestMethod, requestSerializerType,requestHeaderFieldValueDictionary
 - (NSURLRequest *)buildCustomUrlRequest;
 */




#pragma mark --jsonmodel
/*模型集合
 @protocol ProductModel
 
 @end
 @interface ProductModel : JSONModel
 @property (assign, nonatomic) int id;
 @property (strong, nonatomic) NSString* name;
 @property (assign, nonatomic) float price;
 @end
 
 @implementation ProductModel
 @end
 
 @interface OrderModel : JSONModel
 @property (assign, nonatomic) int order_id;
 @property (assign, nonatomic) float total_price;
 @property (strong, nonatomic) NSArray<ProductModel>* products;
 @end
 
 
 */

/*key映射
 @interface OrderModel : JSONModel
 @property (assign, nonatomic) int id;
 @property (assign, nonatomic) float price;
 @property (strong, nonatomic) NSString* productName;
 @end
 
 @implementation OrderModel
 
 +(JSONKeyMapper*)keyMapper
 {
 return [[JSONKeyMapper alloc] initWithDictionary:@{
 @"order_id": @"id",
 @"order_details.name": @"productName",
 @"order_details.price.usd": @"price"
 }];
 }
 设置全局键映射(应用于所有model)
 [JSONModel setGlobalKeyMapper:[
 [JSONKeyMapper alloc] initWithDictionary:@{
 @"item_id":@"ID",
 @"item.name": @"itemName"
 }]
 ];
 
 */

/*下划线转驼峰
 
 +(JSONKeyMapper*)keyMapper
 {
 return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
 }
 
 */

/*可选属性
 @property (assign, nonatomic) int id;
 @property (strong, nonatomic) NSString<Optional>* name;
 @property (assign, nonatomic) float price;
 @property (strong, nonatomic) NSNumber<Optional>* uuid;
 
 忽略属性
 @property (strong, nonatomic) NSString<Ignore>* customProperty;
 @end

 */

/*设置所有的属性为可选(所有属性值可以为空)
 +(BOOL)propertyIsOptional:(NSString*)propertyName
 {
 return YES;
 }
 */

/*model  转json 转字典
 //convert to dictionary
 NSDictionary* dict = [pm toDictionary];
 
 //convert to text
 NSString* string = [pm toJSONString];
 
 */

/*自定义数据的转换
 @implementation JSONValueTransformer (CustomTransformer)
 
 - (NSDate *)NSDateFromNSString:(NSString*)string {
 NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
 [formatter setDateFormat:APIDateFormat];
 return [formatter dateFromString:string];
 }
 
 - (NSString *)JSONObjectFromNSDate:(NSDate *)date {
 NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
 [formatter setDateFormat:APIDateFormat];
 return [formatter stringFromDate:date];
 }

 */

/*自定义处理指定的属性 ?????????
 // Convert and assign the locale property
 - (void)setLocaleWithNSString:(NSString*)string {
 self.locale = [NSLocale localeWithLocaleIdentifier:string];
 }
 
 - (NSString *)JSONObjectForLocale {
 return self.locale.localeIdentifier;
 }

 */

/*自定义JSON校验   ??????
 - (BOOL)validate:(NSError *__autoreleasing *)error {
 BOOL valid = [super validate:error];
 
 if (self.name.length < self.minNameLength.integerValue) {
 *error = [NSError errorWithDomain:@"me.mycompany.com" code:1 userInfo:nil];
 valid = NO;
 }
 
 return valid;
 }
 */



#pragma mark --masnory

/*
 1、基本约束
 基本约束的可变性相当大，只要更新了其中一条约束，其他控件很可能也会受到牵连而发生响应的改变。
 [redView makeConstraints:^(MASConstraintMaker *make) {
 make.left.equalTo(10); //直接在equalTo()内填写数字，默认为相对于父视图而言，等同于下面注释的语句
 //make.left.equalTo(self.view.left).offset(10); //offset()内填写偏差量
 make.top.equalTo(50);
 make.width.equalTo(self.view).dividedBy(2).offset(-30);//dividedBy()，除以某个量，用以实现按比例设置约束；multipliedBy()则是乘以某个量
 make.height.equalTo(self.view).dividedBy(5);
 }];
 
 [blueView makeConstraints:^(MASConstraintMaker *make) {
 make.left.equalTo(redView.right).offset(10);
 make.right.equalTo(-10);
 make.top.equalTo(redView);
 make.height.equalTo(@[redView,greenView]);//equalTo()内填写数组，可以实现对多个控件添加同一约束
 }];
 
 [greenView makeConstraints:^(MASConstraintMaker *make) {
 make.left.width.and.height.equalTo(redView);//如果equalTo()内填写的内容相同，可以使用一个语句来添加多条约束
 make.top.equalTo(redView.bottom).offset(10);
 }];
*/


/*3、边距填充约束
 用于在父视图内设置子视图对父视图的边距。
 [redView makeConstraints:^(MASConstraintMaker *make) {
 make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(60, 60, 60, 60));
 }];
 
 */
/*
 4、约束优先级
 
 当存在多条相同意义的约束时，可以设置约束的优先级。
 
 [redView makeConstraints:^(MASConstraintMaker *make) {
 make.top.left.and.right.equalTo(self.view);
 make.height.greaterThanOrEqualTo(100).with.priorityHigh();//高小于等于100，约束优先级高
 make.height.equalTo(500).with.priorityLow();//高为500，约束优先级低
 }];
 
 [blueView makeConstraints:^(MASConstraintMaker *make) {
 make.top.equalTo(redView.bottom);
 make.left.and.right.equalTo(redView);
 make.bottom.equalTo(self.view);
 make.height.equalTo(self.view).with.priorityHigh();//高占满全屏，约束优先级高
 }];
 /**
 因为约束存在优先级，所以编译器会做出如下判断：
 首先，蓝色视图的高要占满全屏；
 其次，红色视图的高至少要有100；
 最后，红色视图的高为500；
 但由于前两条约束已经完成了视图的布局，所以便忽略了优先级较低的约束。
 */

/*5、更新约束
 
 修改原有的masonry约束。
 [self.redView updateConstraints:^(MASConstraintMaker *make) {
 make.width.and.height.equalTo(200);
 }];
 */
/*6、重设约束
 
 除去所有原有的masonry约束，并重设
 
 [self.redView remakeConstraints:^(MASConstraintMaker *make) {
 make.center.equalTo(self.view);
 make.width.and.height.equalTo(200);
 }];
 */























