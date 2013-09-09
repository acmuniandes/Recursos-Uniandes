//
//  Sala.h
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 8/30/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sala : NSObject
{
    BOOL ocupada;
}

//Properties
@property (nonatomic, strong)NSString *nombre;

//Methods
-(void)cambiarEstado;
-(BOOL)darEstado;
-(NSString *)darNombre;

-(id)initWithParameter: (NSString *)nNombre andWithB:(BOOL)estado;

//Actions

//Outlets

@end
