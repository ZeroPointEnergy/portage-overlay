# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"

DESCRIPTION="Autocode makes it easy to mixin code generation and (re)loading features into any project, just like the framework folks do!"
HOMEPAGE="http://dev.zeraweb.com/autocode"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-ruby/metaid-1.0 \
		>=dev-lang/ruby-1.8.4"
