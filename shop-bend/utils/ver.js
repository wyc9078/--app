const utils = require("./index")
const cache = require("../cache")
const config = require("../config")
module.exports = {
    /**
     * 路由拦截器，拦截路由验证是否有token参数，redis中是否已经有数据缓存
     */
    async Verification(req, res, next) {
        // 验证请求头是否包含token
        if (req.headers.hasOwnProperty("token")) {
            // 验证redis是否有缓存，没有则去获取mysq然后缓存，有直接读取缓存
            if (await cache.Get(req.url) == null) {
                req.unparams = utils.decrypted(req.headers.token)
                next()
            } else {
                res.json({
                    status: config.dev.api.success,
                    cache: true,
                    data: await cache.Get(req.url)
                })
            }
        } else {
            res.json({
                status: config.dev.api.CodeError,
                data: "缺少必填参数，请求头token"
            })
        }
    }
}