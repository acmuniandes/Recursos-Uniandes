//
//  Sala.m
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 8/30/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "Sala.h"

@implementation Sala

-(id)initWithParameter: (NSString *)nNombre andWithB:(BOOL)estado
{
    if(self = [super init])
    {
        self.nombre = nNombre;
        ocupada = estado;
    }
    return self;
}

-(void)cambiarEstado
{
    if (ocupada == YES) {
        ocupada = NO;
    }
    else{
        ocupada = YES;
    }
}

-(BOOL)darEstado
{
    return ocupada;
}


-(NSString *)darNombre
{
    return self.nombre;
}

@end
