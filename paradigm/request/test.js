/*
 * @Author: 明华
 * @Date: 2021-02-05 15:06:17
 * @LastEditors: 明华
 * @LastEditTime: 2021-02-05 15:53:30
 * @Description: 
 * @FilePath: /frontend-training/paradigm/request/test.js
 */

const res = await request(url);
if(!res.error) {
  // 成功操作
  const res2 = await request(url);
} else {
  // 错误处理
}
// complete 处理

try {
  const res = await request(url);
  const res2 = await request(url);
  // 成功处理
} catch {
  // 错误处理
} finally {
  // complete 处理
}

request({
  url,
  success,
  error,
});
