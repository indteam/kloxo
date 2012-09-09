RELEASEVER=$(rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release))

echo "- Creating kloxo-github.repo inside '/etc/yum.repos.d'"

echo "[kloxo-release-noarch]
name=kloxo-release-noarch
baseurl=https://github.com/mustafaramadhan/kloxo/raw/rpms/release/centos$releasever/noarch/
enabled=1
gpgcheck=0

[kloxo-release-arch]
name=kloxo-release-$basearch
baseurl=https://github.com/mustafaramadhan/kloxo/raw/rpms/release/centos$releasever/$basearch/
enabled=1
gpgcheck=0

[kloxo-testing-noarch]
name=kloxo-testing-noarch
baseurl=https://github.com/mustafaramadhan/kloxo/raw/rpms/testing/centos$releasever/noarch/
enabled=0
gpgcheck=0

[kloxo-testing-arch]
name=kloxo-testing-$basearch
baseurl=https://github.com/mustafaramadhan/kloxo/raw/rpms/testing/centos$releasever/$basearch/
enabled=0
gpgcheck=0" > /etc/yum.repos.d/kloxo-github.repo

fi

echo
