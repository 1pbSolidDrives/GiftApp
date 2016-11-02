//
//  SettingViewGiftHeaderView.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/2.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "SettingViewGiftHeaderView.h"

@implementation SettingViewGiftHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)addGiftButtonAct:(id)sender {
    if (_delegate &&[_delegate conformsToProtocol:@protocol(SettingViewGiftHeaderProtocol)]) {
        [_delegate SettingViewGiftHeaderPressAction:0];
    }
}

- (IBAction)editButtonAct:(id)sender {
    if (_delegate &&[_delegate conformsToProtocol:@protocol(SettingViewGiftHeaderProtocol)]) {
        [_delegate SettingViewGiftHeaderPressAction:1];
    }
}
@end
