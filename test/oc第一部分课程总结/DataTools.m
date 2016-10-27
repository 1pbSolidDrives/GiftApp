//
//  DataTools.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "DataTools.h"

@implementation DataTools
static DataTools* instenceMy = nil;

//重写初始化
-(instancetype)init{
    self = [super init];
    if (self) {
        
        _plistPath = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
        _plistData = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    }
    return self;
}

+(DataTools*)getInstence{
    if (instenceMy == nil) {
        instenceMy = [[DataTools alloc]init];
    }
    return instenceMy;
}

-(NSMutableDictionary*)getDataForSection:(NSInteger)section OfRow:(NSInteger)row{
    NSMutableDictionary* testData = [NSMutableDictionary dictionary];
    _plistData = [NSMutableArray arrayWithContentsOfFile:_plistPath];

    testData = _plistData[section][row];
    NSLog(@"%@",_plistData[section][0])  ;
    return testData;
}

//-(NSMutableDictionary*)getHeaderData:(NSInteger)tag{
//    NSMutableDictionary* testData = [NSMutableDictionary dictionary];
//    testData = _plistData[tag];
//    return  testData;
//}
-(Boolean)setDataValue:(NSString*)value ForSection:(NSInteger)section OfRow:(NSInteger)row TheKey:(NSString*)key{
    //获取
    NSMutableDictionary* testData = [[NSMutableDictionary alloc]init];
    testData = [self getDataForSection:section OfRow : row];
    [testData setObject:value forKey:key];
    [_plistData[section] replaceObjectAtIndex:row withObject:testData];
     //写入 数据
    if ([_plistData writeToFile:_plistPath atomically:YES]) {
        NSLog(@"属性列表添加数据成功！");
 

        testData = [self getDataForSection:section OfRow : row];
   
        return YES;
    }else {
        NSLog(@"属性列表添加数据失败！");
        return NO;
    }
}

//-(Boolean)setDataValue:(NSString*)value ForKey:(NSString*)key inPlistArrayIndex:(NSInteger)index{
//    
//    //获取
//     NSMutableDictionary* testData = [[NSMutableDictionary alloc]init];
//    testData = [self getHeaderData:index];
//    [testData setObject:value forKey:key];
//    [_plistData replaceObjectAtIndex:index withObject:testData];
//    //写入 数据
//    if ([_plistData writeToFile:_plistPath atomically:YES]) {
//        NSLog(@"属性列表添加数据成功！");
//        return YES;
//    }else {
//        NSLog(@"属性列表添加数据失败！");
//        return NO;
//    }
//}
@end
