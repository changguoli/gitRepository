//
//  NSData+AES256.h
//  Youngs
//
//  Created by guoxuyao on 2017/3/29.
//  Copyright © 2017年 guoxuyao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData (AES256)
- (NSData *)aes256_encrypt:(NSString *)key;   //加密

- (NSData *)aes256_decrypt:(NSString *)key;   //解密

@end
