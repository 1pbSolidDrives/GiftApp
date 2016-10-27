#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, copy)UILabel *contextLabel;

- (void)initializeUserInterface; /**< 初始化用户界面 */

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUserInterface];
}

#pragma mark *** Initialize methods ***



- (void)initializeUserInterface {
    self.title = @"Details";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.contextLabel];
}

#pragma mark *** Getters ***

- (UILabel *)contextLabel {
    if (!_contextLabel) {
        _contextLabel = [[UILabel alloc] init];
        _contextLabel.bounds = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 30);
        _contextLabel.center = self.view.center;
        _contextLabel.textAlignment = NSTextAlignmentCenter;
        _contextLabel.text = self.context;
        _contextLabel.font = [UIFont fontWithName:self.context size:25];
    }
    return _contextLabel;
}

@end
