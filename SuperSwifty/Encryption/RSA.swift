//
//  RSA.swift
//  Pods-Example
//
//  Created by W&Z on 2020/8/10.
//

import Foundation
import CommonCrypto

public protocol RSAType {
    
    var rsa:RSA { get }
}

public struct RSA{
    
    let base:Data?
    
    init(_ value:Data?) {
        self.base = value
    }
}

extension RSA {
    
    /// 加密
    /// - Parameter filePath: 公钥本地路径
    /// - Returns: 加密后的Data
    public func encrypt(filePath:String)->Data?{
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let certificate = SecCertificateCreateWithData(kCFAllocatorDefault, data as CFData) else { return nil }
        
        ///  返回一个默认 X509 策略的公钥对象
        let policy = SecPolicyCreateBasicX509()
           
        /// 包含信任管理信息的结构体
        var trust:SecTrust?
        /// 基于证书和策略创建一个信任管理对象
        var status = SecTrustCreateWithCertificates(certificate, policy, &trust)
        
        guard status == errSecSuccess,let result = trust else { return nil }
        
        /// 信任结果
        var trustType = SecTrustResultType.invalid
        
        /// 评估指定证书和策略的信任管理是否有效
        status = SecTrustEvaluate(result,&trustType)
        
        guard status == errSecSuccess,
            /// 评估之后返回公钥子证书
            let key = SecTrustCopyPublicKey(result) else { return nil }
        
        return encrypt(key: key)
    }
    
    /// RSA 加密
    /// - Parameter key: 公钥
    /// - Returns: 加密成功后的数据
    public func encrypt(key:SecKey) -> Data? {
        
        let bufferSize = SecKeyGetBlockSize(key)
        
        guard let data = base,data.count > 0 ,
            data.count < bufferSize  - 11 else { return nil }
        
        var bytes = [UInt8](repeating: 0, count: bufferSize)
        
        var output = bufferSize
        
        let encrypt = SecKeyEncrypt(key, .PKCS1,[UInt8](data), data.count, &bytes, &output)
        
        switch encrypt {
        case errSecSuccess:
            return Data(bytes: bytes,count: output)
        default:
            return nil
        }
    }
    
    /// 解密
    /// - Parameters:
    ///   - filePath: 本地.p12 本地路径
    ///   - password: p12 密码
    /// - Returns: 返回 解密后的Data
    public func decrypt(filePath:String,password:String)->Data?{
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else { return nil }
        
        var items:CFArray?
        
        let options = [kSecImportExportPassphrase:password]
        
        let status = SecPKCS12Import(data as CFData, options as CFDictionary, &items)
        
        guard status == errSecSuccess,CFArrayGetCount(items) >= 0 else { return nil }
        
        let value = unsafeBitCast(CFArrayGetValueAtIndex(items, 0), to: CFDictionary.self)
        
        let key = Unmanaged.passUnretained(kSecImportItemIdentity).toOpaque()
        
        let map = CFDictionaryGetValue(value, key)
        
        let identity = unsafeBitCast(map, to: SecIdentity.self)
        
        var secKey:SecKey?
        
        let keyStatus = SecIdentityCopyPrivateKey(identity, &secKey)
        
        guard keyStatus == errSecSuccess,
            let sec = secKey else { return nil }
        
        return decrypt(key: sec)
    }
    
    /// RSA 解密
    /// - Parameters:
    ///   - key: 私钥
    ///   - password: 私钥密码
    /// - Returns: 解密成功后的数据
    public func decrypt(key:SecKey) ->Data?{
        
        let bufferSize = SecKeyGetBlockSize(key)
        
        guard let data = base,data.count > 0 ,
            data.count >= bufferSize else { return nil }
        
        var bytes = [UInt8](repeating: 0, count: bufferSize)
        
        var output = bufferSize
        
        let decrypt = SecKeyDecrypt(key, .PKCS1,[UInt8](data), data.count, &bytes, &output)
       
        switch decrypt {
        case errSecSuccess:
            return Data(bytes: bytes,count: output)
        default:
            return nil
            
        }
    }
    
    
}



