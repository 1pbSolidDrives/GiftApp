//
//  DataController.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TargetModel.h"

@interface DataController : NSObject<TargetModelProtocol>

//plist文件数据
@property(nonatomic,strong)NSMutableArray* dataMaster;
@property(nonatomic,strong)NSString* plistPath;
@property(nonatomic,strong)NSMutableArray* shopSearchList;
@property(nonatomic,strong)NSString* shopSearchListPlistPath;

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

//是否开启每个子节点修改之后自动写入 默认开启
@property(nonatomic)Boolean sonIsModifiedToWriteImmediately;
//当前弹出键盘的view
@property(nonatomic,strong)id haveKeyboardView;


+(DataController*)getInstence;
//初始化一个空的target
-(TargetModel *)getNewTarget;
-(GiftModel*)getNewGiftModel;
-(StepModel*)getNewStepModel;

//刷新数据
-(void)reloadCellMaster;
//下面的所有set 都是重置

//targetmodel如果做了修改那么需要做的


//表头的数据
-(NSMutableDictionary*)getTargetDictionaryForHeaderFooter:(NSInteger)tag;
-(Boolean)setTargetDictionary:(NSMutableDictionary*)newDictionary ForHeaderFooterInTag:(NSInteger)tag;
 
//步骤的数据
-(NSMutableArray*)getStepsArrayFor:(NSInteger)tag fromFather:(NSMutableArray*)father;
-(Boolean)setStepsArray:(NSMutableArray*)newArray For:(NSInteger)tag inFather:(NSMutableArray*)father;

-(NSMutableArray*)getGiftsArrayFor:(NSInteger)tag;
//设置礼物的数组 不是添加 是重置
-(Boolean)setGiftsArray:(NSMutableArray*)newArray ForTag:(NSInteger)tag;



//将plist里的东西读到modle中

//相当于刷新modle
-(void)initCellMaster;
//settingView中的view指针


@end







