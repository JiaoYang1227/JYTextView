//
//  JYTextView.m
//  JYTextView
//
//  Created by sun on 2016/12/6.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "JYTextView.h"

@implementation JYTextView
-(void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        self.layer.cornerRadius= 3.0f;
        self.layer.masksToBounds=YES;
        self.layer.borderColor = [[UIColor colorWithWhite:0.783 alpha:1.000] CGColor];
        self.layer.borderWidth= 0.5f;
        self.textColor = [UIColor colorWithWhite:0.114 alpha:1.000];
        self.font = [UIFont boldSystemFontOfSize:14];
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(textViewTextDidChange:)
                                                    name:@"UITextViewTextDidChangeNotification"
                                                  object:self];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
    }
}

- (void)textViewTextDidChange:(NSNotification *)notification
{
    UITextView *textField = (UITextView *)notification.object;
    
    NSString *toBeString = textField.text;
    
    if (toBeString.length > self.limit && self.limit>0)
    {
        textField.text = [toBeString substringToIndex:self.limit];
    }
}

- (NSInteger)getTextLength:(NSString *)text
{
    NSInteger asciiLength = 0;
    
    for (NSInteger i = 0; i<text.length; i++)
    {
        unichar t = [text characterAtIndex:i];
        
        asciiLength += isascii(t) ? 1 : 2;
    }
    return asciiLength;
}
- (void)textDidChange:(NSNotification *)note
{
    if (_placeholder.length == 0)
        return;
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    if (_placeholder.length == 0)
        return;
    [self setNeedsDisplay];
}
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    if (_placeholder.length == 0 || self.text.length != 0)
        return;
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    if (_placeholder.length == 0 || self.text.length != 0)
        return;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    if (self.text.length == 0) {
        [_placeholderColor set];
        CGFloat padding = 8;
        CGRect placeholderRect = CGRectMake(padding, padding, rect.size.width - padding * 2, rect.size.height - padding);
        [_placeholder drawInRect:placeholderRect withAttributes:@{NSForegroundColorAttributeName:_placeholderColor,NSFontAttributeName :
                                                                      [UIFont systemFontOfSize:15]}];
    }
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
