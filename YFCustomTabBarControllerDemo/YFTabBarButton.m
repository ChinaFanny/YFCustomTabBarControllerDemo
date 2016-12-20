//
//  YFTabBarButton.m
//  YFCustomTabBarControllerDemo
//
//  Created by FannyYoung on 2016/12/15.
//  Copyright © 2016年 FannyYoung. All rights reserved.
//

#import "YFTabBarButton.h"
#define kImageScale 0.7

@implementation YFTabBarButton

- (instancetype)initButtonWithTitle:(NSString *)titleName selectedTitle:(NSString *)selectedTitleName img:(UIImage *)img seletectedImg:(UIImage *)seletectedImg selectedColor:(UIColor *)selectedColor titleFont:(UIFont *)titleFont
{
    self = [super init];
    if (self) {
        // 1、顶部图片
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setImage:img forState:UIControlStateNormal];
        [self setImage:seletectedImg forState:UIControlStateSelected];
        
        // 2、设置文字
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitle:titleName forState:UIControlStateNormal];
        [self setTitle:selectedTitleName forState:UIControlStateSelected];
        
        [self setTitleColor:selectedColor forState:UIControlStateSelected];
        
        [self.titleLabel setFont:titleFont];
    }
    
    return self;
}

#pragma mark - 设置按钮内部图片和文字的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat W = contentRect.size.width;
    CGFloat H = contentRect.size.height*kImageScale;
    
    if (self.selected) {
        return CGRectMake(0, 0, W, H);
    } else {
       return CGRectMake(0, 0, W, contentRect.size.height);
    }
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat W = contentRect.size.width;
    CGFloat H = contentRect.size.height *(1-kImageScale);
    CGFloat y = contentRect.size.height - H;
    return CGRectMake(0, y, W, H);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
