//
//  TargetSettingViewGiftAddGiftTableViewCell.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/29.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TargetSettingViewGiftAddGiftTableViewCell;

@protocol TargetSettingViewGiftAddGiftTableViewCellProtocol <NSObject>

-targetSettingViewGiftAddGiftTableViewCellPress:(id)sender;

@end



@interface TargetSettingViewGiftAddGiftTableViewCell : UITableViewCell

@property(nonatomic,strong)id<TargetSettingViewGiftAddGiftTableViewCellProtocol>delegate;
- (IBAction)addGiftButton:(UIButton *)sender;


@end
