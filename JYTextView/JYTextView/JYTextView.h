//
//  JYTextView.h
//  JYTextView
//
//  Created by sun on 2016/12/6.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYTextView : UITextView
@property (nonatomic, assign) NSInteger limit;//限制输入长度
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) UIColor *placeholderColor;
@end
