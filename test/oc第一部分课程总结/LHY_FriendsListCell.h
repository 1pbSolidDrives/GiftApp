//
//  LHY_FriendsListCell.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/21.
//  Copyright © 2016年 edz. All rights reserved.//

#import <UIKit/UIKit.h>

@interface LHY_FriendsListCell : UITableViewCell

@property (strong, nonatomic) UIImageView *headPortraitImageView; /**< 头像 */
@property (strong, nonatomic) UILabel     *nicknameLabel;         /**< 昵称 */
@property (strong, nonatomic) UILabel     *signatureLabel;        /**< 签名 */

@end
