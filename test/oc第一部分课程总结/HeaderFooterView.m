//
//  HeaderFooterView.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/22.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "HeaderFooterView.h"
@implementation HeaderFooterView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {

        self.contentView.backgroundColor = [UIColor clearColor];
        self.layer.borderWidth = 0.34;
        self.layer.borderColor = [UIColor redColor].CGColor;
        //初始化所有视图
        [self initAllView];
        //创建触摸事件
        UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressTapGestureRecognizer:)];
        [self.contentView addGestureRecognizer:tapRecognizer];
    }
    return self;
}
-(void)pressTapGestureRecognizer:(UITapGestureRecognizer*)sender{
    if (_delegate && [_delegate conformsToProtocol:@protocol(HeaderFooterViewProtocol)]) {
        [_delegate headerFooterView:self PressIdentify:self.tag];
    }
}

-(void)initAllView{
    [self initAllViewData];
    [self.contentView addSubview:[self getImageView]];
    [self.contentView addSubview:[self getLable]];
}

-(UIImageView *)getImageView {
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] init];
        _headerImageView.frame = CGRectMake(18, 18, 20  , 20);
        _headerImageView.center = CGPointMake(18 , 18);
    }
    return _headerImageView;
}
-(UILabel*)getLable{
    if (!_headerLabel) {
        _headerLabel = [[UILabel alloc] init];
        _headerLabel.bounds = CGRectMake(0, 0, 200, 30);
        _headerLabel.center = CGPointMake(CGRectGetMaxX(_headerImageView.frame) + CGRectGetMidX(_headerLabel.bounds) + 10, 22);
        _headerLabel.font = [UIFont boldSystemFontOfSize:18];
    }
    return _headerLabel;
}

-(void)setDataTools:(DataTools*)dataTools{
    _dataTools = dataTools;
}
-(void)initAllViewData{
    _dataTools = [DataTools getInstence];
    NSMutableDictionary *data =[_dataTools getDataForSection:self.tag OfRow:0];
    NSLog(@"%@", data);
    [self setImageview:data];
    [self setHeaderLabelText:data];
}

-(void) setImageview:(NSMutableDictionary *)data{
    NSString* targetImagePath = data[@"targetHeaderImagePath"];
    UIImage* targetImage = [UIImage imageNamed:targetImagePath];
    _headerImageView.image = targetImage;
}
-(void)setHeaderLabelText:(NSMutableDictionary *)data{
    NSString* targetText = data[@"targetHeaderName"];
    _headerLabel.text = targetText;
}



@end
