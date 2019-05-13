const fs = require("fs");
const path = require("path");
const config = require("../config");
const NodeRSA = require('node-rsa');
const md5 = require('md5');

class Utils {
    constructor() {
        // 私钥
        this.rsa_private_key = this.ReadFile(this.GetRsaPath(config.dev.rsa.privateKey))
        // 公钥
        this.rsa_public_key = this.ReadFile(this.GetRsaPath(config.dev.rsa.publicKey))
    }

    /**
     * 前端 ：使用RSA的私钥进行加密  rsa_private_key
     */
    encrypt(text) {
        return (new NodeRSA(this.rsa_private_key)).encryptPrivate(text, 'base64')
    }

    /**
     * 前端 ： 使用私钥解密json数据给前端
     */
    Private_decrypted(text) {
        return (new NodeRSA(this.rsa_private_key)).decrypt(text, 'utf8')
    }

    /**
     * 后端  ： 使用RSA的公钥进行解密 rsa_public_key
     */
    decrypted(text) {
        return (new NodeRSA(this.rsa_public_key)).decryptPublic(text, 'utf8')
    }

    /**
     * 后端 ：使用公钥加密json数据给前端
     */
    public_encrypt(text) {
        return (new NodeRSA(this.rsa_public_key)).encrypt(text, 'base64')
    }

    /**
     * 同步读取文件
     * @param {*string} path 图片的地址 
     */
    ReadFile(path) {
        return fs.readFileSync(path).toString("utf-8")
    }
    /**
     * 获取RSA文件地址
     * @param {*string} url 获取公私钥文件地址 
     */
    GetRsaPath(url) {
        return path.join(__dirname, url)
    }
    /**
     * md5加密 
     * @param {*string} text 需要被加密的字符串 
     */
    md5Text(text) {
        return md5(text)
    }

    Timemap() {
        return Date.parse(new Date())
    }


}


module.exports = new Utils()