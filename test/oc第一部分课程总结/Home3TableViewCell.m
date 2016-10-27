//
//  Home3TableViewCell.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "Home3TableViewCell.h"

#define TARGETCELL 1
#define GIFTCELL 2
@implementation Home3TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initAllReacurce{
    _dataTools= [DataTools getInstence];
    
    _dataDictionary =  [_dataTools getDataForSection:_myIndexPath.section OfRow:_myIndexPath.row+1];
    [self initAllView];
}

-(void)initAllView{
    switch (_myIndexPath.row+1) {
        case TARGETCELL:
        {
            [self initTargetCell];
            break;
        }
            
        case GIFTCELL:
        {
            [self initGiftCell];
            break;
        }
        default:
            break;
    }
}

-(void)initTargetCell{
    UIImage* imageBuf = [UIImage imageNamed:_dataDictionary[@"targetImagePath"]];
    self.targetImageView.image = imageBuf;
    
    NSString* labelText = _dataDictionary[@"targetName"];
    self.textLable.text = labelText;
    
}

-(void)initGiftCell{
    UIImage* imageBuf = [UIImage imageNamed:_dataDictionary[@"giftImagePath"]];
    self.targetImageView.image = imageBuf;
    
    NSString* labelText = _dataDictionary[@"giftName"];
    self.textLable.text = labelText;
    NSString* url = _dataDictionary[@"whereGift"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: url]];

    [_webView loadRequest:request];
}

 
@end
