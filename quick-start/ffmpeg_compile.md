#在CentOS上编译ffmpeg的静态版本

##获取依赖
注意: `#` 表示该命令应该以超级用户或root身份执行，并且在本指南中只有 `yum` 命令需要。
获取依赖项。这些是编译所必需的。
```bash
# yum install autoconf automake bzip2 bzip2-devel cmake freetype-devel gcc gcc-c++ git libtool make mercurial pkgconfig zlib-devel
```
在您的主目录中创建一个新目录，所有源代码将会放到这里：
```bash
mkdir ~/ffmpeg_sources
```

##编译和安装
###NASM
某些库使用的汇编程序。强烈推荐否则您的构建结果可能非常慢。
```bash
cd ~/ffmpeg_sources
curl -O -L https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.bz2
tar xjvf nasm-2.14.02.tar.bz2
cd nasm-2.14.02
./autogen.sh
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
make
make install
```
###Yasm
某些库使用的汇编程序。强烈推荐否则您的构建结果可能非常慢。
```bash
cd ~/ffmpeg_sources
curl -O -L https://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar xzvf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
make
make install
```
###libx264
H.264视频编码器
需要使用 `--enable-gpl` `--enable-libx264`配置 `ffmpeg`。
```bash
cd ~/ffmpeg_sources
git clone --depth 1 https://code.videolan.org/videolan/x264.git
cd x264
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static
make
make install
```
###libx265
H.265 / HEVC视频编码器。
需要使用 `--enable-gpl` `--enable-libx264`配置 `ffmpeg`。
```bash
cd ~/ffmpeg_sources
hg clone https://bitbucket.org/multicoreware/x265
cd ~/ffmpeg_sources/x265/build/linux
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=off ../../source
make
make install
```
###libfdk_aac
AAC音频编码器。
需要使用 `--enable-libfdk_aac` 配置 `ffmpeg` （如果包含 `--enable-nonfree` ，还需要使用 `--enable-gpl` ）。
```bash
cd ~/ffmpeg_sources
git clone --depth 1 https://github.com/mstorsjo/fdk-aac
cd fdk-aac
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
```
###libmp3lame
MP3音频编码器。
需要使用 `--enable-libmp3lame` 配置 `ffmpeg` 。
```bash
cd ~/ffmpeg_sources
curl -O -L https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz
tar xzvf lame-3.100.tar.gz
cd lame-3.100
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm
make
make install
```
###libopus
Opus音频解码器和编码器。
需要使用 `--enable-libopus`配置 `ffmpeg` 。
```bash
cd ~/ffmpeg_sources
curl -O -L https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz
tar xzvf opus-1.3.1.tar.gz
cd opus-1.3.1
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
```
###libvpx
VP8 / VP9视频编码器和解码器。
需要使用 `--enable-libvpx` 配置 `ffmpeg` 。
```bash
cd ~/ffmpeg_sources
git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git
cd libvpx
./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm
make
make install
```
###FFmpeg
```bash
cd ~/ffmpeg_sources
curl -O -L https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs=-lpthread \
  --extra-libs=-lm \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-libfdk_aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree
make
make install
hash -d ffmpeg
```
##编译现已完成
现在可以使用 `ffmpeg` （还有 `ffprobe` ， `lame` 和 `x264` ）。 所在目录为 `~/bin/`

##参考链接
[Compile FFmpeg on CentOS](https://trac.ffmpeg.org/wiki/CompilationGuide/Centos)
[CompilationGuide – FFmpeg](https://trac.ffmpeg.org/wiki/CompilationGuide)
