# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="CUPS wrapper for Brother DCP-750CW"
HOMEPAGE="http://solutions.brother.com/linux/sol/printer/linux/cups_drivers.html"
SRC_URI="http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/cups_wrapper/dcp750cwcupswrapper-1.0.0-10.i386.deb"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="net-print/brother-dcp750cw-lpr"
RDEPEND=""

src_unpack() {
	unpack ${A}
	unpack ./data.tar.gz
	unpack ./control.tar.gz
	rm -f control.tar.gz data.tar.gz debian-binary
}

src_compile() {
	sed -i -e \
		's/\/usr\/local\/Brother\/Printer\/dcp750cw\/cupswrapper\//\.\/usr\/local\/Brother\/Printer\/dcp750cw\/cupswrapper\//g' \
		-e 's/\/usr\/share/\.\/usr\/share/g' \
		-e 's/\/usr\/lib\/cups\/filter\//\.\/usr\/lib\/cups\/filter\//g' \
		usr/local/Brother/Printer/dcp750cw/cupswrapper/cupswrapperdcp750cw

	mkdir -p usr/share/cups/model
	mkdir -p usr/lib/cups/filter
	usr/local/Brother/Printer/"dcp750cw"/cupswrapper/cupswrapper"dcp750cw"
}

src_install() {
	cp -pPR usr ${D} || die "installing data failed"
	mkdir -p ${D}usr/share/ppd/Brother
	mkdir -p ${D}usr/libexec/cups/filter
	mv ${D}usr/share/cups/model/brdcp750cw.ppd ${D}usr/share/ppd/Brother/
	rm -r ${D}usr/share/cups
	mv ${D}usr/lib/cups/filter/brlpdwrapperdcp750cw ${D}usr/libexec/cups/filter/brlpdwrapperdcp750cw
	rm -r ${D}usr/lib
}
