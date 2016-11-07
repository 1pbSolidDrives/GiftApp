//
//  TargetSettingViewTargetTableViewCell.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/29.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderModel.h"
#import "TargetViewController.h"

@class TargetViewController;

@interface TargetSettingViewTargetTableViewCell : UITableViewCell
<TargetViewControllerProtocol>

@property (weak, nonatomic) IBOutlet UITextField *targetName;
@property (weak, nonatomic) IBOutlet UITextField *targetTime;
@property (nonatomic,strong)HeaderModel* myData;
- (IBAction)targetNameTextChanged:(UITextField *)sender;
- (IBAction)targetNameTextDidEnd:(UITextField *)sender;

- (IBAction)targetEndTimeTextChanged:(UITextField *)sender;
- (IBAction)targetEndTimeTextDidEnd:(UITextField *)sender;



-(void)initAllView:(HeaderModel*)myData;
@end
