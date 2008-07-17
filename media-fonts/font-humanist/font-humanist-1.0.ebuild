# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Humanist Fonts"
HOMEPAGE="www.puzzle.ch"
SRC_URI="humanist.zip"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

src_unpack() {
	unpack ${A}
}

src_install() {
	dodir /usr/share/fonts/humanist/
	cp ${WORKDIR}/*.TTF ${D}/usr/share/fonts/humanist/
	chmod 0744 ${WORKDIR}/*.TTF
}
