//
//  MainCameraView.m
//  ARCam
//
//  Created by Xuehao(David) Hu on 11/28/15.
//  Copyright © 2015 Xuehao(David) Hu. All rights reserved.
//

#import "MainCameraView.h"

@interface MainCameraView ()

@property (nonatomic, strong) UIView *topToolContainer;
@property (nonatomic, strong) UIImageView *cameraView;
@property (nonatomic, strong) UIView *bottomToolContainer;
@property (nonatomic, strong) UIView *startButton;

@end

@implementation MainCameraView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createSubViews];
    }
    return self;
}

-(id)init{
    return [self initWithFrame:CGRectZero];
}

-(void)createSubViews{
    [self addSubview:self.topToolContainer];
    [self addSubview:self.cameraView];
    [self addSubview:self.bottomToolContainer];
    [self.bottomToolContainer addSubview:self.startButton];
    [self.bottomToolContainer addSubview:self.lastTakenPanoramasPreview];

    [self setUpConstraints];
}

//********************************
//subviews
//********************************
-(UIView *)topToolContainer{
    if(!_topToolContainer){
        _topToolContainer = [UIView new];
        _topToolContainer.translatesAutoresizingMaskIntoConstraints = NO;
        _topToolContainer.backgroundColor = [UIColor blackColor];
    }
    return _topToolContainer;
}

-(UIImageView *)cameraView{
    if(!_cameraView){
        _cameraView = [UIImageView new];
        _cameraView.translatesAutoresizingMaskIntoConstraints = NO;
        _cameraView.backgroundColor = [UIColor whiteColor];
    }
    return _cameraView;
}

-(UIView *)bottomToolContainer{
    if(!_bottomToolContainer){
        _bottomToolContainer = [UIView new];
        _bottomToolContainer.translatesAutoresizingMaskIntoConstraints = NO;
        _bottomToolContainer.backgroundColor = [UIColor blackColor];
    }
    return _bottomToolContainer;
}

-(UIView *)startButton{
    if(!_startButton){
        _startButton = [UIView new];
        _startButton.translatesAutoresizingMaskIntoConstraints = NO;
        _startButton.backgroundColor = [UIColor redColor];
        _startButton.layer.cornerRadius = 37.f;
    }
    return _startButton;
}

-(UIImageView *)lastTakenPanoramasPreview{
    if(!_lastTakenPanoramasPreview){
        _lastTakenPanoramasPreview = [UIImageView new];
        _lastTakenPanoramasPreview.translatesAutoresizingMaskIntoConstraints = NO;
        _lastTakenPanoramasPreview.image = [UIImage imageNamed:@"happiness1"];
        
        UITapGestureRecognizer *previewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lastTakenPanoramasPreviewTap:)];
        [_lastTakenPanoramasPreview setUserInteractionEnabled:YES];
        [_lastTakenPanoramasPreview addGestureRecognizer:previewTap];
    }
    return _lastTakenPanoramasPreview;
}
-(void)setUpConstraints{
    NSDictionary *TopToolContainerMetrics = @{
                                              @"topToolContainerHeight":[NSNumber numberWithFloat:60.f],
                                              @"topToolContainerSidePadding":[NSNumber numberWithFloat:0.f]
                                              };
//    NSDictionary *mainCameraViewMetrics = @{
//                                            
//                                            };
    NSDictionary *bottomToolContainerMetrics = @{
                                                 @"bottomToolContainerHeight":[NSNumber numberWithFloat:75.f],
                                                 
                                                 @"startButtonRadius":[NSNumber numberWithFloat:74.f],
                                                 
                                                 @"lastTakenPanoramasSidePadding":[NSNumber numberWithFloat:10.f],
                                                 @"lastTakenPanoramasWidth":[NSNumber numberWithFloat:80.f]
                                                 };
    // Top Container constraints
    //
    NSArray *topContainerConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_topToolContainer(topToolContainerHeight)]" options:0 metrics:TopToolContainerMetrics views:NSDictionaryOfVariableBindings(_topToolContainer)];
    NSArray *topContainerConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-topToolContainerSidePadding-[_topToolContainer]-topToolContainerSidePadding-|" options:0 metrics:TopToolContainerMetrics views:NSDictionaryOfVariableBindings(_topToolContainer)];
    [self addConstraints:topContainerConstraints_H];
    [self addConstraints:topContainerConstraints_V];
    
    
    
    //Camera View Constraints
    //
    NSArray *cameraViewConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_topToolContainer]-0-[_cameraView]-0-[_bottomToolContainer]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_topToolContainer,_cameraView,_bottomToolContainer)];
    NSArray *cameraViewConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_cameraView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_cameraView)];
    [self addConstraints:cameraViewConstraints_H];
    [self addConstraints:cameraViewConstraints_V];
    
    //bottom tool container
    //
    NSArray *bottomToolContainerConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bottomToolContainer(bottomToolContainerHeight)]-0-|" options:0 metrics:bottomToolContainerMetrics views:NSDictionaryOfVariableBindings(_bottomToolContainer)];
    NSArray *bottomToolContainerConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_bottomToolContainer]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottomToolContainer)];
    [self addConstraints:bottomToolContainerConstraints_H];
    [self addConstraints:bottomToolContainerConstraints_V];
    //
    //start button constraints
    NSArray *startButtonConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_startButton(startButtonRadius)]" options:0 metrics:bottomToolContainerMetrics views:NSDictionaryOfVariableBindings(_startButton)];
    NSArray *startButtonConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_startButton(startButtonRadius)]" options:0 metrics:bottomToolContainerMetrics views:NSDictionaryOfVariableBindings(_startButton)];
    NSLayoutConstraint *startButtonConstraint_CenterX = [NSLayoutConstraint constraintWithItem:self.startButton
                                                                                     attribute:NSLayoutAttributeCenterX
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.bottomToolContainer
                                                                                     attribute:NSLayoutAttributeCenterX
                                                                                    multiplier:1.0
                                                                                      constant:0.0];
    NSLayoutConstraint *startButtonConstraint_CenterY = [NSLayoutConstraint constraintWithItem:self.startButton
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.bottomToolContainer
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                    multiplier:1.0
                                                                                      constant:0.0];
    [self.bottomToolContainer addConstraints:startButtonConstraints_H];
    [self.bottomToolContainer addConstraints:startButtonConstraints_V];
    [self.bottomToolContainer addConstraint:startButtonConstraint_CenterX];
    [self.bottomToolContainer addConstraint:startButtonConstraint_CenterY];
    //
    //last taken panoramas preview
    NSArray *lastTakenPanoramasPreviewConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-lastTakenPanoramasSidePadding-[_lastTakenPanoramasPreview]-lastTakenPanoramasSidePadding-|" options:0 metrics:bottomToolContainerMetrics views:NSDictionaryOfVariableBindings(_lastTakenPanoramasPreview)];
    NSArray *lastTakenPanoramasPreviewConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-lastTakenPanoramasSidePadding-[_lastTakenPanoramasPreview(lastTakenPanoramasWidth)]" options:0 metrics:bottomToolContainerMetrics views:NSDictionaryOfVariableBindings(_lastTakenPanoramasPreview)];
    [self.bottomToolContainer addConstraints:lastTakenPanoramasPreviewConstraints_H];
    [self.bottomToolContainer addConstraints:lastTakenPanoramasPreviewConstraints_V];
    
}

//***********************************
// Helper Methods
//***********************************
-(void)lastTakenPanoramasPreviewTap:(UITapGestureRecognizer *)sender{
    NSLog(@"tappped");
    [self.delegate lastTakenPanoramasPreviewTapped];
}


@end
