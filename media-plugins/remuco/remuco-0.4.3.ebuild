# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Remuco is a system to remotely control music player software with
bluetooth enabled mobile devices. Remuco is designed to support a wide range of
music player. Remuco not only controls, it also displays player state
information on the mobile devices."
HOMEPAGE="http://remuco.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-server-source-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="amarok rhythmbox"

DEPEND="
amarok? ( media-sound/amarok 
          kde-base/dcoppython ) 
rhythmbox?(media-sound/rhythmbox)
"

RDEPEND=""

S="${WORKDIR}/${PN}-server-source-${PV}"

pkg_setup() {
	if [ ! use amarok  &&  ! use rhythmbox ]
	then 
		die "You should set USE amarok and/or rhythmbox"
	fi
}

src_unpack() 
{
	unpack ${A}
	cd "${S}"
	#epatch "${FILESDIR}/Makefile.patch"     
	sed -i -e "s:/usr/local:${D}/usr:" "Makefile"
	sed -i -e "s/STRIP := strip/STRIP := touch/" "Makefile"
	epatch "${FILESDIR}/rem-pp-python.mk.patch"
}

src_compile()
{
	echo
	"No	compile"
}

src_install()
{
	if use amarok
	then
		emake PP=amarok install || die "Error: emake amarok failed!"
	fi
	if use rhythmbox
	then
		emake PP=rhythmbox install || die "Error: emake rhythmbox failed!"
	fi
	dodoc COPYING README TODO
}
