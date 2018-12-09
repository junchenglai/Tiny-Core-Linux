# 配置 DNS 信息
sudo echo 'nameserver 114.114.114.114' >> /etc/resolv.conf

# 安装 OpenSSH 包
tce-load -wi openssh

# 使用模板创建 SSH 配置文件
sudo cp /usr/local/etc/ssh/sshd_config.orig /usr/local/etc/ssh/sshd_config

# 启动 SSH 服务
sudo /usr/local/etc/init.d/openssh start&

# 更改默认用户 “tc” 的密码
echo tc:password | sudo chpasswd

# 编辑 ’.filetool.lst’ 文件
sudo echo '/usr/local/etc/ssh' >> /opt/.filetool.lst 
sudo echo '/etc/shadow' >> /opt/.filetool.lst

# 编辑启动文件
sudo echo 'sudo adding dns 114.114.114.114' >> /opt/bootlocal.sh
sudo echo 'sudo echo nameserver 114.114.114.114 >> /etc/resolv.conf' >> /opt/bootlocal.sh
# sudo echo 'sudo /sbin/udhcpc' >> /opt/bootlocal.sh
sudo echo 'echo tc:password | chpasswd' >> /opt/bootlocal.sh
sudo echo 'sudo cp /usr/local/etc/ssh/sshd_config.orig /usr/local/etc/ssh/sshd_config' >> /opt/bootlocal.sh
sudo echo 'sudo /usr/local/etc/init.d/openssh start' >> /opt/bootlocal.sh

# 备份配置
sudo filetool.sh -b