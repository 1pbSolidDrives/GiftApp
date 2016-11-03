//
//  TargetSettingViewStepTableViewCell.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/3.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TargetSettingViewStepTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *stepImage;
@property (weak, nonatomic) IBOutlet UITextField *stepName;
- (IBAction)addButtonAct:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *addChildButton;
- (IBAction)addChildButtonAct:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *addBrother;
- (IBAction)addBrotherAct:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *openDateilsView;

@end
