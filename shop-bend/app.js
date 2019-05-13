var createError = require('http-errors');
var express = require('express');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var config = require('./config');

// 导入路由
var CartRouter = require('./routes/cart');
var OrderRouter = require('./routes/order');
var ShopRouter = require('./routes/shop');
var UserRouter = require('./routes/user');

var app = express();
// 跨域请求头设置
app.all("*", function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Content-Type,token,Content-Length, Authorization, Accept,X-Requested-With"
  );
  res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
  res.header("X-Powered-By", "bmy");
  if (req.method == "OPTIONS") res.sendStatus(200);
  else next();
});

// 中间件设置
app.use(logger('dev'));
// 设置 HTTP请求的大小限制 为100mb
app.use(express.json({
  limit: config.dev.httpSize
}));
app.use(express.urlencoded({ limit: config.dev.httpSize, extended: false }));
app.use(cookieParser());

// 配置挂载路由
app.use('/api/json/shop/', ShopRouter);
app.use('/api/json/user/', UserRouter);
app.use('/api/json/cart/', CartRouter)
app.use('/api/json/order/', OrderRouter)

// 捕捉404错误
app.use(function (req, res, next) {
  next(createError(404));
});

// 错误处理
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);

});

module.exports = app;
