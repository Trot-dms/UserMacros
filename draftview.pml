$d1=NEW
!action='$1'
!thisfile='$0'

if (defined(!!dview)) then
!this=!!dview
endif

if (!action.EQ('NEW')) then
setup form !!dview dialog dock top
!this.formtitle = 'DRAFT VIEW'
button .i1 'EXPORT VIEW AND DRAWLIST' call '$$m$!thisfile sview'
button .i2 'IMPORT DRAWLIST' call '$$m$!thisfile dimport'
button .i3 'IMPORT VIEW LIMITS' call '$$m$!thisfile viewimport'
button .i4 'ADD DRAWLIST ELEMENTS TO DES.' call '$$m$!thisfile addelem'
exit

show !!dview

elseif (!action.EQ('sview')) then

var !MyDrawlist1 EVAL Name for all from Drawlist

--!!gph3ddesign1 zawiera dane o view

--!viewpos = !!gph3ddesign1.clipbox.box.position
--!viewpose = !!gph3ddesign1.clipbox.box.position.east
--!viewposn = !!gph3ddesign1.clipbox.box.position.north
--!viewposu = !!gph3ddesign1.clipbox.box.position.up
--!viewxlen = !!gph3ddesign1.clipbox.box.xlength
--!viewylen = !!gph3ddesign1.clipbox.box.ylength
--!viewzlen = !!gph3ddesign1.clipbox.box.zlength

!viewpos = array()
!viewpos = !!gph3ddesign1.view.clipboxposition
--!viewpos[1] = !!gph3ddesign1.view.clipboxposition[1]
--!viewpos[2] = !!gph3ddesign1.view.clipboxposition[1]
--!viewpos[3] = !!gph3ddesign1.view.clipboxposition[1]
!viewxlen = !!gph3ddesign1.view.clipboxxlen
!viewylen = !!gph3ddesign1.view.clipboxylen
!viewzlen = !!gph3ddesign1.view.clipboxzlen

!viewxlen = !viewxlen / 2
!viewylen = !viewylen / 2
!viewzlen = !viewzlen / 2

!MyFile = object FILE ('%pdmsuser%/usermacros/drawlists/temp_draw.txt')
!MyFile2 = object FILE ('%pdmsuser%/usermacros/views/temp_view.txt')

!MyFile.Open ('WRITE')
!MyFile2.Open ('WRITE')

do !auto index !MyDrawlist1
$!MyDrawlist1[$!auto]
!MyFile.WriteRecord (!MyDrawlist1[!auto])
enddo

--!MyFile2.WriteRecord (!viewpos.string() )
!MyFile2.WriteRecord (!viewpos[1].string() )
!MyFile2.WriteRecord (!viewpos[2].string() )
!MyFile2.WriteRecord (!viewpos[3].string() )
!MyFile2.WriteRecord (!viewxlen.string() )
!MyFile2.WriteRecord (!viewylen.string() )
!MyFile2.WriteRecord (!viewzlen.string() )

!Myfile.Close()
!Myfile2.Close()

elseif(!action.EQ('dimport')) then
--DRAFT

var !dwgn eval name for drwg
!dwgname = !dwgn[1]
!libname = !dwgname + '/LIBY'
!drawlistliby = !dwgname + '/DRAWLIST'
!drawlistname = !dwgname + '/DRAWLIST/IMPORT'

--SET NEW DRAWLIST

$!drawlistliby
new idli
name $!drawlistname

--READ DESIGN DRAWLIST
!MyFile = object FILE ('%pdmsuser%/usermacros/drawlists/temp_draw.txt')
!MyFile.Open ('READ')

do 
!line = !MyFile.ReadRecord()
if (!line.set()) then
$!drawlistname
new ADDE
IDNM $!line
else
break
endif
enddo

!MyFile.Close()


--DRAFT VIEW

elseif (!action.EQ('viewimport')) then

var !dwgn eval name for drwg
!dwgname = !dwgn[1]
!libname = !dwgname + '/LIBY'
!drawlistliby = !dwgname + '/DRAWLIST'
!drawlistname = !dwgname + '/DRAWLIST/IMPORT'
!viewname = !!ce.name + '/IMPORT_VIEW'

!MyFile = object FILE ('%pdmsuser%/usermacros/views/temp_view.txt')
!MyFile.Open ('READ')

--!viewpos = !MyFile.ReadRecord()
!viewpose = !MyFile.ReadRecord()
!viewposn = !MyFile.ReadRecord()
!viewposu = !MyFile.ReadRecord()
!viewxlen = !MyFile.ReadRecord()
!viewylen = !MyFile.ReadRecord()
!viewzlen = !MyFile.ReadRecord()

!MyFile.Close()

!tempx1 = !viewpose.real() - !viewxlen.real()
!tempy1 = !viewposn.real() - !viewylen.real()
!tempz1 = !viewposu.real() - !viewzlen.real()

!tempx2 = !viewpose.real() + !viewxlen.real()
!tempy2 = !viewposn.real() + !viewylen.real()
!tempz2 = !viewposu.real() + !viewzlen.real()

!viewpos = 'E ' & $!viewpose & ' N ' & $!viewposn & ' U ' & $!viewposu

!limity = 'From E ' & $!tempx1 & ' N ' & $!tempy1 & ' U ' & $!tempz1 & ' To E ' & $!tempx2 & ' N ' & $!tempy2 & ' U ' & $!tempz2


new view
name $!viewname

idln $!drawlistname
vsca 0.01
thpo $!viewpos
:cdlimits '$!limity'



elseif(!action.EQ('addelem')) then
!MyFile = object FILE ('%pdmsuser%/usermacros/drawlists/temp_draw.txt')
!MyFile.Open ('READ')

do 
!line = !MyFile.ReadRecord()
if (!line.set()) then

add $!line
else
break
endif
enddo

!MyFile.Close()


else
kill !!dview

endif