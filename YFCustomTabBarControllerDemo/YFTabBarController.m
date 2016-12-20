//
//  YFTabBarControll.m
//  YFCustomTabBarControllerDemo
//
//  Created by FannyYoung on 2016/12/15.
//  Copyright © 2016年 FannyYoung. All rights reserved.
//

#import "YFTabBarController.h"
#import "YFTabBar.h"

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface YFTabBarController ()<YFTabBarDelegate>

@property (nonatomic, strong) YFTabBar *myView;

@end

@implementation YFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%s", __func__);
    NSLog(@"%@", self.view.subviews);
    
    ViewController *vc = [[ViewController alloc] init];
    ViewController1 *vc1 = [[ViewController1 alloc] init];
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    ViewController3 *vc3 = [[ViewController3 alloc] init];
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *nc2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController *nc3 = [[UINavigationController alloc] initWithRootViewController:vc3];

    
    [self setViewControllers:@[nc, nc1, nc2, nc3]];

    CGRect rect = self.tabBar.bounds; //这里要用bounds来加, 否则会加到下面去.看不见
    
    //测试添加自己的视图
    YFTabBar *myView = [[YFTabBar alloc] init]; //设置代理必须改掉前面的类型,不能用UIView
    myView.delegate = self; //设置代理
    myView.frame = rect;
    [self.tabBar addSubview:myView]; //添加到系统自带的tabBar上, 这样可以用的的事件方法. 而不必自己去写
    
    NSArray *tabTitles = @[@"微信", @"通讯录", @"发现", @"我的"];
    
    for (int i=0; i<self.viewControllers.count; i++) { //根据有多少个子视图控制器来进行添加按钮
        
        NSString *imageName = [NSString stringWithFormat:@"tab%d", i + 1];
        NSString *imageNameSel = [NSString stringWithFormat:@"tabSelected%d", i + 1];
        
        UIImage *image = [UIImage imageNamed:imageName];
        UIImage *imageSel = [UIImage imageNamed:imageNameSel];
        
        [myView addButtonWithTitle:tabTitles[i] Image:image selectedImage:imageSel];
    }
}

/**永远别忘记设置代理*/
- (void)tabBar:(YFTabBar *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
