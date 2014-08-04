//
//  SBRTTokenView.m
//  AgoBook
//
//  Created by Simone Bierti on 15/04/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "SBRTTokenView.h"
#import "SBRTTokenButton.h"
#import "SegnoTag.h"

@implementation SBRTTokenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(SBRTTokenButton *) createTokenButtonForString:(NSString *)string {
    // istanzio un oggetto TokenButton
    SBRTTokenButton *btn = [[SBRTTokenButton alloc] init];
    // imposto la stringa passata come title per il pulsante appena creato
    [btn setTitle:string forState:UIControlStateNormal];
    // rilevo le dimensioni della string in base al font prescelto
    CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:btn.titleLabel.font}];
    // border è la lunghezza massina a cui potrà arrivare il pulsante creato
    CGFloat border = (self.nextToken.x + size.width + 20.0);
    // esegue controllo che la lunghezza dell'oggetto creato non sia superiore alle dimensione della vista contenitore
    if(border > self.frame.size.width) {
        //nel caso la lunghezza sfori la vista reimposta il valore di nextToken con x=0 e y=y+50
        [self setNextToken:CGPointMake(0.0, self.nextToken.y+50)];
        // l'altezza complessiva della vista ora aumenta di 50 punti
        self.linesHeight = self.linesHeight +50;
    }
    // con il punto di innesto (nexttoken) determinato si procede a stabilire il frame del bottone
    btn.frame = CGRectMake(self.nextToken.x, self.nextToken.y, size.width +20.0, 44);
    // imposta un padding left e right di 10 punti
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    // corregge la misura x di nextToken per tenere conto del padding
    [self setNextToken:CGPointMake(self.nextToken.x +size.width + 20.0, self.nextToken.y)];
    return btn;
}

-(SBRTTokenButton *) createTokenButtonForSegnoTag:(SegnoTag *)tag {
    // istanzio un oggetto TokenButton
    SBRTTokenButton *btn = [SBRTTokenButton buttonWithTag:tag];
    //SBRTTokenButton *btn = [[SBRTTokenButton alloc] init];
    //[btn setTag:tag];
    // imposto la stringa passata come title per il pulsante appena creato
    //[btn setTitle:tag.descrizione forState:UIControlStateNormal];
    // rilevo le dimensioni della string in base al font prescelto
    CGSize size = btn.frame.size;
    //CGSize size = [tag.descrizione sizeWithAttributes:@{NSFontAttributeName:btn.titleLabel.font}];
    // border è la lunghezza massina a cui potrà arrivare il pulsante creato
    CGFloat border = (self.nextToken.x + size.width + 30.0);
    // esegue controllo che la lunghezza dell'oggetto creato non sia superiore alle dimensione della vista contenitore
    if(border > self.frame.size.width) {
        //nel caso la lunghezza sfori la vista reimposta il valore di nextToken con x=0 e y=y+50
        [self setNextToken:CGPointMake(0.0, self.nextToken.y+50)];
        // l'altezza complessiva della vista ora aumenta di 50 punti
        self.linesHeight = self.linesHeight +50;
    }
    // con il punto di innesto (nexttoken) determinato si procede a stabilire il frame del bottone
    btn.frame = CGRectMake(self.nextToken.x, self.nextToken.y, size.width +20.0, 30);
    // imposta un padding left e right di 10 punti
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    // corregge la misura x di nextToken per tenere conto del padding
    [self setNextToken:CGPointMake(self.nextToken.x +size.width + 30.0, self.nextToken.y)];
    return btn;
}


- (void) refreshTokenView:(NSArray *) array {
    
    [self.delegate addMeToSubviews:self];
    
    self.nextToken = CGPointZero;
    self.linesHeight = 50.0;
    
    for (NSString *string in array) {
        SBRTTokenButton *btn = [self createTokenButtonForString:string];
        [btn setNeedsDisplay];
        [self addSubview:btn];
    }
    
    
}

- (void) refreshTokenViewWithSegnoTags:(NSArray *) array {
    [self.delegate addMeToSubviews:self];
    
    self.nextToken = CGPointZero;
    self.linesHeight = 50.0;
    
    for (SegnoTag *tag in array) {
        SBRTTokenButton *btn = [self createTokenButtonForSegnoTag:tag];
        [btn setNeedsDisplay];
        [self addSubview:btn];
    }
}

- (void) refreshTokenView:(NSArray *) array forCell:(NSInteger)indexPathRow{
    NSLog(@"questo per la cella all'indice: %li",(long)indexPathRow);
    [self.delegate addMeToSubviews:self];
    
    self.nextToken = CGPointZero;
    self.linesHeight = 50.0;
    
    for (NSString *string in array) {
        SBRTTokenButton *btn = [self createTokenButtonForString:string];
        [btn setNeedsDisplay];
        [self addSubview:btn];
    }
    
    
}

+ (CGFloat) heightForTokenViewFromArray:(NSArray *) strings withFont:(UIFont *)font withViewWidth:(CGFloat) width{
    // Ricevo come parametro l'array di stringhe che rappresentano i tag per il SegnoPersonale
    // comincio quindi a settare una misura di base per l'altezza
    // suppongo infatti che la tokenview sarà rappresentata solo da una linea di token
    CGFloat linesHeight = 50.0f;
    CGPoint nextToken = CGPointMake(0.0f, 0.0f);
    
    for (NSString *string in strings) {
        //NSString *s = [NSString stringWithString:];
        //NSLog(@"questa el la maledetta stringa di merda: %@",s);
        //SegnoTag *segno = (SegnoTag *)string;
        // rilevo le dimensioni della string in base al font prescelto
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        // border è la lunghezza massina a cui potrà arrivare il pulsante creato
        CGFloat border = (nextToken.x + size.width + 20.0);
        // esegue controllo che la lunghezza dell'oggetto creato non sia superiore alle dimensione della vista contenitore
        if(border > width) {
            //nel caso la lunghezza sfori la vista reimposta il valore di nextToken con x=0 e y=y+50
            nextToken = CGPointMake(0.0, nextToken.y+50);
            // l'altezza complessiva della vista ora aumenta di 50 punti
            linesHeight = linesHeight +50;
        }
        // corregge la misura x di nextToken per tenere conto del padding
        nextToken = CGPointMake(nextToken.x +size.width +20.0, nextToken.y);
            
    }
    
    return linesHeight;
}


@end
