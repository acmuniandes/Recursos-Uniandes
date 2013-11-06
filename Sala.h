//
//  Sala.h
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 10/16/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sala : NSObject

@property (nonatomic,strong) NSString *nombre;
@property (nonatomic) NSInteger *tiempoRestante;
@property (nonatomic) NSInteger *disponibilidad;

@end
