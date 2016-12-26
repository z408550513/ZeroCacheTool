//
//  ZeroCacheTool.swift
//  ZeroClearCacheToolDemo
//
//  Created by ptsdesigner on 2016/12/26.
//  Copyright © 2016年 Zero. All rights reserved.
//

import UIKit
import Foundation

class ZeroCacheTool: NSObject {

    
    class func FileSize () -> Float{
        
        return self.folderSizeAtPath(self.FilePath())
        
    }
    
    
    class func FilePath() -> String{
        return  NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).first!
        
    }
    
    class func fileSizeAtPath(path : String) -> Float{
        
        let fileMgr = NSFileManager.defaultManager()
        
        if fileMgr.fileExistsAtPath(path) {
            
            if let fileProperty = try? fileMgr.attributesOfItemAtPath(path) {
                
                return (fileProperty[NSFileSize] as? Float) ?? 0.0
                
            }
            
            
        }
        
        return 0.0
        
    }
    
    
    class func folderSizeAtPath(path : String) -> Float{
        
        let fileMgr = NSFileManager.defaultManager()
        var folderSize : Float = 0.0
        
        if fileMgr.fileExistsAtPath(path) {
            
            if let childerFiles = fileMgr.subpathsAtPath(path){
                
                for name in childerFiles {
                    let absolutePath = path + "/\(name)"
                    
                    folderSize += self.fileSizeAtPath(absolutePath)
                    print("folderSize")
                }
            }
            
        }
        return folderSize / 1024
        
    }
    
    class func clearFile() -> Bool{
        let cachePath = self.FilePath()
        let fileMgr = NSFileManager.defaultManager()
        if let childerFiles = fileMgr.subpathsAtPath(cachePath){
            
            for name in childerFiles{
                // 拼接路径
                let path = cachePath.stringByAppendingFormat("/\(name)")
                // 判断是否可以删除
                if(NSFileManager.defaultManager().fileExistsAtPath(path)){
                    // 删除
                    if let _ = try? NSFileManager.defaultManager().removeItemAtPath(path) {
                        
                        
                    }else {
                     
                    }
                }
            }
            
        }
        
        
        return true
    }
    
    
    
}
