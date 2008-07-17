# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="LPR driver for Brother DCP-750CW"
HOMEPAGE="http://solutions.brother.com/linux/sol/printer/linux/lpr_drivers.html"
SRC_URI="http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/lpr_debian/dcp750cwlpr-1.0.0-9.i386.deb"

LICENSE="Brother"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="app-arch/alien"
RDEPEND=""

src_unpack() {
	unpack ${A}
	unpack ./data.tar.gz
	unpack ./control.tar.gz
	rm -f control.tar.gz data.tar.gz debian-binary
}

src_compile() {
	sed -i \
		-e 's/\/etc\//\.\/etc\//g' \
		-e 's/\/var\/spool/\.\/var\/spool/g' \
		usr/local/Brother/Printer/dcp750cw/inf/setupPrintcapij
	
	mkdir -p etc
	mkdir -p var/spool/lpd
	cp /etc/printcap etc/
	usr/local/Brother/Printer/dcp750cw/inf/setupPrintcapij dcp750cw -i USB
}

src_install() {
	cp -pPR usr ${D} || die "installing data failed"
	cp -pPR var ${D} || die "installing data failed"
}
