# THSA应用文章代码验证步骤 THSA Application Article Code Verification Steps
<figure>
  <br />
  <img src="Img/GuidelineForTHSA.png" weight="1500">
  <figcaption>
  </figcaption>
  <br /> <br />
</figure>

## Step 01 环境准备 Environment Preparation
* 需要安装Matlab
* Need to install Matlab
## Step 02 下载代码 Download the code
* 将`Code_for_Paper`和`Original_Code`两个文件夹拉取到本地。
* Pull the two folders `Code_for_Paper` and `Original_Code` to your local computer.
## Step 03 下载数据 Download data
* 由于Github对上传文件大小有限制，我将会用到的数据存在云端，可以通过[链接](https://1drv.ms/f/s!AvR41SoNKXKfgxQJOUYJsxVrBWZ4?e=cQeQFE)进行下载，里面应该含有`BWT_SPICE_400us_maxstep0.1n_transient2.txt`、`DSIM_MAIN_400us_VdsId2.txt`、和`DSIM_MAIN_400us_VdsId3.txt`三个文本文件。检查无误后将其分别复制到下载好的`Code_for_Paper`和`Original_Code`文件夹中的对应文件夹。
* Since Github has a limit on the size of uploaded files, the data I will use is stored in the cloud and can be downloaded through [link](https://1drv.ms/f/s!AvR41SoNKXKfgxQJOUYJsxVrBWZ4?e=cQeQFE), which should contain three text files: `BWT_SPICE_400us_maxstep0.1n_transient2.txt`, `DSIM_MAIN_400us_VdsId2.txt`, and `DSIM_MAIN_400us_VdsId3.txt`. After checking that they are correct, copy them to the corresponding folders in the downloaded `Code_for_Paper` and `Original_Code` folders.
## Step 04 运行论文所使用代码 Run the code used in the paper
* 在Matlab环境中依次运行`Code_for_Paper/DSIM_vs_SPICE_transient_draw.m`即可获得数据修改版本的Fig.C1,
* Run `Code_for_Paper/DSIM_vs_SPICE_transient_draw.m` in Matlab environment to get the data modified version of Fig.C1.
## Step 05 运行原始代码 Run the original code
* 在Matlab环境中依次运行`Original_Code/DSIM_vs_SPICE_transient_draw.m`即可获得原本数据版本的Fig.C1,
* Run `Original_Code/DSIM_vs_SPICE_transient_draw.m` in Matlab environment to get the original data version of Fig.C1.
## Step 06 对比分析 Comparative analysis
* 比较两者结果差异，验证“学术不端行为”的有效性。
* Compare the differences between the two results to verify the effectiveness of "academic misconduct".
## Step 07 一点技巧 A little trick
* 细心的同学可能发现得到的图和论文中的图在尺寸和线条颜色上有不同，那是因为我担心被导师发现，先在matlab中弄好数据放缩后，将数据导入到其他画图软件，例如Origin里面重新绘图，这样导师就不可能发现了。
* Careful people  may find that the obtained figures are different from those in the paper in size and line color. That’s because I was worried that my supervisor would find out, so I first scaled the data in Matlab, and then imported the data into other drawing software, such as Origin, and re-drew the figure. This way, my supervisor would not be able to find out.
