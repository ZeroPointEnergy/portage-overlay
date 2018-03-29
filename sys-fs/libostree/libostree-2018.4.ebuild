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

DEPEND="
	app-arch/libarchive
	app-arch/xz-utils
	app-crypt/gpgme
	dev-libs/glib
	dev-libs/libassuan
	dev-libs/libgpg-error
	net-libs/libsoup
	sys-apps/util-linux
	sys-fs/fuse:0
	sys-libs/glibc
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_configure() {
	econf --with-posix-regex
}

src_install() {
	emake DESTDIR="${D}" install

	dodoc README.md TODO
}
