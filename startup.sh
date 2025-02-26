#!/bin/bash
set -ex

# 创建data/images目录
mkdir -p data/images

# 启动docker
./restart_lede_docker.sh

cat <<EOF > ./data/first_run.sh
#!/bin/bash
set -ex

git clone https://github.com/greennyreborn/lede.git
cp -r /home/lede/scripts/* /home/lede/build/lede/
cd /home/lede/build/lede/
git checkout green/passwall
EOF

chmod +x ./data/first_run.sh
docker run -it -u lede -w /home/lede/build ./first_run.sh
