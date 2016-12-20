//
//  YFTabBarButton.h
//  YFCustomTabBarControllerDemo
//
//  Created by FannyYoung on 2016/12/15.
//  Copyright © 2016年 FannyYoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFTabBarButton : UIButton

- (instancetype)initButtonWithTitle:(NSString *)titleName selectedTitle:(NSString *)selectedTitleName img:(UIImage *)img seletectedImg:(UIImage *)seletectedImg selectedColor:(UIColor *)selectedColor titleFont:(UIFont *)titleFont;

//@property (nonatomic, strong) NSString *titleName;
//@property (nonatomic, strong) NSString *selectedTitleName;
//@property (nonatomic, strong) UIImage *img;
//@property (nonatomic, strong) UIImage *seletectedImg;
//@property (nonatomic, strong) UIColor *selectedColor;
//@property (nonatomic, strong) UIFont *titleFont;
@end
