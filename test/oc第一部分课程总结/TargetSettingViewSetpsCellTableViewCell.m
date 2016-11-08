//
//  TargetSettingViewSetpsCellTableViewCell.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/3.
//  Copyright © 2016年 edz. All rights reserved.
//
#import "TargetViewController.h"
#import "TargetSettingViewSetpsCellTableViewCell.h"
#import "Masonry.h"

@class TargetViewController;

@interface TargetSettingViewSetpsCellTableViewCell()
<TargetViewControllerProtocol>

@end

@implementation TargetSettingViewSetpsCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self initDetailView];
}
//初始化缩进
-(void)initMySpace{
    NSInteger spaceNum = _myData.SpaceNum;
    NSInteger contentViewWidth ;
    contentViewWidth = [UIScreen mainScreen].bounds.size.width;
    NSInteger stepImageViewWidth = CGRectGetWidth(_stepImageView.frame);
    NSInteger stepImageViewHeight = CGRectGetHeight(_stepImageView.frame);

    
    
    [_stepImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset
        (10+spaceNum*10);
        make.right.equalTo(self.contentView.mas_left).offset
        (stepImageViewWidth + 10+spaceNum*10);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.bottom.equalTo(self.contentView.mas_top).offset
        (stepImageViewHeight + 10);

    }];

    [_stepNameTextFeild mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(73+spaceNum*10);
        make.right.equalTo(self.contentView.mas_left).offset
        (CGRectGetWidth(_stepNameTextFeild.frame) + 73 + spaceNum*10);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.bottom.equalTo(self.contentView.mas_top).offset
        (CGRectGetHeight(_stepNameTextFeild.frame) + 10);

    }];
}

-(void)initDetailView{
    _detailView = [[[NSBundle mainBundle]loadNibNamed:@"TargetSettingViewStepDetailView" owner:nil options:nil]firstObject];
    _detailView.hidden = _myData.isShowDetail;
    
    _detailView.clipsToBounds = YES;
    [self.contentView addSubview:_detailView];
    [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_bottom).offset(-_detailView.frame.size.height);
        make.height.mas_equalTo(0);
    }];
}

-(void)initAllView{
    //视图是否显示
    int height = _myData.isShowDetail ? 248 : 0;
     
    [_detailView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_bottom).offset(-_detailView.frame.size.height);
        make.height.mas_equalTo(height);
    }];
    
}

-(void)setMyData:(StepModel *)myData{
    _myData = myData;
    //初始化所有
    _detailView.myData = _myData;
    [self initAllView];
    [self initMySpace];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addSonButtonAct:(UIButton *)sender {
    _addButton .hidden = NO;
    _addSonButton.hidden = YES;
    _addBrotherButton.hidden = YES;
    _showDetailButton.hidden = YES;

    //添加子节点
    StepModel* newStep = [[DataController getInstence]getNewStepModel];
    newStep.isShow = YES;
    newStep.fatherModel = _myData;
    [_myData.stepModels addObject:newStep];
    [_myData updataAll ];
    [self dataTest];
    if (_delegate && [_delegate conformsToProtocol:@protocol(targetSettingViewSetpsCellTableViewCellProtocol)]) {
        
        [_delegate reloadStepsCell:self];
    }
}
- (IBAction)addBrotherButtonAct:(UIButton *)sender {
    _addButton .hidden = NO;
    _addSonButton.hidden = YES;
    _addBrotherButton.hidden = YES;
    _showDetailButton.hidden = NO;
    
    //发送消息给viewcontroller 要添加step了

    [_myData.fatherModel addSonStep:self.myData];
    [self dataTest];

    if (_delegate && [_delegate conformsToProtocol:@protocol(targetSettingViewSetpsCellTableViewCellProtocol)]) {
        
        [_delegate reloadStepsCell:self];
    }
}
- (IBAction)addButtonAct:(UIButton *)sender {
    //显示那些按钮 如果一定时间不点击会隐藏
    _addButton .hidden = YES;
    _showDetailButton.hidden = YES;

    _addSonButton.hidden = NO;
    _addBrotherButton.hidden = NO;
}

- (IBAction)showDetailVuew:(id)sender {
    [self updataShowDetailView];
}

- (IBAction)stepNameDidEnd:(UITextField *)sender {
    _myData.stepName = sender.text;
}

- (IBAction)stepNameChanged:(UITextField *)sender {
    _myData.stepName = sender.text;


 }

-(void)updataShowDetailView{
    if (!_myData.isShowDetail) {
        _myData.isShowDetail = YES;
        
    }else{
        _myData.isShowDetail = NO;
    }
    if (_delegate && [_delegate conformsToProtocol:@protocol(targetSettingViewSetpsCellTableViewCellProtocol)]) {
        [_delegate reloadStepsCell:self];
    }
}
//targetViewController的代理 这里需要保存数据了
-(void)TargetViewControllerProtocolSaveData{
    [_myData updataAll];
}

-(void)dataTest{
    NSMutableArray* targets =[[DataController getInstence]targetMaster];
    TargetModel* targetBuf = targets[1];
    //测试1 修改一个target项
    //        HeaderModel* headermodel = [targetBuf headerModel];
    //    //
    //        NSString* targetName = [headermodel targetHeaderName];
    //        NSLog(@"targetName %@",targetName);
    //    headermodel.targetHeaderName = @"把数据部分调通";
    //    NSLog(@"targetName %@",headermodel.targetHeaderName);
    //    [headermodel upDataAll ];
    //    TargetModel* targetBuf2 = [[DataController getInstence]targetMaster][0];
    //    NSLog(@"targetBuf %@",[[targetBuf2 headerModel] targetHeaderName]);
    //    NSLog(@"----------targetBuf %@",[[DataController getInstence] dataMaster][0][@"headerFooter"][@"targetHeaderName"]);
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSLog(@"DataMaster %@",DataMaster[0][@"headerFooter"][@"targetHeaderName"]);
    
    
    //测试2 修改一个step项
    //    NSMutableArray* steps =[targetBuf stepsModel];
    //    StepModel* step = steps[0];
    //    NSString* name = [step stepName];
    //    NSLog(@"step name %@",name);
    //    step.stepName = @"处理model";
    //    [step updataAll];
    //    NSString* name2 = [[targetBuf stepsModel][0]stepName];
    //    NSLog(@"step name %@",name2);
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSMutableArray* steps2 = DataMaster[0][@"steps"];
    //    NSString* name3 = steps2[0][@"setpName"];
    //    NSLog(@"setpName %@",name3);
    
    //    //测试3 添加一个step项
    //    StepModel* step = steps[0];
    //    [targetBuf addStep:@"写完model" stepDetails:@"好好活着" stepImagePath:@"no.png" stepBuildTime:@"20161010" stepEndTime:@"20161111" giftPath:[[NSMutableArray alloc]init]];
    //    NSMutableArray* steps =[targetBuf stepsModel];
    //
    //    //测试 4 删除一个step项
    //    StepModel* step2 = steps[2];
    //
    //    [step2 deleteMe];
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSMutableArray* steps2 = DataMaster[0][@"steps"];
    //    NSMutableDictionary* steps3 = steps2[2];
    //    NSString* name3 = steps3[@"setpName"];
    //    NSLog(@"setpName %@",name3);
    
    //测试 5 修改一个gift
    NSMutableArray* gifts =[targetBuf giftsModel];
    GiftModel* gift = gifts[0];
    NSLog(@"%@",gift.giftName);
    //    gift.giftName = @"好好活着";
    //    [gift updataAll];
    //    //测试 6 添加一个Gift
    //    [targetBuf addGift:@"好好活着" giftUrl:@"空" giftImage:@"sb.png" setpPath:[[NSMutableArray alloc]init]];
    //
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSMutableArray* gifts2 = DataMaster[0][@"gifts"];
    //    NSString* giftName = gifts2[1][@"giftName"];
    //    NSLog(@"%@",giftName);
    
}

@end
