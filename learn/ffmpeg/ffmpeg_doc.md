1. `-i` 选项,指定输入  
   下面的例子可以根据输出信息获取输入的素材的相关信息
   ```shell
   ffmpeg -i a.mp4
   ```
2. `-filter_complex` (与 `-lavfi` 等价)选项,定义了一个复杂的滤波器，即具有任意数量的输入和/或输出的滤波器  
   下面的例子将图片合成视频,并指定每个图片在视频中的开始结束时间:
   ```shell
   ffmpeg -i slide-1.jpg -i slide-18.jpg -i line_0.png -filter_complex "[0:v]scale=640*480[ppt0];[1:v]scale=640*480[ppt1];nullsrc=s=640*480[bg0],[bg0][ppt0]overlay=0:0:enable='between(t,0.0,30.0)'[out0],[out0][ppt1]overlay=0:0:enable='between(t,30.0,60.0)'[out1],[out1][2:v]overlay=0:0:enable='between(t,8.377,22.545)'" -preset ultrafast -r 24.0 -t 60.0 -y a.mp4
   ```
3. `-ss` 选项,指定位置,可以作为一个输入的选项(此时放到 `-i` 之前),也可以作为一个输出的选项  
   下面的例子将一个视频文件和一个音频文件合成一个mp4
   ```shell
   ffmpeg -ss 298.298 -i out-video-ss-1.flv -ss 302.372 -i out-audio-ss-1.flv -t 60.0 -r 24.0 -ac 1 -preset ultrafast -vcodec libx264 -acodec aac -pix_fmt yuv420p -s 412*316 -y c.mp4
   ```
4. `-map` 选项 `-amerge` 选项 `-amix` 选项  
   下面的例子将 stu.mp4/tea.mp4/ppt.mp4/b.png 四个输入合成到一个画面上其中b.png作为背景图,其他三个视频缩放到指定大小并切放置到指定的位置;其中stu.mp4或者tea.mp4可能会包含音频ppt.mp4不包含音频  
   ```shell
   ffmpeg -i stu.mp4 -i tea.mp4 -i b.png -i ppt.mp4 -filter_complex \
   "nullsrc=size=1334*740[b0];[3:v]scale=865*650[y0];[2:v]scale=1334*750[b1];[b0][b1]overlay=0:0[b];[b][0:v]overlay=906:50[out1];[out1][1:v]overlay=906:380[out2];[out2][y0]overlay=20:50[out]; \
   [0:a][1:a]amerge=inputs=2[aout]" -map "[out]" -map "[aout]" -ac 1 -preset ultrafast -pix_fmt yuv420p -t 60.0 -y d.mp4
   ```
   ```shell
   ffmpeg -i stu.mp4 -i tea.mp4 -i b.png -i ppt.mp4 -filter_complex \
   "nullsrc=size=1334*740[b0];[3:v]scale=865*650[y0];[2:v]scale=1334*750[b1];[b0][b1]overlay=0:0[b];[b][0:v]overlay=906:50[out1];[out1][1:v]overlay=906:380[out2];[out2][y0]overlay=20:50[out]; \
   [0:a][1:a]amix=inputs=2[aout]" -map "[out]" -map "[aout]" -ac 1 -preset ultrafast -pix_fmt yuv420p -t 60.0 -y d.mp4
   ```
5. `-f fmt (input/output)` 选项 强制指定输入或者输出的格式 `-vframes number (output)` 选项设置输出的视频帧数  
   下面的例子将视频a.mp4的第0.05秒截取一帧输出为图片  
   ```shell
   ffmpeg -i a.mp4 -y -f image2 -ss 0.05 -vframes 1 a.png
   ```