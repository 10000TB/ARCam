//
//  MainCameraViewController.m
//  ARCam
//
//  Created by Xuehao(David) Hu on 11/28/15.
//  Copyright © 2015 Xuehao(David) Hu. All rights reserved.
//

#import "MainCameraViewController.h"
#import "GalleryViewController.h"

@interface MainCameraViewController ()<MainCameraViewDelegate>

@property (nonatomic, strong) MainCameraView *view;

@end

@implementation MainCameraViewController
@dynamic view;

-(void)loadView{
    self.view = [MainCameraView new];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.Delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//*********************************
// MainCameraViewDelegate Methods
//*********************************
-(void)lastTakenPanoramasPreviewTapped{
    GalleryViewController *galleryVC = [GalleryViewController new];
    NSLog(@"Tapped in MainCameraVC");
    [self presentViewController:galleryVC animated:YES completion:^{
    }];
}


@end
