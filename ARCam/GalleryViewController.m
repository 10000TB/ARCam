//
//  GalleryViewController.m
//  ARCam
//
//  Created by Xuehao(David) Hu on 11/28/15.
//  Copyright © 2015 Xuehao(David) Hu. All rights reserved.
//

#import "GalleryViewController.h"
#import "GalleryView.h"
#import "SeeAllViewController.h"

@interface GalleryViewController ()<GalleryViewDelegate>

@property (nonatomic, strong) GalleryView *view;

@end

@implementation GalleryViewController
@dynamic view;

-(void)loadView{
    self.view = [GalleryView new];
    self.view.delegate = self;
//    self.view.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//***********************
// GalleryViewDelegate Methods
//***********************
-(void)goBackButtonTapped:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)SeeAllButtonTapped{
    SeeAllViewController *seeAllVC = [SeeAllViewController new];
    [self presentViewController:seeAllVC animated:YES completion:^{
        
    }];
}

@end
