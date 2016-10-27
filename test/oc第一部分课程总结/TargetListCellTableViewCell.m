//
//  TargetListCellTableViewCell.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/21.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetListCellTableViewCell.h"

@implementation TargetListCellTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {        
//        [self.contentView addSubview:self.getTargetImageView];
//        [self.contentView addSubview:self.getTagetLabel];
        self.contentView.backgroundColor = [UIColor redColor];
    }
    
    return self;
}

/*
#pragma 控件getter
-(UIImageView*)getTargetImageView{

    if (!_targetImage) {
        _targetImage = [[UIImageView alloc]init];
        _targetImage.bounds = CGRectMake(0, 0, 60, 60);
        _targetImage.layer.cornerRadius = 30;
        _targetImage.layer.masksToBounds = YES;
        _targetImage.contentMode = UIViewContentModeScaleAspectFit;
        
    }
    return _targetImage;
}

-(UIImageView*)getGiftImageView{

    return _giftImage;
}

-(UILabel*)getTagetLabel{
    if (!_targetText) {
        _targetText = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 310, 30)];
        _targetText.font = [UIFont boldSystemFontOfSize:30];
        _targetText.textColor = [UIColor redColor];

    }
    return _targetText;
}

-(UILabel*)getGiftLabel{
    return _giftText;
}
*/


@end
