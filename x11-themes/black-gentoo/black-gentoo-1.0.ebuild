# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit kde
set-kdedir 3

DESCRIPTION="A theme package providing kdmtheme/gensplash/ksplash/background"
HOMEPAGE="http://art4linux.org"
SRC_URI="http://art4linux.org/system/files/black-gentoo.tar.gz
		 http://art4linux.org/system/files/BlackGentooKDM.tar.gz
		 http://art4linux.org/system/files/black-gentoo-gensplash.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND=">=kde-misc/ksplash-engine-moodin-0.4.2"

# don't compile
src_compile() { 
	epatch ${FILESDIR}/kdm-positions.patch
}

src_install() {
	mv BlackGentooKDM/BlackGentooKDM.xml BlackGentooKDM/${PN}.xml
	sed -i \
	    -e "s/BlackGentooKDM/black-gentoo/" \
	    BlackGentooKDM/*.desktop || die "config manipulation failed"

	# install kdm theme
	BlackGentooKDM/*
	insinto ${KDEDIR}/share/apps/kdm/themes/${PN}
	doins BlackGentooKDM/* || die "doins failed"

	# install ksplash theme
	insinto ${KDEDIR}/share/apps/ksplash/Themes/${PN}
	doins black-gentoo/* || die "doins failed"

	# fix paths in config
	sed -i \
		-e "s/Gentoo-black/black-gentoo/" \
		Gentoo-black/1280x1024.cfg || die "config manipulation failed"
	# install gensplash theme to /etc/splash
	insinto /etc/splash/${PN}
	doins -r Gentoo-black/* || die "doins failed"


	
	# install background
	mv Gentoo-black/images/background* black-gentoo.png
	insinto ${KDEDIR}/share/wallpapers
	doins black-gentoo.png
}

pkg_postinst() {
	echo
	elog "This package does not pull gensplash, you have to install it by yourself!"
	elog "The splash theme has been installed to /etc/splash/black-gentoo."
	echo
}
