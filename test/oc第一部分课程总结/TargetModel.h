//
//  TargetModle.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "DataController.h"

#import "HeaderModel.h"
#import "StepModel.h"
#import "GiftModel.h"

@class DataController;

@class TargetModel;

@protocol TargetModelProtocol <NSObject>

-(Boolean)targetModelUpData:(TargetModel*)sender;

@end

@interface TargetModel : NSObject
<
StepModelProtocol,
HeaderModelProtocol,
GiftModelProtocol
>

-(TargetModel*)init:(NSMutableDictionary*)data myName:(NSInteger)myName;
-(Boolean)upDataAll;
//添加step
-(void)addStep:(NSString*)stepName
   stepDetails:(NSString*)stepDetails
 stepImagePath:(NSString*)stepImagePath
 stepBuildTime:(NSString*)stepBuildTime
   stepEndTime:(NSString*)stepEndTime
      giftPath:(NSMutableArray*)giftPath;
//添加一个Gift
/*
 _myDataPlist = giftData;
 _giftName   = giftData[@"giftName"];
 _giftImage  = giftData[@"giftImage"];
 _giftUrl    = giftData[@"giftUrl"];
 _stepPath   = giftData[@"setpPath"];
 _canBuyThisGift = NO;
 
 */
-(void)addGift:(NSString*)giftName
      giftUrl:(NSMutableDictionary*)giftUrl
    giftImage:(NSString*)giftImage
     setpPath:(NSMutableArray*)setpPath;

-(void)addSonStep:(StepModel*)bigBrother;


@property(nonatomic)NSInteger myName;

@property(nonatomic,strong)HeaderModel* headerModel;
@property(nonatomic,strong)NSMutableArray* giftsModel;//modle
@property(nonatomic,strong)NSMutableArray* stepsModel;//modle
//保存一下父节点指针 用于 在修改之后 刷新数据
@property(nonatomic,strong)NSMutableDictionary* mySelfDataPlist;

@property(nonatomic,strong)NSMutableArray* stepData;//plist
@property(nonatomic,strong)NSMutableArray* giftData;//plist
@property(nonatomic,strong)NSMutableDictionary* headerData;//plist

@property(nonatomic,strong)id<TargetModelProtocol>delegate;

@end
