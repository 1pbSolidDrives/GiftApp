//
//  StepModle.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StepModle : NSObject

-(StepModle*)init:(NSMutableDictionary*)stepData;
-(void)updataAll;

@property(nonatomic) BOOL stepIscomplet;
@property(nonatomic,strong)NSString* stepDetails;
@property(nonatomic,strong)NSString* stepName;
@property(nonatomic,strong)NSString* stepImagePath;
@property(nonatomic,strong)NSString* stepEndTime;
@property(nonatomic,strong)NSString* stepBuildTime;
@property(nonatomic,strong)NSMutableArray* giftPath;
@property(nonatomic,strong)NSMutableArray* steps;

@property(nonatomic)Boolean isOpen;
@property(nonatomic)Boolean isRoot;//是不是根节点 这个节点不能被关闭
@property(nonatomic)Boolean isShow;//是否显示
@property(nonatomic)NSInteger SpaceNum;//缩进数量


@property(nonatomic,strong)NSMutableArray* stepModles;

@property(nonatomic,strong)NSMutableDictionary* fatherData;
@end
