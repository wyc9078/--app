const _ = require("..")


/**
 * 进入商品的详情页面
 * phone: 用户名字(手机号)
 * nickname: 昵称
 * pwd: 密码
 * http://127.0.0.1:3000/api/json/user/addUser
 */
_.router.post('/addUser', _.Ver.Verification, async (req, res, next) => {
    let params = JSON.parse(req.unparams)
    let phone = params.phone,
        nickname = params.nickname,
        pwd = params.pwd,
        list = await _.mysql.query(_.config.dev.sql.user.add, [phone, _.utils.md5Text(pwd), nickname]);
    res.json({
        status: list.status,
        data: _.utils.public_encrypt(list.data)
    })
});

/**
 * 进入商品的详情页面
 * phone: 用户名字(手机号)
 * pwd: 密码
 * http://127.0.0.1:3000/api/json/user/login
 */
_.router.post('/login', _.Ver.Verification, async (req, res, next) => {
    let params = JSON.parse(req.unparams)
    let phone = params.phone,
        pwd = params.pwd,
        list = await _.mysql.query(_.config.dev.sql.user.login, [phone, _.utils.md5Text(pwd)]);
    res.json({
        status: list.status,
        data: _.utils.public_encrypt(list.data)
    })
});

/**
 * 进入商品的详情页面
 * phone: 用户名字(手机号)
 * pwd: 密码
 * http://127.0.0.1:3000/api/json/user/setAddress
 */
_.router.post('/setAddress', _.Ver.Verification, async (req, res, next) => {
    let params = JSON.parse(req.unparams)
    let truename = params.truename,
        address = params.address,
        uid = params.uid,
        list = await _.mysql.query(_.config.dev.sql.user.setAddress, [truename, address, uid]);
    res.json({
        status: list.status,
        data: _.utils.public_encrypt(list.data)
    })
});



module.exports = _.router;