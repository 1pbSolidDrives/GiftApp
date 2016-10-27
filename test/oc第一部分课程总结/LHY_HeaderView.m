#import "LHY_HeaderView.h"
#import "FooterView.h"
@implementation LHY_HeaderView
//从父类那里继承来的
- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor clearColor];
        self.layer.borderWidth = 0.34;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        //FooterView* footerView = [[FooterView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
       FooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil] firstObject];
        footerView.frame = CGRectMake(0, 100, 300, 400);
        footerView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:footerView];
        //[self addSubview:footerView];
        // 加载控件
        //•UITableViewCell内部有个默认的子视图:contentView，contentView是UITableViewCell所显示内容的父视图，可显示一些辅助指示视图
//        contentView下默认有3个子视图
//        Ø其中2个是UILabel(通过UITableViewCell的textLabel和detailTextLabel属性访问)
//        Ø第3个是UIImageView(通过UITableViewCell的imageView属性访问)

        //[self.contentView addSubview:self.indictorImageView];
       // [self.contentView addSubview:self.sectionTitleLabel];
        
        // 添加点击手势
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapGesture:)];
        [self addGestureRecognizer:tapGesture];
        
    }
    return self;
}



#pragma mark *** Gestures ***
- (void)respondsToTapGesture:(UITapGestureRecognizer *)gesture {
    if (_delegate && [_delegate conformsToProtocol:@protocol(LHY_HeaderViewDelegate)]) {
        [_delegate lhyHeaderView:self didSelectedWithTag:self.tag];
    }
    // 判断代理是否存在并且遵守协议，如果满足条件，则让代理执行协议方法，并且将对应组以及tag值传递给代理；
    /*
     疑问：
        1，这里的代理的使用原理是什么？
        2，将数值传送到了哪里？
     
        我的理解：
        1，在头文件里已经设置好了一个协议了 只要都继承（是这么说吧） 那么就可以通过这个方法 向某个协议中的方法传值
        2，homeviewcontroller 就继承了这个协议 并且也实现了这个协议 他就可以通过这个协议中的某些方法接到值 
        3，感觉上比c++的继承舒服 并不需要繁杂的继承逻辑 只需要设定协议 设置好方法 别人接这个协议实现方法就可以~
        4，conformsToProtocol:@protocol()是用来检查对象是否实现了指定协议类的方法
     */

}

#pragma mark *** Getters ***
- (UIImageView *)indictorImageView {
    if (!_indictorImageView) {
        _indictorImageView = [[UIImageView alloc] init];
        _indictorImageView.bounds = CGRectMake(0, 0, 20, 20);
        _indictorImageView.center = CGPointMake(15, 22);
    }
    return _indictorImageView;
}

- (UILabel *)sectionTitleLabel {
    if (!_sectionTitleLabel) {
        _sectionTitleLabel = [[UILabel alloc] init];
        _sectionTitleLabel.bounds = CGRectMake(0, 0, 200, 30);
        _sectionTitleLabel.center = CGPointMake(CGRectGetMaxX(self.indictorImageView.frame) + CGRectGetMidX(_sectionTitleLabel.bounds) + 10, 22);
        _sectionTitleLabel.font = [UIFont boldSystemFontOfSize:18];
    }
    return _sectionTitleLabel;
}

@end
