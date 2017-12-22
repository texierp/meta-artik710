#
# linux-artik710 - branch 4.4.71
# (C)2017 Marco Cavallini - KOAN sas - <m.cavallini@koansoftware.com>
#

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

LINUX_VERSION = "4.4.71"


SRC_URI = " git://github.com/SamsungARTIK/linux-artik.git;protocol=https;branch=A710/v4.4"

SRCREV = "b8d11c1ee7fa4d5c7f724560db97aff0f100d5c0"

inherit kernel
require recipes-kernel/linux/linux-yocto.inc

PV = "${LINUX_VERSION}+git${SRCPV}"

S = "${WORKDIR}/git"

# The defconfig was created with make_savedefconfig so not all the configs are in place
KCONFIG_MODE="--alldefconfig"

COMPATIBLE_MACHINE = "(artik710)"
