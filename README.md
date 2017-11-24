<p align="center">
    <img src="https://cloud.githubusercontent.com/assets/1342803/24797159/52fb0d88-1b90-11e7-85a5-359fff0496a4.png" width="320" alt="MySQL">
    <br>
    <br>
    <a href="http://beta.docs.vapor.codes/getting-started/hello-world/">
        <img src="http://img.shields.io/badge/read_the-docs-92A8D1.svg" alt="Documentation">
    </a>
    <a href="http://vapor.team">
        <img src="http://vapor.team/badge.svg" alt="Slack Team">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/mysql">
        <img src="https://circleci.com/gh/vapor/mysql.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://travis-ci.org/vapor/api-template">
    	<img src="https://travis-ci.org/vapor/api-template.svg?branch=master" alt="Build Status">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-3.1-brightgreen.svg" alt="Swift 3.1">
    </a>
</center>

---
## 将Vapor项目部署到Heroku
### 操作说明：
#### 1、本操作仅为熟悉流程，一切从简，通熟易懂
#### 2、本操作流程不需要本地安装Heroku和数据库，方便快捷

### 一、将本地vapor项目上传至GitHub
#### 1、安装vapor
#### 2、使用 `vapor new [项目名] ` 创建应用
#### 3、进入项目根目录，执行 `vapor xcode -y` 使用Xcode来运行
#### 4、通过浏览器访问`http://0.0.0.0:8080/hello`，返回内容说明运行成功
#### 5、在GitHub上新建一个空仓库，并把本地项目上传到GitHub
##### 在项目根目录，执行以下两行命令：

```
git remote add origin git@github.com:xxx/xxx.git
git push -u origin master

```

### 二、将GitHub项目关联到Heroku上
#### 1、注册Heroku账号，自备梯子
#### 2、在Heroku上创建一个新应用
#### 3、在`Settings->Buildpacks`下，添加`https://github.com/kylef/heroku-buildpack-swift`
> 因为Heroku中并没有提供swift语言的选项，所以我们要自行添加URL（告诉它build的时候使用swift）

#### 4、在`Deploy->Deployment method`下，关联GitHub仓库和项目
#### 5、在`Deploy->Manual deploy`下，选择正确的分支，并点击`Deploy Branch`按钮，Heroku会开始部署项目
> 如果是首次部署，可能需要多花一点时间安装配置，耐心等待部署完成......

### 三、访问链接：
#### 1、部署完成后，点击项目右上角的`Open app`按钮或手动输入域名，访问链接https://xxxxxx.herokuapp.com（xxxxxx是Heroku中创建的应用名）
#### 2、此时会提示`Application error`，别慌！离最终成功已经很近了，请继续以下操作
#### 3、进入项目根目录，执行 `touch Procfile` 创建名为Procfile的文件，并用编辑打开添加`web: Run --env=production --port=$PORT`，然后push到GitHub
#### 4、将Procfile文件提交到Github后，刷新Heroku控制面板，在Dyno处可以看到多了Procfile中的内容
#### 5、重新进入`Deploy->Manual deploy`，点击`Deploy Branch`按钮重新部署
#### 6、再次访问链接，成功

### 四、注意
#### 1、Procfile文件可以在新建项目后一并创建，提交至Github，此处只为演示
#### 2、在Heroku中可以选择自动部署，当选中的分支（执行自动部署的分支）每次有代码push上来的时候，都会执行自动部署。如果你是测试或练习项目，没有什么影响，如果是正式项目，请慎重选择并做好分支控制