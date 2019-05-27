# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit rpm

DESCRIPTION="Binary distribution of Vagrant."
HOMEPAGE="https://www.vagrantup.com/"
SRC_URI="https://releases.hashicorp.com/vagrant/${PV}/vagrant_${PV}_x86_64.rpm"
RESTRICT="mirror strip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="!!app-emulation/vagrant"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install () {
	mv {opt,usr} ${ED} || die 'mv failed'
}

