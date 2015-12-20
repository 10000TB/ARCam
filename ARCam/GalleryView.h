//
//  GalleryView.h
//  ARCam
//
//  Created by Xuehao(David) Hu on 11/28/15.
//  Copyright © 2015 Xuehao(David) Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GalleryViewDelegate <NSObject>

-(void)goBackButtonTapped:(UIButton *)sender;
-(void)SeeAllButtonTapped;

@end

@interface GalleryView : UIView

@property (nonatomic, strong) UITextField *nameItTextfield;
@property (nonatomic, weak) id<GalleryViewDelegate> delegate;


@end
