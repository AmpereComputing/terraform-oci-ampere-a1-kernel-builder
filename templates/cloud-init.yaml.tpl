#cloud-config

apt:
  sources:
    docker.list:
      source: deb [arch=arm64] https://download.docker.com/linux/ubuntu $RELEASE stable
      keyid: 9DC858229FC7DD38854AE2D88D81803C0EBFCD88

package_update: true
package_upgrade: true

packages:
  - screen
  - rsync
  - git
  - curl
  - docker-ce
  - docker-ce-cli
  - python3-pip
  - python3-dev
  - python3-selinux
  - python3-setuptools
  - python3-venv
  - libffi-dev
  - gcc
  - libssl-dev
  - flex
  - bison
  - libelf++0
  - libelf-dev
  - fakeroot
  - kernel-package
  - build-essential
  - crash
  - kexec-tools
  - makedumpfile
  - kernel-wedge
  - build-dep
  - libncurses5
  - libncurses5-dev
  - asciidoc
  - binutils-dev
  - zstd
  - git-email
  - git-doc

groups:
  - docker
system_info:
  default_user:
    groups: [docker]

runcmd:
  - 'git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git /usr/src/linux-next' 
  - 'cd /usr/src/linux-next && scripts/config --disable SYSTEM_REVOCATION_KEYS && scripts/config --disable SYSTEM_TRUSTED_KEYS && time fakeroot make-kpkg kernel-image kernel-source --initrd --append-to-version=.ampere'
