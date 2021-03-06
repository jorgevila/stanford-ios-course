//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by Scott Kensell on 11/22/13.
//  Copyright (c) 2013 Scott Kensell. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"
#import "SetCardView.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

-(Deck *)createDeck {
    SetCardDeck *fullDeck = [[SetCardDeck alloc] init];
    Deck *smallerDeck = [[Deck alloc] init];
    for (int i=0; i < 27; i++) {
        [smallerDeck addCard:[fullDeck drawRandomCard]];
    }
    return smallerDeck;
}

- (CardView *)createCardViewInFrame:(CGRect)frame fromCard:(Card *)card {
    SetCard *setCard = (SetCard *)card;
    SetCardView *setCardView = [[SetCardView alloc] initWithFrame:frame];
    setCardView.shape = setCard.shape;
    setCardView.shading = setCard.shading;
    setCardView.number = setCard.number;
    setCardView.color = setCard.color;
    return setCardView;
}

- (void)viewDidLoad {
    [self setupGameWithNumberOfCardsToMatch:3
                            CardAspectRatio:7.0/5.0
                           prefersWideCards:YES
                minimumNumberOfCardsOnBoard:12
                maximumNumberOfCardsOnBoard:15
                      allowsFlippingOfCards:NO
    numberToDealWhenDealMoreButtonIsPressed:3];

    [super viewDidLoad];
}


@end
