//
//  GiftCellTableViewCell.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/27.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
@class GiftCellTableViewCell;

@protocol GiftCellTableViewCellProtocol <NSObject>

-(void)giftCellTableViewCellPressAct:(GiftCellTableViewCell*)sender andTag:(const NSInteger)tag;

@end


@interface GiftCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView*   giftURLImage;
@property (weak, nonatomic) IBOutlet UILabel*       whereBuy;
@property (weak, nonatomic) IBOutlet UIButton*      buyButton;
- (IBAction)buyButtonAct:(UIButton *)sender;
- (IBAction)otherInfo:(id)sender;

@property (nonatomic, strong)GiftModle* myModel;
@property (nonatomic, strong)id<GiftCellTableViewCellProtocol> delegate;

-(void)initGiftCell:(GiftModle*)mySelfModel;


@end
