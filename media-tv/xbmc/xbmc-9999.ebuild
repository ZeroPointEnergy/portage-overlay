# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic subversion

ESVN_REPO_URI="https://xbmc.svn.sourceforge.net/svnroot/xbmc/branches/linuxport/XBMC"
ESVN_REVISION="HEAD"

DESCRIPTION="XBMC is a free and open source media-player and entertainment hub"
HOMEPAGE="http://xbmc.org/"
#SRC_URI="mirror://sourceforge/xbmc/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="automount ccache gprof joystick opengl pcre xrandr"
RDEPEND="app-arch/bzip2
	app-arch/unzip
	app-arch/zip
	app-i18n/enca
	x86? ( dev-lang/nasm )
	amd64? ( dev-lang/yasm )
	dev-libs/boost
	dev-libs/fribidi
	pcre? ( dev-libs/libpcre )
	dev-libs/lzo
	dev-libs/tre
	=dev-python/pysqlite-2*
	dev-util/cmake
	dev-util/gperf
	ccache? ( dev-util/ccache )
	media-libs/alsa-lib
	media-libs/faac
	media-libs/fontconfig
	media-libs/freetype
	media-libs/glew
	media-libs/jasper
	media-libs/jpeg
	media-libs/libmad
	media-libs/libogg
	media-libs/libpng
	media-libs/libvorbis
	media-libs/sdl-gfx
	media-libs/sdl-image
	media-libs/sdl-mixer
	media-libs/sdl-sound
	net-misc/curl
	sys-apps/dbus
	automount? ( sys-apps/pmount )
	x11-libs/libXinerama
	x11-libs/libXmu
	x11-libs/libXt
	xrandr? ( x11-libs/libXrandr )
	x11-libs/libXrender
	x11-proto/xineramaproto
	virtual/mysql
	opengl? ( virtual/opengl )"
DEPEND="${RDEPEND}"

pkg_setup() {
	if use joystick && built_with_use media-libs/libsdl nojoystick; then
		die "media-libs/libsdl needs to be built with USE -nojoystick."
	fi

	if use automount && ! built_with_use sys-apps/pmount hal; then
		die "sys-apps/pmount needs to be built with USE hal."
	fi
}

src_unpack() {
	subversion_src_unpack
}

src_compile() {
	#-fomit-frame-pointer cannot be used with gprof
	if use gprof; then
		filter-flags "-fomit-frame-pointer"
	fi

	# force debug at the request of upstream until stable release
	econf \
		--prefix=/usr \
		--mandir=/usr/share/man \
		$(use_enable ccache) \
		--enable-debug \
		$(use_enable gprof profiling) \
		$(use_enable automount halmount) \
		$(use_enable joystick) \
		$(use_enable opengl gl) \
		$(use_enable pcre) \
		$(use_enable xrandr) \
		|| die "Configure failed!"

	emake || die "Make failed!"
}

src_install() {
	einstall INSTALL_ROOT="${D}" || die "Install failed!"
}
