//
//  GiftCellTableViewCell.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/27.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "GiftCellTableViewCell.h"
static const NSInteger buyButtonAct = 1;
static const NSInteger otherInfoButtonAct = 2;
@implementation GiftCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initGiftCell:(GiftModel*)mySelfModel{
    //初始化数据
    _myModel = mySelfModel;
    //初始化视图
    [self initView];
}

-(void)initView{
    UIImage* giftImage = [UIImage imageNamed:_myModel.giftImage];
    _giftURLImage.image = giftImage;
    _gitName.text = _myModel.giftName;
    _whereBuy.text = @"京东";
//    _buyButton.titleLabel.text = @"6000";
    NSLog(@"%@",_buyButton.titleLabel.text);
    [_buyButton setTitle:@"6000" forState:UIControlStateNormal];
}



- (IBAction)buyButtonAct:(UIButton *)sender {
    if (_delegate &&[_delegate conformsToProtocol:@protocol(GiftCellTableViewCellProtocol) ]){
        [_delegate giftCellTableViewCellPressAct:self andTag:buyButtonAct];
    }
}

- (IBAction)otherInfo:(id)sender {
    if (_delegate &&[_delegate conformsToProtocol:@protocol(GiftCellTableViewCellProtocol) ]){
        [_delegate giftCellTableViewCellPressAct:self andTag:otherInfoButtonAct];
    }
}
@end
