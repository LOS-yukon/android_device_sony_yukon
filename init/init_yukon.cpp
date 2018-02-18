/*
Copyright (c) 2013, The Linux Foundation. All rights reserved.
Copyright (C) 2017 The LineageOS Project


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
#include <stdio.h>
#include <dirent.h>
#include <sys/types.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "vendor_init.h"
#include "property_service.h"
#include <android-base/properties.h>
#include <android-base/logging.h>

using android::base::GetProperty;
using android::init::property_set;

using namespace std;

#define LTA_MODEL_OFFSET 20
#define LTA_MODEL_LENGTH 4

string get_model_number()
{
    string lta;

    DIR* dirFile = opendir( "/lta-label/" );
    if ( dirFile ) 
    {
        struct dirent* hFile;

        while (( hFile = readdir( dirFile )) != NULL ) 
        {
            // ignore these special files
            if ( !strcmp( hFile->d_name, "."  )) continue;
            if ( !strcmp( hFile->d_name, ".." )) continue;

            // get the model from the file name of the .html file
            if ( strstr( hFile->d_name, ".html" ))
            lta = string(hFile->d_name).substr(LTA_MODEL_OFFSET, LTA_MODEL_LENGTH);
        }
        closedir( dirFile );
    }
    return lta;
}

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void vendor_load_properties()
{
    string platform;
    string hardware;
    string device;
    string model;
    
    platform = GetProperty("ro.board.platform", "");
    if (platform != ANDROID_TARGET)
    return;

    hardware = GetProperty("ro.boot.hardware", "");
    model = get_model_number();
    
    if (hardware == "eagle") {
        if (model == "2403") {
            /* D2403 (Xperia M2 Aqua) */
            property_override("ro.product.model", "Xperia M2 Aqua");
            property_override("ro.product.name", "D2403");
            property_override("ro.product.device", "D2403");
            property_override("ro.build.product", "D2403");
            property_override("ro.build.description", "D2403-user 5.1.1 18.6.A.0.182 1643041205 release-keys");
            property_override("ro.build.fingerprint", "Sony/D2403/D2403:5.1.1/18.6.A.0.182/1643041205:user/release-keys");
            property_set("ro.telephony.default_network", "9");
            property_set("persist.radio.multisim.config", "");
            property_set("telephony.lteOnGsmDevice", "1");
        } else if (model == "2406") {
            /* D2406 (Xperia M2 Aqua USA) */
            property_override("ro.product.model", "Xperia M2 Aqua");
            property_override("ro.product.name", "D2406");
            property_override("ro.product.device", "D2406");
            property_override("ro.build.product", "D2406");
            property_override("ro.build.description", "D2406-user 5.1.1 18.6.A.0.182 1643041205 release-keys");
            property_override("ro.build.fingerprint", "Sony/D2406/D2406:5.1.1/18.6.A.0.182/1643041205:user/release-keys");
            property_set("ro.telephony.default_network", "9");
            property_set("persist.radio.multisim.config", "");
            property_set("telephony.lteOnGsmDevice", "1");
        } else if (model == "2302") {
            /* D2302 (Xperia M2 Dual) */
            property_override("ro.product.model", "Xperia M2 Dual");
            property_override("ro.product.name", "D2302");
            property_override("ro.product.device", "D2302");
            property_override("ro.build.product", "D2302");
            property_override("ro.build.description", "D2302-user 5.1.1 18.6.A.0.182 1643041205 release-keys");
            property_override("ro.build.fingerprint", "Sony/D2302/D2302:5.1.1/18.6.A.0.182/1643041205:user/release-keys");
            property_set("ro.telephony.default_network", "0,1");
            property_set("ro.telephony.ril.config", "simactivation");
            property_set("persist.radio.multisim.config", "dsds");
            property_set("persist.radio.dont_use_dsd", "true");
            property_set("persist.radio.plmn_name_cmp", "1");
        } else if (model == "2305") {
            /* D2305 (Xperia M2 3G) */
            property_override("ro.product.model", "Xperia M2 3G");
            property_override("ro.product.name", "D2305");
            property_override("ro.product.device", "D2305");
            property_override("ro.build.product", "D2305");
            property_override("ro.build.description", "D2305-user 5.1.1 18.6.A.0.182 1643041205 release-keys");
            property_override("ro.build.fingerprint", "Sony/D2305/D2305:5.1.1/18.6.A.0.182/1643041205:user/release-keys");
            property_set("ro.telephony.default_network", "0");
            property_set("persist.radio.multisim.config", "");
        } else if (model == "2306") {
            /* D2306 (Xperia M2 LTE USA) */
            property_override("ro.product.model", "Xperia M2");
            property_override("ro.product.name", "D2306");
            property_override("ro.product.device", "D2306");
            property_override("ro.build.product", "D2306");
            property_override("ro.build.description", "D2306-user 5.1.1 18.6.A.0.182 1643041205 release-keys");
            property_override("ro.build.fingerprint", "Sony/D2306/D2306:5.1.1/18.6.A.0.182/1643041205:user/release-keys");
            property_set("ro.telephony.default_network", "9");
            property_set("persist.radio.multisim.config", "");
            property_set("telephony.lteOnGsmDevice", "1");
        } else {
            /* D2303 (Xperia M2 LTE) */
            property_override("ro.product.model", "Xperia M2");
            property_override("ro.product.name", "D2303");
            property_override("ro.product.device", "D2303");
            property_override("ro.build.product", "D2303");
            property_override("ro.build.description", "D2303-user 5.1.1 18.6.A.0.182 1643041205 release-keys");
            property_override("ro.build.fingerprint", "Sony/D2303/D2303:5.1.1/18.6.A.0.182/1643041205:user/release-keys");
            property_set("ro.telephony.default_network", "9");
            property_set("persist.radio.multisim.config", "");
            property_set("telephony.lteOnGsmDevice", "1");
        }
    } else if (hardware == "flamingo") {
        if (model == "2203") {
            /* D2203 (Xperia E3 LTE) */
            property_override("ro.product.model", "Xperia E3");
            property_override("ro.product.name", "D2203");
            property_override("ro.product.device", "D2203");
            property_override("ro.build.product", "D2203");
            property_set("ro.telephony.default_network", "9");
            property_set("persist.radio.multisim.config", "");
            property_set("telephony.lteOnGsmDevice", "1");
        }
    }    

    device = GetProperty("ro.product.device", "");
}
