//
//  Home2ViewController.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/22.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestTableViewCell.h"
#import "HeaderView.h"
#import "HeaderFooterView.h"
#import "DataTools.h"
#import "Home3TableViewCell.h"

@class Home2ViewController;

@protocol home2ViewControllerProtocol <NSObject>

-(Boolean)home2ViewController :(Home2ViewController*)sender sendViewResouceData : (NSDictionary*)data forWho:(NSInteger)tag;


@end
@interface Home2ViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource,
HeaderFooterViewProtocol
>
{
    UITableView* _tableview;
    //数据
    NSMutableArray* _plistData;
    
    //plist地址
    NSString* _plistPath;

    DataTools* _dataTools;
}
@property(nonatomic,weak)id<home2ViewControllerProtocol> viewResouceDelegate;

@end
