hungarian-airspaces
===================
Megpróbáltam összeszedni a legfontosabb, XC távrepüléskor figyelemre méltó Magyar légtereket, és olyan formátumba konvertálni őket,
hogy feltölthetők legyenek a Brauniger Competino-ra. A fájlok szerintem más Brauniger és Flytec műszerekkel is működnnek, de ezt nem 
tudom megerősíteni.

A légtereket a galatech.hu oldalon megtalálható információkból és a vonatkozó törvény szövegéből gyűjtöttem ki. Linkek:
http://galatech.hu/pg/dir/MoICAO/Mo_ICAO.htm
http://www.complex.hu/jr/gen/hjegy_doc.cgi?docid=A0700026.GKM

Figyelem! Semmilyen felelősséget nem vállalok az adatok pontosságáért, így ha miattam sérted meg valamelyik légteret, és törlik a repülésed, akkor ne hibáztass! Az adatok egyes esetekben pontatlanok lehetnek!
   

Mit tartalmazank a fájlok?
__________________________
* convert.rb : ruby szkript, ami a gpx formátumból tud előállítani fa5 formátumot, hogy feltölthető legyen a Flychart szoftverbe
* hun-city-wp.fw5: fontosabb városok, tájékozódási pontok amik szerintem hasznosak. Leginkább a nagyobb határvárosokat vettem fel ide.
* hun-restricted.fa5: korlátozott légterek. 20 db van benne, mert ennyit bír a Competino

Hogyan használd?
________________ 
Ahhoz, hogy használni tudd a fájlokat, elsőként szükséges a legfrissebb firmware:
http://www.brauniger.com/en/support/downloads/firmware.html

Ha feltöltötted a firmware-t , akkor szükséged van a Flychart szoftverre is:
http://www.brauniger.com/en/support/downloads/flight-analysis-software.html

A Flychart menüben itt tudod feltölteni a két fájlt:
Extras -> Flight Instrumet options

Jó tudni
--------
A competino csak 20 tiltott légteret tud kezelni, ezért kicsit optimalizálni kellett. A hun-restricted.fa5 fájlban a következő 'trükköket' követtem el:
* G23 és TMA5 összevonva, mert ugyanannyi az alja
* Ferihegy CTR nincs benne, itt ugye biztosan nem repülünk
* G20, G21, G22 nincs benne, mert itt sem repülünk szerintem
* TMA5 határ oldalt közelítőleg tartalmazza, hogy kevesebb pont legyen
* Pápa MCTR közepén a kör csak hozzávetőleges, aki már ide keveredik, az magára vessen!
* Debrecen CRT TIZ1 (a középső rész) nincs benne, erre sem kellene keveredni, már a körülötte levő TIZ2 és TIZ3 is elég
 