//
//  shopListTableViewCell.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/20.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UITextField *shopNameField;

@end
