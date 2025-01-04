class Mox < Formula
     desc "Mox Programming Language"
     homepage "https://github.com/Mai-hh/Mox"
     url "https://github.com/Mai-hh/Mox/releases/download/v0.0.1/Mox-v0.0.1.jar"
     version "0.0.1"
     sha256 "7182211b5d390b12e9ab43b9d2bcff12fa5ab8399405747674a995f98d5ebf69" # 注意需要实际的SHA256哈希，否则无法通过 Homebrew 审核
   
     # 声明依赖
     depends_on "openjdk@17"
   
     def install
       # 将 jar 安装到 libexec 目录，避免和其他文件混淆
       libexec.install "Mox-v0.0.1.jar"
   
       # 在 bin 下创建可执行脚本，脚本实际调用安装的 jar
       (bin/"mox").write <<~EOS
         #!/bin/bash
         exec "#{Formula["openjdk@17"].opt_bin}/java" -jar "#{libexec}/Mox-v0.0.1.jar" "$@"
       EOS
     end
   
     def caveats
       <<~EOS
         Mox 已经安装到:
           #{bin}
   
         如果需要额外的环境变量，请自行在配置文件中（如 ~/.bashrc、~/.zshrc）添加。
         常见的做法可能是：
           export MOX_HOME=#{opt_prefix}
           export PATH="$PATH:#{bin}"
   
         如果只需要执行 mox 命令，可能不需要其它额外配置。
       EOS
     end
   
     test do
       # 简单测试，检查是否可以正确输出版本号
       system "#{bin}/mox", "--version"
     end
   end