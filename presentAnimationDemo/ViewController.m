//
//  ViewController.m
//  presentAnimationDemo
//
//  Created by 改车吧 on 2016/12/23.
//  Copyright © 2016年 jianye. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *pushButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
}
- (IBAction)buttonClick:(UIButton *)sender {
    
    NextViewController *nextVC = [[NextViewController alloc] init];
    
    UIViewController *destinationViewController = nextVC;
    
    UIView *materialView = ({
        //CGRect viewFrame = self.sourceButton.frame;
        
        CGRect viewFrame = _pushButton.frame;
        
        CGFloat width = _pushButton.frame.size.width;
        
        viewFrame.size = CGSizeMake(width, width);
        UIView *view = [[UIView alloc] initWithFrame:viewFrame];
        //view.backgroundColor = self.animateColor;
        view.backgroundColor = [UIColor orangeColor];
        
        view.layer.cornerRadius = width/2.0;
        view;
    });
    
    [[UIApplication sharedApplication].keyWindow addSubview:materialView];
    
    CGFloat size = MAX(CGRectGetHeight(destinationViewController.view.frame),
                       CGRectGetWidth(destinationViewController.view.frame)) * 2.0;
    CGFloat scale = size / CGRectGetWidth(materialView.frame);
    CGAffineTransform finalTransform = CGAffineTransformMakeScale(scale, scale);
    
    [UIView animateWithDuration:0.5 animations:^{
        materialView.transform = finalTransform;
        materialView.center = destinationViewController.view.center;
        materialView.backgroundColor = destinationViewController.view.backgroundColor;
    } completion:^(BOOL finished) {
        //显示ViewController
        [self presentViewController:destinationViewController animated:NO completion:nil];
        [UIView animateWithDuration:0.25 animations:^{
            materialView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [materialView removeFromSuperview];
        }];
    }];
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
