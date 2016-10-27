//
//  Home2TableViewCell.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/22.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "Home2TableViewCell.h"

@implementation Home2TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _dataTools = [[DataTools alloc]init];
    
    _myData = [_delegate Home2TableViewCellGetMyData];
    [self initAllView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setMyData:(NSMutableDictionary *)myData{
    [self initAllView];
}

-(void)initAllView{
    NSString* imatPath = _myData[@"targetImagePath"];
    UIImage* imageBuf = [UIImage imageNamed:imatPath];
    _cellIamge.image = imageBuf;
    
}
@end
