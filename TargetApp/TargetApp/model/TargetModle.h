//
//  TargetModle.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeaderModel.h"
#import "TargetModle.h"
#import "StepModle.h"
#import "GiftModle.h"
@interface TargetModle : NSObject

-(TargetModle*)init:(NSMutableDictionary*)data;
-(void)upData;//这个节点似乎并不需要刷新？ 也需要

@property(nonatomic,strong)HeaderModel* headerModel;
@property(nonatomic,strong)NSMutableArray* giftsModel;//modle
@property(nonatomic,strong)NSMutableArray* stepsModel;//modle
//保存一下父节点指针 用于 在修改之后 刷新数据
@property(nonatomic,strong)NSMutableDictionary* fatherData;//plist
@property(nonatomic,strong)NSMutableArray* stepData;//plist
@property(nonatomic,strong)NSMutableArray* giftData;//plist
@property(nonatomic,strong)NSMutableDictionary* headerData;//plist
@end
