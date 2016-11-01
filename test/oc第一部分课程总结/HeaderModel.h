//
//  HaederModle.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HeaderModel;

@protocol HeaderModelProtocol <NSObject>
//这个是唯一的 所以不需要传id
-(Boolean)headerModelProtocolUpData:(HeaderModel*)myself ;

@end

@interface HeaderModel : NSObject
-(HeaderModel*)init:(NSMutableDictionary*)headerData;
//刷新 当修改完数据之后使用
-(Boolean)upDataAll;
//plist
@property(nonatomic,strong)NSMutableDictionary* myDataPlist;

//model
@property(nonatomic,strong)NSString* completeness;
@property(nonatomic,strong)NSString* targetDetails;
@property(nonatomic,strong)NSString* targetHeaderName;
@property(nonatomic,strong)NSString* targetHeaderImagePath;
@property(nonatomic,strong)NSString* targetBeginTime;
@property(nonatomic,strong)NSString* targetExpectTime;

 
@property(nonatomic,strong)id<HeaderModelProtocol>delegate;



@end
