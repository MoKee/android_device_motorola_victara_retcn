/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

void vendor_load_properties()
{
    char platform[PROP_VALUE_MAX];
    char cid[PROP_VALUE_MAX];
    int rc;

    rc = property_get("ro.board.platform", platform);
    if (!rc || strncmp(platform, ANDROID_TARGET, PROP_VALUE_MAX))
        return;

    property_get("ro.boot.cid", cid);

    property_set("ro.build.product", "victara");
    property_set("ro.product.device", "victara");

    if (strstr(cid, "0xB")) {
        /* xt1085 */
        property_set("ro.product.model", "XT1085");
        property_set("ro.build.description", "victara_retcn-user 5.1 LPE23.32-53 41 release-keys");
        property_set("ro.build.fingerprint", "motorola/victara_retcn/victara:5.1/LPE23.32-53/41:user/release-keys");
        property_set("ro.telephony.default_network", "22");
        property_set("telephony.lteOnCdmaDevice", "1");
        property_set("ro.telephony.default_cdma_sub", "0");
        property_set("ro.cdma.subscription", "0");
        property_set("persist.radio.mcfg_enabled", "1");
        property_set("persist.radio.rat_on", "combine");
    } else {
        /* all others */
        property_set("ro.product.model", "XT1095");
        property_set("ro.build.description", "victara_tmo-user 5.1 LPE23.32-21.3 5 release-keys");
        property_set("ro.build.fingerprint", "motorola/victara_tmo/victara:5.1/LPE23.32-21.3/5:user/release-keys");
        property_set("ro.telephony.default_network", "9");
        property_set("telephony.lteOnGsmDevice", "1");
    }
}
