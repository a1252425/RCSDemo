//
//  RCSConnection.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/9.
//

#import "RCSConnection.h"

#include <os/signpost.h>

#define INNER_BEGIN_LOG(subsystem, category, name) \
os_log_t m_log_##name = os_log_create((#subsystem), (#category));\
os_signpost_id_t m_spid_##name = os_signpost_id_generate(m_log_##name);\
os_signpost_interval_begin(m_log_##name, m_spid_##name, (#name));

#define INNER_END_LOG(name) \
os_signpost_interval_end(m_log_##name, m_spid_##name, (#name));

@implementation RCSConnection

- (void)testConnection {
    NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:@"IM_Token"];
    if (!token) return;
    RCConnectionStatus status = [[RCIMClient sharedRCIMClient] getConnectionStatus];
    if (status == ConnectionStatus_Connected) {
        [[RCIM sharedRCIM] disconnect];
    } else {
        INNER_BEGIN_LOG(IM, test, connection);
        [[RCIM sharedRCIM] connectWithToken:token dbOpened:^(RCDBErrorCode code) {
            INNER_END_LOG(connection);
        } success:^(NSString *userId) {
            INNER_END_LOG(connection);
        } error:^(RCConnectErrorCode errorCode) {
            INNER_END_LOG(connection);
        }];
    }
    
    [self performSelector:@selector(testConnection) withObject:nil afterDelay:3];
}

@end
