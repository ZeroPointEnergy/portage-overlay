# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"

DESCRIPTION="This is the MySQL API module for Ruby. It provides the same functions for Ruby programs that the MySQL C API provides for C programs."
HOMEPAGE="http://www.tmtm.org/en/mysql/ruby/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-db/mysql-5.0.0 \
		>=dev-lang/ruby-1.8.4"
