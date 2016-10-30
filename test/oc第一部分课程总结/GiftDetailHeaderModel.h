//
//  GiftDetailHeaderModel.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/28.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GiftDetailMessage.h"
@interface GiftDetailHeaderModel : NSObject

//modelData
@property(strong,nonatomic)NSString* headerName;
@property(strong,nonatomic)NSMutableArray* dataModels;
//PlistData
@property(strong,nonatomic)NSMutableDictionary* dataPlist;


-(GiftDetailHeaderModel*)init:(NSMutableDictionary*)dataPlist;

@end
