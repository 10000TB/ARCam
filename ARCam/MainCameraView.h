//
//  MainCameraView.h
//  ARCam
//
//  Created by Xuehao(David) Hu on 11/28/15.
//  Copyright © 2015 Xuehao(David) Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainCameraViewDelegate <NSObject>

-(void)lastTakenPanoramasPreviewTapped;

@end

@interface MainCameraView : UIView

@property (nonatomic, strong) UIImageView *lastTakenPanoramasPreview;
@property (nonatomic, weak) id<MainCameraViewDelegate> Delegate;

@end
