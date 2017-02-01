$d1=NEW
!action='$1'
!thisfile='$0'

if (defined(!!lookview)) then
!this=!!lookview
endif

if (!action.EQ('NEW')) then
setup form !!lookview 
!this.formtitle = 'LOOK'
button .i1 at xmin 'S' call '$$m$!thisfile S'
button .i2 'ISO1' call '$$m$!thisfile ISO1'
button .i3 'W' call '$$m$!thisfile W'
button .i4 'ISO2' call '$$m$!thisfile ISO2'
button .i5 'N' call '$$m$!thisfile N'
button .i6 'ISO3' call '$$m$!thisfile ISO3'
button .i7 'E' call '$$m$!thisfile E'
button .i8 'ISO4' call '$$m$!thisfile ISO4'

button .i10 ' PLAN S ' at xmin .i1 ymax .i8 call '$$m$!thisfile PLS'
button .i11 ' PLAN W ' at xmin .i3 ymax .i8 call '$$m$!thisfile PLW'
button .i12 ' PLAN N ' at xmin .i5 ymax .i8 call '$$m$!thisfile PLN'
button .i13 ' PLAN E ' at xmin .i7 ymax .i8 call '$$m$!thisfile PLE'

exit

show !!lookview

elseif(!action.EQ('S')) then
!tview = array()
!tview[1] = 0
!tview[2] = -1
!tview[3] = 0
!!gph3ddesign1.view.direction=!tview

elseif(!action.EQ('W')) then
!tview = array()
!tview[1] = -1
!tview[2] = 0
!tview[3] = 0
!!gph3ddesign1.view.direction=!tview

elseif(!action.EQ('N')) then
!tview = array()
!tview[1] = 0
!tview[2] = 1
!tview[3] = 0
!!gph3ddesign1.view.direction=!tview

elseif(!action.EQ('E')) then
!tview = array()
!tview[1] = 1
!tview[2] = 0
!tview[3] = 0
!!gph3ddesign1.view.direction=!tview

elseif(!action.EQ('ISO1')) then
!tview = array()
!tview[1] = -0.577
!tview[2] = -0.577
!tview[3] = -0.577
!!gph3ddesign1.view.direction=!tview

elseif(!action.EQ('ISO2')) then
!tview = array()
!tview[1] = -0.577
!tview[2] = 0.577
!tview[3] = -0.577
!!gph3ddesign1.view.direction=!tview

elseif(!action.EQ('ISO3')) then
!tview = array()
!tview[1] = 0.577
!tview[2] = 0.577
!tview[3] = -0.577
!!gph3ddesign1.view.direction=!tview

elseif(!action.EQ('ISO4')) then
!tview = array()
!tview[1] = 0.577
!tview[2] = -0.577
!tview[3] = -0.577
!!gph3ddesign1.view.direction=!tview

elseif(!action.EQ('DOWN')) then
!tview = array()
!tview[1] = 0
!tview[2] = 0
!tview[3] = -1
!!gph3ddesign1.view.direction=!tview

elseif(!action.EQ('PLS')) then
$m$!thisfile S
$m$!thisfile DOWN

elseif(!action.EQ('PLW')) then
$m$!thisfile W
$m$!thisfile DOWN

elseif(!action.EQ('PLN')) then
$m$!thisfile N
$m$!thisfile DOWN

elseif(!action.EQ('PLE')) then
$m$!thisfile E
$m$!thisfile DOWN

else
kill !!lookview

endif