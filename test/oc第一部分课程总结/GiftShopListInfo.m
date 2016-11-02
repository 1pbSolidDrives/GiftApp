//
//  GiftShopListInfo.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/2.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "GiftShopListInfo.h"

@implementation GiftShopListInfo

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)shopNameTextFieldDidEnd:(UITextField *)sender {
    [_myData setObject:sender.text forKey:@"shopName"];

}

- (IBAction)urlTextFieldDidEnd:(UITextField *)sender {
    [_myData setObject:sender.text forKey:@"url"];

}

- (IBAction)priceTextFieldDidEnd:(UITextField *)sender {
    if ([sender.text  isEqual: @""]) {
        [_myData setObject:_autoPrice.text forKey:@"price"];
    }
    else{
        [_myData setObject:sender.text forKey:@"price"];
    }
}

- (IBAction)shopNameDidChange:(UITextField *)sender {
        [_myData setObject:sender.text forKey:@"shopName"];
}

- (IBAction)shopUrlDidChange:(UITextField *)sender {
    [_myData setObject:sender.text forKey:@"url"];

}

- (IBAction)priceDidChange:(UITextField *)sender {
    if ([sender.text  isEqual: @""]) {
        [_myData setObject:_autoPrice.text forKey:@"price"];
    }
    else{
        [_myData setObject:sender.text forKey:@"price"];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}

 
@end
