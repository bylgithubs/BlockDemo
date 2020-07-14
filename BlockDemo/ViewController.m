//
//  ViewController.m
//  BlockDemo
//
//  Created by Civet on 2019/12/2.
//  Copyright © 2019 PersonalONBYL. All rights reserved.
//

#import "ViewController.h"

typedef void(^Block) (NSString *);

@interface ViewController ()

//@property (nonatomic,copy) Block block;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self runBlock:@"OK" completion:^(NSString *str1){
        NSLog(@"current thread is =====%@",[NSThread currentThread]);
        NSLog(@"block11\n %@",str1);
    } completion1:^(NSString *str2){
        NSLog(@"block22\n %@",str2);
    } completion2:^(NSInteger i1,NSString *str3){
        NSLog(@"block33\n %ld",i1);
    }];
}

- (void)runBlock:(NSString *)str completion:(Block)block completion1:(Block)block1 completion2:(void(^) (NSInteger,NSString *))block2{
    NSLog(@"current thread11 is =====%@",[NSThread currentThread]);
    NSLog(@"block1\n");
    block(@"one");
    NSLog(@"block2\n");
    block1(@"two");
    NSLog(@"block3\n");
    block2(1,@"four");
    NSLog(@"block4\n %@",str);
}


@end
