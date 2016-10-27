//
//  DataController.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TargetModle.h"
@interface DataController : NSObject
{
    //装所有plist数据的容器
    NSMutableArray* _dataMaster;
    //plist的路径
    NSString* _plistPath;
    
    
}
//装所有model的容器
@property(nonatomic,strong)NSMutableArray* targetMaster;
//模仿queue的一个容器 用于cell的显示
/*
 通过递归 将每个打开标记位的step都放到数组里
 用的时候从头便利就可以
 */

@property(nonatomic,strong)NSMutableArray* headerFooterMaster;
@property(nonatomic,strong)NSMutableArray* stepCellMaster;
@property(nonatomic,strong)NSMutableArray* giftMaster;

+(DataController*)getInstence;


//下面的所有set 都是重置 
//表头的数据
-(NSMutableDictionary*)getTargetDictionaryForHeaderFooter:(NSInteger)tag;
-(Boolean)setTargetDictionary:(NSMutableDictionary*)newDictionary ForHeaderFooterInTag:(NSInteger)tag;
 
//步骤的数据
-(NSMutableArray*)getStepsArrayFor:(NSInteger)tag fromFather:(NSMutableArray*)father;
-(Boolean)setStepsArray:(NSMutableArray*)newArray For:(NSInteger)tag inFather:(NSMutableArray*)father;

//奖励的数据 尝试一下 传送的是指针 所以是不是只修改父节点就可以了 之后只要将新的根 写到plist中就可以了
-(NSMutableArray*)getGiftsArrayFor:(NSInteger)tag;
//设置礼物的数组 不是添加 是重置
-(Boolean)setGiftsArray:(NSMutableArray*)newArray ForTag:(NSInteger)tag;

//将plist里的东西读到modle中

//相当于刷新modle
-(void)initCellMaster;

@end







