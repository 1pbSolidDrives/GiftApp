//
//  GiftDetailRootModel.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/28.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GiftModel.h"
#import "GiftDetailHeaderModel.h"
@interface GiftDetailRootModel : NSObject
//model
@property (nonatomic,strong)NSMutableArray* dataModels;//装信息分类的容器
//plistdata
@property (nonatomic,strong)NSMutableArray* dataPlist;

-(instancetype)init:(NSMutableArray*)dataPlist;


@end
