//
//  NSFileManager+Extension.m
//  LZExtension
//
//  Created by 寕小陌 on 16/10/27.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import "NSFileManager+Extension.h"

@implementation NSFileManager (Extension)

+ (NSString * _Nullable)lz_readTextFile:(NSString * _Nonnull)file ofType:(NSString * _Nonnull)type {
    return [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:type] encoding:NSUTF8StringEncoding error:nil];
}

+ (BOOL)lz_saveArrayToPath:(LZDirectoryType)path withFilename:(NSString * _Nonnull)fileName array:(NSArray * _Nonnull)array {
    NSString *_path;
    
    switch (path) {
        case LZDirectoryTypeMainBundle:
            _path = [self lz_getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case LZDirectoryTypeLibrary:
            _path = [self lz_getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case LZDirectoryTypeDocuments:
            _path = [self lz_getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case LZDirectoryTypeCache:
            _path = [self lz_getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
    }
    
    return [NSKeyedArchiver archiveRootObject:array toFile:_path];
}

+ (NSArray * _Nullable)lz_loadArrayFromPath:(LZDirectoryType)path withFilename:(NSString * _Nonnull)fileName {
    NSString *_path;
    
    switch (path) {
        case LZDirectoryTypeMainBundle:
            _path = [self lz_getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case LZDirectoryTypeLibrary:
            _path = [self lz_getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case LZDirectoryTypeDocuments:
            _path = [self lz_getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case LZDirectoryTypeCache:
            _path = [self lz_getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
    }
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:_path];
}


+ (NSString * _Nonnull)lz_getBundlePathForFile:(NSString * _Nonnull)fileName {
    NSString *fileExtension = [fileName pathExtension];
    return [[NSBundle mainBundle] pathForResource:[fileName stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@".%@", fileExtension] withString:@""] ofType:fileExtension];
}

+ (NSString * _Nonnull)lz_getDocumentsDirectoryForFile:(NSString * _Nonnull)fileName {
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSString * _Nonnull)lz_getLibraryDirectoryForFile:(NSString * _Nonnull)fileName {
    NSString *libraryDirectory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [libraryDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSString * _Nonnull)lz_getCacheDirectoryForFile:(NSString * _Nonnull)fileName {
    NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [cacheDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSNumber * _Nullable)lz_fileSize:(NSString * _Nonnull)fileName fromDirectory:(LZDirectoryType)directory {
    if (fileName.length > 0) {
        NSString *path;
        
        switch (directory) {
            case LZDirectoryTypeMainBundle:
                path = [self lz_getBundlePathForFile:fileName];
                break;
            case LZDirectoryTypeLibrary:
                path = [self lz_getLibraryDirectoryForFile:fileName];
                break;
            case LZDirectoryTypeDocuments:
                path = [self lz_getDocumentsDirectoryForFile:fileName];
                break;
            case LZDirectoryTypeCache:
                path = [self lz_getCacheDirectoryForFile:fileName];
                break;
        }
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:fileName]) {
            NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:fileName error:nil];
            if (fileAttributes) {
                return [fileAttributes objectForKey:NSFileSize];
            }
        }
    }
    
    return nil;
}

+ (BOOL)lz_deleteFile:(NSString * _Nonnull)fileName fromDirectory:(LZDirectoryType)directory {
    if (fileName.length > 0) {
        NSString *path;
        
        switch (directory) {
            case LZDirectoryTypeMainBundle:
                path = [self lz_getBundlePathForFile:fileName];
                break;
            case LZDirectoryTypeLibrary:
                path = [self lz_getLibraryDirectoryForFile:fileName];
                break;
            case LZDirectoryTypeDocuments:
                path = [self lz_getDocumentsDirectoryForFile:fileName];
                break;
            case LZDirectoryTypeCache:
                path = [self lz_getCacheDirectoryForFile:fileName];
                break;
        }
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        }
    }
    
    return NO;
}

+ (BOOL)lz_moveLocalFile:(NSString * _Nonnull)fileName fromDirectory:(LZDirectoryType)origin toDirectory:(LZDirectoryType)destination {
    return [self lz_moveLocalFile:fileName fromDirectory:origin toDirectory:destination withFolderName:nil];
}

+ (BOOL)lz_moveLocalFile:(NSString * _Nonnull)fileName fromDirectory:(LZDirectoryType)origin toDirectory:(LZDirectoryType)destination withFolderName:(NSString * _Nullable)folderName {
    NSString *originPath;
    
    switch (origin) {
        case LZDirectoryTypeMainBundle:
            originPath = [self lz_getBundlePathForFile:fileName];
            break;
        case LZDirectoryTypeLibrary:
            originPath = [self lz_getDocumentsDirectoryForFile:fileName];
            break;
        case LZDirectoryTypeDocuments:
            originPath = [self lz_getLibraryDirectoryForFile:fileName];
            break;
        case LZDirectoryTypeCache:
            originPath = [self lz_getCacheDirectoryForFile:fileName];
            break;
    }
    
    NSString *destinationPath;
    if (folderName) {
        destinationPath = [NSString stringWithFormat:@"%@/%@", folderName, fileName];
    } else {
        destinationPath = fileName;
    }
    
    switch (destination) {
        case LZDirectoryTypeMainBundle:
            destinationPath = [self lz_getBundlePathForFile:destinationPath];
            break;
        case LZDirectoryTypeLibrary:
            destinationPath = [self lz_getLibraryDirectoryForFile:destinationPath];
            break;
        case LZDirectoryTypeDocuments:
            destinationPath = [self lz_getDocumentsDirectoryForFile:destinationPath];
            break;
        case LZDirectoryTypeCache:
            destinationPath = [self lz_getCacheDirectoryForFile:destinationPath];
            break;
    }
    
    if (folderName) {
        NSString *folderPath = [NSString stringWithFormat:@"%@/%@", destinationPath, folderName];
        if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
    }
    
    BOOL copied = NO, deleted = NO;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:originPath]) {
        if ([[NSFileManager defaultManager] copyItemAtPath:originPath toPath:destinationPath error:nil]) {
            copied = YES;
        }
    }
    
    if (destination != LZDirectoryTypeMainBundle) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:originPath])
            if ([[NSFileManager defaultManager] removeItemAtPath:originPath error:nil]) {
                deleted = YES;
            }
    }
    
    if (copied && deleted) {
        return YES;
    }
    return NO;
}


+ (BOOL)lz_duplicateFileAtPath:(NSString * _Nonnull)origin toNewPath:(NSString * _Nonnull)destination {
    if ([[NSFileManager defaultManager] fileExistsAtPath:origin]) {
        return [[NSFileManager defaultManager] copyItemAtPath:origin toPath:destination error:nil];
    }
    return NO;
}

+ (BOOL)lz_renameFileFromDirectory:(LZDirectoryType)origin atPath:(NSString * _Nonnull)path withOldName:(NSString * _Nonnull)oldName andNewName:(NSString * _Nonnull)newName {
    NSString *originPath;
    
    switch (origin) {
        case LZDirectoryTypeMainBundle:
            originPath = [self lz_getBundlePathForFile:path];
            break;
        case LZDirectoryTypeLibrary:
            originPath = [self lz_getDocumentsDirectoryForFile:path];
            break;
        case LZDirectoryTypeDocuments:
            originPath = [self lz_getLibraryDirectoryForFile:path];
            break;
        case LZDirectoryTypeCache:
            originPath = [self lz_getCacheDirectoryForFile:path];
            break;
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:originPath]) {
        NSString *newNamePath = [originPath stringByReplacingOccurrencesOfString:oldName withString:newName];
        if ([[NSFileManager defaultManager] copyItemAtPath:originPath toPath:newNamePath error:nil]) {
            if ([[NSFileManager defaultManager] removeItemAtPath:originPath error:nil]) {
                return YES;
            }
        }
    }
    return NO;
}

+ (id _Nullable)lz_getSettings:(NSString * _Nonnull)settings objectForKey:(NSString * _Nonnull)objKey {
    NSString *path = [self lz_getLibraryDirectoryForFile:@""];
    path = [path stringByAppendingString:@"/Preferences/"];
    path = [path stringByAppendingString:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    
    NSMutableDictionary *loadedPlist;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    } else {
        return nil;
    }
    
    return loadedPlist[objKey];
}

+ (BOOL)lz_setSettings:(NSString * _Nonnull)settings object:(id _Nonnull)value forKey:(NSString * _Nonnull)objKey {
    NSString *path = [self lz_getLibraryDirectoryForFile:@""];
    path = [path stringByAppendingString:@"/Preferences/"];
    path = [path stringByAppendingString:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    
    NSMutableDictionary *loadedPlist;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    } else {
        loadedPlist = [[NSMutableDictionary alloc] init];
    }
    
    [loadedPlist setObject:value forKey:objKey];
    
    return [loadedPlist writeToFile:path atomically:YES];
}

+ (id _Nullable)lz_getAppSettingsForObjectWithKey:(NSString * _Nonnull)objKey {
    
    NSString *APP_NAME =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    return [self lz_getSettings:APP_NAME objectForKey:objKey];
}

+ (BOOL)lz_setAppSettingsForObject:(id _Nonnull)value forKey:(NSString * _Nonnull)objKey {
    
    NSString *APP_NAME =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    return [self lz_setSettings:APP_NAME object:value forKey:objKey];
}

@end
