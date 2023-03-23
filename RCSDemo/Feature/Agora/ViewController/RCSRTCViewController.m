//
//  RCSRTCViewController.m
//  RCSDemo
//
//  Created by shuai shao on 2023/3/14.
//

#import "RCSRTCViewController.h"

#if ENABLE_RTC

@interface RCSRTCViewController () <AgoraRtcEngineDelegate, AgoraVideoFrameDelegate>

@property (nonatomic, strong) UIView *localView;

@property (nonatomic, strong) UIView *remoteView;

@property (nonatomic, strong) AgoraRtcEngineKit *agoraKit;

@end

@implementation RCSRTCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _remoteView = [UIView new];
    [self.view addSubview:_remoteView];
    [_remoteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
    
    _localView = [UIView new];
    _localView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_localView];
    [_localView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(-40);
        make.right.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(160);
        make.width.mas_equalTo(90);
    }];
    
    _agoraKit = [AgoraRtcEngineKit sharedEngineWithAppId:@"79e92bc3c950410b865a506897a88e20" delegate:self];
    [_agoraKit setClientRole:AgoraClientRoleBroadcaster];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.agoraKit enableAudio];
    [self.agoraKit enableVideo];
    
    [self.agoraKit setVideoFrameDelegate:self];
    
    AgoraRtcVideoCanvas *videoCanvas = [AgoraRtcVideoCanvas new];
    videoCanvas.renderMode = AgoraVideoRenderModeHidden;
    videoCanvas.view = _localView;
    videoCanvas.uid = 0;
    [self.agoraKit setupLocalVideo:videoCanvas];
    
    [self.agoraKit startPreview];
    
    AgoraRtcChannelMediaOptions *options = [AgoraRtcChannelMediaOptions new];
    options.publishCameraTrack = YES;
    options.publishMicrophoneTrack = YES;
    options.clientRoleType = AgoraClientRoleBroadcaster;
    [self.agoraKit joinChannelByToken:nil channelId:@"QW" uid:0 mediaOptions:options joinSuccess:^(NSString * _Nonnull channel, NSUInteger uid, NSInteger elapsed) {
        NSLog(@"join RTC success");
    }];
}

#pragma mark - AgoraRtcEngineDelegate -

- (void)rtcEngineMediaEngineDidLoaded:(AgoraRtcEngineKit * _Nonnull)engine {
    NSLog(@"rtcEngineMediaEngineDidLoaded");
}

- (void)rtcEngine:(AgoraRtcEngineKit * _Nonnull)engine didOccurWarning:(AgoraWarningCode)warningCode {
    NSLog(@"didOccurWarning");
}

- (void)rtcEngine:(AgoraRtcEngineKit * _Nonnull)engine didOccurError:(AgoraErrorCode)errorCode {
    NSLog(@"didOccurError");
}

#pragma mark - AgoraVideoFrameDelegate -

- (BOOL)onCaptureVideoFrame:(AgoraOutputVideoFrame *)videoFrame {
    NSLog(@"onCaptureVideoFrame");
    return YES;
}

@end

#else

@implementation RCSRTCViewController

@end

#endif
