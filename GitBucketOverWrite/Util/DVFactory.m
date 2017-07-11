//
//  DVFactory.m
//  Origan
//
//  Created by LiJiaHuan on 17/3/21.
//  Copyright © 2017年 David. All rights reserved.
//



#import "DVFactory.h"

@interface DVFactory ()

@end

@implementation DVFactory

#pragma mark - Basebutton
+(UIButton *)createBtnWithFrame:(CGRect)rect imageNormalStr:(NSString *)imageNorStr imageHighLightStr:(NSString *)imageHighLightStr title:(NSString *)title font:(CGFloat)fontSize{
    
    UIButton *btn = [[UIButton alloc]initWithFrame:rect];
    [self privacyCreatBtnWithBtn:btn imageNormalStr:imageNorStr imageHighLightStr:imageHighLightStr title:title font:fontSize ];
    
    return btn;
}

+(UIButton *)createBtnWithCenter:(CGPoint)center size:(CGSize)size imageNormalStr:(NSString *)imageNorStr imageHighLightStr:(NSString *)imageHighLightStr title:(NSString *)title font:(CGFloat)fontSize {
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    btn.center = center;
    [self privacyCreatBtnWithBtn:btn imageNormalStr:imageNorStr imageHighLightStr:imageHighLightStr title:title font:fontSize ];
    
    return btn;
}


+(void)privacyCreatBtnWithBtn:(UIButton *)btn imageNormalStr:(NSString *)imageNorStr imageHighLightStr:(NSString *)imageHighLightStr title:(NSString *)title font:(CGFloat)fontSize {
    if (imageNorStr) {
        [btn setImage:[UIImage imageNamed:imageNorStr] forState:UIControlStateNormal];
    }
    if (imageHighLightStr) {
        [btn setImage:[UIImage imageNamed:imageHighLightStr] forState:UIControlStateHighlighted];
    }
    if (title.length) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (fontSize != 0 ) {
        btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
}


+(UIButton *)createCustomBtnWithBouds:(CGRect)bounds titleStr:(NSString *)title{
    UIImage *disableImage = [UIImage imageNamed:@"灰色底"];

    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y, disableImage.size.width, disableImage.size.height)];
    [btn setBackgroundImage:disableImage forState:UIControlStateDisabled];
    UIImage *enableImage = [UIImage imageNamed:@"蓝色底"];
    [btn setBackgroundImage:enableImage forState:UIControlStateNormal];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    
    return btn;
}

#pragma mark - image
+(UIImageView *)createImageWithFrame:(CGRect)frame image:(NSString *)image {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:image];
    
    return imageView;
}

+(UIImageView *)createImageWithCenter:(CGPoint)center size:(CGSize)size image:(NSString *)image {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    imageView.center = center;
    imageView.image = [UIImage imageNamed:image];
    
    return imageView;
}

#pragma mark - label
+(UILabel *)createLabelWithFrame:(CGRect)frame  title:(NSString *)title font:(CGFloat)fontSize textAlign:(NSTextAlignment)textAlign {
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    [self privacyCreateLabelWithLabel:label title:title font:fontSize textAlign:textAlign];
    
    return label;
}

+(UILabel *)createLabelWithCenter:(CGPoint)center size:(CGSize)size  title:(NSString *)title font:(CGFloat)fontSize textAlign:(NSTextAlignment)textAlign {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    label.center = center;
    [self privacyCreateLabelWithLabel:label title:title font:fontSize textAlign:textAlign];
    return label;
}
+(void)privacyCreateLabelWithLabel:(UILabel *)label title:(NSString *)title font:(CGFloat)fontSize textAlign:(NSTextAlignment)textAlign {
    label.text = title;
    label.font =  FitFont(fontSize);
    label.textAlignment = textAlign;
}

#pragma mark - view
+(UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)color {
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = color;
    return view;
    
}

+(UIView *)createViewWithCenter:(CGPoint)center size:(CGSize)size backgroundColor:(UIColor *)color {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    view.center = center;
    view.backgroundColor = color;
    return view;
    
}

+(UIView *)createLineView {
    UIView *lineView = [DVFactory createViewWithFrame:CGRectMake(0,0, UI_WIDTH, 1) backgroundColor:RGBFromHex(0xcfced3)];
    return lineView;
}

#pragma mark - textField
+(UITextField *)createTextFieldWithFrame:(CGRect)frame text:(NSString *)text  textAlign:(NSTextAlignment)align textColor:(UIColor *)color font:(CGFloat)font {
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.text = text;
    textField.textAlignment = align;
    textField.textColor = color;
    textField.font = FitFont(font);
    
    return textField;
}

#pragma mark - textView
+(UITextView *)createTextViewWithFrame:(CGRect)frame text:(NSString *)text textAlign:(NSTextAlignment)align textColor:(UIColor *)color font:(CGFloat)font enableScroll:(BOOL)enableScroll  {
    UITextView *textView = [[UITextView alloc]initWithFrame:frame];
    textView.scrollEnabled = enableScroll;
    textView.text = text;
    textView.font = FitFont(font);
    textView.textColor = color;
    textView.textAlignment = align;
    
    return textView;
}



@end
