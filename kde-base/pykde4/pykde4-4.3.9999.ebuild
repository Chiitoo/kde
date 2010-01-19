# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KMNAME="kdebindings"
KMMODULE="python/pykde4"
OPENGL_REQUIRED="always"
PYTHON_USE_WITH="threads"
inherit python kde4-meta

DESCRIPTION="Python bindings for KDE4"
KEYWORDS=""
IUSE="akonadi debug doc examples policykit semantic-desktop"

DEPEND="
	$(add_kdebase_dep kdelibs 'opengl,semantic-desktop?')
	aqua? ( >=dev-python/PyQt4-4.5[dbus,sql,svg,webkit,aqua] )
	!aqua? ( >=dev-python/PyQt4-4.5[dbus,sql,svg,webkit,X] )
	akonadi? ( $(add_kdebase_dep kdepimlibs) )
	policykit? ( >=sys-auth/policykit-qt-0.9.2 )
"
# blocker added due to compatibility issues and error during compile time
RDEPEND="${DEPEND}
	!dev-python/pykde
"

pkg_setup() {
	python_pkg_setup
	kde4-meta_pkg_setup
}

src_prepare() {
	kde4-meta_src_prepare

	if ! use examples; then
		sed -e '/^ADD_SUBDIRECTORY(examples)/s/^/# DISABLED /' -i python/${PN}/CMakeLists.txt \
			|| die "Failed to disable examples"
	fi
}

src_configure() {
	mycmakeargs=(
		-DWITH_QScintilla=OFF
		$(cmake-utils_use_with semantic-desktop Soprano)
		$(cmake-utils_use_with semantic-desktop Nepomuk)
		$(cmake-utils_use_with akonadi)
		$(cmake-utils_use_with akonadi KdepimLibs)
		$(cmake-utils_use_with policykit PolkitQt)
	)

	kde4-meta_src_configure
}

src_install() {
	kde4-meta_src_install

	if use doc; then
		dohtml -r "${S}"/python/pykde4/docs/html/* || die 'dohtml failed'
	fi

	rm -f \
		"${ED}$(python_get_sitedir)"/PyKDE4/*.py[co] \
		"${ED}${PREFIX}"/share/apps/"${PN}"/*.py[co]
}

pkg_postinst() {
	kde4-meta_pkg_postinst

	python_mod_optimize "$(python_get_sitedir)"/PyKDE4

	if use examples; then
		echo
		elog "PyKDE4 examples have been installed to"
		elog "${EKDEDIR}/share/apps/${PN}/examples"
		echo
	fi
}

pkg_postrm() {
	kde4-meta_pkg_postrm

	python_mod_cleanup "$(python_get_sitedir)"/PyKDE4
}
