# HTTP是什么？

HTTP（HyperText Transfer Protocal超文本传输协议）是一种规范

是因特网的多媒体信使，每天数以万计的JPEG，HTML页面，文本文件，音频在因特网上传输，HTTP可以从遍布全世界的Web服务器上将这些信息块迅速、便捷，可靠地搬移到人们桌面上的Web浏览器上

Web使用HTTP协议作为规范，完成从客户端到服务器端等一系列运作流程，Web是建立在HTTP协议上通信的


# HTTP报文

Q：什么是HTTP报文？

A：用于HTTP协议交互的信息被称为HTTP报文：

请求端（客户端）的HTTP报文叫做请求报文，

响应端（服务器端）的HTTP报文叫响应报文

HTTP报文是简单的格式化数据，是由多行（CR+LF换行符）数据构成的字符串文本，HTTP报文可大致分为**报文首部**和**报文主体**两块，两者由首行空行（CR+LF）来划分，并不一定要有报文主体。


![图片](https://uploader.shimo.im/f/OZJcYRPk5lMHrtLj.jpeg!thumbnail?fileGuid=3KcTp8QY3p8XDgv6)![图片](https://uploader.shimo.im/f/GDiWSJV3e57RL4p2.jpeg!thumbnail?fileGuid=3KcTp8QY3p8XDgv6)




![图片](https://uploader.shimo.im/f/a29nyZVcdyl5oFS5.png!thumbnail?fileGuid=3KcTp8QY3p8XDgv6)

# 请求方法：

## GET：

请求服务器发送某个资源。

## HEAD:

GET方法类似，但服务器在响应中只返回首部。不会返回实体的主体部分，这就允许客户端在未获取实际资源的情况下，对资源的首部进行检查。

如：不获取资源的情况下了解资源的情况；查看响应的状态码，看看某个对象是否存在；通过查看首部，测试资源是否被修改

## PUT:

向服务器写入文档

## POST:

通常用来支持HTML表单，表单中的数据发送到服务器，然后由服务器处理后发送到它要去的地方

## TRACE:

客户端发起请求，请求可能要穿过防火墙，代理，网关或者其他一些应用程序，中间每个节点都可能会修改原始HTTP请求，所以TRACE方法允许客户端在最终将请求发送给服务器，看看它变成了什么样子

## OPTIONS:

请求Web服务器告知其支持的各种功能，可询问服务器通常支持哪些方法，或者对某些特殊资源支持哪些方法。

## DELETE:

请服务器删除请求URL所指定的资源（无法保证删除操作一定会被执行）

# HTTP报文首部

HTTP协议的请求报文和响应报文中必定包含HTTP首部。首部内容为客户端和服务器分别处理请求和响应提供所需要的信息。

HTTP首部字段是构成HTTP报文的要素之一，在客户端与服务器之间以HTTP协议进行通信的过程中，无论是请求还是响应都会使用首部字段，它能起到传递额外重要信息的作用。

## 首部的规则

HTTP首部字段由首部字段名和字段值构成，中间用冒号分割

首部字段名：字段值

如Content-Type：text/html

一个HTTP首部字段可以由多个值

Keep-Alive：timeout=15, max=100

多个值之间可以用权重值q来表示相对优先级

Accept-Language: zh-cn,zh;q=0.7,en-us,en;q=0.3（有中文资源优先返回中文资源）

## 首部分类

### 1.通用首部

客户端、服务器和其他应用程序之间提供一些非常有用的通用功能

#### Cache-Control

可缓存性：

Cache-Control：no-cache

防止从缓存中返回过期的资源，在发布缓存副本之前，强制要求缓存把请求提交给原始服务器进行验证（协商缓存验证）

Cache-Control：no-store

暗示请求（和对应的响应）或响应中包含机密信息，因此不能进行缓存

Cache-Control：pubulic

Cache-Control：private

Cache-Control：max-age=604800（单位：秒）

设置缓存存储最大周期，超过这个时间缓存被认为过期，缓存服务器需要将请求转发给源服务器

#### Connection:

控制不再转发给代理的首部字段

如一个自定义头部字段，给代理分发用的，如果不想让传给服务器，可以直接赋值给connection

![图片](https://uploader.shimo.im/f/DBkxwG6M94C7pjqm.png!thumbnail?fileGuid=3KcTp8QY3p8XDgv6)

connection: close/Keep-Alive

connection: Keep-Alive

Keep-Alive: timeout=10, max=500

持久连接

#### Date

创建HTTP报文的时间

Date: Wed, 10 Mar 2021 05:50:09 GMT


### 2.请求首部

请求首部是请求报文特有的，为服务器提供了一些额外信息，比如客户端希望接收什么类型的数据

#### Accept:

告知客户端可以处理的类型和相对优先级

![图片](https://uploader.shimo.im/f/jrcVBAabDliZiScq.png!thumbnail?fileGuid=3KcTp8QY3p8XDgv6)

#### Accept-Encodeing

告知服务器用户代理支持的内容编码

Accept-Encodeing： gzip， deflate，compress

#### Accept-Language

告知服务器用户代理能够处理的自然语言集

Accept-Language: zh-cn,zh;q=0.7,en-us,en;q=0.3

#### Authorization

告知服务器，用户代理的认证信息，证书值在接收到返回的401状态码后，把首部字段Authorization加入请求中

#### If-xxx

这种样式的请求首部字段，都可称为条件请求。服务器接收到附加条件的请求后，只有判断指定条件为真时，才会执行请求

#### If-Match

告知服务器匹配资源所用的实体标记，并且当这个标记和请求的资源Etag值匹配一致的时候服务器才会接受请求

（强比较算法，每个字节都相同才算匹配；弱比较算法，在Etag值前加 W/）

If-Match: W/"67ab43", "54ed21", "7892dd"

#### If-Modified-Since

只能用在GET，HEAD请求中，服务器只在所请求的资源在给定日期时间之后对内容进行过修改的情况下才处理请求（才会将资源返回，状态码为200）；若在指定日期之后请求的资源都没有过更新，则返回状态码304Not Modified的响应，可通过响应资源的首部字段Last-Modified来确定

If-None-Match: 和If-Match相反（与If-Modified-Since有类似）

If-Unmodified-Since: 和If-modified-Since相反

#### Referer：

告知服务器发起请求的原始资源的URI

#### Range：

请求首部，告知服务器返回文件哪一部分。在一个  Range 首部中，可以一次性请求多个部分，服务器会以 multipart 文件的形式将其返回。如果服务器返回的是范围响应，需要使用 206 Partial Content 状态码。

#### User-Agent：

将创建请求的浏览器和用户代理名称的信息传达给服务器。如果请求经过代理，那么中间也很可能被添加上代理服务器的名称

User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.03.2101150 MicroMessenger/7.0.4 Language/zh_CN webview/

### 3.响应首部

响应报文有自己的首部集，以便为客户端提供信息（比如，客户端在与那种类型的服务器进行交互）

#### Accept-Ranges

（小程序看视频）

Accept-Ranges：bytes

标识自身支持范围请求，字段的具体值用与定义范围请求的单位。当浏览器发现Accept-Ranges头时，可以尝试中断了的下载，而不是重新开始

#### Age（单位：秒）

响应的是源服务器：源服务器多久之前创建了响应

响应的是缓存服务器：缓存后的响应再次发起认证到认证完成的时间值

缓存必须在发送的每条响应中都包含一个Age值

#### Etag

能告知客户端实体标识。是一种可将资源以字符串形式作为唯一标示的方式，由服务器分配。

当资源更新时Etag会发生改变

强Etag值：无论实体发生多么细微的变化都会改变其值

弱Etag值：只有资源发生了根本变化，才会改变Etag值，会在字段值最开始出附加W/ 如 Etag：W/"usagi-1234"

#### Location

可以将响应接收方引导至某个与请求URI位置不同的资源

该字段配合3xx: Redirection的响应，提供重定向的URI

#### Retry-After

告知客户端应该在多久之后再次发送请求。

主要配合状态码503 Service Unavailable响应，值可以是具体秒数，也可以是具体的日期时间

#### Server

告知客户端当前服务上安装的HTTP服务器应用程序的信息。

### 4.实体首部

实体首部指的是应对实体主体部分的首部。比如，可以用实体首部来说明实体主体部分的数据类型。

#### Allow：

枚举资源所支持的HTTP方法集合，若服务器返回状态码405 Method Not Allowed，则该首部字段需要同时返回给客户端

[https://backend5.hanguangbaihuo.com/api/sparrow_log/front/bulk_create/](https://backend5.hanguangbaihuo.com/api/sparrow_log/front/bulk_create/)

#### Content-Encoding:

告知客户端服务器对实体的主体部分选用的内容编码方式。（压缩）

对应请求首部Accept-Encoding: gzip,compress,deflate,identity

#### Content-Language:

告知客户端，实体主体使用的自然语言（中英文）

#### Content-Length:

实体主体大小

#### Content-Range:

一个数据片段在整个文件中的位置

![图片](https://uploader.shimo.im/f/1O0CkSivT7xOrbbH.png!thumbnail?fileGuid=3KcTp8QY3p8XDgv6)

![图片](https://uploader.shimo.im/f/8EQpMS9Rajxbyh3P.png!thumbnail?fileGuid=3KcTp8QY3p8XDgv6)

#### Content-Type

说明实体主体内对象的媒体类型

Content-Type: text/html; charset=UTF-8

#### Expires:

将资源失效的日期告知客户端。缓存服务器在接收到含有首部字段的Expires之后，会以缓存来应答请求，在指定失效日期之前，不再去询问服务器它是否失效了。

当首部字段Cache-Control有指定的max-age指令时，比其首部字段Expires，会优先处理max-age指令（不知道是不是因为首部字段有优先级处理之分，所以有时候同一功能使用了多个首部字段表示，方便层层封装和特异性处理，类似css）

#### Last-Modified

资源最终被修改时间

### 5.扩展首部

扩展首部是非标准的首部，由应用程序开发者创建，但还未添加到已批准的HTTP规范中去。

为cookie服务的首部字段和其他首部字段


# 状态码

## 1xx：信息性状态码

100 continue：客户端避免向服务器发送一个服务器无法处理或使用的大实体时，先发送一个携带100 continue的Expect请求首部，等待服务器返回。

## 2xx：成功状态码

200: 正常处理

204: 返回的报文不含实体的主体部分

## 3xx：重定向状态码

301:  请求资源已被重新分配URI，永久重定向

302: 请求资源已被重新分配URI，本次（临时性）重定向

304: （虽然被划分为重定向中，但是和重定向没啥关系）

客户端可以通过所包含的请求首部（If-Match，If-Modified-Since，If-None-Match，If-Range，If-Unmodified-Since），使其请求变为有条件的，但因未满足条件（资源未被修改），所以返回304，这个状态码的响应不应该包含实体的主体部分，实体从缓存拿

## 4xx：客户端错误状态码

401: 未认证

403: 被拒绝，无权限

404: 服务器上没有请求的资源

## 5xx：服务器错误状态码

500: 服务器执行请求时发生了错误

503: 现在无法提供服务，以后可以。服务器暂时处于超负载，或正在进行停机维护，无法处理请求



# HTTP缓存

## 缓存优点

1.缓存减少了冗余的数据传输，节省了网络费用

客户端访问一个流行的原始服务器页面，服务器会多次传输同一份文档，每次传送给一个客户端

2.缓存缓解了网络瓶颈的问题。不需要更多的带宽就能够更快的加载页面

很多网络为本地客户端配置的带宽要比远程服务器配置的带宽要宽，如果在这种状况下客户端去请求远程服务器，那么客户端将会以一种的较低的速度去请求服务端，从而没有发挥出客户端带宽宽的长处

3.缓存降低了对原始服务器的要求。服务器可以更快的响应，避免过载的出现

缓存在破坏瞬间拥塞的时候尤为重要，比如某个突发事件（爆炸性新闻）使很多人几乎同时去访问一个Web文档，就会出现会出现瞬间拥堵

4.缓存降低了距离时延。因为从较远的地方加载页面会更慢些

每台网络路由器都会增加因特网浏览的时延，即使客户端和服务器之间没有太多的路由器，距离太长也会造成显著的时延

## 
## 缓存的命中和未命中

一次http事务请求如果是从得到的响应是从缓存得到的原始响应副本，那么这样的过程就称之为**缓存命中**。反之，如果缓存没有响应的副本，而要去请求原始服务，那么就把这个过程称之为**缓存未命中**

![图片](https://uploader.shimo.im/f/4zjLkXwUVpgTWJnK.jpeg!thumbnail?fileGuid=3KcTp8QY3p8XDgv6)


## 缓存再验证

原始服务器内容有可能会变化，缓存要不时对其进行检测，看看它们保存的副本是否仍是服务器上最新的副本，这些“新鲜度测试”被称为HTTP再验证

大部分缓存只有在客户端发起请求并且副本旧得需要检测的时候，才会对副本进行再验证


![图片](https://uploader.shimo.im/f/9lY63tjUb2TvKPJD.jpeg!thumbnail?fileGuid=3KcTp8QY3p8XDgv6)


再验证有三种情况：

1.再验证命中

服务器对象未被修改，服务器会向客户端发一个HTTP 304 Not Modified响应

2.再验证未命中

服务器对象与已缓存的副本不同，服务器向客户端发一个普通的，带有完整内容的HTTP 200 OK 响应

3.对象被删

服务器对象已经被删除，服务器就回送一个404Not Found 响应，缓存也会将其副本删除


## 获取资源花费时间对比

缓存命中 < 再验证命中 < 缓存未命中

缓存再验证命中因为要与原始服务器进行核对，所以比缓存命中慢，但是没有从服务器获取对象数据，所以比缓存未命中快

HTTP为我们提供了几个用来对已缓存的对象进行再验证的工具，最常见的是If-Modified-since首部。HTTP/1.0+ Expires首部  或者  HTTP/1.1 的Cache-Control：max-age响应首部来指定过期日期

## 缓存的处理步骤

简单概括，即：

接收———解析———查询———新鲜度检测———创建响应———发送———记入日志

第一步接收：读取网络连接http请求报文

第二部解析：把报文解析为片段，并把首部放入到缓存易操作的数据结构中，方便处理和修改

第三步查询：查找存下来缓存副本

第四步新鲜度检测：说白了检查缓存副本是不是还有效的

第五步创建响应：缓存服务器用原始服务器的缓存副本实现响应的起点，同时再在此基础上做一些修改，比如协议转换等

第六步发送：发送报文

第七步日志：事务完成之后，在日志文件插入一个条目，用以记录缓存处理情况，以及记录一些与缓存命中率的数据

## 保持副本新鲜

![图片](https://uploader.shimo.im/f/rpitsHgea4uA2Qmo.jpeg!thumbnail?fileGuid=3KcTp8QY3p8XDgv6)

缓存GET请求的流程图

HTTP有一些简单的机制可以不要去服务器记住有哪些缓存拥有其文档副本的情况下，保存已缓存的数据与服务器数据之间充分一致。

这些简单的机制称为**文档过期**和**服务器再验证**

### 文档过期

特殊的HTTP首部Cache-Control和Expires,HTTP让原始服务器为每个文档设置一个“过期时间”，在文档过期之前，缓存可以以任意频率使用这些副本，而无需与服务器联系（除非客户端请求中包含由阻止提供已缓存或未验证资源的首部）

Cache-Control: Max-Age=484200（相对时间）

Expires: Fri, 28 Oct 2016 03:03:47 GMT（绝对时间）

### 服务器再验证

用条件方法进行再验证，过期的文档并不是就是原始服务器的原始文档不一样了，而是需要向服务器发起新鲜度验证请求


![图片](https://uploader.shimo.im/f/MLuXJX7tWjVyaNM4.jpeg!thumbnail?fileGuid=3KcTp8QY3p8XDgv6)


## 控制缓存的能力

缓存控制能力描述的是服务器可以通过设置相关首部来控制文档的缓存过期时间的能力，相关首部如下：

Cache-Control: no-store //不能缓存



Cache-Control: no-cache //在没有对服务器验证之前不能提供内容



Cache-Control: must-revalidate //严格遵守新鲜验证规则



Cache-Control: max-age //设置多长时间的过期时间（相对时间）



Expires: <date> //设置多长的过期时间（绝对时间）

（以上优先级从上到下以此降低）



# 各个协议与HTTP协议之间的关系

客户端发起一个请求——DNS解析找到目标服务器对应IP地址

HTTP职责：生成对应Web服务器的HTTP请求报文（比如请求某个资源）

｜

TCP职责：为了方便通信，将HTTP请求报文按序号分割成报文段，并把每个报文段可靠地传给对方

｜

IP协议职责：搜索对方地址，一边中转一遍传送

｜

TCP职责：从对方接收到的报文段后，按序号重组报文

｜

HTTP协议的职责：对Web服务器请求的内容的处理（请求某个资源）


# HTTPS

## HTTPS是什么

HTTPS 经由 HTTP 进行通信，但利用 SSL/TLS 来加密数据包。HTTPS 开发的主要目的，是提供对网站服务器的身份认证，保护交换数据的隐私与完整性。

## 
## HTTPS与HTTP的区别

1. HTTP 明文传输，数据都是未加密的，安全性较差，HTTPS（SSL+HTTP） 数据传输过程是加密的，安全性较好。

2. 使用 HTTPS 协议需要到 CA（Certificate Authority，数字证书认证机构） 申请证书，一般免费证书较少，因而需要一定费用。证书颁发机构如：Symantec、Comodo、GoDaddy 和 GlobalSign 等。

3. HTTP 页面响应速度比 HTTPS 快，主要是因为 HTTP 使用 TCP 三次握手建立连接，客户端和服务器需要交换 3 个包，而 HTTPS除了 TCP 的三个包，还要加上 ssl 握手需要的 9 个包，所以一共是 12 个包。

4. http 和 https 使用的是完全不同的连接方式，用的端口也不一样，前者是 80，后者是 443。

5. HTTPS 其实就是建构在 SSL/TLS 之上的 HTTP 协议，所以，要比较 HTTPS 比 HTTP 要更耗费服务器资源。



