# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Freescale/NXP I.MX Chip image deploy tools"
HOMEPAGE="https://github.com/NXPmicro/mfgtools"
SRC_URI="https://github.com/NXPmicro/mfgtools/archive/uuu_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-arch/bzip2
	dev-libs/libzip
	virtual/libusb:1"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-uuu_${PV}

src_compile() {
	gen_dir=${BUILD_DIR}/libuuu/gen
	git_version="#define GIT_VERSION \"libuuu-${PV}\""
	mkdir -p $gen_dir || die
	echo $git_version > ${gen_dir}/gitversion.h || die

	cmake-utils_src_compile
}
