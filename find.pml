$d1=NEW
!action='$1'
!thisfile='$0'

if (defined(!!find)) then
!this=!!find
endif

if (!action.EQ('NEW')) then
setup form !!find dialog dock left
!this.formtitle = 'FIND PIPE'
path down
option .type 'Choose element type ' width 5
text .text1 'Enter part of the name' width 13 is string
list .list1 'Search results' single width 35 height 25
button .find 'Find' at xmin form ymax form call '$$m$!thisfile findpipe'
button .gotoce 'Go to...' at xmax .find ymin .find call '$$m$!thisfile pick'
button .cls 'Cancel' at xmax form-8 ymin .find cancel

!types = 'PIPE BRAN EQUI STRU FRMW SBFR SITE ZONE'
!list = !types.split()
!this.type.dtext = !list

exit

show !!find

elseif(!action.EQ('findpipe')) then
!part = !this.text1.val
!type = !this.type.selection()
var !temp coll all $!type with (matchw(name,'*$!part*'))
!xce = !!ce.name
do !i indices !temp
$!temp[$!i]
!results[!i] = !!ce.name
enddo
$!xce
!this.list1.dtext = !results
handle (2,751)
!q[1] = ' '
!q[2] = ' '
!q[3] = ' NOTHING FOUND'
!this.list1.dtext = !q
endhandle

elseif(!action.EQ('pick')) then
!elem = !this.list1.selection()
$!elem

else
kill !!find

endif