const _ = require("..");

/**
 * 用户收藏商品
 * userid: 用户id
 * shopid: 商品id
 * http://127.0.0.1:3000/api/json/cart/addCart
 */
_.router.post('/addCart', _.Ver.Verification, async (req, res, next) => {
    let params = JSON.parse(req.unparams)
    let userid = params.userid,
        shopid = params.shopid,
        list = await _.mysql.query(_.config.dev.sql.cart.add, [shopid, userid]);
    res.json({
        status: list.status,
        data: _.utils.public_encrypt(list.data)
    })
});

/**
 * 检查商品是否被收藏过
 * userid: 用户id
 * shopid: 商品id
 * http://127.0.0.1:3000/api/json/cart/checkCart
 */
_.router.post('/checkCart', _.Ver.Verification, async (req, res, next) => {
    let params = JSON.parse(req.unparams)
    let userid = params.userid,
        shopid = params.shopid,
        list = await _.mysql.query(_.config.dev.sql.cart.checkCart, [shopid, userid]);
    res.json({
        status: list.status,
        data: _.utils.public_encrypt(list.data)
    })
});

/**
 * 查找用户的购物车数据
 * userid: 用户id
 * http://127.0.0.1:3000/api/json/cart/selectCart
 */
_.router.post('/selectCart', _.Ver.Verification, async (req, res, next) => {
    let params = JSON.parse(req.unparams)
    let userid = params.userid,
        list = await _.mysql.query(_.config.dev.sql.cart.selectCart, [userid]);
    res.json({
        status: list.status,
        data: _.utils.public_encrypt(list.data)
    })
});


/**
 * 删除用户购物车的商品
 * cid: 购物车表的id，前端的cid字段
 * http://127.0.0.1:3000/api/json/cart/deleteCart
 */
_.router.post('/deleteCart', _.Ver.Verification, async (req, res, next) => {
    let params = JSON.parse(req.unparams)
    let cid = params.cid,
        list = await _.mysql.query(_.config.dev.sql.cart.deleteCart, [cid]);
    res.json({
        status: list.status,
        data: _.utils.public_encrypt(list.data)
    })
});

module.exports = _.router;