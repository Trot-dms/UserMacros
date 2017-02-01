$d1=NEW
!action='$1'
!thisfile='$0'

if (defined(!!remel)) then
!this=!!remel
endif

if (!action.EQ('NEW')) then
setup form !!remel
!this.formtitle = 'REMOVE ELEMENTS'
path down


list .list1 'Elements' single width 35 height 25
button .addce 'ADD CE' at xmin form ymax form call '$$m$!thisfile addelement'
button .remce 'REM CE' at xmax .addce ymin .addce call '$$m$!thisfile remce'
button .gotosel 'GO TO' at xmax .remce ymin .addce call '$$m$!thisfile pick'
button .savelist 'SAVE LIST' at xmin form ymax .addce call '$$m$!thisfile save'
button .loadlist 'LOAD LIST' at xmax .savelist ymax .addce call '$$m$!thisfile load'
button .clearlist 'CLEAR LIST' at xmax .loadlist ymax .addce call '$$m$!thisfile clear'
button .addel 'ADD' at xmax form-13 ymin .addce call '$$m$!thisfile addel'
button .cls 'REMOVE' at xmax form-8 ymin .addce call '$$m$!thisfile remfromview'
combo .listselector tagwid 5 at xmin form ymax .savelist 'LISTS' scroll 20 width 25
!this.listselector.add('temp_remlist')
!this.listselector.add('temp_remlist_01')
!this.listselector.add('temp_remlist_02')
!this.listselector.add('temp_remlist_03')
!this.listselector.add('temp_remlist_04')
!this.listselector.add('temp_remlist_05')
!ct='$m%pdmsuser%/usermacros/remfromlist.pml load'
$!ct

exit

show !!remel

elseif(!action.EQ('addelement')) then

!xce = !!ce.name

!this.list1.add( !xce)

elseif(!action.EQ('save')) then

!temp=!this.listselector.selection()
!temp=!temp+'.txt'

!MyFile = object FILE ('%pdmsuser%/usermacros/lists/$!temp')
!MyFile.Open ('WRITE')

do !auto index !this.list1.dtext
!MyFile.WriteRecord (!this.list1.dtext[!auto])
enddo

!Myfile.Close()


elseif(!action.EQ('load')) then

!temp=!this.listselector.selection()
!temp=!temp+'.txt'
!this.list1.clear()
!MyFile = object FILE ('%pdmsuser%/usermacros/lists/$!temp')
!MyFile.Open ('READ')

do 
!line = !MyFile.ReadRecord()
if (!line.set()) then
!this.list1.add(!line)
else
break
endif
enddo

!Myfile.Close()

elseif(!action.EQ('pick')) then
!elem = !this.list1.selection()
$!elem

elseif(!action.EQ('remce')) then
!elem = !this.list1.selection()
!this.list1.clear(!elem)

elseif(!action.EQ('remfromview')) then
do !auto index !this.list1.dtext
!xce=!this.list1.dtext[!auto]
$!xce
rem $!!ce
enddo

elseif(!action.EQ('clear')) then
!this.list1.clear()

elseif(!action.EQ('addel')) then
do !auto index !this.list1.dtext
!xce=!this.list1.dtext[!auto]
$!xce
add $!!ce
enddo

else
kill !!remel

endif