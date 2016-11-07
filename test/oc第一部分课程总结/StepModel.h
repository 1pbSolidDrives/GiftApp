//
//  StepModle.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//


#import <Foundation/Foundation.h>
@class StepModel;

@protocol StepModelProtocol <NSObject>

-(Boolean)stepModelProtocolUpData:(StepModel*)sender;

-(Boolean)stepModelProtocolDeleteMe:(StepModel*)sender;

@end

@interface StepModel : NSObject
<StepModelProtocol>

-(StepModel*)init:(NSMutableDictionary*)stepData father:(StepModel*)father;
-(Boolean)updataAll;
//增加
-(void)addStep:(NSString*)stepName
   stepDetails:(NSString*)stepDetails
 stepImagePath:(NSString*)stepImagePath
 stepBuildTime:(NSString*)stepBuildTime
   stepEndTime:(NSString*)stepEndTime
      giftPath:(NSMutableArray*)giftPath;
//删除
-(Boolean)deleteMe;
-(void)addSonStep:(id)bigBrother;
//修改
//直接改 然后调用 updataall
//model
@property(nonatomic) BOOL stepIscomplet;
@property(nonatomic,strong)NSString* stepDetails;
@property(nonatomic,strong)NSString* stepImagePath;
@property(nonatomic,strong)NSString* stepEndTime;
@property(nonatomic,strong)NSString* stepBuildTime;
@property(nonatomic,strong)NSString* stepName;

@property(nonatomic)NSInteger stepNumInPlist;

@property(nonatomic,strong)NSMutableArray* giftPath;
@property(nonatomic,strong)NSMutableArray* steps;

@property(nonatomic,strong)id fatherModel;
@property(nonatomic)Boolean isShowDetail;

@property(nonatomic)Boolean isOpen;
@property(nonatomic)Boolean isRoot;//是不是根节点 这个节点不能被关闭
@property(nonatomic)Boolean isShow;//是否显示

@property(nonatomic)NSInteger SpaceNum;//缩进数量


@property(nonatomic,strong)NSMutableArray* stepModels;
//plist
@property(nonatomic,strong)NSMutableDictionary* myDataplist;

@property(nonatomic,strong)id<StepModelProtocol>delegate;

@end
