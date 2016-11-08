//
//  TargetSettingViewStepDetailView.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/4.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetSettingViewStepDetailView.h"

@implementation TargetSettingViewStepDetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)complete:(id)sender {
    NSLog(@"我被点啊");
    _myData.stepEndTime = _Time.text;
    [_myData.giftPath addObject:_gift.text ];
    _myData.stepDetails = _detailTextView.text;
    _myData.isShowDetail = NO;
    NSNotification * notice = [NSNotification notificationWithName:@"upDataStepCells" object: nil userInfo:@{@"seciton":@"2"}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}

- (IBAction)timeChange:(UITextField *)sender{
    _myData.stepEndTime = sender.text;
}
- (IBAction)giftChangeText:(UITextField *)sender {
    [_myData.giftPath addObject:sender.text ];

}

- (IBAction)timeChangeDidEnd:(UITextField *)sender {
    [sender resignFirstResponder];
}

- (IBAction)giftChangeDidEnd:(UITextField *)sender {
    [sender resignFirstResponder];

}
@end
