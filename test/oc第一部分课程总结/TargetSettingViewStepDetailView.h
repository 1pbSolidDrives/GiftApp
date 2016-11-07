//
//  TargetSettingViewStepDetailView.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/4.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StepModel.h"



@interface TargetSettingViewStepDetailView : UIView

@property(strong,nonatomic) StepModel* myData;

@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UITextField *Time;
@property (weak, nonatomic) IBOutlet UITextField *gift;
@property (weak, nonatomic) IBOutlet UIButton *complete;
- (IBAction)complete:(id)sender;

- (IBAction)timeChange:(UITextField *)sender;
- (IBAction)giftChangeText:(UITextField *)sender;
- (IBAction)timeChangeDidEnd:(UITextField *)sender;
- (IBAction)giftChangeDidEnd:(UITextField *)sender;

@end
