import config from '../config'
import NodeRSA from 'node-rsa'
class Lib {
  constructor() {
    this.rsa_private_key = config.rsa_private_key
  }

  /**
   * 前端: 使用RSA的私钥进行加密  rsa_private_key
   * @param {*string} text 需要加密的字符串
   */
  encrypt(text) {
    return (new NodeRSA(this.rsa_private_key)).encryptPrivate(text, 'base64')
  }

  /**
   * 前端: 使用私钥解密json数据给前端
   * @param {*string} text 需要解密的字符串
   */
  privateDecrypted(text) {
    return (new NodeRSA(this.rsa_private_key)).decrypt(text, 'utf8')
  }

  /**
   * 获取用户信息
   */
  getUserInfo() {
    return this.GetLocalstorage("u")
  }
  /**
   * 获取本地数据
   * @param {*string} name 名称
   */
  GetLocalstorage(name) {
    return localStorage.getItem(name) != null ? JSON.parse(localStorage.getItem(name)) : false
  }
  /**
   * 写入本地数据
   * @param {*string} name 名称
   */
  SetLocalstorage(name, key) {
    localStorage.setItem(name, JSON.stringify(key))
  }
}

export default new Lib()
