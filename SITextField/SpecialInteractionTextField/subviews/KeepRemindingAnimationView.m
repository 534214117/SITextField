//
//  KeepRemindingAnimationView.m
//  SITextField
//
//  Created by 第一反应 on 2018/11/16.
//  Copyright © 2018 Sonia. All rights reserved.
//

#import "KeepRemindingAnimationView.h"
#import <QuartzCore/QuartzCore.h>

@interface KeepRemindingAnimationView ()

@property (nonatomic, strong) UILabel  *smallTipLable;
@property (nonatomic, strong) UILabel  *fakePlaceholderLabel;

@end

@implementation KeepRemindingAnimationView



#pragma mark - Public Func
- (void)hideFakePlaceholderAndShowSmallTip {
    CGRect smallFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 1 / 3.f);
    [self.smallTipLable.layer removeAllAnimations];
    [UIView animateWithDuration:0.3 animations:^{
        self.fakePlaceholderLabel.alpha = 0;
        self.smallTipLable.alpha = 1;
        self.smallTipLable.frame = smallFrame;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hideSmallTipAndShowFakePlaceholder {
    CGRect smallFrame = CGRectMake(0, self.frame.size.height * 1 / 3.f, self.frame.size.width, self.frame.size.height * 1 / 3.f);
    [self.smallTipLable.layer removeAllAnimations];
    [UIView animateWithDuration:0.3 animations:^{
        self.fakePlaceholderLabel.alpha = 1;
        self.smallTipLable.alpha = 0;
    } completion:^(BOOL finished) {
        // 兼容刚刚清空立马输入的情况 不加动画会有问题
        if (!self.smallTipLable.alpha) {
            self.smallTipLable.frame = smallFrame;
        }
    }];
}


#pragma mark - Initialize & FrameSet

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (!self.smallTipLable || !self.fakePlaceholderLabel) {
        CGRect fakePlaceholderLabel = frame;
        fakePlaceholderLabel.origin.x = 0;
        fakePlaceholderLabel.origin.y = frame.size.height * 1 / 3.f;
        fakePlaceholderLabel.size.height = frame.size.height * 2 / 3.f;
        self.fakePlaceholderLabel    = [[UILabel alloc] initWithFrame:fakePlaceholderLabel];
        self.fakePlaceholderLabel.numberOfLines = 1;
        self.smallTipLable           = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height * 1 / 3.f, frame.size.width, frame.size.height * 1 / 3.f)];
        self.smallTipLable.numberOfLines = 1;
        self.smallTipLable.alpha = 0;
        [self addSubview:self.fakePlaceholderLabel];
        [self addSubview:self.smallTipLable];
    }
    else {
        CGRect fakePlaceholderLabel = frame;
        fakePlaceholderLabel.origin.x = 0;
        fakePlaceholderLabel.origin.y = frame.size.height * 1 / 3.f;
        fakePlaceholderLabel.size.height = frame.size.height * 2 / 3.f;
        self.fakePlaceholderLabel.frame    = fakePlaceholderLabel;
        self.smallTipLable.frame           = CGRectMake(0, frame.size.height * 1 / 3.f, frame.size.width, frame.size.height * 1 / 3.f);
    }
}

#pragma mark - Override

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    _fakePlaceholderLabel.text = placeholder;
    _smallTipLable.text = placeholder;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    _fakePlaceholderLabel.textColor = placeholderColor;
}

- (void)setPlaceholderTintColor:(UIColor *)placeholderTintColor {
    _placeholderTintColor = placeholderTintColor;
    _smallTipLable.textColor = placeholderTintColor;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    _fakePlaceholderLabel.font = font;
}

- (void)setTintFont:(UIFont *)tintFont {
    _tintFont = tintFont;
    _smallTipLable.font = tintFont;
}

@end
