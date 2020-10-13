
# 解决xp上面可能出现的乱码问题
apt-get install language-pack-zh-hans -y

cd /root/userfolder
# install Anaconda
wget -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2020.02-Linux-x86_64.sh
sh Anaconda3-2020.02-Linux-x86_64.sh
# /root/userfolder/anaconda3
echo 'export PATH=/root/userfolder/anaconda3/bin:$PATH' >> ~/.zshrc
source ~/.zshrc

# Anaconda换源
conda config
echo 'channels:
  - defaults
show_channel_urls: true
channel_alias: https://mirrors.tuna.tsinghua.edu.cn/anaconda
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/pro
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud' >> ~/.condarc


# 安装pytorch mmcv
conda install pytorch cudatoolkit=10.2 torchvision -c pytorch -y
# pip install mmcv-full==latest+torch1.6.0+cu102 -f https://download.openmmlab.com/mmcv/dist/index.html
pip install mmcv-full

# 创建环境，名为mmdetection
conda create -n mmdetection python=3.7 -y
source activate mmdetection


# 下载 mmdetection
git clone https://github.com/open-mmlab/mmdetection.git
cd mmdetection

pip install -v -e .
