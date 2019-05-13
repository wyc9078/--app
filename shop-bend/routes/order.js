const _ = require("..");

/**
 * 提交订单
 * brand: 商品的分类(品牌)
 * http://127.0.0.1:3000/api/json/order/addOrder
 */
_.router.post('/addOrder', _.Ver.Verification, async (req, res, next) => {
    let params = JSON.parse((JSON.parse(req.unparams)).order),
        totals = JSON.parse(req.unparams).orderTotal,
        money = JSON.parse(req.unparams).money;
    let order_number = _.utils.Timemap()
    // 插入到订单表
    for (var i = 0; i < params.length; i++) {
        await _.mysql.query(_.config.dev.sql.order.addOrder, [params[i].uid, params[i].sid, order_number, '1', params[i].total, params[i].size]);
    }

    // 删除购物车数据
    for (var i = 0; i < params.length; i++) {
        await _.mysql.query(_.config.dev.sql.order.deleteCarts, [params[i].uid, params[i].sid]);
    }

    await _.mysql.query(_.config.dev.sql.user.updateMoney, [money - totals, params[0].uid]);


    res.json({
        status: 200,
        data: _.utils.public_encrypt([
            {
                orderNumber: order_number
            }
        ])
    })

});



/**
 * 查看订单状态
 * userid: 用户id
 * status: 订单状态id
 * http://127.0.0.1:3000/api/json/order/checkOrder
 */
_.router.post('/checkOrder', _.Ver.Verification, async (req, res, next) => {
    let params = JSON.parse(req.unparams)
    let userid = params.userid,
        status = params.status,
        list = await _.mysql.query(_.config.dev.sql.order.selectOrder, [userid, status]);

    res.json({
        status: list.status,
        data: _.utils.public_encrypt(list.data)
    })
});

module.exports = _.router;