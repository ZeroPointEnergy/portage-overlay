# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"

DESCRIPTION="abstract is a library which enables you to define abstract method in Ruby."
HOMEPAGE="http://rubyforge.org/projects/abstract/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-lang/ruby-1.8.4"
