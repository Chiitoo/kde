# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="forceoptional"
KFMIN=5.71.0
PVCUT=$(ver_cut 1-3)
QTMIN=5.14.2
inherit ecm kde.org

DESCRIPTION="Dedicated search application built on top of Baloo"
HOMEPAGE="https://invent.kde.org/plasma/milou"

LICENSE="GPL-2 LGPL-2.1"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kitemmodels-${KFMIN}:5
	>=kde-frameworks/krunner-${KFMIN}:5
	>=kde-frameworks/kservice-${KFMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${PN}-5.19.80-disable-manual-tests.patch" ) # bug 732584
