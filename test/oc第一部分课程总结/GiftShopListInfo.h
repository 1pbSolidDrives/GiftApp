//
//  GiftShopListInfo.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/2.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GiftShopListInfo;

@protocol giftShopListInfoProtocol <NSObject>

-(void)giftShopListInfoProtocoldeleteMe:(NSInteger)myName;

@end

@interface GiftShopListInfo : UIView
 <UIApplicationDelegate,UITextFieldDelegate>

@property (weak, nonatomic) NSMutableDictionary* myData;
@property (nonatomic) NSInteger myNum;
@property (strong, nonatomic)id<giftShopListInfoProtocol> delegate;

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
- (IBAction)shopUrlDidEndOnExit:(UITextField *)sender;

- (IBAction)shopNameDidEndOnExit:(UITextField *)sender;
- (IBAction)priceDidEnd:(UITextField *)sender;
@property (weak, nonatomic) IBOutlet UIButton *deleteMe;
- (IBAction)deleteMeAct:(UIButton *)sender;



@end
