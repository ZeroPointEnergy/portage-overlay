# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Library and tools to manage and deploy root filesystems in a git-like repository"
HOMEPAGE="https://ostree.readthedocs.io"
SRC_URI="https://github.com/ostreedev/ostree/releases/download/v${PV}/${P}.tar.xz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	econf --with-posix-regex
}

src_install() {
	emake DESTDIR="${D}" install

	dodoc README.md TODO
}
