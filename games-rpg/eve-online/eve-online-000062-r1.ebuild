# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

SLOT="0"
LICENSE="as-is"
KEYWORDS="~amd64 ~ia64 ~x86"
DESCRIPTION="Client for Eve-Online"
SRC_URI="http://ccp.vo.llnwd.net/o2/linux/eve-${PV}.tgz"
HOMEPAGE="http://www.eve-online.com"
IUSE=""

# dependencies may be wrong
RDEPEND="x11-libs/libX11
	virtual/opengl
	>=sys-libs/ncurses-5.2
	>=media-libs/freetype-2.0.0
	>=dev-lang/python-2.3
	>=dev-python/pygtk-2.6
	amd64? ( app-emulation/emul-linux-x86-xlibs
		app-emulation/emul-linux-x86-soundlibs )"


src_unpack()	# This function unpacks our files
{ 
	mkdir -p ${S}
	unpack ${A}
	mv ${WORKDIR}/usr ${S}
	mv ${WORKDIR}/etc ${S}
}

src_install()
{
	cp -R ${S}/* ${D}/

	# move desktop files
	mkdir -p ${D}usr/share/applications
	mv ${D}usr/lib/eve/icons/*.desktop ${D}usr/share/applications/

	# change permissions (incomplete)
	gamesowners ${D}usr/bin/eve
	gamesperms ${D}usr/bin/eve
	gamesowners ${D}usr/lib/eve
	gamesperms ${D}usr/lib/eve
}

pkg_postrm()
{
	einfo "If you are unmerging EVE Online permanently, don't forget to"
	einfo "manually delete the data folders which normally can be found"
	einfo "in ~/.cedega/."
}
