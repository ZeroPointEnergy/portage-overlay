# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Sansa Fonts"
HOMEPAGE="www.fontshop.com"
SRC_URI="sansa.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

src_unpack() {
	unpack ${A}
}

src_install() {
	dodir /usr/share/fonts/sansa/
	cp ${WORKDIR}/sansa/*.ttf ${D}/usr/share/fonts/sansa/
	chmod 0744 ${D}/usr/share/fonts/sansa/*.ttf
}
