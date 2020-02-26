//
//  ViewController.m
//  Demo
//
//  Created by zx on 2020/2/25.
//  Copyright © 2020 zx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) CGFloat subRemaining;
@property (nonatomic, assign) CGFloat subBonus;
@property (nonatomic, assign) CGFloat subMoney;


@property (nonatomic, strong) NSArray *boundsArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.boundsArr = @[@2,@5,@10,@20,@66.6,@88.8,@100,@150,@200,@520];
    // Do any additional setup after loading the view.
    
    [self planA];
//    [self planB];
//    [self planC];
//    [self planD];
}


- (void)planA{//每次奖励都是小额的,净赚基本维持在0.1
    for (int i = 0; i<500; i++) {
        CGFloat onceMoney = 20;
        self.subRemaining += onceMoney;
        self.subMoney += onceMoney;
        NSInteger maxBounds = MIN((self.subMoney*0.9-self.subBonus)-1, 519);
        int bounds = 2 +  (arc4random() % maxBounds);
        
        
        self.subBonus += bounds;
        self.subRemaining -= bounds;
        
        NSLog(@"单次奖励:%d,奖励上限:%ld,剩余奖池:%lf",bounds,maxBounds,self.subRemaining);
    }
    NSLog(@"!!!!!累计奖励:%lf,剩余金额:%lf",self.subBonus,self.subRemaining);
}



- (void)planB{
    self.subBonus = 500 * 20 *0.9;
    for (int i = 0; i<500; i++) {
        CGFloat mustRemaining = 2*(499-i);
        CGFloat onceBounds = self.subBonus - mustRemaining;
        NSInteger maxBounds = MIN(onceBounds-1, 519);
       int bounds = 2 +  (arc4random() % maxBounds);
        self.subBonus -= bounds; NSLog(@"单次奖励:%d,奖励上限:%ld,剩余奖池:%lf",bounds,maxBounds-1,self.subBonus);
        
        self.subRemaining += (20-bounds);
    }
    NSLog(@"!!!!!剩余金额:%lf",self.subRemaining);
}

- (void)planC{
    NSInteger RepeatNumber = 1027;
    NSInteger r2=0, r5=0,r10=0,r20=0,r66=0, r88=0,r100=0,r150=0,r200=0, r520=0;
    for (int i = 0; i<RepeatNumber; i++) {
        CGFloat onceMoney = 20;
        self.subRemaining += onceMoney;
        self.subMoney += onceMoney;
        CGFloat maxBounds = self.subMoney*0.9-self.subBonus;
        
        NSInteger maxBoundIndex = 0;
        for (int j = 9; j>=0; j--) {
            if ([self.boundsArr[j] floatValue]<=maxBounds) {
                maxBoundIndex = j;
                break;
            }
        }
        
        NSInteger boundsIndex = (arc4random() % maxBoundIndex);
        CGFloat bounds = [self.boundsArr[boundsIndex] floatValue];
        self.subBonus += bounds;
        self.subRemaining -= bounds; NSLog(@"单次奖励:%lf,奖励上限:%lf,剩余金额:%lf",bounds,maxBounds,self.subRemaining);
        
        NSInteger bounds1 = floorf(bounds);
        switch (bounds1) {
            case 2:
                r2+=1;
                break;
                case 5:
                r5+=1;
                break;
                case 10:
                r10+=1;
                break;
                case 20:
                r20+=1;
                break;
                case 66:
                r66+=1;
                break;
                case 88:
                r88+=1;
                break;
                case 100:
                r100+=1;
                break;
                case 150:
                r150+=1;
                break;
                case 200:
                r200+=1;
                break;
                case 520:
                r520+=1;
                break;
            default:
                break;
        }
    }
    NSLog(@"!!!!!累计奖励:%lf,剩余金额:%lf",self.subBonus,self.subRemaining);
    NSLog(@"2:%ld次,5:%ld次,10:%ld次,20:%ld次,66:%ld次,88:%ld次,100:%ld次,150:%ld次,200:%ld次,520:%ld次,",r2,r5,r10,r20,r66,r88,r100,r150,r200,r520);
}


- (void)planD{
    NSInteger RepeatNumber = 1027;
    self.subBonus = RepeatNumber * 20 *0.9;
    NSInteger r2=0, r5=0,r10=0,r20=0,r66=0, r88=0,r100=0,r150=0,r200=0, r520=0;
    for (int i = 0; i<1027; i++) {
        CGFloat onceMoney = 20;
        self.subRemaining += onceMoney;
        self.subMoney += onceMoney;
        
        CGFloat mustRemaining = 2*(RepeatNumber-1-i);
        CGFloat onceMaxBounds = self.subBonus - mustRemaining;
        
        NSInteger maxBoundIndex = 0;
        for (int j = 9; j>=0; j--) {
            if ([self.boundsArr[j] floatValue]<=onceMaxBounds) {
                maxBoundIndex = j;
                break;
            }
        }
        
        NSInteger boundsIndex = (arc4random() % (maxBoundIndex+1));
        CGFloat bounds = [self.boundsArr[boundsIndex] floatValue];
        self.subBonus -= bounds;
        self.subRemaining -= bounds;
    NSLog(@"单次奖励:%lf,奖励上限:%lf,奖池剩余:%lf",bounds,onceMaxBounds,self.subBonus);
        
        NSInteger bounds1 = floorf(bounds);
        switch (bounds1) {
            case 2:
                r2+=1;
                break;
            case 5:
                r5+=1;
                break;
            case 10:
                r10+=1;
                break;
            case 20:
                r20+=1;
                break;
            case 66:
                r66+=1;
                break;
            case 88:
                r88+=1;
                break;
            case 100:
                r100+=1;
                break;
            case 150:
                r150+=1;
                break;
            case 200:
                r200+=1;
                break;
            case 520:
                r520+=1;
                break;
            default:
                break;
        }
    }
    NSLog(@"!!!!!累计奖励:%lf,剩余金额:%lf",self.subBonus,self.subRemaining);
    NSLog(@"2:%ld次,5:%ld次,10:%ld次,20:%ld次,66:%ld次,88:%ld次,100:%ld次,150:%ld次,200:%ld次,520:%ld次,",r2,r5,r10,r20,r66,r88,r100,r150,r200,r520);
}





@end
