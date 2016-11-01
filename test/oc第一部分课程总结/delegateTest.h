//
//  delegateTest.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/1.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface delegateTest : NSObject
- (void)setDelegateTargets:(NSArray *)delegateTargets;
-(void)addDelegate:(id)delegate;
-(void)initWeakRefTargets;
@end
