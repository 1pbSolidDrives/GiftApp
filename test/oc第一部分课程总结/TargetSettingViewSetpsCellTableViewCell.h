//
//  TargetSettingViewSetpsCellTableViewCell.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/3.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TargetSettingViewStepDetailView.h"
#import "DataController.h"
@class TargetSettingViewSetpsCellTableViewCell;

@protocol targetSettingViewSetpsCellTableViewCellProtocol <NSObject>

-(void)reloadStepsCell:(TargetSettingViewSetpsCellTableViewCell*)sender;

@end

@interface TargetSettingViewSetpsCellTableViewCell : UITableViewCell

@property (strong,nonatomic)TargetSettingViewStepDetailView* detailView;

@property(nonatomic)Boolean isShowDetail;
@property(strong,nonatomic)StepModel* myData;
@property(strong,nonatomic)id<targetSettingViewSetpsCellTableViewCellProtocol>delegate;

@property (weak, nonatomic) IBOutlet UIImageView *stepImageView;
@property (weak, nonatomic) IBOutlet UITextField *stepNameTextFeild;
@property (weak, nonatomic) IBOutlet UIButton *addSonButton;

- (IBAction)addSonButtonAct:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *addBrotherButton;
- (IBAction)addBrotherButtonAct:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *showDetailButton;

@property (weak, nonatomic) IBOutlet UIButton *addButton;
- (IBAction)addButtonAct:(UIButton *)sender;
- (IBAction)showDetailVuew:(id)sender;

@end
