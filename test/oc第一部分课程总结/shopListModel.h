//
//  shopListModel.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/20.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shopListModel : NSObject

@property(nonatomic,strong)NSString* searchURL;
@property(nonatomic,strong)NSString* shopName;
@property(nonatomic,strong)NSMutableArray* giftBindList;

@end
