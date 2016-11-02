//
//  TargetSettingViewAddGiftTableViewCell.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/29.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetSettingViewAddGiftTableViewCell.h"
#import "GiftShopListInfo.h"
#import "Masonry.h"
#import "TargetViewController.h"

@interface TargetSettingViewAddGiftTableViewCell()
<TargetViewControllerProtocol>

@end

@implementation TargetSettingViewAddGiftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initAllView:(GiftModel *)giftData{
    _myData = giftData;
    //显示数据
    _giftName.text = _myData.giftName;
    //显示商城信息
    [self initShopInfo];
    

}
//初始化商城信息

-(void)initShopInfo{
    //读取显示info数量
    NSMutableArray* shopList = _myData.giftUrl;
    
    //写入其中的信息
    for (NSInteger i = 0; i<shopList.count; i++) {
        [self initSingleShopInfo:shopList[i] row:i allNum:shopList.count];
    }
    //刷新价格
    NSInteger height  = [[[[NSBundle mainBundle]loadNibNamed:@"GiftShopListInfo" owner:nil options:nil]firstObject]frame].size.height ;
    NSInteger ndwHeight = self.contentView.frame.size.height;
    ndwHeight = shopList.count * height;

}

-(void)initSingleShopInfo: (NSMutableDictionary*)shopInfo row:(NSInteger)row allNum:(NSInteger)allNum{
    GiftShopListInfo* shopInfoView = [[[NSBundle mainBundle]loadNibNamed:@"GiftShopListInfo" owner:nil options:nil]firstObject];
    shopInfoView.shopName       = shopInfo[@"shopName"];
    shopInfoView.shopUrl        = shopInfo[@"url"];
    shopInfoView.autoPrice      = shopInfo[@"price"];
    shopInfoView.manualPrice    = shopInfo[@"price"];
    shopInfoView.myData = shopInfo;
    [self.contentView addSubview:shopInfoView];
    //设置位置
    //设置infoView位置
    [shopInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.contentView);//宽度跟随父视图
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        NSInteger height = (allNum - row) * shopInfoView.frame.size.height;
        make.top.equalTo(self.contentView.mas_bottom).offset(-height);
    }];
    [_shopListViews addObject:shopInfoView];
}

- (IBAction)addShopInfo:(id)sender {
    NSLog(@"addShopInfo");
    //添加一个view 到自己内部
    [self addShopDataAndeView];
    //刷新tabelview
    if (_delegate && [_delegate conformsToProtocol:@protocol(TargetSettingViewAddGiftTableViewCellUpdataProtocol)]) {
        [_delegate targetSettingViewAddGiftTableViewCellUpdataProtocol:self updataModelAndTabelView:_myData];
    }
}

//添加一个shopView
-(void)addShopDataAndeView{
    //填充数据
    NSMutableDictionary* newData = [[NSMutableDictionary alloc]init];
    [newData setObject:@"" forKey:@"shopName"];
    [newData setObject:@"" forKey:@"shopUrl"];
    [newData setObject:@"" forKey:@"autoPrice"];

    [_myData.giftUrl addObject:newData];

}

-(void)TargetViewControllerProtocolSaveData{
     NSMutableArray* shopListData = [[NSMutableArray alloc]init];
 
    _myData.giftUrl = shopListData;
    [_myData updataAll];
}


@end
