/*
 * @Author: 明华
 * @Date: 2021-02-05 11:26:57
 * @LastEditors: 明华
 * @LastEditTime: 2021-02-05 11:31:45
 * @Description: 
 * @FilePath: /frontend-training/paradigm/request/ajax.js
 */

// const $ = require('./jquery/jquery-3.5.1');
// import $ from './jquery/jquery-3.5.1';

// 查询验证码接口
const apiQuerySmsCode =
  "https://backend5.dongyouliang.com/api/core/sms_checkcode/";
// 需要查询的手机号，第二个会报错
const phone1 = "13691204807";
const phone2 = "13691204808";

function getToken() {
  return "Token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiIwN2FiYjgxYTQ3Y2U0ZTkxODczYmUzNDk3MmI4MjE5NyIsImFwcF9pZCI6ImFwcF8xNTIxMDEwNjIwIiwiZXhwIjoxNjEyNTE2ODkyLCJpYXQiOjE2MTI0MzA0OTIsImlzcyI6InNwYXJyb3dfY29yZSJ9.M5naHSz1SPT-1djQi0a7LGhJNam6dh_x1I1TZgNNVuo";
}

// 请求函数主函数
function request(obj) {
  $.ajax({
    headers: {
      authorization: getToken(),
    },
    // ...obj
    success: function (data) {
      console.log("请求成功");
      obj.success && obj.success(data);
    },
    error: (error) => {
      console.error("请求失败, 错误处理逻辑");

      // 判断是否存在 obj.error 函数
      // 存在error函数，则调用error函数处理错误，否则进行自动错误处理
      if (obj.error && typeof obj.error === "function") {
        obj.error({
          message: "我是错误对象",
          error,
        });
        return null;
      }

      console.error("我是通用错误处理");
    },
    complete: () => {
      console.warn("请求完成");
      obj.complete && obj.complete();
    },
  });
}

// 异步函数 request
async function requestAsync(phone) {
  return new Promise((resolve, reject) => {
    request({
      url: `${apiQuerySmsCode}?phone=${phone}`,
      success: (data) => {
        resolve(data);
      },
      error: (error) => {
        reject({
          statusCode: error.statusCode,
          message: "接口报错",
        });
      },
      complete: () => {
        console.warn("请求完成");
      },
    });
  });
}

function requestPhone(phone) {
  // $.ajax({
  //   headers: {
  //     authorization: getToken(),
  //   },
  request({
    url: `${apiQuerySmsCode}?phone=${phone}`,
    success: (data) => {
      console.log("请求成功");
      console.log(data);
    },
    error: (error) => {
      console.error("请求失败");
      console.log(error);
    },
    complete: () => {
      console.warn("请求完成");
    },
  });
}

function main() {
  requestPhone(phone1);
  requestPhone(phone2);

  console.log("我是request函数之后的输出");
}

main();
