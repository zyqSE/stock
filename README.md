## Stock Seer 股票价格在线预测工具  
一个利用 Ruby on Rails 搭建的超轻量级股票价格预测工具， 采用Tushare和（预测模型）进行股票数据的获取和预测
## Online Demo
访问[Stock Seer](http://47.92.125.215/)查看在线演示。  
![网站首页](https://github.com/9kalikali/Algorithm_Course/blob/master/Others/demo1.png)
![股价预测与评估页面](https://github.com/9kalikali/Algorithm_Course/blob/master/Others/demo2.png)
测试用账号：
>username: test0@stock.com  
>password: test0test0

使用步骤：
1. 注册并登录
2. 根据股票代码查询股票
3. 点击相应股票，查看价格预测与评估  
## Usage
1. **Fork 项目**
2. **TuShare安装**
   + 安装python
   + 安装pandas
   + 建议安装Anaconda（若没安装Anaconda， 请单独安装lxml）
   + 本体安装：方式1 `pip install tushare`; 方式2 访问[这里](https://pypi.python.org/pypi/Tushare/)下载安装
   + 版本查看
    ```
    import tushare

    print(tushare.__version__)
    ```
3. **（预测模型）的安装**
## Todo
1. 股价评估的雷达图显示效果较差，欲寻找一种更合适的可视化方案
2. 添加用户浏览历史以及收藏功能。
## Reference
