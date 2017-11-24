import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("/") { req in
            let text = """
            一、将本地vapor项目上传至GitHub
            1、安装vapor
            2、使用 "vapor new [项目名] " 创建应用
            3、进入项目根目录，执行 "vapor xcode -y" 使用Xcode来运行
            4、通过浏览器访问"http://0.0.0.0:8080/hello"，返回内容，说明运行成功
            5、在GitHub上新建一个空仓库，并把本地项目上传到GitHub
            在项目根目录，执行以下两行命令：
            git remote add origin git@github.com:YunsChou/HelloVapor.git
            git push -u origin master
            
            二、将GitHub项目关联到Heroku上
            1、注册Heroku账号，自备梯子
            2、在Heroku上创建一个新应用
            3、在Settings->Buildpacks下，添加"https://github.com/kylef/heroku-buildpack-swift"
            因为Heroku中并没有提供swift语言的选项，所以我们要自行添加URL（告诉它build的时候使用swift）
            4、在Deploy->Deployment method下，关联GitHub仓库和项目
            5、在Deploy->Manual deploy下，选择正确的分支，并点击"Deploy Branch"按钮，Heroku会开始部署项目
            如果是首次部署，可能需要多花一点时间安装配置，耐心等待部署完成......
            
            三、访问链接：https://xxxxxx.herokuapp.com（xxxxxx是Heroku中创建的应用名）
            1、部署完成后，点击项目右上角的"Open app"按钮（或手动输入域名），访问链接
            2、此时会提示"Application error"，别慌！离最终成功已经很近了，请继续以下操作
            3、进入项目根目录，执行 "touch Procfile" 创建名为Procfile的文件，并用编辑打开添加"web: Run --env=production --port=$PORT"，然后push到GitHub
            4、将Procfile文件提交到Github后，刷新Heroku控制面板，在Dyno处可以看到多了Procfile中的内容
            5、重新进入Deploy->Manual deploy，点击"Deploy Branch"按钮重新部署
            6、再次访问链接，成功
            """
            return text
        }
        
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
