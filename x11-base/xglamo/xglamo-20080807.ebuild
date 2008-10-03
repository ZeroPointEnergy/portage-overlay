# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git autotools

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

EGIT_REPO_URI="git://git.openmoko.org/git/xglamo.git"
EGIT_BRANCH="master"
EGIT_TREE="4067470ea4d569bae7b4161ca998645a0c9b96e7"

LICENSE=""
SLOT="0"
KEYWORDS="~arm"
IUSE=""

RDEPEND="x11-libs/xtrans
	x11-libs/libfontenc
	x11-libs/libXau
	x11-libs/libXfont
	x11-libs/libxkbfile
	x11-libs/libXt"
#	x11-libs/tslib"
DEPEND="${RDEPEND}
	>=x11-proto/randrproto-1.2
	x11-proto/renderproto
	>=x11-proto/fixesproto-4
	>=x11-proto/damageproto-1.1
	x11-proto/xcmiscproto
	x11-proto/xextproto
	x11-proto/xproto
	x11-proto/xf86miscproto
	x11-proto/xf86vidmodeproto
	x11-proto/xf86bigfontproto
	>=x11-proto/scrnsaverproto-1.1.0
	x11-proto/bigreqsproto
	x11-proto/resourceproto
	x11-proto/fontsproto
	x11-proto/inputproto
	x11-proto/xf86dgaproto
	>=x11-proto/kbproto-1.0.3
	x11-proto/videoproto
	>=x11-proto/compositeproto-0.3
	x11-proto/trapproto
	x11-proto/recordproto
	x11-proto/xineramaproto
	x11-proto/evieext"

src_unpack() {
	git_src_unpack
	epatch "${FILESDIR}/xglamo-no-linuxdoc.patch"
	eautoreconf
}

src_compile() {
	econf --disable-dri --enable-kdrive --disable-xfree86-utils --enable-tslib \
		--disable-xorgcfg --disable-kbd_mode \
		--sysconfdir=/etc/X11 --localstatedir=/var --enable-install-setuid \
		--with-fontdir=/usr/share/fonts --with-xkb-output=/var/lib/xkb \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
