//
//  TargetSettingViewGiftAddGiftTableViewCell.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/29.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetSettingViewGiftAddGiftTableViewCell.h"

@implementation TargetSettingViewGiftAddGiftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addGiftButton:(UIButton *)sender {
    if (_delegate && [_delegate conformsToProtocol:@protocol(TargetSettingViewGiftAddGiftTableViewCellProtocol)]) {
        [_delegate targetSettingViewGiftAddGiftTableViewCellPress:self];
    }
}
@end
