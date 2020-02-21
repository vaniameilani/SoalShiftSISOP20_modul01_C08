#!/bin/bash

#declare array
hurufbesar=({A..Z})
hurufkecil=({a..z})

hrfA=${hurufbesar[(0+$jam)]}
hrfZ=${hurufbesar[(25+jam)%26]}
hrfa=${hurufkecil[(0+$jam]}
hrfz=${hurufkecil[(25+jam)%26]}

#nama file setelah didekripsi :

