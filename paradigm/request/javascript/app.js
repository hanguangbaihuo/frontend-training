/*
 * @Author: 明华
 * @Date: 2021-02-05 11:41:22
 * @LastEditors: 明华
 * @LastEditTime: 2021-02-05 11:54:11
 * @Description: 
 * @FilePath: /frontend-training/paradigm/request/javascript/app.js
 */
const fs = require('fs');
const path = require('path');
const zlib = require('zlib');

const Koa = require('koa');
const staticMiddleware = require('koa-static');
const logger = require('koa-logger');
const compress = require('koa-compress');
const mount = require('koa-mount');
const cors = require('koa2-cors');

const config = {
  port: 3000,
};

// 初始化koa
const app = new Koa();
// 跨域
app.use(cors());
// 日志
app.use(logger());
// // 压缩
// app.use(
//   compress({
//     threshold: 10240,
//     flush: zlib.Z_SYNC_FLUSH,
//   }),
// );
// // 静态路由
app.use(
  mount(
    '/jquery',
    staticMiddleware(path.join(__dirname, './jquery'), {
      maxage: 7 * 24 * 60 * 60 * 1000,
    }),
  ),
);

// app.use(async (ctx, next) => {
//   if (ctx.path === '/wx_app/lc4VGpLr0m.txt') {
//     ctx.body = '57d66f79545928c210089620504714cc';
//     return;
//   } else if (
//     ctx.path === '/apple-app-site-association' ||
//     ctx.path === '/.well-known/apple-app-site-association'
//   ) {
//     ctx.body = `{
//       "applinks": {
//           "apps": [],
//           "details": [
//               {
//                   "appID": "BJ5KVKZ654.com.hanguangbaihuo.app.ishop",
//                   "paths": [ "*" ]
//               }
//           ]
//       }
//   }`;
//     return;
//   }

//   await next();
// });
// 其他所有请求返回HTML
// const indexHtml = fs.readFileSync(path.join(__dirname, './ajax.html'), 'utf8');
app.use(async ctx => {
  ctx.set('Cache-Control', 'no-store');
  ctx.type = 'html';
  ctx.body = fs.readFileSync(path.join(__dirname, './ajax.html'), 'utf8');
});

// 开启服务
app.listen(config.port, () => {
  console.log(`server run at port: http://127.0.0.1:${config.port}`);
});
