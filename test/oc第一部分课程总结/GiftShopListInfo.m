//
//  GiftShopListInfo.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/2.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "GiftShopListInfo.h"

@implementation GiftShopListInfo


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //获取通知中心单例对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(showDeleteButton:) name:@"GIFTEDIT_ORDR" object:nil];
}

- (IBAction)shopNameTextFieldDidEnd:(UITextField *)sender {
    [_myData setObject:sender.text forKey:@"shopName"];

}

- (IBAction)urlTextFieldDidEnd:(UITextField *)sender {
    [_myData setObject:sender.text forKey:@"url"];

}

- (IBAction)priceTextFieldDidEnd:(UITextField *)sender {
    [_myData setObject:sender.text forKey:@"price"];

 
}

- (IBAction)shopNameDidChange:(UITextField *)sender {
        [_myData setObject:sender.text forKey:@"shopName"];
}

- (IBAction)shopUrlDidChange:(UITextField *)sender {
    [_myData setObject:sender.text forKey:@"url"];

}

- (IBAction)priceDidChange:(UITextField *)sender {
    [_myData setObject:sender.text forKey:@"price"];

 
}

- (IBAction)shopUrlDidEndOnExit:(UITextField*)sender {
    [_myData setObject:sender.text forKey:@"url"];
    [sender resignFirstResponder];
}

- (IBAction)shopNameDidEndOnExit:(UITextField *)sender {
    [_myData setObject:sender.text forKey:@"shopName"];
    [sender resignFirstResponder];

}

- (IBAction)priceDidEnd:(UITextField *)sender {
    [_myData setObject:sender.text forKey:@"price"];
    [sender resignFirstResponder];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}

- (IBAction)deleteMeAct:(UIButton *)sender {
    if (_delegate && [_delegate conformsToProtocol:@protocol(giftShopListInfoProtocol)]) {
        [_delegate giftShopListInfoProtocoldeleteMe:_myNum];
    }
}

-(void)showDeleteButton:(id)sender{
    NSDictionary* sendInfo = [sender userInfo];
    if ([sendInfo[@"isShow"] isEqualToString:@"NO"]) {
        _deleteMe.hidden = YES;
    }else{
        _deleteMe.hidden = NO;
        
    }
}
@end
