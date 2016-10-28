//
//  GiftModle.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GiftModle : NSObject

-(GiftModle*)init:(NSMutableDictionary*)giftData;
-(void)updataAll;

@property(nonatomic,strong)NSString* giftName;
@property(nonatomic,strong)NSString* giftImage;
@property(nonatomic,strong)NSMutableDictionary* giftUrl;
@property(nonatomic,strong)NSMutableArray* stepPath;
//修改的时候只要把新的东西写到这里就可以了
@property(nonatomic,strong)NSMutableDictionary* fatherData;

//所有商城的价格
@property(nonatomic,strong)NSMutableDictionary* allShopSellNum;
@property(nonatomic)Boolean canBuyThisGift;
 
@end
