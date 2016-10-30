//
//  GiftModle.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GiftModel;

@protocol GiftModelProtocol <NSObject>

-(Boolean)giftModelProtocolUpData:(GiftModel*)mySelf;

@end

@interface GiftModel : NSObject

-(GiftModel*)init:(NSMutableDictionary*)giftData;
-(Boolean)updataAll;



//model

@property(nonatomic,strong)NSString* giftName;
@property(nonatomic,strong)NSString* giftImage;
@property(nonatomic,strong)NSMutableDictionary* giftUrl;
@property(nonatomic,strong)NSMutableArray* stepPath;
//所有商城的价格
//存的是 商城array 数据是价格
@property(nonatomic,strong)NSMutableDictionary* allShopSellNum;
@property(nonatomic)Boolean canBuyThisGift;
//plist
@property(nonatomic,strong)NSMutableDictionary* myDataPlist;
@property(nonatomic)NSInteger giftNumInPlist;


 //代理
@property(nonatomic,strong)id<GiftModelProtocol>delegate;
@end
