# hugo建站

```shell
# 装hugo拓展版
scoop install hugo-extended
# 或者 apt install hugo
cd /mnt/d/10.code/1.website/

# 建站
hugo new site xiaobeita
cd xiaobeita

# 添加主题
git init
git add .
git submodule add --depth 1 https://github.com/reuixiy/hugo-theme-meme.git themes/meme
git submodule update --rebase --remote

# 替换配置
rm config.toml && cp themes/meme/config-examples/zh-cn/config.toml config.toml

# 新建文章
hugo new "posts/hello-world.md"
hugo new "about/_index.md"

# 体验一下
hugo server -D
```