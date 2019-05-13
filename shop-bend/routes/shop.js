const _ = require("..")

/**
 * 进入商品的详情页面
 * id: 商品的id
 * http://127.0.0.1:3000/api/json/shop/info
 */
_.router.get('/info', _.Ver.Verification, async (req, res, next) => {
    let id = (JSON.parse(req.unparams)).id,
        list = await _.mysql.query(_.config.dev.sql.shop.info, [id]);
    res.json({
        status: list.status,
        data: _.utils.public_encrypt(list.data)
    })
});


/**
 * 首页接口，实现分页
 * page: 前端提供, 如果用户第一次访问app，让前端加密一个空的对象
 * http://127.0.0.1:3000/api/json/shop/index
 */
_.router.get('/index', _.Ver.Verification, async (req, res, next) => {
    let params = JSON.parse(req.unparams),
        pages = 0,
        totalPage = 15;

    params.hasOwnProperty("page") ? pages = params.page : pages = 0;
    let startPage = pages * totalPage

    list = await _.mysql.query(_.config.dev.sql.shop.index, [startPage, totalPage]);

    _.redis.Set(req.url, _.utils.public_encrypt(list.data))
    res.json({
        status: list.status,
        data: _.utils.public_encrypt(list.data)
    })
});


/**
 * 进入商品的详情页面
 * brand: 商品的分类(品牌)
 * http://127.0.0.1:3000/api/json/shop/class
 */
_.router.get('/class', _.Ver.Verification, async (req, res, next) => {
    let brand = (JSON.parse(req.unparams)).brand,
        list = await _.mysql.query(_.config.dev.sql.shop.brand, [brand]);
    res.json({
        status: list.status,
        data: _.utils.public_encrypt(list.data)
    })
});


module.exports = _.router;