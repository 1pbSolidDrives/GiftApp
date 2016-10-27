//
//  TableView.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/18.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableView : UIViewController
<
//实现数据视图的普通协议
//数据视图的普通事件处理
UITableViewDelegate,
//实现数据视图的数据代理协议
//处理数据视图的数据代理
UITableViewDataSource
>
{
    //数据视图用来显示大量相同格式的大量信息的视图 
    UITableView* _tableView;
    NSMutableArray* _arryBig;
    
    UIBarButtonItem* _btnEdit;
    UIBarButtonItem* _btnFinish;
    UIBarButtonItem* _btnDelete;
    
    BOOL _isEdit;
    
}
@end
