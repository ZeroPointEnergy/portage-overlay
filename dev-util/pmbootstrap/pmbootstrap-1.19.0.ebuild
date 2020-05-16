# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1 eutils

DESCRIPTION="Sophisticated chroot/build/flash tool to develop and install postmarketOS"
HOMEPAGE="https://postmarketos.org/"
SRC_URI="https://gitlab.com/postmarketOS/${PN}/-/archive/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

BDEPEND=""
RDEPEND="
	app-admin/sudo
	dev-libs/openssl
	dev-vcs/git"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature "bash-completion and zsh-completion support" dev-python/argcomplete
}
