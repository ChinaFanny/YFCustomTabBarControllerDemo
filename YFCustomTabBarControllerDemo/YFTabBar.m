//
//  YFTabBar.m
//  YFCustomTabBarControllerDemo
//
//  Created by FannyYoung on 2016/12/15.
//  Copyright © 2016年 FannyYoung. All rights reserved.
//

#import "YFTabBar.h"
#import "YFTabBarButton.h"

@interface YFTabBar()

/**
 *  设置之前选中的按钮
 */
@property (nonatomic, weak) UIButton *selectedBtn;

@end

@implementation YFTabBar

-(void)addButtonWithTitle:(NSString *)title Image:(UIImage *)image selectedImage:(UIImage *) selectedImage
{
    YFTabBarButton *btn = [[YFTabBarButton alloc] initButtonWithTitle:@"" selectedTitle:title img:image seletectedImg:selectedImage selectedColor:[UIColor colorWithRed:0/255.0f green:186.0f/255.0f blue:59.0f/255.0f alpha:1] titleFont:[UIFont systemFontOfSize:11.0f]];
    
    [self addSubview:btn];
    
    //带参数的监听方法记得加"冒号"
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //如果是第一个按钮, 则选中(按顺序一个个添加)
    if (self.subviews.count == 1) {
        [self clickBtn:btn];
    }
}


- (void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];

    [self addSubview:btn];
    
    //带参数的监听方法记得加"冒号"
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //如果是第一个按钮, 则选中(按顺序一个个添加)
    if (self.subviews.count == 1) {
        [self clickBtn:btn];
    }
}

/**专门用来布局子视图, 别忘了调用super方法*/
- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        //取得按钮
        UIButton *btn = self.subviews[i];
        
        btn.tag = i; //设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
        
//        int R = (arc4random() % 256) ;
//        int G = (arc4random() % 256) ;
//        int B = (arc4random() % 256) ;
//        [btn setBackgroundColor:[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]];
        
        CGFloat x = i * self.bounds.size.width / count;
        CGFloat y = 0;
        CGFloat width = self.bounds.size.width / count;
        CGFloat height = self.bounds.size.height;
        btn.frame = CGRectMake(x, y, width, height);
        
//        if (i == 0) {
//            [self setButtonContentCenter:btn];
//        }
    }
}

/**
 *  自定义TabBar的按钮点击事件
 */
- (void)clickBtn:(UIButton *)button {
    //1.先将之前选中的按钮设置为未选中
    self.selectedBtn.selected = NO;
    //2.再将当前按钮设置为选中
    button.selected = YES;
    //3.最后把当前按钮赋值为之前选中的按钮
    self.selectedBtn = button;
    
//    [self setButtonContentCenter:button];
    
    //却换视图控制器的事情,应该交给controller来做
    //最好这样写, 先判断该代理方法是否实现
    if ([self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
        [self.delegate tabBar:self selectedFrom:self.selectedBtn.tag to:button.tag];
    }
    
    //4.跳转到相应的视图控制器. (通过selectIndex参数来设置选中了那个控制器)
    //self.selectedIndex = button.tag;
}

//// UIButton 设置图片文字垂直居中排列
//-(void)setButtonContentCenter:(UIButton *) btn
//{
//    CGSize imgViewSize,titleSize,btnSize;
//    UIEdgeInsets imageViewEdge,titleEdge;
//    CGFloat heightSpace = 10.0f;
//    
//    //    if (btn.tag == kButtonBaseTag+1) {
//    //        heightSpace = 5;
//    //    }
//    
//    //设置按钮内边距
//    imgViewSize = btn.imageView.bounds.size;
//    btnSize = btn.bounds.size;
//    
//    //
//    // 防止button文字太多显示不全，获取的titleLabel的长度比实际短，
//    // 所以通过另一个label根据文字内容获取宽度
//    // titleSize = btn.titleLabel.bounds.size;(这种方法只适用于文字少的情况)
//    UILabel *label = btn.titleLabel;
//    [label sizeToFit];
//    titleSize = label.bounds.size;
//    
//    imageViewEdge = UIEdgeInsetsMake(heightSpace,0.0, btnSize.height -imgViewSize.height - heightSpace, - titleSize.width);
//    [btn setImageEdgeInsets:imageViewEdge];
//    titleEdge = UIEdgeInsetsMake(imgViewSize.height +heightSpace, - imgViewSize.width, 0.0, 0.0);
//    [btn setTitleEdgeInsets:titleEdge];
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
