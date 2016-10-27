//
//  TableViewController.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/20.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate
>
{
    UITableView* _tableView;
    NSMutableArray* _array;
}
@end
