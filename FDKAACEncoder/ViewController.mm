//
//  ViewController.m
//  FDKAACEncoder
//
//  Created by apple on 2017/2/16.
//  Copyright © 2017年 xiaokai.zhan. All rights reserved.
//

#import "ViewController.h"
#import "CommonUtil.h"
#import "audio_encoder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)encode:(id)sender {
    NSLog(@"FDK AAC Encoder Test...");
    NSString* pcmFilePath = [CommonUtil bundlePath:@"vocal.pcm"];
    NSString* aacFilePath = [CommonUtil bundlePath:@"vocal.aac"];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
