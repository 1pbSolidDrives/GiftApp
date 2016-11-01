//
//  TargetViewDelegates.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/1.
//  Copyright © 2016年 edz. All rights reserved.
//

/*
 这是一个代理集合 
 当viewcontroller 执行某个代理的时候 
 他会
 */

#import "TargetViewDelegates.h"



@implementation TargetViewDelegates

-(instancetype)init{
    self = [super init];
    if (self) {
        self.weakRefTargets = [NSPointerArray weakObjectsPointerArray];
        _targetViewDelegates = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)addDelegateTargets:(id)delegate{
    [self.targetViewDelegates addObject:delegate];
}
//判断这个方法本对象有没有
-(BOOL)respondsToSelector:(SEL)aSelector{
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    
    for (id target in _targetViewDelegates) {
        if ([target respondsToSelector:aSelector]) {
            return YES;
        }
    }
    
    return NO;
}

//找这个方法的 id
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature* singnature = [super methodSignatureForSelector:aSelector];
    if (singnature == nil) {
        for (id target in [self targetViewDelegates]) {
            singnature = [target methodSignatureForSelector:aSelector];
            break;
        }
    }
    return singnature;

}
//转发方法调用给所有delegate
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    for (id target in self.targetViewDelegates) {
        if ([target respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:target];
        }
    }
}

@end
