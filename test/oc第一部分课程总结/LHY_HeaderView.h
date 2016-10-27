#import <UIKit/UIKit.h>

@class LHY_HeaderView;

// 协议声明
@protocol LHY_HeaderViewDelegate <NSObject>

- (void)lhyHeaderView:(LHY_HeaderView *)lhyHeaderView didSelectedWithTag:(NSInteger)tag;

@end
/*
 这个类是tableview分组部分的显示
 */
@interface LHY_HeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) UILabel                *sectionTitleLabel; /**< 组标题 */
@property (nonatomic, strong) UIImageView            *indictorImageView; /**< 指示图片 */

@property (nonatomic, weak) id <LHY_HeaderViewDelegate> delegate;        /**< 代理 */

@end
