//
//  SeeAllView.h
//  ARCam
//
//  Created by Xuehao(David) Hu on 12/6/15.
//  Copyright © 2015 Xuehao(David) Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  SeeAllViewDelegate <NSObject>

-(void)backButtonTapped:(UIButton *)sender;

@end

@interface SeeAllView : UIView

@property (nonatomic, strong) UIView *CollectionViewContentView;
@property (nonatomic, weak) id<SeeAllViewDelegate> delsgate;

@end
