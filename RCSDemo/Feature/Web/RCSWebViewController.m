//
//  RCSWebViewController.m
//  RCSDemo
//
//  Created by shuai shao on 2023/6/7.
//

#import <WebKit/WebKit.h>

#import "RCSWebViewController.h"

@interface RCSWebViewController ()

@property (nonatomic, strong) NSURL *URL;

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation RCSWebViewController

+ (WKProcessPool *)singleWKProcessPool {
    static WKProcessPool *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WKProcessPool alloc] init];
    });
    return instance;
}

- (instancetype)initWithURL:(NSURL *)URL {
    if (self = [super init]) {
        _URL = URL;
    }
    return self;
}

- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.processPool = [RCSWebViewController singleWKProcessPool];
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.URL];
    [self.webView loadRequest:request];
}

@end
