//
//  MomentCollectionViewCell.m
//  ARCam
//
//  Created by Xuehao(David) Hu on 12/19/15.
//  Copyright © 2015 Xuehao(David) Hu. All rights reserved.
//

#import "MomentCollectionViewCell.h"
#import "Constants.h"

@interface MomentCollectionViewCell()

//@property (nonatomic, strong) UIView *foregroundOverlay;
@property (nonatomic, strong) UIImageView *momentImage;
@property (nonatomic, strong) UIView *nameView;
@property (nonatomic, strong) UILabel *name;

@end

@implementation MomentCollectionViewCell

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
    [self addSubview:self.momentImage];
//    [self addSubview:self.foregroundOverlay];
    [self addSubview:self.nameView];
    [self.nameView addSubview:self.name];
    
    [self setUpConstraints];
}

//************************************************
// subviews
//************************************************
//-(UIView *)foregroundOverlay{
//    if(!_foregroundOverlay){
//        _foregroundOverlay = [UIView new];
//        _foregroundOverlay.translatesAutoresizingMaskIntoConstraints = NO;
//        _foregroundOverlay.backgroundColor = [UIColor colorWithRed:3.0/255.0 green:3.0/255.0 blue:3.0/255.0 alpha:0.53];
//    }
//    return _foregroundOverlay;
//}

-(UIImageView *)momentImage{
    if(!_momentImage){
        _momentImage = [UIImageView new];
        _momentImage.translatesAutoresizingMaskIntoConstraints = NO;
        _momentImage.backgroundColor = [UIColor redColor];
    }
    return _momentImage;
}

-(UIView *)nameView{
    if(!_nameView){
        _nameView = [UIView new];
        _nameView.translatesAutoresizingMaskIntoConstraints = NO;
        _nameView.backgroundColor = [UIColor whiteColor];
    }
    return _nameView;
}

-(UILabel *)name{
    if(!_name){
        _name = [UILabel new];
        _name.translatesAutoresizingMaskIntoConstraints = NO;
        _name.font = [UIFont fontWithName:ARCamRegularFont size:18];
        _name.textColor = [UIColor blackColor];
        _name.textAlignment = NSTextAlignmentCenter;
        
        _name.text = @"Untitled";
    }
    return _name;
}

//************************************************
// constraint subviews
//************************************************
-(void)setUpConstraints{
    NSDictionary *momentCellMetrics = @{
                                        @"momentImageSidePadding":[NSNumber numberWithFloat:15.f],
                    
                                        @"overlaySidePadding":[NSNumber numberWithFloat:0.f],
                                        
                                        @"nameViewHeght":[NSNumber numberWithFloat:21.f],
                                        @"nameViewHorizontalPadding":[NSNumber numberWithFloat:10.f],
                                        @"nameViewVerticalPadding":[NSNumber numberWithFloat:10.f],
                                        
                                        @"nameLabelPadding":[NSNumber numberWithFloat:0.f]
                                        };
    //moment image
    NSArray *momentImageConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-momentImageSidePadding-[_momentImage]-momentImageSidePadding-|" options:0 metrics:momentCellMetrics views:NSDictionaryOfVariableBindings(_momentImage)];
    NSArray *momentImageConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-momentImageSidePadding-[_momentImage]-momentImageSidePadding-|" options:0 metrics:momentCellMetrics views:NSDictionaryOfVariableBindings(_momentImage)];
    [self addConstraints:momentImageConstraints_V];
    [self addConstraints:momentImageConstraints_H];
    
    //shadow
//    NSArray *foregroundOverlayConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-overlaySidePadding-[_foregroundOverlay]-overlaySidePadding-|" options:0 metrics:momentCellMetrics views:NSDictionaryOfVariableBindings(_foregroundOverlay)];
//    NSArray *foregroundOverlayConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-overlaySidePadding-[_foregroundOverlay]-overlaySidePadding-|" options:0 metrics:momentCellMetrics views:NSDictionaryOfVariableBindings(_foregroundOverlay)];
//    [self addConstraints:foregroundOverlayConstraints_H];
//    [self addConstraints:foregroundOverlayConstraints_V];
    
    //nameView
    NSArray *nameViewConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-nameViewHorizontalPadding-[_nameView]-nameViewHorizontalPadding-|" options:0 metrics:momentCellMetrics views:NSDictionaryOfVariableBindings(_nameView)];
    NSArray *nameViewConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_nameView(nameViewHeght)]-nameViewVerticalPadding-|" options:0 metrics:momentCellMetrics views:NSDictionaryOfVariableBindings(_nameView)];
    [self addConstraints:nameViewConstraints_H];
    [self addConstraints:nameViewConstraints_V];
    
    //name label
    NSArray *nameLabelConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-nameLabelPadding-[_name]-nameLabelPadding-|" options:0 metrics:momentCellMetrics views:NSDictionaryOfVariableBindings(_name)];
    NSArray *nameLabelConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-nameLabelPadding-[_name]-nameLabelPadding-|" options:0 metrics:momentCellMetrics views:NSDictionaryOfVariableBindings(_name)];
    [self addConstraints:nameLabelConstraints_H];
    [self addConstraints:nameLabelConstraints_V];
}



@end
