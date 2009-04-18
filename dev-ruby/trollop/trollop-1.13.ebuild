# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"

DESCRIPTION="Trollop is YAFCLAP --- yet another fine commandline argument
processing library for Ruby. Trollop is designed to provide the maximal amount
of GNU-style argument processing in the minimum number of lines of code (for
you, the programmer)."
HOMEPAGE="http://trollop.rubyforge.org/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"
LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-ruby/trollop-1.13 \
		>=dev-lang/ruby-1.8.4"
