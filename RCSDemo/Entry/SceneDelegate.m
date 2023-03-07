//
//  SceneDelegate.m
//  RCSDemo
//
//  Created by shuai shao on 2022/12/26.
//

#import "SceneDelegate.h"
#import <AVFoundation/AVFoundation.h>

@interface SceneDelegate (){
    BOOL _shouldStopBg;
}

@property (nonatomic, strong) AVAudioPlayer * audioPlayer;

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
    UIBackgroundTaskIdentifier bgTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
    _shouldStopBg = NO;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(){
        while ( TRUE ) {
            if ( _shouldStopBg ){ break; }
            float remainTime = [[UIApplication sharedApplication] backgroundTimeRemaining];
            NSLog(@"###!!!BackgroundTimeRemaining: %f",remainTime);
            if ( remainTime < 20.0 ){
                NSLog(@"start play audio!");
                NSError *audioSessionError = nil;
                AVAudioSession *audioSession = [AVAudioSession sharedInstance];
                if ( [audioSession setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:&(audioSessionError)] )
                {
                    NSLog(@"set audio session success!");
                }else{
                    NSLog(@"set audio session fail!");
                }
                NSURL *musicUrl = [[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"poke" ofType:@"mp3"]];
                self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:musicUrl error:nil];
                self.audioPlayer.numberOfLoops = 0;
                self.audioPlayer.volume = 0;
                [self.audioPlayer play];
                [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
            }
            [NSThread sleepForTimeInterval:1.0];
        }
    });
}


@end
