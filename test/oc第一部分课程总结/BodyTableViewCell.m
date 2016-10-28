//
//  BodyTableViewCell.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "BodyTableViewCell.h"

@implementation BodyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //创建触摸事件
    //点击打开子节点
    UITapGestureRecognizer* tapRecognizerOpenSonSteps = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesteureRecognizerOpenSonStepsAct:)];
    [_OpenSonStepsView addGestureRecognizer:tapRecognizerOpenSonSteps];
    //点击打开设置窗口
    UITapGestureRecognizer* tapRecognizerOpenSettingView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesteureRecognizerOpenSetStepViewAct:)];
    [_openSetView addGestureRecognizer:tapRecognizerOpenSettingView];
    
}

-(void)tapGesteureRecognizerOpenSetStepViewAct:(UITapGestureRecognizer*)sender {
    if (_delegate && [_delegate conformsToProtocol:@protocol(BodyTableViewCellProtocol) ]) {
        [_delegate bodyTableViewCellPressForOpenSetView:self];
    }
}

-(void)tapGesteureRecognizerOpenSonStepsAct:(UITapGestureRecognizer*)sender {
    NSLog(@"我被点钟啦,快把消息发给table ");
    [self updataMeAndMySon];
        [[DataController getInstence]initCellMaster];

    if (_delegate && [_delegate conformsToProtocol:@protocol(BodyTableViewCellProtocol) ]) {
        [_delegate bodyTableViewCell:self PressForOpenSonsteps:self.tag];
    }
    
}
//点击事件
    //显示子节点
    //显示设置页面




//显示子节点
-(void)initAllView:(StepModel *)myself{
    _myselfModel = myself;
    
    _StepText.text = [NSString stringWithFormat:@"%ld,%@", _myselfModel.SpaceNum,_myselfModel.stepName ];
}

-(void)updataMeAndMySon{
    //点击事件只会修改是否显示
    NSMutableArray* stepsBuf = _myselfModel.stepModels;
    
    //如果我有子节点
    if (stepsBuf.count > 0) {
        
        StepModel* step = stepsBuf[0];
        //我显示 并且 打开
        if (step.isShow == YES && _myselfModel.isOpen == YES) {
            //我的子节点 不显示 我关闭
            [self setAllSonShowRoNot:NO];
            _myselfModel.isOpen = NO;
        }
        else if(step.isShow == NO && _myselfModel.isOpen == NO){
            [self setAllSonShowRoNot:YES];
            _myselfModel.isOpen = YES;
        }
    }



}

-(void)setAllSonOpenClose:(Boolean)bools{
    NSMutableArray* stepsBuf = _myselfModel.stepModels;
    if (stepsBuf.count!=0) {
        for (NSInteger i =0 ; i<stepsBuf.count; i++) {
            StepModel* step = stepsBuf[i];
            NSLog(@"%@",step);
            step.isOpen = bools;
        }
    }

}

-(void)setAllSonShowRoNot:(Boolean)bools{
    NSMutableArray* stepsBuf = _myselfModel.stepModels;
    if (stepsBuf.count!=0) {
        for (NSInteger i =0 ; i<stepsBuf.count; i++) {
            StepModel* step = stepsBuf[i];
            NSLog(@"%@",step);
            step.isShow = bools;
            step.SpaceNum = _myselfModel.SpaceNum + 1;
        }
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
