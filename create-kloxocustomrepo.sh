#!/bin/sh

# release on Kloxo 6.2.0
# by mustafa.ramadhan@lxcenter.org

RELEASEVER=$(rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release))

echo "- Creating custom-repo inside '/home/rpms' "
echo "     with kloxo-custom.repo inside '/etc/yum.repos.d'"

echo "[kloxo-release-noarch]
name=kloxo-release-noarch
baseurl=https://github.com/mustafaramadhan/kloxo/raw/rpms-release/centos$RELEASEVER/noarch/
enabled=1
gpgcheck=0

[kloxo-release-arch]
name=kloxo-release-$basearch
baseurl=https://github.com/mustafaramadhan/kloxo/raw/rpms-release/centos$RELEASEVER/\$basearch/
enabled=1
gpgcheck=0

[kloxo-testing-noarch]
name=kloxo-testing-noarch
baseurl=https://github.com/mustafaramadhan/kloxo/raw/rpms-testing/centos$RELEASEVER/noarch/
enabled=0
gpgcheck=0

[kloxo-testing-arch]
name=kloxo-testing-\$basearch
baseurl=https://github.com/mustafaramadhan/kloxo/raw/rpms-testing/centos$RELEASEVER/\$basearch/
enabled=0
gpgcheck=0

# ==================================

[kloxo-centalt]
name=kloxo-centalt - \$basearch
baseurl=http://centos.alt.ru/repository/centos/$RELEASEVER/\$basearch/
enabled=1
gpgcheck=0
exclude=openssh*

# ==================================

[kloxo-ius]
name=kloxo - IUS Community Packages for Enterprise Linux $RELEASEVER - \$basearch
baseurl=http://dl.iuscommunity.org/pub/ius/stable/Redhat/$RELEASEVER/\$basearch
mirrorlist=http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-el$RELEASEVER&arch=\$basearch
enabled=1
gpgcheck=0

# ==================================

[kloxo-epel]
name=kloxo - Extra Packages for Enterprise Linux $RELEASEVER - \$basearch
baseurl=http://download.fedoraproject.org/pub/epel/$RELEASEVER/\$basearch
mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$RELEASEVER&arch=\$basearch
enabled=1
gpgcheck=0" > /etc/yum.repos.d/kloxo-custom.repo
