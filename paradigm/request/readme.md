<!--
 * @Author: 明华
 * @Date: 2021-02-05 06:03:17
 * @LastEditors: 明华
 * @LastEditTime: 2021-02-05 10:50:41
 * @Description: 
 * @FilePath: /frontend-training/paradigm/request/readme.md
-->

# request 请求范式
咱们很多分歧都是对下边两个规范没有说清楚

- 模块划分
    * 界定好模块边界
- 模块封装
    * 把核心逻辑封装在一个地方，其他方式都是对核心逻辑的调用。
## 对自己封装的 request 方法需要达到的三个要求

1. 调用成功处理
2. 调用错误处理
3. 调用完成处理

## 边界界定
1. 是否需要进行错误处理

## 对各种 request 进行测试
1. jQuery.ajax
2. fetch
3. dio

