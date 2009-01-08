# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KMNAME="kdebase-runtime"
inherit kde4-meta

DESCRIPTION="KDE: Plugins to manage filtering URIs."
KEYWORDS="~amd64 ~x86"
IUSE="debug"
RESTRICT="test" # Tests segfault. Last checked on 4.0.3.
