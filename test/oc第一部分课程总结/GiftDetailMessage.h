//
//  GiftDetailMessage.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/28.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GiftDetailHeaderModel.h"
@interface GiftDetailMessage : NSObject
//modelData
@property(strong,nonatomic)NSString* name;
@property(strong,nonatomic)NSString* detail;
@property(strong,nonatomic)NSString* url;
//plistData
@property(strong,nonatomic)NSMutableDictionary* dataInPlist;

-(instancetype)init:(NSMutableDictionary*)dataInPlist;
//对数据的相关操作 以免我弄错了

@end
