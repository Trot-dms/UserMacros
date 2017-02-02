# Welcome to PDMS UserMacros
Usermacros - macro system build for Aveva PDMS (version 12.x+)

This version is interpreted by PDMS PML interpreter and you need to set your USERMACROS directory into PMLLIB path variable.

Current version is 1.2.1. For more information head to [Trot's Den site -> UserMacros](https://sites.google.com/site/trotdms/piping/user-macros).

## Author rights
Below macros are open source code so you can modify and use them as you want. But be aware that i'm not responsible for damages this macros can made ;).

## Version history
- 07.07.2014 - Version 1.0 - public.
- 22.09.2014 - Version 1.1 - minor fixes.
- 18.12.2015 - Version 1.2 - macros rewritten to new pml syntax.
- 28.01.2016 - Version 1.2.1 - added 2 new macros (PMLtracing and CE Tracking)

## Current version macros
Before you run any macro please see [installation information](https://sites.google.com/site/trotdms/piping/user-macros) for complex instructions on how to setup variables. After this you can use commands from How to run.

## Installation
To use macros you need to add directory with macros to PMLLIB path variable. Below are some informations how to do it.
Example:
Go to `PDMSUSER` folder of your PDMS installation (my is `C:\AVEVA\Plant\PDMS12.0.SP4`). In `PDMSUSER` folder create `USERMACROS` folder.

Macro | How to run
------|-----------
Insulation and obstruction toolbar | `show !!ibar <Free Centred xr0.9 yr0.12>`
History of editing for CE | `show !!historyCE`
Steel toolbar | `show !!sbar <Free Centred xr0.9 yr0.12>`
Lisega toolbar | `show !!jslisegalof`
Paint spref | `show !!paintspref <Free Centred xr0.9 yr0.12>`
Find toolbar | `$m%pdmsuser%/usermacros/find.pml`
3D box view export | `$m%pdmsuser%/usermacros/draftview.pml`
Look direction toolbar | `$m%pdmsuser%/usermacros/lookview.pml`
3D box remove toolbar | `$m%pdmsuser%/usermacros/remfromlist.pml`
Pml tracing tool | `show !!pmltracing`
CE tracking | `show !!trackCE`

For more information visit above webpage. 
You can also use my macros for your own by cloning below repository
```
$ git clone https://kgolis@bitbucket.org/kgolis/pdms-usermacros.git
```
