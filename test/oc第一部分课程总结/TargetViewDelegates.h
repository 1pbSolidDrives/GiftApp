//
//  TargetViewDelegates.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/1.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TargetViewDelegates : NSObject
//代理协议集合 这个暂时不用
@property(nonatomic,strong)NSMutableArray* targetViewDelegates;
@property (nonatomic, strong) NSPointerArray *weakRefTargets;

-(instancetype)init;
-(void)addDelegateTargets:(id)delegate;
@end
