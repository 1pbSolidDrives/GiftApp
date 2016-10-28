//
//  BodyTableViewCell.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@class BodyTableViewCell;
@protocol BodyTableViewCellProtocol <NSObject>
//点击打开子节点代理
-(void)bodyTableViewCell : (BodyTableViewCell*)sender PressForOpenSonsteps:(NSInteger)tag;
//点击切换到设置页面代理
-(void)bodyTableViewCellPressForOpenSetView : (BodyTableViewCell*)sender;
@end
@interface BodyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *IsOpenTargetImage;
@property (weak, nonatomic) IBOutlet UILabel *StepText;
@property (weak, nonatomic) IBOutlet UIView *OpenSonStepsView;
@property (weak, nonatomic) IBOutlet UIView *openSetView;

@property(strong,nonatomic) id<BodyTableViewCellProtocol> delegate;
@property(strong,nonatomic) NSMutableArray* cellSon;//我内部保存的节点
@property(strong,nonatomic) StepModle* myselfModel;
@property(strong,nonatomic) NSIndexPath *myIndexPath;

-(void)initAllView:(StepModle*)myself;

@end
