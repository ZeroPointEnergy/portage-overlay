# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )

inherit distutils-r1

DESCRIPTION="Sophisticated chroot/build/flash tool to develop and install postmarketOS"
HOMEPAGE="https://postmarketos.org/"
SRC_URI="https://gitlab.com/postmarketOS/${PN}/-/archive/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-vcs/git"
RDEPEND="${DEPEND}"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
