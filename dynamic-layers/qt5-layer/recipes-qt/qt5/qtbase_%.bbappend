# Simple bbappend file for qtbase.

PACKAGECONFIG_GL = "gles2 kms eglfs"
PACKAGECONFIG_FONTS = "fontconfig"

PACKAGECONFIG_append = " accessibility sql-sqlite tslib libinput"					
PACKAGECONFIG_remove = " directfb gl"

do_configure_prepend() {
# adapt qmake.conf to our needs
sed -i 's!load(qt_config)!!' ${S}/mkspecs/linux-oe-g++/qmake.conf

cat >> ${S}/mkspecs/linux-oe-g++/qmake.conf <<EOF	
QT_QPA_DEFAULT_PLATFORM = eglfs
EGLFS_DEVICE_INTEGRATION = eglfs_kms
QMAKE_LIBS_EGL         += -lEGL -lGLESv2
QMAKE_LIBS_OPENGL_ES2  += \$\${QMAKE_LIBS_EGL}

load(qt_config)
EOF
}
