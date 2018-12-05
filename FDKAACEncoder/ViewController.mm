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
#include <stdio.h>

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
    NSString* aacFilePath = [CommonUtil documentsPath:@"vocal.aac"];
    AudioEncoder* encoder = new AudioEncoder();
    int bitsPerSample = 16;
    const char * codec_name = [@"libfdk_aac" cStringUsingEncoding:NSUTF8StringEncoding];
    int bitRate = 128* 1024;
    int channels = 2;
    int sampleRate = 44100;
    encoder->init(bitRate, channels, sampleRate, bitsPerSample, [aacFilePath cStringUsingEncoding:NSUTF8StringEncoding], codec_name);
    int bufferSize = 1024 * 256;
    byte* buffer = new byte[bufferSize];
    FILE* pcmFileHandle = fopen([pcmFilePath cStringUsingEncoding:NSUTF8StringEncoding], "rb");
    size_t readBufferSize = 0;
    while((readBufferSize = fread(buffer, 1, bufferSize, pcmFileHandle)) > 0) {
        encoder->encode(buffer, (int)readBufferSize);
    }
    delete[] buffer;
    fclose(pcmFileHandle);
    encoder->destroy();
    delete encoder;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
