//
//  DataTools.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataTools : NSObject
{
    //数据
    NSMutableArray* _plistData;
    
    //plist地址
    NSString* _plistPath;
}
@property (strong,nonatomic)NSMutableArray* plistData;
@property (strong,nonatomic)NSString* plistPath;
+(DataTools*)getInstence;
//-(NSMutableDictionary*)getHeaderData:(NSInteger)tag;
//获取第几组的第几项数据
-(NSMutableDictionary*)getDataForSection:(NSInteger)section OfRow:(NSInteger)row;
//修改某一项的数据
-(Boolean)setDataValue:(NSString*)value ForSection:(NSInteger)section OfRow:(NSInteger)row TheKey:(NSString*)key;

//-(Boolean)setDataValue:(NSString*)value ForKey:(NSString*)key inPlistArrayIndex:(NSInteger)index;
@end
