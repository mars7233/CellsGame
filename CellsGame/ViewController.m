//
//  ViewController.m
//  CellsGame
//
//  Created by Mars on 2017/9/29.
//  Copyright © 2017年 Mingjun Ma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

//struct Cell{
//    int cellID;
//    int cellState;
//};

@implementation ViewController
int oldCells[9][9];
int newCells[9][9];
- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化细胞
    for(int i = 0;i<9;i++){
        for (int j = 0; j<9; j++) {
            int value = arc4random() % 100;
            oldCells[i][j] = value%2;
        }
    }
    // 绘制细胞图层
    [self drawCells];
    
}

//刷新细胞
-(void)refresh:(int *) oldcell to:(int *) newcell {
    int count = 0;
    for(int i = 0; i < 9; i++){
        for(int j = 0;j < 9; j++){
            int tempX = i-1;
            int tempY = j-1;
            for(int y = tempY; y<9 && y<tempY+3; y++)
//                if (tempX >= 0 && y>=0 && *(oldcell + tempX * 9 + y) == 1) {
                if(tempX >= 0 && y >= 0 && oldCells[tempX][y] == 1){
                    count ++;
                }
            for(int y = tempY; y<9 && y<tempY+3; y++){
//                if (y != j && *(oldcell +(tempX+1)*9 +y) == 1 && y >= 0){
                if(y != j && oldCells[tempX+1][y] == 1 && y >= 0){
                    count ++;
                }
            }
            for (int y = tempY; y < 9 && y < tempY + 3; y++) {
//                if (*(oldcell +(tempX + 2)*9 +y) == 1 && y >= 0) {
                if(oldCells[tempX+2][y] == 1 && y >= 0){
                    count ++;
                }
            }
            if (count == 3) {
//                *(newcell + i * 9 + j) = 1;
                newCells[i][j] = 1;
            }else if(count != 2){
//                *(newcell + i * 9 + j) = 0;
                newCells[i][j] = 0;
            }
            count = 0;
        }
    }
    for (int i =0; i<9; i++) {
        for (int j = 0; j<9; j++) {
            oldCells[i][j] = newCells[i][j];
        }
    }
}

//绘制细胞
-(void)drawCells {
    for (int i = 0; i<9; i++){
        for(int j = 0; j<9; j++){
            CGRect cellCG = CGRectMake(30*i+8, 30*j+8, 30, 30);
            UIButton *cell = [[UIButton alloc] initWithFrame:cellCG];
            cell.layer.cornerRadius = 10;
            //            if((j+1+9*i)%2 == 0){
            if(oldCells[i][j] == 0){
                cell.backgroundColor = [UIColor whiteColor];
                
            }else{
                cell.backgroundColor = [UIColor blackColor];
            }
            [_backgroundView addSubview:cell];
            NSLog(@"%d",j+1+9*i);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startButton:(id)sender {
    //刷新100次
    for (int i = 0; i< 100; i++){
        if(i%2 == 0){
            [self refresh:oldCells to:newCells];
            [self drawCells];
        }else{
            [self refresh:newCells to:oldCells];
            [self drawCells];
        }
    }
}

- (IBAction)stopButton:(id)sender {
    // 初始化细胞
    for(int i = 0;i<9;i++){
        for (int j = 0; j<9; j++) {
            int value = arc4random() % 100;
            oldCells[i][j] = value%2;
        }
    }
    // 绘制细胞图层
    [self drawCells];
}
@end
