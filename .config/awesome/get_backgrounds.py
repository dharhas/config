#!/usr/bin/env python
"""
Script to gather nifty images from the internets
"""

import urllib2
import os.path

timeout = 2
background_dir = os.path.expanduser("~/config/.config/awesome/background/")
backgrounds = (
                ("solar_eclipse.jpg",
                 "http://antwrp.gsfc.nasa.gov/apod/image/1007/TSE2010_JLD4.jpg"),
                ("bad_sky.jpg",
                 "http://i.imgur.com/9zINi.jpg"),
                ("water_drops.jpg",
                 "http://farm2.static.flickr.com/1162/4726134943_067f7f6bff_o.jpg"),
                ("dogwood.jpg",
                 "http://farm2.static.flickr.com/1203/4724273563_ef5c54a059_o.jpg"),
                ("grass_wire.jpg",
                 "http://farm2.static.flickr.com/1163/4609397107_ea974ccd9e_o.jpg"),
                ("walk_the_plank.jpg",
                 "http://farm2.static.flickr.com/1007/4605547522_a5756e5096_o.jpg"),
                ("curl.jpg",
                 "http://farm3.static.flickr.com/2771/4462907734_d8e323b175_o.jpg"),
                ("lighthouse_guts.jpg",
                 "http://farm3.static.flickr.com/2526/3772928256_7fe5b3f6ac_o.jpg"),
                ("dew.jpg",
                 "http://farm4.static.flickr.com/3520/3770903944_969f1ab3e2_o.jpg"),
                ("threads.jpg",
                 "http://farm4.static.flickr.com/3474/3748239444_03ab6b99da_o.jpg"),
                ("seed.jpg",
                 "http://farm3.static.flickr.com/2471/3747059411_28a1517589_o.jpg"),
                ("mouth.jpg",
                 "http://farm3.static.flickr.com/2589/3724627682_9853752519_o.jpg"),
                ("door.jpg",
                 "http://farm4.static.flickr.com/3488/3742874977_fd9b1e2d49_o.jpg"),
                ("tufa.jpg",
                 "http://farm3.static.flickr.com/2367/3610862737_945839a1b3_o.jpg"),
                ("shadarrow.jpg",
                 "http://farm4.static.flickr.com/3554/3438007239_36af067a25_o.jpg"),
                ("lighthouseII.jpg",
                 "http://farm4.static.flickr.com/3349/3186651030_a03c6e6104_o.jpg"),
                ("golden_gate_bw.jpg",
                 "http://farm4.static.flickr.com/3226/3133959128_f848a1c68e_o.jpg"),
                ("into_the_night.jpg",
                 "http://www.nasa.gov/images/content/476052main_irasghost_hst_big_full.jpg"),
                
                 
               )



for bg in backgrounds:
    bg_name, bg_url = bg[0], bg[1]

    r = urllib2.urlopen(bg_url, timeout=timeout)

    with open(background_dir + bg_name, 'w') as f:
        print "fetching %s..." % (bg_name,)
        f.write(r.read())

    r.close()
