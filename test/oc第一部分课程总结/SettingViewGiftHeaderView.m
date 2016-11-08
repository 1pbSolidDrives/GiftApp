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
-(void)awakeFromNib{
    [super awakeFromNib];
    
//
//    [self barite];
    
}

- (IBAction)addGiftButtonAct:(id)sender {
    if (_delegate &&[_delegate conformsToProtocol:@protocol(SettingViewGiftHeaderProtocol)]) {
        [_delegate SettingViewGiftHeaderPressAction:0];
    }
}

- (IBAction)editButtonAct:(id)sender {
    //修改显示文字
    UIButton* edit = (UIButton*)sender;
    if ([edit.titleLabel.text isEqualToString:@"编辑"]) {
        
        [edit.titleLabel setText: @"完成"];
        //发送编辑消息
        NSNotification* noticeForEditGift = [NSNotification notificationWithName:@"editCellS" object:nil userInfo:@{@"sender":@"giftEdit_ON"}];
        [[NSNotificationCenter defaultCenter]postNotification:noticeForEditGift];
    }
    else if ([((UIButton*)sender).titleLabel.text isEqualToString:@"完成"]){
        ((UIButton*)sender).titleLabel.text = @"编辑";
        NSNotification* noticeForEditGift = [NSNotification notificationWithName:@"editCellS" object:nil userInfo:@{@"sender":@"giftEdit_OFF"}];
        [[NSNotificationCenter defaultCenter]postNotification:noticeForEditGift];
    }
    
}


@end
