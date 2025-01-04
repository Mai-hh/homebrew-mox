class Mox < Formula
     desc "Mox Programming Language"
     homepage "https://github.com/Mai-hh/Mox"
     url "https://github.com/Mai-hh/Mox/releases/download/v0.0.1/Mox-v0.0.1.jar"

     def install
          bin.install "mox"
     end

     def caveats
          <<~EOS
            Mox 已经安装到:
              #{bin}
      
            如需额外环境变量，请自行在配置文件中添加，
            例如将下列语句加入你的 ~/.bashrc 或 ~/.zshrc:
              export MOX_HOME=#{opt_prefix}
              export PATH="$PATH:#{bin}"
      
            如果你仅需执行 mox 命令，可能不需要额外配置。
          EOS
        end
      
        test do
          # 简单测试，检查是否可以正确输出版本号
          system "#{bin}/mox", "--version"
        end
     end
