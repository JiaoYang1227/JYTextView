//
//  ViewController.m
//  JYTextView
//
//  Created by sun on 2016/12/6.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "ViewController.h"
#import "JYTextView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet JYTextView *TF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.TF setPlaceholder:@"请输入文字"];
    [self.TF setPlaceholderColor:[UIColor redColor]];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    // 删除回退的时候返回yes
    if (text.length == 0 && range.length == 1) {
        return YES;
    }
    if(textView ==_TF){
        _TF.limit = 5;////限制输入长度
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
