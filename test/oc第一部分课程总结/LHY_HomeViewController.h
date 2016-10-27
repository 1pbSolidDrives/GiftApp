#import <UIKit/UIKit.h>
#import "LHY_HomeViewController.h"
#import "LHY_HeaderView.h"
#import "LHY_FriendsListCell.h"
@interface LHY_HomeViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate,
LHY_HeaderViewDelegate
>

{
    NSArray *_sectionTitles;   /**< 分组标题集合 */
    NSArray *_friendsListInfo; /**< 好友信息集合 */
    
    NSMutableDictionary *_openDict; /**< 用于设置当前分组展开或关闭  这只是一个开关而已*/
}

@property (nonatomic, strong) UITableView *tableView; /**< 表格视图 */

- (void)initializeDataSource;    /**< 初始化数据源 */
- (void)initializeUserInterface; /**< 初始化用户界面 */

@end
