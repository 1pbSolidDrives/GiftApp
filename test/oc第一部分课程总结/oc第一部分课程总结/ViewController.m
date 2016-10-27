#import "ViewController.h"
#import "DetailViewController.h"
#import "ViewC1.h"
static NSString *const kViewControllerTitle = @"Fonts";
static NSString *const kReusableCellIdentifier = @"identifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

{
    NSArray *_sortedKeys; /**< 键 */
    NSMutableDictionary *_dataSource; /**< 数据源 */
}

@property (nonatomic, copy) UITableView *tableView; /**< 表格视图 */


- (void)initializeDataSource; /**< 初始化数据源 */
- (void)initializeUserInterface; /**< 初始化用户界面 */

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeUserInterface];
}

#pragma mark *** Initialize methods ***
- (void)initializeDataSource {
    
    // 处理字体数据
    _dataSource = [[NSMutableDictionary alloc] init];
    
    NSArray *fonts = [[UIFont familyNames] mutableCopy];
    
    for (NSString *font in fonts) {
        
        NSString *ch = [font substringToIndex:1];
        
        NSMutableArray *font_group = [NSMutableArray arrayWithArray:_dataSource[ch]];
        
        [font_group addObject:font];
        
        [_dataSource setObject:font_group forKey:ch];
    }
    
    // 获取字典key数据
    _sortedKeys = [[NSArray alloc] initWithArray:[_dataSource.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)]];
    
}

- (void)initializeUserInterface {
    
    self.title = kViewControllerTitle;
    self.view.backgroundColor = [UIColor whiteColor];
    // 关闭系统自动偏移
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 加载表格视图
    [self.view addSubview:self.tableView];
    
    // 自定义返回按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil] ;
}

#pragma mark *** UITableViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sortedKeys.count;
}

// 设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)_dataSource[_sortedKeys[section]]).count;
}

// 定制单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 单元格重用机制
    // 首先在表格视图中根据标识符寻找可重用的单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier];
    // 判断是否找到可重用的单元格
    if (!cell) {
        // 如果没有找到则新建单元格
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kReusableCellIdentifier];
    }
    // 设置图片
    cell.imageView.image = [UIImage imageNamed:@"01.png"];
    // 设置文本信息
    NSString *fontName = ((NSArray *) _dataSource[_sortedKeys[indexPath.section]])[indexPath.row];
    cell.textLabel.text = fontName;
    cell.textLabel.font = [UIFont fontWithName:fontName size:20];
    // 设置详情文本信息
    cell.detailTextLabel.text = @"Click to enter details.";
    // 设置Cell选中风格
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    // 设置辅助视图
    /**
     UITableViewCellAccessoryNone,                   // don't show any accessory view
     UITableViewCellAccessoryDisclosureIndicator,    // 向右剪头
     UITableViewCellAccessoryDetailDisclosureButton, // info button w/ chevron. tracks
     UITableViewCellAccessoryCheckmark,              // 钩钩符号
     UITableViewCellAccessoryDetailButton NS_ENUM_AVAILABLE_IOS(7_0) // 圆圈中间有一个感叹号
     */
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

// 这是头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

// 设置尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

// 设置组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _sortedKeys[section];
}

// 自定义头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

// 自定义尾部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

// 设置侧栏索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return _sortedKeys;
}

#pragma mark *** UITableViewDelegate ***
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *detailVc = [[DetailViewController alloc] init];
    
    detailVc.context = ((NSArray *)_dataSource[_sortedKeys[indexPath.section]])[indexPath.row];
    UIView* view = [[UIView alloc]initWithFrame:self.view.bounds];
    
    
    ViewC1* c1 = [[ViewC1 alloc]init];
    
    [self.navigationController pushViewController:c1 animated:YES];
    
    // 设置选中时单元格背景颜色
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
    
}

// 取消选中
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 设置取消选中时单元格背景颜色
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}

#pragma mark *** Getters ***
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 64) style:UITableViewStylePlain];
        // 设置背景颜色
        _tableView.backgroundColor = [UIColor clearColor];
        // 设置代理
        _tableView.delegate = self;
        // 设置数据源
        _tableView.dataSource = self;
        // 设置分割线样式
        // 由于iPhone6S plus的分辨率较高，开发的时候通常都使用command + 3 或者 command + 4 缩小模拟器显示，这个时候就相当于把plus的分辨率压缩了所以我们会看不到分割线，解决办法就是把模拟器放大就可以了，选中模拟器按command + 1把模拟器放大就可以了。
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        // 设置能否回弹
        _tableView.bounces = NO;
        // 设置侧栏索引背景色
        _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        // 设置侧栏标题色
        _tableView.sectionIndexColor = [UIColor blueColor];
        // 设置侧栏拖动时的背景颜色
        _tableView.sectionIndexTrackingBackgroundColor = [UIColor lightGrayColor];
        
    }
    return _tableView;
}

@end
