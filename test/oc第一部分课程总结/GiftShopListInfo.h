//
//  GiftShopListInfo.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/2.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftShopListInfo : UIView
 <UIApplicationDelegate,UITextFieldDelegate>
@property (weak, nonatomic) NSMutableDictionary* myData;
@property (weak, nonatomic) IBOutlet UITextField *shopName;
@property (weak, nonatomic) IBOutlet UITextField *shopUrl;
@property (weak, nonatomic) IBOutlet UITextField *manualPrice;
@property (weak, nonatomic) IBOutlet UILabel *autoPrice;
- (IBAction)shopNameTextFieldDidEnd:(UITextField *)sender;
- (IBAction)urlTextFieldDidEnd:(UITextField *)sender;
- (IBAction)priceTextFieldDidEnd:(UITextField *)sender;
- (IBAction)shopNameDidChange:(UITextField *)sender;
- (IBAction)shopUrlDidChange:(UITextField *)sender;
- (IBAction)priceDidChange:(UITextField *)sender;


@end
