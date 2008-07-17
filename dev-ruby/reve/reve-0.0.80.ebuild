# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"

DESCRIPTION="Reve is a Ruby library to interface with the Eve Online API."
HOMEPAGE="http://www.crudvision.com/reve-ruby-eve-online-api-library/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-ruby/hpricot-0.6 \
         >=dev-lang/ruby-1.8.4"
