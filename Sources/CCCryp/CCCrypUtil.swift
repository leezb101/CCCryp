
/**
 * ------------------------------------------------------------------
 * Copyright © 2020 HeNan DtCloud Network Technology Co.,Lt d.
 * ------------------------------------------------------------------
 * 类 名: CCCrypUtil.swift
 * 功 能:
 * 创建者: 愚公
 * 创建时间: 2020/8/26
 * 备 注:
 * ------------------------------------------------------------------
 * 修改历史
 * ------------------------------------------------------------------
 * 时间                      姓名                  备注
 * ------------------------------------------------------------------
 * 
 * ------------------------------------------------------------------
 */
import Foundation
import CryptoSwift

class CCCrypUtil: NSObject {
    //AES ECB encode
    public static func Endcode_AES_ECB(strToEncode:String,key:String) -> String {
        // 从String 转成data
        let data = strToEncode.data(using: String.Encoding.utf8)
        // byte 数组
        var encrypted: [UInt8] = []
        do {
          encrypted = try AES(key: key.bytes, blockMode: ECB(), padding: .zeroPadding).encrypt(data!.bytes)
        } catch {
            print(error.localizedDescription)
        }
        let encoded =  Data(encrypted)
        //加密结果要用Base64转码
        return encoded.base64EncodedString()
    }
    
    //AES ECB decode
    public static func Decode_AES_ECB(strToDecode:String,key:String)->String {
        var decodeStr = ""
        let data = NSData(base64Encoded: strToDecode, options: NSData.Base64DecodingOptions.init(rawValue: 0))
        var encrypted: [UInt8] = []
        let count = data?.length
        for i in 0..<count! {
            var temp:UInt8 = 0
            data?.getBytes(&temp, range: NSRange(location: i,length:1 ))
            encrypted.append(temp)
        }
        do {
            let aes = try AES(key: key.bytes,blockMode: ECB())
            let decode = try aes.decrypt(encrypted)
            let encoded = Data(decode)
            decodeStr = String(bytes: encoded.bytes, encoding: .utf8)!
        } catch {
            print(error.localizedDescription)
        }
        return decodeStr
    }
}
