//
//  TargetSettingViewTargetTableViewCell.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/29.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetSettingViewTargetTableViewCell.h"


@implementation TargetSettingViewTargetTableViewCell

-(void)initAllView:(HeaderModel *)myData{
        _myData = myData;
        [self initViews];
}

-(void)initViews{
    _targetName.text = [_myData targetHeaderName];
    _targetTime.text = [_myData targetBeginTime];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    // Configure the view for the selected state
}

-(void)TargetViewControllerProtocolSaveData{
    //获取文本
    NSString* targetName = [_targetName text];
    NSString* targetTime = [_targetTime text];
    
    
    //写入model
    
    _myData.targetExpectTime = targetTime;
    _myData.targetHeaderName = targetName;
    
    [_myData upDataAll];
    NSLog(@"TargetSettingViewTargetTableViewCell 要保存啦！！");
}
@end
