è"
qE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Attributes\GeneTreeAuthorizeAttribute.cs
	namespace		 	
GenealogyTree		
 
.		 
API		 
.		 

Attributes		 &
{

 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Method> D
)D E
]E F
public 

class &
GeneTreeAuthorizeAttribute +
:, -
	Attribute. 7
,7 8 
IAuthorizationFilter9 M
{ 
private 
readonly 
IEnumerable $
<$ %
	UserRoles% .
>. /

allowRoles0 :
;: ;
public &
GeneTreeAuthorizeAttribute )
() *
)* +
{ 	

allowRoles 
= 
new 
List !
<! "
	UserRoles" +
>+ ,
{ 
	UserRoles 
. 
Admin 
,  
	UserRoles 
. 
User 
} 
; 
} 	
public &
GeneTreeAuthorizeAttribute )
() *
	UserRoles* 3
role4 8
)8 9
{ 	

allowRoles 
= 
new 
List !
<! "
	UserRoles" +
>+ ,
{ 
role 
} 
; 
} 	
private   
static   
void   %
AppendUnauthorizedRequest   5
(  5 6&
AuthorizationFilterContext  6 P
context  Q X
)  X Y
{!! 	
context"" 
."" 
Result"" 
="" 
new""  

JsonResult""! +
(""+ ,
new"", /
{""0 1
message""2 9
="": ;
$str""< J
}""K L
)""L M
{""N O

StatusCode""P Z
=""[ \
StatusCodes""] h
.""h i!
Status401Unauthorized""i ~
}	"" Ä
;
""Ä Å
}## 	
public%% 
void%% 
OnAuthorization%% #
(%%# $&
AuthorizationFilterContext%%$ >
context%%? F
)%%F G
{&& 	
try'' 
{(( 
var)) 
token)) 
=)) 
context)) #
.))# $
HttpContext))$ /
.))/ 0
Request))0 7
.))7 8
Headers))8 ?
[))? @
$str))@ O
]))O P
.))P Q
FirstOrDefault))Q _
())_ `
)))` a
?))a b
.))b c
Split))c h
())h i
$str))i l
)))l m
.))m n
Last))n r
())r s
)))s t
;))t u
if** 
(** 
token** 
!=** 
null** !
&&**" $
TokenService**% 1
.**1 2
ValidateToken**2 ?
(**? @
token**@ E
)**E F
)**F G
{++ 
bool,, 
parseSucceded,, &
=,,' (
int,,) ,
.,,, -
TryParse,,- 5
(,,5 6
TokenService,,6 B
.,,B C
GetClaim,,C K
(,,K L
token,,L Q
,,,Q R
TokenService,,S _
.,,_ `
UserRole,,` h
),,h i
,,,i j
out,,k n
var,,o r
userRole,,s {
),,{ |
;,,| }
if-- 
(-- 
!-- 
parseSucceded-- &
||--' )
!--* +

allowRoles--+ 5
.--5 6
Contains--6 >
(--> ?
(--? @
	UserRoles--@ I
)--I J
userRole--J R
)--R S
)--S T
{.. %
AppendUnauthorizedRequest// 1
(//1 2
context//2 9
)//9 :
;//: ;
}00 
}11 
else22 
{33 %
AppendUnauthorizedRequest44 -
(44- .
context44. 5
)445 6
;446 7
}55 
}66 
catch77 
{88 %
AppendUnauthorizedRequest99 )
(99) *
context99* 1
)991 2
;992 3
}:: 
};; 	
}<< 
}== ˚
lE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Attributes\MaxImageSizeAttribute.cs
	namespace 	
GenealogyTree
 
. 
API 
. 

Attributes &
{ 
public 

class !
MaxImageSizeAttribute &
:' (
ValidationAttribute) <
{ 
private 
readonly 
int 
_maxImageSize *
;* +
public		 !
MaxImageSizeAttribute		 $
(		$ %
int		% (
maxImageSize		) 5
)		5 6
{

 	
_maxImageSize 
= 
maxImageSize (
;( )
} 	
	protected 
override 
ValidationResult +
IsValid, 3
(3 4
object4 :
value; @
,@ A
ValidationContextB S
validationContextT e
)e f
{ 	
var 
image 
= 
( 
value 
as !
	IFormFile" +
)+ ,
;, -
if 
( 
image 
!= 
null 
&&  
image! &
.& '
Length' -
>. /
_maxImageSize0 =
*> ?
$num@ D
)D E
{ 
return 
new 
ValidationResult +
(+ ,
$", .
$str. A
{A B
_maxImageSizeB O
}O P
$strP S
"S T
)T U
;U V
} 
return 
ValidationResult #
.# $
Success$ +
;+ ,
} 	
} 
} …%
fE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Controllers\AuthController.cs
	namespace 	
GenealogyTree
 
. 
API 
. 
Controllers '
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
AuthController 
:  !

Controller" ,
{ 
private 
readonly 
IAuthService %
_authService& 2
;2 3
public 
AuthController 
( 
IAuthService *
userService+ 6
)6 7
{ 	
_authService 
= 
userService &
;& '
} 	
[ 	
HttpPost	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
LoginResponseModel' 9
>9 :
>: ;
Login< A
(A B

LoginModelB L
loginCredentialsM ]
)] ^
{ 	
try 
{ 
LoginResponseModel "
loginResponse# 0
=1 2
await3 8
_authService9 E
.E F
LoginF K
(K L
loginCredentialsL \
)\ ]
;] ^
if 
( 
loginResponse !
==" $
null% )
)) *
{ 
return 
NotFound #
(# $
)$ %
;% &
} 
return 
Ok 
( 
loginResponse '
)' (
;( )
}   
catch!! 
(!! 
	Exception!! 
e!! 
)!! 
{"" 
return## 

BadRequest## !
(##! "
e##" #
)### $
;##$ %
}$$ 
}%% 	
['' 	
HttpPost''	 
]'' 
[(( 	
Route((	 
((( 
$str(( 
)(( 
](( 
public)) 
async)) 
Task)) 
<)) 
ActionResult)) &
<))& '
UserDetailsModel))' 7
>))7 8
>))8 9
Register)): B
())B C
RegisterModel))C P
userRegister))Q ]
)))] ^
{** 	
try++ 
{,, 
UserDetailsModel--  
userDetails--! ,
=--- .
await--/ 4
_authService--5 A
.--A B
Register--B J
(--J K
userRegister--K W
)--W X
;--X Y
if.. 
(.. 
userDetails.. 
==..  "
null..# '
)..' (
{// 
return00 
NotFound00 #
(00# $
)00$ %
;00% &
}11 
return22 
Ok22 
(22 
userDetails22 %
)22% &
;22& '
}33 
catch44 
(44 
	Exception44 
e44 
)44 
{55 
return66 

BadRequest66 !
(66! "
e66" #
)66# $
;66$ %
}77 
}88 	
[:: 	
GeneTreeAuthorize::	 
]:: 
[;; 	
HttpPut;;	 
];; 
[<< 	
Route<<	 
(<< 
$str<< 
)<<  
]<<  !
public== 
async== 
Task== 
<== 
ActionResult== &
<==& '
UserDetailsModel==' 7
>==7 8
>==8 9
ChangePassword==: H
(==H I
UpdatePasswordModel==I \
updatePassword==] k
)==k l
{>> 	
try?? 
{@@ 
UserDetailsModelAA  
updatedUserAA! ,
=AA- .
awaitAA/ 4
_authServiceAA5 A
.AAA B
UpdatePasswordAAB P
(AAP Q
updatePasswordAAQ _
)AA_ `
;AA` a
ifBB 
(BB 
updatedUserBB 
==BB  "
nullBB# '
)BB' (
{CC 
returnDD 
NotFoundDD #
(DD# $
)DD$ %
;DD% &
}EE 
returnFF 
OkFF 
(FF 
updatedUserFF %
)FF% &
;FF& '
}GG 
catchHH 
(HH 
	ExceptionHH 
eHH 
)HH 
{II 
returnJJ 

BadRequestJJ !
(JJ! "
eJJ" #
)JJ# $
;JJ$ %
}KK 
}LL 	
}MM 
}NN ÿ0
hE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Controllers\CommonController.cs
	namespace

 	
GenealogyTree


 
.

 
API

 
.

 
Controllers

 '
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
CommonController !
:" #

Controller$ .
{ 
private 
readonly 
INationalityService ,
_nationalityService- @
;@ A
private 
readonly 
IReligionService )
_religionService* :
;: ;
public 
CommonController 
(  
INationalityService  3
nationalityService4 F
,F G
IReligionServiceH X
religionServiceY h
)h i
{ 	
_nationalityService 
=  !
nationalityService" 4
;4 5
_religionService 
= 
religionService .
;. /
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
GenericNameModel, <
>< =
>= >
>> ?
GetAllNationalities@ S
(S T
)T U
{ 	
try 
{ 
List 
< 
GenericNameModel %
>% &
nationalities' 4
=5 6
await7 <
_nationalityService= P
.P Q$
GetAllNationalitiesAsyncQ i
(i j
)j k
;k l
if 
( 
nationalities !
==" $
null% )
)) *
{   
return!! 
NotFound!! #
(!!# $
)!!$ %
;!!% &
}"" 
return## 
Ok## 
(## 
nationalities## '
)##' (
;##( )
}$$ 
catch%% 
(%% 
	Exception%% 
e%% 
)%% 
{&& 
return'' 

BadRequest'' !
(''! "
e''" #
)''# $
;''$ %
}(( 
})) 	
[++ 	
GeneTreeAuthorize++	 
(++ 
	UserRoles++ $
.++$ %
Admin++% *
)++* +
]+++ ,
[,, 	
HttpPost,,	 
],, 
[-- 	
Route--	 
(-- 
$str-- 
)-- 
]-- 
public.. 
async.. 
Task.. 
<.. 
ActionResult.. &
<..& '
GenericNameModel..' 7
>..7 8
>..8 9
AddNationality..: H
(..H I
string..I O
nationalityName..P _
).._ `
{// 	
try00 
{11 
GenericNameModel22  
nationality22! ,
=22- .
await22/ 4
_nationalityService225 H
.22H I
AddNationalityAsync22I \
(22\ ]
nationalityName22] l
)22l m
;22m n
return33 
Ok33 
(33 
nationality33 %
)33% &
;33& '
}44 
catch55 
(55 
	Exception55 
e55 
)55 
{66 
return77 

BadRequest77 !
(77! "
e77" #
)77# $
;77$ %
}88 
}99 	
[;; 	
HttpGet;;	 
];; 
[<< 	
Route<<	 
(<< 
$str<< 
)<< 
]<< 
public== 
async== 
Task== 
<== 
ActionResult== &
<==& '
List==' +
<==+ ,
GenericNameModel==, <
>==< =
>=== >
>==> ?
GetAllReligions==@ O
(==O P
)==P Q
{>> 	
try?? 
{@@ 
ListAA 
<AA 
GenericNameModelAA %
>AA% &
	religionsAA' 0
=AA1 2
awaitAA3 8
_religionServiceAA9 I
.AAI J 
GetAllReligionsAsyncAAJ ^
(AA^ _
)AA_ `
;AA` a
ifBB 
(BB 
	religionsBB 
==BB  
nullBB! %
)BB% &
{CC 
returnDD 
NotFoundDD #
(DD# $
)DD$ %
;DD% &
}EE 
returnFF 
OkFF 
(FF 
	religionsFF #
)FF# $
;FF$ %
}GG 
catchHH 
(HH 
	ExceptionHH 
eHH 
)HH 
{II 
returnJJ 

BadRequestJJ !
(JJ! "
eJJ" #
)JJ# $
;JJ$ %
}KK 
}LL 	
[NN 	
GeneTreeAuthorizeNN	 
(NN 
	UserRolesNN $
.NN$ %
AdminNN% *
)NN* +
]NN+ ,
[OO 	
HttpPostOO	 
]OO 
[PP 	
RoutePP	 
(PP 
$strPP 
)PP 
]PP 
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
ActionResultQQ &
<QQ& '
GenericNameModelQQ' 7
>QQ7 8
>QQ8 9
AddReligionQQ: E
(QQE F
stringQQF L
religionNameQQM Y
)QQY Z
{RR 	
trySS 
{TT 
GenericNameModelUU  
religionUU! )
=UU* +
awaitUU, 1
_religionServiceUU2 B
.UUB C
AddReligionAsyncUUC S
(UUS T
religionNameUUT `
)UU` a
;UUa b
returnVV 
OkVV 
(VV 
religionVV "
)VV" #
;VV# $
}WW 
catchXX 
(XX 
	ExceptionXX 
eXX 
)XX 
{YY 
returnZZ 

BadRequestZZ !
(ZZ! "
eZZ" #
)ZZ# $
;ZZ$ %
}[[ 
}\\ 	
}]] 
}^^ øL
kE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Controllers\EducationController.cs
	namespace 	
GenealogyTree
 
. 
API 
. 
Controllers '
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
EducationController $
:% &

Controller' 1
{ 
private 
readonly 
IEducationService *
_educationService+ <
;< =
public 
EducationController "
(" #
IEducationService# 4
educationService5 E
)E F
{ 	
_educationService 
= 
educationService  0
;0 1
} 	
[ 	
GeneTreeAuthorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str #
)# $
]$ %
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
EducationModel, :
>: ;
>; <
>< =
GetPersonEducations> Q
(Q R
GuidR V
userIdW ]
)] ^
{ 	
try 
{ 
List 
< 
EducationModel #
># $
returnEvent% 0
=1 2
await3 8
Task9 =
.= >
Run> A
(A B
(B C
)C D
=>E G
_educationServiceH Y
.Y Z#
GetAllEducationsForUserZ q
(q r
userIdr x
)x y
)y z
;z {
if 
( 
returnEvent 
==  "
null# '
)' (
{   
return!! 
NotFound!! #
(!!# $
)!!$ %
;!!% &
}"" 
return## 
Ok## 
(## 
returnEvent## %
)##% &
;##& '
}$$ 
catch%% 
(%% 
	Exception%% 
e%% 
)%% 
{&& 
return'' 

BadRequest'' !
(''! "
e''" #
)''# $
;''$ %
}(( 
})) 	
[++ 	
GeneTreeAuthorize++	 
]++ 
[,, 	
HttpGet,,	 
],, 
[-- 	
Route--	 
(-- 
$str-- 
)-- 
]-- 
public.. 
async.. 
Task.. 
<.. 
ActionResult.. &
<..& '
EducationModel..' 5
>..5 6
>..6 7
GetEducation..8 D
(..D E
int..E H
id..I K
)..K L
{// 	
try00 
{11 
EducationModel22 
returnEvent22 *
=22+ ,
await22- 2
_educationService223 D
.22D E
GetEducationAsync22E V
(22V W
id22W Y
)22Y Z
;22Z [
if33 
(33 
returnEvent33 
==33  "
null33# '
)33' (
{44 
return55 
NotFound55 #
(55# $
)55$ %
;55% &
}66 
return77 
Ok77 
(77 
returnEvent77 %
)77% &
;77& '
}88 
catch99 
(99 
	Exception99 
e99 
)99 
{:: 
return;; 

BadRequest;; !
(;;! "
e;;" #
);;# $
;;;$ %
}<< 
}== 	
[?? 	
GeneTreeAuthorize??	 
]?? 
[@@ 	
HttpPost@@	 
]@@ 
[AA 	
RouteAA	 
(AA 
$strAA 
)AA 
]AA 
publicBB 
asyncBB 
TaskBB 
<BB 
ActionResultBB &
<BB& '
EducationModelBB' 5
>BB5 6
>BB6 7
AddEducationBB8 D
(BBD E
EducationModelBBE S
	educationBBT ]
)BB] ^
{CC 	
tryDD 
{EE 
EducationModelFF 
returnEventFF *
=FF+ ,
awaitFF- 2
_educationServiceFF3 D
.FFD E
AddEducationAsyncFFE V
(FFV W
	educationFFW `
)FF` a
;FFa b
returnGG 
OkGG 
(GG 
returnEventGG %
)GG% &
;GG& '
}HH 
catchII 
(II 
	ExceptionII 
eII 
)II 
{JJ 
returnKK 

BadRequestKK !
(KK! "
eKK" #
)KK# $
;KK$ %
}LL 
}MM 	
[OO 	
GeneTreeAuthorizeOO	 
]OO 
[PP 	
HttpPutPP	 
]PP 
[QQ 	
RouteQQ	 
(QQ 
$strQQ 
)QQ 
]QQ 
publicRR 
asyncRR 
TaskRR 
<RR 
ActionResultRR &
<RR& '
EducationModelRR' 5
>RR5 6
>RR6 7
UpdateEducationRR8 G
(RRG H
EducationModelRRH V
	educationRRW `
)RR` a
{SS 	
tryTT 
{UU 
EducationModelVV 
returnEventVV *
=VV+ ,
awaitVV- 2
_educationServiceVV3 D
.VVD E 
UpdateEducationAsyncVVE Y
(VVY Z
	educationVVZ c
)VVc d
;VVd e
returnWW 
OkWW 
(WW 
returnEventWW %
)WW% &
;WW& '
}XX 
catchYY 
(YY 
	ExceptionYY 
eYY 
)YY 
{ZZ 
return[[ 

BadRequest[[ !
([[! "
e[[" #
)[[# $
;[[$ %
}\\ 
}]] 	
[__ 	
GeneTreeAuthorize__	 
]__ 
[`` 	

HttpDelete``	 
]`` 
[aa 	
Routeaa	 
(aa 
$straa 
)aa 
]aa 
publicbb 
asyncbb 
Taskbb 
<bb 
ActionResultbb &
>bb& '
DeleteEducationbb( 7
(bb7 8
intbb8 ;
idbb< >
)bb> ?
{cc 	
trydd 
{ee 
EducationModelff 
returnEventff *
=ff+ ,
awaitff- 2
_educationServiceff3 D
.ffD E 
DeleteEducationAsyncffE Y
(ffY Z
idffZ \
)ff\ ]
;ff] ^
returngg 
Okgg 
(gg 
returnEventgg %
)gg% &
;gg& '
}hh 
catchii 
(ii 
	Exceptionii 
eii 
)ii 
{jj 
returnkk 

BadRequestkk !
(kk! "
ekk" #
)kk# $
;kk$ %
}ll 
}mm 	
[oo 	
HttpGetoo	 
]oo 
[pp 	
Routepp	 
(pp 
$strpp 
)pp 
]pp 
publicqq 
asyncqq 
Taskqq 
<qq 
ActionResultqq &
<qq& '
Listqq' +
<qq+ ,
GenericNameModelqq, <
>qq< =
>qq= >
>qq> ?
GetEducationLevelsqq@ R
(qqR S
)qqS T
{rr 	
tryss 
{tt 
Listuu 
<uu 
GenericNameModeluu %
>uu% &
returnEventuu' 2
=uu3 4
awaituu5 :
_educationServiceuu; L
.uuL M&
GetAllEducationLevelsAsyncuuM g
(uug h
)uuh i
;uui j
ifvv 
(vv 
returnEventvv 
==vv  "
nullvv# '
)vv' (
{ww 
returnxx 
NotFoundxx #
(xx# $
)xx$ %
;xx% &
}yy 
returnzz 
Okzz 
(zz 
returnEventzz %
)zz% &
;zz& '
}{{ 
catch|| 
(|| 
	Exception|| 
e|| 
)|| 
{}} 
return~~ 

BadRequest~~ !
(~~! "
e~~" #
)~~# $
;~~$ %
} 
}
ÄÄ 	
[
ÇÇ 	
GeneTreeAuthorize
ÇÇ	 
(
ÇÇ 
	UserRoles
ÇÇ $
.
ÇÇ$ %
Admin
ÇÇ% *
)
ÇÇ* +
]
ÇÇ+ ,
[
ÉÉ 	
HttpPost
ÉÉ	 
]
ÉÉ 
[
ÑÑ 	
Route
ÑÑ	 
(
ÑÑ 
$str
ÑÑ 
)
ÑÑ 
]
ÑÑ 
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
ActionResult
ÖÖ &
<
ÖÖ& '
GenericNameModel
ÖÖ' 7
>
ÖÖ7 8
>
ÖÖ8 9
AddEducationLevel
ÖÖ: K
(
ÖÖK L
string
ÖÖL R
name
ÖÖS W
)
ÖÖW X
{
ÜÜ 	
try
áá 
{
àà 
GenericNameModel
ââ  
returnEvent
ââ! ,
=
ââ- .
await
ââ/ 4
_educationService
ââ5 F
.
ââF G$
AddEducationLevelAsync
ââG ]
(
ââ] ^
name
ââ^ b
)
ââb c
;
ââc d
return
ää 
Ok
ää 
(
ää 
returnEvent
ää %
)
ää% &
;
ää& '
}
ãã 
catch
åå 
(
åå 
	Exception
åå 
e
åå 
)
åå 
{
çç 
return
éé 

BadRequest
éé !
(
éé! "
e
éé" #
)
éé# $
;
éé$ %
}
èè 
}
êê 	
}
ëë 
}íí ‰?
jE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Controllers\MarriageController.cs
	namespace		 	
GenealogyTree		
 
.		 
API		 
.		 
Controllers		 '
{

 
[ 
GeneTreeAuthorize 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
MarriageController #
:$ %

Controller& 0
{ 
private 
readonly 
IMarriageService )
_marriageService* :
;: ;
public 
MarriageController !
(! "
IMarriageService" 2
marriageService3 B
)B C
{ 	
_marriageService 
= 
marriageService .
;. /
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str &
)& '
]' (
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
MarriedPersonModel, >
>> ?
>? @
>@ A
GetPersonMarriagesB T
(T U
intU X
personIdY a
)a b
{ 	
try 
{ 
List 
< 
MarriedPersonModel '
>' (
returnEvent) 4
=5 6
await7 <
_marriageService= M
.M N$
GetAllMarriagesForPersonN f
(f g
personIdg o
)o p
;p q
if 
( 
returnEvent 
==  "
null# '
)' (
{ 
return 
NotFound #
(# $
)$ %
;% &
}   
return!! 
Ok!! 
(!! 
returnEvent!! %
)!!% &
;!!& '
}"" 
catch## 
(## 
	Exception## 
e## 
)## 
{$$ 
return%% 

BadRequest%% !
(%%! "
e%%" #
)%%# $
;%%$ %
}&& 
}'' 	
[)) 	
HttpGet))	 
])) 
[** 	
Route**	 
(** 
$str** .
)**. /
]**/ 0
public++ 
async++ 
Task++ 
<++ 
ActionResult++ &
<++& '
MarriedPersonModel++' 9
>++9 :
>++: ;$
GetPersonCurrentMarriage++< T
(++T U
int++U X
personId++Y a
)++a b
{,, 	
try-- 
{.. 
MarriedPersonModel// "
returnEvent//# .
=/// 0
await//1 6
_marriageService//7 G
.//G H'
GetCurrentMarriageForPerson//H c
(//c d
personId//d l
)//l m
;//m n
if00 
(00 
returnEvent00 
==00  "
null00# '
)00' (
{11 
return22 
NotFound22 #
(22# $
)22$ %
;22% &
}33 
return44 
Ok44 
(44 
returnEvent44 %
)44% &
;44& '
}55 
catch66 
(66 
	Exception66 
e66 
)66 
{77 
return88 

BadRequest88 !
(88! "
e88" #
)88# $
;88$ %
}99 
}:: 	
[<< 	
HttpGet<<	 
]<< 
[== 	
Route==	 
(== 
$str== 
)== 
]== 
public>> 
async>> 
Task>> 
<>> 
ActionResult>> &
<>>& ' 
MarriageDetailsModel>>' ;
>>>; <
>>>< =
GetMarriage>>> I
(>>I J
int>>J M
id>>N P
)>>P Q
{?? 	
try@@ 
{AA  
MarriageDetailsModelBB $
returnEventBB% 0
=BB1 2
awaitBB3 8
_marriageServiceBB9 I
.BBI J
GetMarriageAsyncBBJ Z
(BBZ [
idBB[ ]
)BB] ^
;BB^ _
ifCC 
(CC 
returnEventCC 
==CC  "
nullCC# '
)CC' (
{DD 
returnEE 
NotFoundEE #
(EE# $
)EE$ %
;EE% &
}FF 
returnGG 
OkGG 
(GG 
returnEventGG %
)GG% &
;GG& '
}HH 
catchII 
(II 
	ExceptionII 
eII 
)II 
{JJ 
returnKK 

BadRequestKK !
(KK! "
eKK" #
)KK# $
;KK$ %
}LL 
}NN 	
[PP 	
HttpPostPP	 
]PP 
[QQ 	
RouteQQ	 
(QQ 
$strQQ 
)QQ 
]QQ 
publicRR 
asyncRR 
TaskRR 
<RR 
ActionResultRR &
<RR& ' 
MarriageDetailsModelRR' ;
>RR; <
>RR< =
AddMarriageRR> I
(RRI J%
MarriageCreateUpdateModelRRJ c
marriageRRd l
)RRl m
{SS 	
tryTT 
{UU  
MarriageDetailsModelVV $
returnEventVV% 0
=VV1 2
awaitVV3 8
_marriageServiceVV9 I
.VVI J
AddMarriageAsyncVVJ Z
(VVZ [
marriageVV[ c
)VVc d
;VVd e
returnWW 
OkWW 
(WW 
returnEventWW %
)WW% &
;WW& '
}XX 
catchYY 
(YY 
	ExceptionYY 
eYY 
)YY 
{ZZ 
return[[ 

BadRequest[[ !
([[! "
e[[" #
)[[# $
;[[$ %
}\\ 
}]] 	
[__ 	
HttpPut__	 
]__ 
[`` 	
Route``	 
(`` 
$str`` 
)`` 
]`` 
publicaa 
asyncaa 
Taskaa 
<aa 
ActionResultaa &
<aa& ' 
MarriageDetailsModelaa' ;
>aa; <
>aa< =
UpdateMarriageaa> L
(aaL M%
MarriageCreateUpdateModelaaM f
marriageaag o
)aao p
{bb 	
trycc 
{dd  
MarriageDetailsModelee $
returnEventee% 0
=ee1 2
awaitee3 8
_marriageServiceee9 I
.eeI J
UpdateMarriageAsynceeJ ]
(ee] ^
marriageee^ f
)eef g
;eeg h
returnff 
Okff 
(ff 
returnEventff %
)ff% &
;ff& '
}gg 
catchhh 
(hh 
	Exceptionhh 
ehh 
)hh 
{ii 
returnjj 

BadRequestjj !
(jj! "
ejj" #
)jj# $
;jj$ %
}kk 
}ll 	
[nn 	

HttpDeletenn	 
]nn 
[oo 	
Routeoo	 
(oo 
$stroo 
)oo 
]oo 
publicpp 
asyncpp 
Taskpp 
<pp 
ActionResultpp &
<pp& ' 
MarriageDetailsModelpp' ;
>pp; <
>pp< =
DeleteMarriagepp> L
(ppL M
intppM P
idppQ S
)ppS T
{qq 	
tryrr 
{ss  
MarriageDetailsModeltt $
returnEventtt% 0
=tt1 2
awaittt3 8
_marriageServicett9 I
.ttI J
DeleteMarriageAsyncttJ ]
(tt] ^
idtt^ `
)tt` a
;tta b
returnuu 
Okuu 
(uu 
returnEventuu %
)uu% &
;uu& '
}vv 
catchww 
(ww 
	Exceptionww 
eww 
)ww 
{xx 
returnyy 

BadRequestyy !
(yy! "
eyy" #
)yy# $
;yy$ %
}zz 
}{{ 	
}|| 
}}} Ω6
lE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Controllers\OccupationController.cs
	namespace		 	
GenealogyTree		
 
.		 
API		 
.		 
Controllers		 '
{

 
[ 
GeneTreeAuthorize 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class  
OccupationController %
:& '

Controller( 2
{ 
private 
readonly 
IOccupationService +
_occupationService, >
;> ?
public  
OccupationController #
(# $
IOccupationService$ 6
occupationService7 H
)H I
{ 	
_occupationService 
=  
occupationService! 2
;2 3
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
]  
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
OccupationModel, ;
>; <
>< =
>= >
GetUserOccupations? Q
(Q R
GuidR V
userIdW ]
)] ^
{ 	
try 
{ 
List 
< 
OccupationModel $
>$ %
returnEvent& 1
=2 3
await4 9
Task: >
.> ?
Run? B
(B C
(C D
)D E
=>F H
_occupationServiceI [
.[ \$
GetAllOccupationsForUser\ t
(t u
userIdu {
){ |
)| }
;} ~
if 
( 
returnEvent 
==  "
null# '
)' (
{ 
return 
NotFound #
(# $
)$ %
;% &
}   
return!! 
Ok!! 
(!! 
returnEvent!! %
)!!% &
;!!& '
}"" 
catch## 
(## 
	Exception## 
e## 
)## 
{$$ 
return%% 

BadRequest%% !
(%%! "
e%%" #
)%%# $
;%%$ %
}&& 
}'' 	
[)) 	
HttpGet))	 
])) 
[** 	
Route**	 
(** 
$str** 
)** 
]** 
public++ 
async++ 
Task++ 
<++ 
ActionResult++ &
<++& '
OccupationModel++' 6
>++6 7
>++7 8
GetOccupation++9 F
(++F G
int++G J
id++K M
)++M N
{,, 	
try-- 
{.. 
OccupationModel// 
returnEvent//  +
=//, -
await//. 3
_occupationService//4 F
.//F G
GetOccupationAsync//G Y
(//Y Z
id//Z \
)//\ ]
;//] ^
if00 
(00 
returnEvent00 
==00  "
null00# '
)00' (
{11 
return22 
NotFound22 #
(22# $
)22$ %
;22% &
}33 
return44 
Ok44 
(44 
returnEvent44 %
)44% &
;44& '
}55 
catch66 
(66 
	Exception66 
e66 
)66 
{77 
return88 

BadRequest88 !
(88! "
e88" #
)88# $
;88$ %
}99 
}:: 	
[<< 	
HttpPost<<	 
]<< 
[== 	
Route==	 
(== 
$str== 
)== 
]== 
public>> 
async>> 
Task>> 
<>> 
ActionResult>> &
<>>& '
OccupationModel>>' 6
>>>6 7
>>>7 8
AddOccupation>>9 F
(>>F G
OccupationModel>>G V

occupation>>W a
)>>a b
{?? 	
try@@ 
{AA 
OccupationModelBB 
returnEventBB  +
=BB, -
awaitBB. 3
_occupationServiceBB4 F
.BBF G
AddOccupationAsyncBBG Y
(BBY Z

occupationBBZ d
)BBd e
;BBe f
returnCC 
OkCC 
(CC 
returnEventCC %
)CC% &
;CC& '
}DD 
catchEE 
(EE 
	ExceptionEE 
eEE 
)EE 
{FF 
returnGG 

BadRequestGG !
(GG! "
eGG" #
)GG# $
;GG$ %
}HH 
}II 	
[KK 	
HttpPutKK	 
]KK 
[LL 	
RouteLL	 
(LL 
$strLL 
)LL 
]LL 
publicMM 
asyncMM 
TaskMM 
<MM 
ActionResultMM &
<MM& '
OccupationModelMM' 6
>MM6 7
>MM7 8
UpdateOccupationMM9 I
(MMI J
OccupationModelMMJ Y

occupationMMZ d
)MMd e
{NN 	
tryOO 
{PP 
OccupationModelQQ 
returnEventQQ  +
=QQ, -
awaitQQ. 3
_occupationServiceQQ4 F
.QQF G!
UpdateOccupationAsyncQQG \
(QQ\ ]

occupationQQ] g
)QQg h
;QQh i
returnRR 
OkRR 
(RR 
returnEventRR %
)RR% &
;RR& '
}SS 
catchTT 
(TT 
	ExceptionTT 
eTT 
)TT 
{UU 
returnVV 

BadRequestVV !
(VV! "
eVV" #
)VV# $
;VV$ %
}WW 
}XX 	
[ZZ 	

HttpDeleteZZ	 
]ZZ 
[[[ 	
Route[[	 
([[ 
$str[[ 
)[[ 
][[ 
public\\ 
async\\ 
Task\\ 
<\\ 
ActionResult\\ &
<\\& '
OccupationModel\\' 6
>\\6 7
>\\7 8
DeleteOccupation\\9 I
(\\I J
int\\J M
id\\N P
)\\P Q
{]] 	
try^^ 
{__ 
OccupationModel`` 
returnEvent``  +
=``, -
await``. 3
_occupationService``4 F
.``F G!
DeleteOccupationAsync``G \
(``\ ]
id``] _
)``_ `
;``` a
returnaa 
Okaa 
(aa 
returnEventaa %
)aa% &
;aa& '
}bb 
catchcc 
(cc 
	Exceptioncc 
ecc 
)cc 
{dd 
returnee 

BadRequestee !
(ee! "
eee" #
)ee# $
;ee$ %
}ff 
}gg 	
}hh 
}ii …X
mE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Controllers\ParentChildController.cs
	namespace

 	
GenealogyTree


 
.

 
API

 
.

 
Controllers

 '
{ 
[ 
GeneTreeAuthorize 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class !
ParentChildController &
:' (

Controller) 3
{ 
private 
readonly 
IParentChildService ,
_parentChildService- @
;@ A
public !
ParentChildController $
($ %
IParentChildService% 8
parentChildService9 K
)K L
{ 	
_parentChildService 
=  !
parentChildService" 4
;4 5
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str &
)& '
]' (
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
ParentChildModel, <
>< =
>= >
>> ?
GetAllParents@ M
(M N
intN Q
childIdR Y
)Y Z
{ 	
try 
{ 
List 
< 
ParentChildModel %
>% &
parents' .
=/ 0
await1 6
_parentChildService7 J
.J K"
GetAllParentsForPersonK a
(a b
childIdb i
)i j
;j k
if 
( 
parents 
== 
null #
)# $
{ 
return   
NotFound   #
(  # $
)  $ %
;  % &
}!! 
return"" 
Ok"" 
("" 
parents"" !
)""! "
;""" #
}## 
catch$$ 
($$ 
	Exception$$ 
e$$ 
)$$ 
{%% 
return&& 

BadRequest&& !
(&&! "
e&&" #
)&&# $
;&&$ %
}'' 
}(( 	
[** 	
HttpGet**	 
]** 
[++ 	
Route++	 
(++ 
$str++ (
)++( )
]++) *
public,, 
async,, 
Task,, 
<,, 
ActionResult,, &
<,,& '
List,,' +
<,,+ ,
ParentChildModel,,, <
>,,< =
>,,= >
>,,> ?
GetAllChildren,,@ N
(,,N O
int,,O R
parentId,,S [
),,[ \
{-- 	
try.. 
{// 
List00 
<00 
ParentChildModel00 %
>00% &
children00' /
=000 1
await002 7
_parentChildService008 K
.00K L#
GetAllChildrenForPerson00L c
(00c d
parentId00d l
)00l m
;00m n
if11 
(11 
children11 
==11 
null11  $
)11$ %
{22 
return33 
NotFound33 #
(33# $
)33$ %
;33% &
}44 
return55 
Ok55 
(55 
children55 "
)55" #
;55# $
}66 
catch77 
(77 
	Exception77 
e77 
)77 
{88 
return99 

BadRequest99 !
(99! "
e99" #
)99# $
;99$ %
}:: 
};; 	
[== 	
HttpGet==	 
]== 
[>> 	
Route>>	 
(>> 
$str>> 3
)>>3 4
]>>4 5
public?? 
async?? 
Task?? 
<?? 
ActionResult?? &
<??& '
List??' +
<??+ ,
GenericPersonModel??, >
>??> ?
>??? @
>??@ A"
GetParentSpouceOptions??B X
(??X Y
int??Y \
personId??] e
)??e f
{@@ 	
tryAA 
{BB 
ListCC 
<CC 
GenericPersonModelCC '
>CC' (
parentsCC) 0
=CC1 2
awaitCC3 8
_parentChildServiceCC9 L
.CCL M"
GetParentSpouceOptionsCCM c
(CCc d
personIdCCd l
)CCl m
;CCm n
ifDD 
(DD 
parentsDD 
==DD 
nullDD #
)DD# $
{EE 
returnFF 
NotFoundFF #
(FF# $
)FF$ %
;FF% &
}GG 
returnHH 
OkHH 
(HH 
parentsHH !
)HH! "
;HH" #
}II 
catchJJ 
(JJ 
	ExceptionJJ 
eJJ 
)JJ 
{KK 
returnLL 

BadRequestLL !
(LL! "
eLL" #
)LL# $
;LL$ %
}MM 
}NN 	
[QQ 	
HttpGetQQ	 
]QQ 
[RR 	
RouteRR	 
(RR 
$strRR /
)RR/ 0
]RR0 1
publicSS 
asyncSS 
TaskSS 
<SS 
ActionResultSS &
<SS& '
ListSS' +
<SS+ ,
GenericPersonModelSS, >
>SS> ?
>SS? @
>SS@ A
GetChildrenOptionsSSB T
(SST U
intSSU X
personIdSSY a
)SSa b
{TT 	
tryUU 
{VV 
ListWW 
<WW 
GenericPersonModelWW '
>WW' (
parentsWW) 0
=WW1 2
awaitWW3 8
_parentChildServiceWW9 L
.WWL M
GetChildrenOptionsWWM _
(WW_ `
personIdWW` h
)WWh i
;WWi j
ifXX 
(XX 
parentsXX 
==XX 
nullXX #
)XX# $
{YY 
returnZZ 
NotFoundZZ #
(ZZ# $
)ZZ$ %
;ZZ% &
}[[ 
return\\ 
Ok\\ 
(\\ 
parents\\ !
)\\! "
;\\" #
}]] 
catch^^ 
(^^ 
	Exception^^ 
e^^ 
)^^ 
{__ 
return`` 

BadRequest`` !
(``! "
e``" #
)``# $
;``$ %
}aa 
}bb 	
[dd 	
HttpGetdd	 
]dd 
[ee 	
Routeee	 
(ee 
$stree 
)ee 
]ee 
publicff 
asyncff 
Taskff 
<ff 
ActionResultff &
<ff& '#
ParentChildDetailsModelff' >
>ff> ?
>ff? @
GetParentChildffA O
(ffO P
intffP S
idffT V
)ffV W
{gg 	
tryhh 
{ii #
ParentChildDetailsModeljj '
returnEventjj( 3
=jj4 5
awaitjj6 ;
_parentChildServicejj< O
.jjO P
GetParentChildAsyncjjP c
(jjc d
idjjd f
)jjf g
;jjg h
ifkk 
(kk 
returnEventkk 
==kk  "
nullkk# '
)kk' (
{ll 
returnmm 
NotFoundmm #
(mm# $
)mm$ %
;mm% &
}nn 
returnoo 
Okoo 
(oo 
returnEventoo %
)oo% &
;oo& '
}pp 
catchqq 
(qq 
	Exceptionqq 
eqq 
)qq 
{rr 
returnss 

BadRequestss !
(ss! "
ess" #
)ss# $
;ss$ %
}tt 
}uu 	
[ww 	
HttpPostww	 
]ww 
[xx 	
Routexx	 
(xx 
$strxx 
)xx 
]xx 
publicyy 
asyncyy 
Taskyy 
<yy 
ActionResultyy &
<yy& '#
ParentChildDetailsModelyy' >
>yy> ?
>yy? @
AddParentChildyyA O
(yyO P(
ParentChildCreateUpdateModelyyP l
parentChildyym x
)yyx y
{zz 	
try{{ 
{|| #
ParentChildDetailsModel}} '
returnEvent}}( 3
=}}4 5
await}}6 ;
_parentChildService}}< O
.}}O P
AddParentChildAsync}}P c
(}}c d
parentChild}}d o
)}}o p
;}}p q
return~~ 
Ok~~ 
(~~ 
returnEvent~~ %
)~~% &
;~~& '
} 
catch
ÄÄ 
(
ÄÄ 
	Exception
ÄÄ 
e
ÄÄ 
)
ÄÄ 
{
ÅÅ 
return
ÇÇ 

BadRequest
ÇÇ !
(
ÇÇ! "
e
ÇÇ" #
)
ÇÇ# $
;
ÇÇ$ %
}
ÉÉ 
}
ÑÑ 	
[
ÜÜ 	
HttpPut
ÜÜ	 
]
ÜÜ 
[
áá 	
Route
áá	 
(
áá 
$str
áá 
)
áá 
]
áá 
public
àà 
async
àà 
Task
àà 
<
àà 
ActionResult
àà &
<
àà& '%
ParentChildDetailsModel
àà' >
>
àà> ?
>
àà? @ 
UpdateRelativeLink
ààA S
(
ààS T*
ParentChildCreateUpdateModel
ààT p
parentChild
ààq |
)
àà| }
{
ââ 	
try
ää 
{
ãã %
ParentChildDetailsModel
åå '
returnEvent
åå( 3
=
åå4 5
await
åå6 ;!
_parentChildService
åå< O
.
ååO P$
UpdateParentChildAsync
ååP f
(
ååf g
parentChild
ååg r
)
åår s
;
åås t
return
çç 
Ok
çç 
(
çç 
returnEvent
çç %
)
çç% &
;
çç& '
}
éé 
catch
èè 
(
èè 
	Exception
èè 
e
èè 
)
èè 
{
êê 
return
ëë 

BadRequest
ëë !
(
ëë! "
e
ëë" #
)
ëë# $
;
ëë$ %
}
íí 
}
ìì 	
[
ïï 	

HttpDelete
ïï	 
]
ïï 
[
ññ 	
Route
ññ	 
(
ññ 
$str
ññ 
)
ññ 
]
ññ 
public
óó 
async
óó 
Task
óó 
<
óó 
ActionResult
óó &
<
óó& '%
ParentChildDetailsModel
óó' >
>
óó> ?
>
óó? @ 
DeleteRelativeLink
óóA S
(
óóS T
int
óóT W
id
óóX Z
)
óóZ [
{
òò 	
try
ôô 
{
öö %
ParentChildDetailsModel
õõ '
returnEvent
õõ( 3
=
õõ4 5
await
õõ6 ;!
_parentChildService
õõ< O
.
õõO P$
DeleteParentChildAsync
õõP f
(
õõf g
id
õõg i
)
õõi j
;
õõj k
return
úú 
Ok
úú 
(
úú 
returnEvent
úú %
)
úú% &
;
úú& '
}
ùù 
catch
ûû 
(
ûû 
	Exception
ûû 
e
ûû 
)
ûû 
{
üü 
return
†† 

BadRequest
†† !
(
††! "
e
††" #
)
††# $
;
††$ %
}
°° 
}
¢¢ 	
}
££ 
}§§ èr
hE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Controllers\PersonController.cs
	namespace 	
GenealogyTree
 
. 
API 
. 
Controllers '
{ 
[ 
GeneTreeAuthorize 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
PersonController !
:" #

Controller$ .
{ 
private 
readonly 
IPersonService '
_personService( 6
;6 7
private 
readonly 
IImageService &
_imageService' 4
;4 5
public 
PersonController 
(  
IPersonService  .
personService/ <
,< =
IImageService> K
imageServiceL X
)X Y
{ 	
_personService 
= 
personService *
;* +
_imageService 
= 
imageService (
;( )
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str '
)' (
]( )
public   
async   
Task   
<   
ActionResult   &
<  & '
GenericPersonModel  ' 9
>  9 :
>  : ;
GetPeopleListInTree  < O
(  O P
Guid  P T
treeId  U [
)  [ \
{!! 	
try"" 
{## 
List$$ 
<$$ 
GenericPersonModel$$ '
>$$' (
returnEvent$$) 4
=$$5 6
await$$7 <
_personService$$= K
.$$K L
GetPeopleListInTree$$L _
($$_ `
treeId$$` f
)$$f g
;$$g h
if%% 
(%% 
returnEvent%% 
==%%  "
null%%# '
)%%' (
{&& 
return'' 
NotFound'' #
(''# $
)''$ %
;''% &
}(( 
return)) 
Ok)) 
()) 
returnEvent)) %
)))% &
;))& '
}** 
catch++ 
(++ 
	Exception++ 
e++ 
)++ 
{,, 
return-- 

BadRequest-- !
(--! "
e--" #
)--# $
;--$ %
}.. 
}// 	
[11 	
HttpGet11	 
]11 
[22 	
Route22	 
(22 
$str22 '
)22' (
]22( )
public33 
async33 
Task33 
<33 
ActionResult33 &
<33& '
PersonTreeInfoModel33' :
>33: ;
>33; <#
GetPeopleTreeDataInTree33= T
(33T U
Guid33U Y
treeId33Z `
)33` a
{44 	
try55 
{66 
List77 
<77 
PersonTreeInfoModel77 (
>77( )
returnEvent77* 5
=776 7
await778 =
_personService77> L
.77L M#
GetPeopleTreeDataInTree77M d
(77d e
treeId77e k
)77k l
;77l m
if88 
(88 
returnEvent88 
==88  "
null88# '
)88' (
{99 
return:: 
NotFound:: #
(::# $
)::$ %
;::% &
};; 
return<< 
Ok<< 
(<< 
returnEvent<< %
)<<% &
;<<& '
}== 
catch>> 
(>> 
	Exception>> 
e>> 
)>> 
{?? 
return@@ 

BadRequest@@ !
(@@! "
e@@" #
)@@# $
;@@$ %
}AA 
}BB 	
[DD 	
HttpGetDD	 
]DD 
[EE 	
RouteEE	 
(EE 
$strEE %
)EE% &
]EE& '
publicFF 
asyncFF 
TaskFF 
<FF 
ActionResultFF &
<FF& '
EventInTreeModelFF' 7
>FF7 8
>FF8 9
GetEventsInTreeFF: I
(FFI J
GuidFFJ N
treeIdFFO U
)FFU V
{GG 	
tryHH 
{II 
ListJJ 
<JJ 
EventInTreeModelJJ %
>JJ% &
returnEventJJ' 2
=JJ3 4
awaitJJ5 :
_personServiceJJ; I
.JJI J
GetEventsInTreeJJJ Y
(JJY Z
treeIdJJZ `
)JJ` a
;JJa b
ifKK 
(KK 
returnEventKK 
==KK  "
nullKK# '
)KK' (
{LL 
returnMM 
NotFoundMM #
(MM# $
)MM$ %
;MM% &
}NN 
returnOO 
OkOO 
(OO 
returnEventOO %
)OO% &
;OO& '
}PP 
catchQQ 
(QQ 
	ExceptionQQ 
eQQ 
)QQ 
{RR 
returnSS 

BadRequestSS !
(SS! "
eSS" #
)SS# $
;SS$ %
}TT 
}UU 	
[WW 	
HttpGetWW	 
]WW 
[XX 	
RouteXX	 
(XX 
$strXX .
)XX. /
]XX/ 0
publicYY 
asyncYY 
TaskYY 
<YY 
ActionResultYY &
<YY& '
PersonTreeInfoModelYY' :
>YY: ;
>YY; <$
GetPeopleWithoutRelativeYY= U
(YYU V
GuidYYV Z
treeIdYY[ a
)YYa b
{ZZ 	
try[[ 
{\\ 
List]] 
<]] 
GenericPersonModel]] '
>]]' (
returnEvent]]) 4
=]]5 6
await]]7 <
_personService]]= K
.]]K L$
GetPeopleWithoutRelative]]L d
(]]d e
treeId]]e k
)]]k l
;]]l m
if^^ 
(^^ 
returnEvent^^ 
==^^  "
null^^# '
)^^' (
{__ 
return`` 
NotFound`` #
(``# $
)``$ %
;``% &
}aa 
returnbb 
Okbb 
(bb 
returnEventbb %
)bb% &
;bb& '
}cc 
catchdd 
(dd 
	Exceptiondd 
edd 
)dd 
{ee 
returnff 

BadRequestff !
(ff! "
eff" #
)ff# $
;ff$ %
}gg 
}hh 	
[jj 	
HttpGetjj	 
]jj 
[kk 	
Routekk	 
(kk 
$strkk 
)kk 
]kk 
publicll 
asyncll 
Taskll 
<ll 
ActionResultll &
<ll& '
PersonDetailsModelll' 9
>ll9 :
>ll: ;
GetPersonDetailsll< L
(llL M
intllM P
idllQ S
)llS T
{mm 	
trynn 
{oo 
PersonDetailsModelpp "
returnEventpp# .
=pp/ 0
awaitpp1 6
_personServicepp7 E
.ppE F
GetPersonAsyncppF T
(ppT U
idppU W
)ppW X
;ppX Y
ifqq 
(qq 
returnEventqq 
==qq  "
nullqq# '
)qq' (
{rr 
returnss 
NotFoundss #
(ss# $
)ss$ %
;ss% &
}tt 
returnuu 
Okuu 
(uu 
returnEventuu %
)uu% &
;uu& '
}vv 
catchww 
(ww 
	Exceptionww 
eww 
)ww 
{xx 
returnyy 

BadRequestyy !
(yy! "
eyy" #
)yy# $
;yy$ %
}zz 
}{{ 	
[}} 	
HttpPost}}	 
]}} 
[~~ 	
Route~~	 
(~~ 
$str~~ 
)~~ 
]~~ 
public 
async 
Task 
< 
ActionResult &
<& '
PersonDetailsModel' 9
>9 :
>: ;
	AddPerson< E
(E F
[F G
FromBodyG O
]O P#
PersonCreateUpdateModelQ h
personi o
)o p
{
ÄÄ 	
try
ÅÅ 
{
ÇÇ  
PersonDetailsModel
ÉÉ "
returnEvent
ÉÉ# .
=
ÉÉ/ 0
await
ÉÉ1 6
_personService
ÉÉ7 E
.
ÉÉE F
AddPersonAsync
ÉÉF T
(
ÉÉT U
person
ÉÉU [
)
ÉÉ[ \
;
ÉÉ\ ]
return
ÑÑ 
Ok
ÑÑ 
(
ÑÑ 
returnEvent
ÑÑ %
)
ÑÑ% &
;
ÑÑ& '
}
ÖÖ 
catch
ÜÜ 
(
ÜÜ 
	Exception
ÜÜ 
e
ÜÜ 
)
ÜÜ 
{
áá 
return
àà 

BadRequest
àà !
(
àà! "
e
àà" #
)
àà# $
;
àà$ %
}
ââ 
}
ää 	
[
åå 	
HttpPut
åå	 
]
åå 
[
çç 	
Route
çç	 
(
çç 
$str
çç 
)
çç 
]
çç 
public
éé 
async
éé 
Task
éé 
<
éé 
ActionResult
éé &
<
éé& ' 
PersonDetailsModel
éé' 9
>
éé9 :
>
éé: ;
UpdatePerson
éé< H
(
ééH I%
PersonCreateUpdateModel
ééI `
person
ééa g
)
éég h
{
èè 	
try
êê 
{
ëë  
PersonDetailsModel
íí "
returnEvent
íí# .
=
íí/ 0
await
íí1 6
_personService
íí7 E
.
ííE F
UpdatePersonAsync
ííF W
(
ííW X
person
ííX ^
)
íí^ _
;
íí_ `
return
ìì 
Ok
ìì 
(
ìì 
returnEvent
ìì %
)
ìì% &
;
ìì& '
}
îî 
catch
ïï 
(
ïï 
	Exception
ïï 
e
ïï 
)
ïï 
{
ññ 
return
óó 

BadRequest
óó !
(
óó! "
e
óó" #
)
óó# $
;
óó$ %
}
òò 
}
ôô 	
[
õõ 	

HttpDelete
õõ	 
]
õõ 
[
úú 	
Route
úú	 
(
úú 
$str
úú 
)
úú 
]
úú 
public
ùù 
async
ùù 
Task
ùù 
<
ùù 
ActionResult
ùù &
<
ùù& ' 
PersonDetailsModel
ùù' 9
>
ùù9 :
>
ùù: ;
DeletePerson
ùù< H
(
ùùH I
int
ùùI L
id
ùùM O
)
ùùO P
{
ûû 	
try
üü 
{
††  
PersonDetailsModel
°° "
returnEvent
°°# .
=
°°/ 0
await
°°1 6
_personService
°°7 E
.
°°E F
DeletePersonAsync
°°F W
(
°°W X
id
°°X Z
)
°°Z [
;
°°[ \
return
¢¢ 
Ok
¢¢ 
(
¢¢ 
returnEvent
¢¢ %
)
¢¢% &
;
¢¢& '
}
££ 
catch
§§ 
(
§§ 
	Exception
§§ 
e
§§ 
)
§§ 
{
•• 
return
¶¶ 

BadRequest
¶¶ !
(
¶¶! "
e
¶¶" #
)
¶¶# $
;
¶¶$ %
}
ßß 
}
®® 	
[
™™ 	
HttpPost
™™	 
]
™™ 
[
´´ 	
Route
´´	 
(
´´ 
$str
´´ %
)
´´% &
]
´´& '
public
¨¨ 
async
¨¨ 
Task
¨¨ 
<
¨¨ 
ActionResult
¨¨ &
<
¨¨& '
	ImageFile
¨¨' 0
>
¨¨0 1
>
¨¨1 2
UploadPhoto
¨¨3 >
(
¨¨> ?
int
¨¨? B
personId
¨¨C K
,
¨¨K L
[
¨¨M N
Required
¨¨N V
]
¨¨V W
[
¨¨W X
FromForm
¨¨X `
]
¨¨` a
[
¨¨a b
MaxImageSize
¨¨b n
(
¨¨n o
$num
¨¨o p
*
¨¨q r
$num
¨¨s w
)
¨¨w x
]
¨¨x y
	IFormFile¨¨z É
image¨¨Ñ â
)¨¨â ä
{
≠≠ 	
try
ÆÆ 
{
ØØ 
Image
∞∞ 
createdImage
∞∞ "
=
∞∞# $
await
∞∞% *
_imageService
∞∞+ 8
.
∞∞8 9
AddImageAsync
∞∞9 F
(
∞∞F G
image
∞∞G L
.
∞∞L M
ToImageFile
∞∞M X
(
∞∞X Y
)
∞∞Y Z
)
∞∞Z [
;
∞∞[ \
	ImageFile
±± 
	imageFile
±± #
=
±±$ %
await
±±& +
_personService
±±, :
.
±±: ; 
UpdatePictureAsync
±±; M
(
±±M N
personId
±±N V
,
±±V W
createdImage
±±X d
.
±±d e
Id
±±e g
)
±±g h
;
±±h i
return
≤≤ 
Ok
≤≤ 
(
≤≤ 
	imageFile
≤≤ #
)
≤≤# $
;
≤≤$ %
}
≥≥ 
catch
¥¥ 
(
¥¥ 
	Exception
¥¥ 
e
¥¥ 
)
¥¥ 
{
µµ 
return
∂∂ 

BadRequest
∂∂ !
(
∂∂! "
e
∂∂" #
)
∂∂# $
;
∂∂$ %
}
∑∑ 
}
∏∏ 	
[
∫∫ 	
HttpPut
∫∫	 
]
∫∫ 
[
ªª 	
Route
ªª	 
(
ªª 
$str
ªª 
)
ªª 
]
ªª 
public
ºº 
async
ºº 
Task
ºº 
<
ºº 
ActionResult
ºº &
<
ºº& '
	ImageFile
ºº' 0
>
ºº0 1
>
ºº1 2
UpdatePhoto
ºº3 >
(
ºº> ?
[
ºº? @
	FromQuery
ºº@ I
]
ººI J
int
ººK N
personId
ººO W
,
ººW X
[
ººY Z
	FromQuery
ººZ c
]
ººc d
int
ººe h
imageId
ººi p
)
ººp q
{
ΩΩ 	
try
ææ 
{
øø 
	ImageFile
¿¿ 
	imageFile
¿¿ #
=
¿¿$ %
await
¿¿& +
_personService
¿¿, :
.
¿¿: ; 
UpdatePictureAsync
¿¿; M
(
¿¿M N
personId
¿¿N V
,
¿¿V W
imageId
¿¿X _
)
¿¿_ `
;
¿¿` a
return
¡¡ 
Ok
¡¡ 
(
¡¡ 
	imageFile
¡¡ #
)
¡¡# $
;
¡¡$ %
}
¬¬ 
catch
√√ 
(
√√ 
	Exception
√√ 
e
√√ 
)
√√ 
{
ƒƒ 
return
≈≈ 

BadRequest
≈≈ !
(
≈≈! "
e
≈≈" #
)
≈≈# $
;
≈≈$ %
}
∆∆ 
}
«« 	
}
»» 
}…… òÖ
jE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Controllers\RelativeController.cs
	namespace 	
GenealogyTree
 
. 
API 
. 
Controllers '
{ 
[ 
GeneTreeAuthorize 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
RelativeController #
:$ %

Controller& 0
{ 
private 
readonly 
IRelativeService )
_relativeService* :
;: ;
private 
readonly 
IRequestService (
_requestService) 8
;8 9
public 
RelativeController !
(! "
IRelativeService" 2
relativeService3 B
,B C
IRequestServiceD S
requestServiceT b
)b c
{ 	
_relativeService 
= 
relativeService .
;. /
_requestService 
= 
requestService ,
;, -
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
]  
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
RelativeModel, 9
>9 :
>: ;
>; <
GetRelativesForUser= P
(P Q
GuidQ U
userIdV \
)\ ]
{ 	
try   
{!! 
List"" 
<"" 
RelativeModel"" "
>""" #
returnEvent""$ /
=""0 1
await""2 7
_relativeService""8 H
.""H I"
GetAllRelativesForUser""I _
(""_ `
userId""` f
)""f g
;""g h
if## 
(## 
returnEvent## 
==##  "
null### '
)##' (
{$$ 
return%% 
NotFound%% #
(%%# $
)%%$ %
;%%% &
}&& 
return'' 
Ok'' 
('' 
returnEvent'' %
)''% &
;''& '
}(( 
catch)) 
()) 
	Exception)) 
e)) 
))) 
{** 
return++ 

BadRequest++ !
(++! "
e++" #
)++# $
;++$ %
},, 
}-- 	
[// 	
HttpGet//	 
]// 
[00 	
Route00	 
(00 
$str00 $
)00$ %
]00% &
public11 
async11 
Task11 
<11 
ActionResult11 &
<11& '
RelativeState11' 4
>114 5
>115 6!
CanAddRelativeForUser117 L
(11L M
Guid11M Q
userId11R X
,11X Y
[11Z [
	FromQuery11[ d
]11d e
Guid11f j

relativeId11k u
)11u v
{22 	
try33 
{44 
RelativeState55 
canAdd55 $
=55% &
await55' ,
_relativeService55- =
.55= >
CheckRelative55> K
(55K L
userId55L R
,55R S

relativeId55T ^
)55^ _
;55_ `
return77 
Ok77 
(77 
canAdd77  
)77  !
;77! "
}88 
catch99 
(99 
	Exception99 
e99 
)99 
{:: 
return;; 

BadRequest;; !
(;;! "
e;;" #
);;# $
;;;$ %
}<< 
}== 	
[?? 	
HttpPut??	 
]?? 
[@@ 	
Route@@	 
(@@ 
$str@@ -
)@@- .
]@@. /
publicAA 
asyncAA 
TaskAA 
<AA 
ActionResultAA &
<AA& '
RelativeStateAA' 4
>AA4 5
>AA5 6"
MarkChangesForRelativeAA7 M
(AAM N
intAAN Q

relativeIdAAR \
)AA\ ]
{BB 	
tryCC 
{DD 
RelativeModelEE 
relativeEE &
=EE' (
awaitEE) .
_relativeServiceEE/ ?
.EE? @
MarkChangesEE@ K
(EEK L

relativeIdEEL V
)EEV W
;EEW X
ifFF 
(FF 
relativeFF 
==FF 
nullFF  $
)FF$ %
{GG 
returnHH 
NotFoundHH #
(HH# $
)HH$ %
;HH% &
}II 
returnJJ 
OkJJ 
(JJ 
relativeJJ "
)JJ" #
;JJ# $
}KK 
catchLL 
(LL 
	ExceptionLL 
eLL 
)LL 
{MM 
returnNN 

BadRequestNN !
(NN! "
eNN" #
)NN# $
;NN$ %
}OO 
}PP 	
[RR 	
HttpPostRR	 
]RR 
[SS 	
RouteSS	 
(SS 
$strSS 
)SS 
]SS 
publicTT 
asyncTT 
TaskTT 
<TT 
ActionResultTT &
<TT& '
UsersToLinkModelTT' 7
>TT7 8
>TT8 9
UserRespondedTT: G
(TTG H
UsersToLinkModelTTH X
usersToLinkTTY d
)TTd e
{UU 	
tryVV 
{WW 
RelativeModelXX 
returnEventXX )
=XX* +
awaitXX, 1
_relativeServiceXX2 B
.XXB C
AddRelativeUserXXC R
(XXR S
usersToLinkXXS ^
)XX^ _
;XX_ `
returnYY 
OkYY 
(YY 
returnEventYY %
)YY% &
;YY& '
}ZZ 
catch[[ 
([[ 
	Exception[[ 
e[[ 
)[[ 
{\\ 
return]] 

BadRequest]] !
(]]! "
e]]" #
)]]# $
;]]$ %
}^^ 
}__ 	
[aa 	

HttpDeleteaa	 
]aa 
[bb 	
Routebb	 
(bb 
$strbb 
)bb 
]bb 
publiccc 
asynccc 
Taskcc 
<cc 
ActionResultcc &
<cc& '
RelativeModelcc' 4
>cc4 5
>cc5 6
RemoveRelativecc7 E
(ccE F
intccF I
idccJ L
)ccL M
{dd 	
tryee 
{ff 
RelativeModelgg 
returnEventgg )
=gg* +
awaitgg, 1
_relativeServicegg2 B
.ggB C
DeleteRelativeggC Q
(ggQ R
idggR T
)ggT U
;ggU V
returnhh 
Okhh 
(hh 
returnEventhh %
)hh% &
;hh& '
}ii 
catchjj 
(jj 
	Exceptionjj 
ejj 
)jj 
{kk 
returnll 

BadRequestll !
(ll! "
ell" #
)ll# $
;ll$ %
}mm 
}nn 	
[pp 	
HttpGetpp	 
]pp 
[qq 	
Routeqq	 
(qq 
$strqq +
)qq+ ,
]qq, -
publicrr 
asyncrr 
Taskrr 
<rr 
ActionResultrr &
<rr& '
Listrr' +
<rr+ ,
RequestDetailsModelrr, ?
>rr? @
>rr@ A
>rrA B
RequestsSentrrC O
(rrO P
GuidrrP T
userIdrrU [
)rr[ \
{ss 	
trytt 
{uu 
Listvv 
<vv 
RequestDetailsModelvv (
>vv( )
returnEventvv* 5
=vv6 7
awaitvv8 =
_requestServicevv> M
.vvM N
GetRequestsSentvvN ]
(vv] ^
userIdvv^ d
)vvd e
;vve f
ifww 
(ww 
returnEventww 
==ww  "
nullww# '
)ww' (
{xx 
returnyy 
NotFoundyy #
(yy# $
)yy$ %
;yy% &
}zz 
return{{ 
Ok{{ 
({{ 
returnEvent{{ %
){{% &
;{{& '
}|| 
catch}} 
(}} 
	Exception}} 
e}} 
)}} 
{~~ 
return 

BadRequest !
(! "
e" #
)# $
;$ %
}
ÄÄ 
}
ÅÅ 	
[
ÉÉ 	
HttpGet
ÉÉ	 
]
ÉÉ 
[
ÑÑ 	
Route
ÑÑ	 
(
ÑÑ 
$str
ÑÑ /
)
ÑÑ/ 0
]
ÑÑ0 1
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
ActionResult
ÖÖ &
<
ÖÖ& '
List
ÖÖ' +
<
ÖÖ+ ,!
RequestDetailsModel
ÖÖ, ?
>
ÖÖ? @
>
ÖÖ@ A
>
ÖÖA B
RequestsReceived
ÖÖC S
(
ÖÖS T
Guid
ÖÖT X
userId
ÖÖY _
)
ÖÖ_ `
{
ÜÜ 	
try
áá 
{
àà 
List
ââ 
<
ââ !
RequestDetailsModel
ââ (
>
ââ( )
returnEvent
ââ* 5
=
ââ6 7
await
ââ8 =
_requestService
ââ> M
.
ââM N!
GetRequestsReceived
ââN a
(
ââa b
userId
ââb h
)
ââh i
;
ââi j
if
ää 
(
ää 
returnEvent
ää 
==
ää  "
null
ää# '
)
ää' (
{
ãã 
return
åå 
NotFound
åå #
(
åå# $
)
åå$ %
;
åå% &
}
çç 
return
éé 
Ok
éé 
(
éé 
returnEvent
éé %
)
éé% &
;
éé& '
}
èè 
catch
êê 
(
êê 
	Exception
êê 
e
êê 
)
êê 
{
ëë 
return
íí 

BadRequest
íí !
(
íí! "
e
íí" #
)
íí# $
;
íí$ %
}
ìì 
}
îî 	
[
ññ 	
HttpGet
ññ	 
]
ññ 
[
óó 	
Route
óó	 
(
óó 
$str
óó 0
)
óó0 1
]
óó1 2
public
òò 
async
òò 
Task
òò 
<
òò 
ActionResult
òò &
<
òò& '
List
òò' +
<
òò+ ,"
RequestResponseModel
òò, @
>
òò@ A
>
òòA B
>
òòB C
RequestsResponded
òòD U
(
òòU V
Guid
òòV Z
userId
òò[ a
)
òòa b
{
ôô 	
try
öö 
{
õõ 
List
úú 
<
úú "
RequestResponseModel
úú )
>
úú) *
returnEvent
úú+ 6
=
úú7 8
await
úú9 >
_requestService
úú? N
.
úúN O"
GetRequestsResponded
úúO c
(
úúc d
userId
úúd j
)
úúj k
;
úúk l
if
ùù 
(
ùù 
returnEvent
ùù 
==
ùù  "
null
ùù# '
)
ùù' (
{
ûû 
return
üü 
NotFound
üü #
(
üü# $
)
üü$ %
;
üü% &
}
†† 
return
°° 
Ok
°° 
(
°° 
returnEvent
°° %
)
°°% &
;
°°& '
}
¢¢ 
catch
££ 
(
££ 
	Exception
££ 
e
££ 
)
££ 
{
§§ 
return
•• 

BadRequest
•• !
(
••! "
e
••" #
)
••# $
;
••$ %
}
¶¶ 
}
ßß 	
[
©© 	
HttpPost
©©	 
]
©© 
[
™™ 	
Route
™™	 
(
™™ 
$str
™™ 
)
™™ 
]
™™ 
public
´´ 
async
´´ 
Task
´´ 
<
´´ 
ActionResult
´´ &
<
´´& '&
RequestCreateUpdateModel
´´' ?
>
´´? @
>
´´@ A
SendRequest
´´B M
(
´´M N&
RequestCreateUpdateModel
´´N f
request
´´g n
)
´´n o
{
¨¨ 	
try
≠≠ 
{
ÆÆ &
RequestCreateUpdateModel
ØØ (
returnEvent
ØØ) 4
=
ØØ5 6
await
ØØ7 <
_requestService
ØØ= L
.
ØØL M

AddRequest
ØØM W
(
ØØW X
request
ØØX _
)
ØØ_ `
;
ØØ` a
if
∞∞ 
(
∞∞ 
returnEvent
∞∞ 
==
∞∞  "
null
∞∞# '
)
∞∞' (
{
±± 
return
≤≤ 
NotFound
≤≤ #
(
≤≤# $
)
≤≤$ %
;
≤≤% &
}
≥≥ 
return
¥¥ 
Ok
¥¥ 
(
¥¥ 
returnEvent
¥¥ %
)
¥¥% &
;
¥¥& '
}
µµ 
catch
∂∂ 
(
∂∂ 
	Exception
∂∂ 
e
∂∂ 
)
∂∂ 
{
∑∑ 
return
∏∏ 

BadRequest
∏∏ !
(
∏∏! "
e
∏∏" #
)
∏∏# $
;
∏∏$ %
}
ππ 
}
∫∫ 	
[
ºº 	
HttpPut
ºº	 
]
ºº 
[
ΩΩ 	
Route
ΩΩ	 
(
ΩΩ 
$str
ΩΩ !
)
ΩΩ! "
]
ΩΩ" #
public
ææ 
async
ææ 
Task
ææ 
<
ææ 
ActionResult
ææ &
<
ææ& '
UsersToLinkModel
ææ' 7
>
ææ7 8
>
ææ8 9
RespondToRequest
ææ: J
(
ææJ K
int
ææK N
id
ææO Q
,
ææQ R"
RequestResponseModel
ææS g
request
ææh o
)
ææo p
{
øø 	
try
¿¿ 
{
¡¡ 
UsersToLinkModel
¬¬  
returnEvent
¬¬! ,
=
¬¬- .
await
¬¬/ 4
_requestService
¬¬5 D
.
¬¬D E
RespondToRequest
¬¬E U
(
¬¬U V
id
¬¬V X
,
¬¬X Y
request
¬¬Z a
)
¬¬a b
;
¬¬b c
return
√√ 
Ok
√√ 
(
√√ 
returnEvent
√√ %
)
√√% &
;
√√& '
}
ƒƒ 
catch
≈≈ 
(
≈≈ 
	Exception
≈≈ 
e
≈≈ 
)
≈≈ 
{
∆∆ 
return
«« 

BadRequest
«« !
(
««! "
e
««" #
)
««# $
;
««$ %
}
»» 
}
…… 	
[
ÀÀ 	

HttpDelete
ÀÀ	 
]
ÀÀ 
[
ÃÃ 	
Route
ÃÃ	 
(
ÃÃ 
$str
ÃÃ !
)
ÃÃ! "
]
ÃÃ" #
public
ÕÕ 
async
ÕÕ 
Task
ÕÕ 
<
ÕÕ 
ActionResult
ÕÕ &
<
ÕÕ& '!
RequestDetailsModel
ÕÕ' :
>
ÕÕ: ;
>
ÕÕ; <
RemoveRequest
ÕÕ= J
(
ÕÕJ K
int
ÕÕK N
id
ÕÕO Q
)
ÕÕQ R
{
ŒŒ 	
try
œœ 
{
–– !
RequestDetailsModel
—— #
returnEvent
——$ /
=
——0 1
await
——2 7
_requestService
——8 G
.
——G H
DeleteRequest
——H U
(
——U V
id
——V X
)
——X Y
;
——Y Z
return
““ 
Ok
““ 
(
““ 
returnEvent
““ %
)
““% &
;
““& '
}
”” 
catch
‘‘ 
(
‘‘ 
	Exception
‘‘ 
e
‘‘ 
)
‘‘ 
{
’’ 
return
÷÷ 

BadRequest
÷÷ !
(
÷÷! "
e
÷÷" #
)
÷÷# $
;
÷÷$ %
}
◊◊ 
}
ÿÿ 	
[
€€ 	
HttpGet
€€	 
]
€€ 
[
‹‹ 	
Route
‹‹	 
(
‹‹ 
$str
‹‹ '
)
‹‹' (
]
‹‹( )
public
›› 
async
›› 
Task
›› 
<
›› 
ActionResult
›› &
<
››& '
List
››' +
<
››+ ,
UserPositionModel
››, =
>
››= >
>
››> ?
>
››? @
RelativesPosition
››A R
(
››R S
Guid
››S W
userId
››X ^
)
››^ _
{
ﬁﬁ 	
try
ﬂﬂ 
{
‡‡ 
List
·· 
<
·· 
UserPositionModel
·· &
>
··& '
returnEvent
··( 3
=
··4 5
await
··6 ;
_relativeService
··< L
.
··L M"
GetRelativesPosition
··M a
(
··a b
userId
··b h
)
··h i
;
··i j
if
‚‚ 
(
‚‚ 
returnEvent
‚‚ 
==
‚‚  "
null
‚‚# '
)
‚‚' (
{
„„ 
return
‰‰ 
NotFound
‰‰ #
(
‰‰# $
)
‰‰$ %
;
‰‰% &
}
ÂÂ 
return
ÊÊ 
Ok
ÊÊ 
(
ÊÊ 
returnEvent
ÊÊ %
)
ÊÊ% &
;
ÊÊ& '
}
ÁÁ 
catch
ËË 
(
ËË 
	Exception
ËË 
e
ËË 
)
ËË 
{
ÈÈ 
return
ÍÍ 

BadRequest
ÍÍ !
(
ÍÍ! "
e
ÍÍ" #
)
ÍÍ# $
;
ÍÍ$ %
}
ÎÎ 
}
ÏÏ 	
}
ÌÌ 
}ÓÓ ”å
fE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Controllers\UserController.cs
	namespace 	
GenealogyTree
 
. 
API 
. 
Controllers '
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
UserController 
:  !

Controller" ,
{ 
private 
readonly 
IUserService %
_userService& 2
;2 3
private 
readonly 
IEmailService &
_emailService' 4
;4 5
public 
UserController 
( 
IUserService *
userService+ 6
,6 7
IEmailService8 E
emailServiceF R
)R S
{ 	
_userService 
= 
userService &
;& '
_emailService 
= 
emailService (
;( )
} 	
[ 	
GeneTreeAuthorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 1
)1 2
]2 3
public 
async 
Task 
< 
ActionResult &
<& '
bool' +
>+ ,
>, -!
GetNotificationsCount. C
(C D
GuidD H
userIdI O
)O P
{ 	
try 
{   
int!! 
notificationsCount!! &
=!!' (
await!!) .
_userService!!/ ;
.!!; <!
GetNotificationsCount!!< Q
(!!Q R
userId!!R X
)!!X Y
;!!Y Z
return"" 
Ok"" 
("" 
notificationsCount"" ,
)"", -
;""- .
}## 
catch$$ 
($$ 
	Exception$$ 
e$$ 
)$$ 
{%% 
return&& 

BadRequest&& !
(&&! "
e&&" #
)&&# $
;&&$ %
}'' 
}(( 	
[** 	
GeneTreeAuthorize**	 
]** 
[++ 	
HttpGet++	 
]++ 
[,, 	
Route,,	 
(,, 
$str,, ,
),,, -
],,- .
public-- 
async-- 
Task-- 
<-- 
ActionResult-- &
>--& '
GetNotifications--( 8
(--8 9
Guid--9 =
userId--> D
)--D E
{.. 	
try// 
{00 
NotificationsBundle11 #
notifications11$ 1
=112 3
await114 9
_userService11: F
.11F G
GetNotifications11G W
(11W X
userId11X ^
)11^ _
;11_ `
return22 
Ok22 
(22 
notifications22 '
)22' (
;22( )
}33 
catch44 
(44 
	Exception44 
e44 
)44 
{55 
return66 

BadRequest66 !
(66! "
e66" #
)66# $
;66$ %
}77 
}88 	
[:: 	
HttpGet::	 
]:: 
[;; 	
Route;;	 
(;; 
$str;; 
);; 
];; 
public<< 
async<< 
Task<< 
<<< 
ActionResult<< &
<<<& '
bool<<' +
><<+ ,
><<, -
CheckUsername<<. ;
(<<; <
[<<< =
	FromQuery<<= F
]<<F G 
InfiniteScrollFilter<<H \
filter<<] c
)<<c d
{== 	
try>> 
{?? 

UsersFound@@ 

usersFound@@ %
=@@& '
await@@( -
_userService@@. :
.@@: ;
	FindUsers@@; D
(@@D E
filter@@E K
)@@K L
;@@L M
returnAA 
OkAA 
(AA 

usersFoundAA $
)AA$ %
;AA% &
}BB 
catchCC 
(CC 
	ExceptionCC 
eCC 
)CC 
{DD 
returnEE 

BadRequestEE !
(EE! "
eEE" #
)EE# $
;EE$ %
}FF 
}HH 	
[II 	
HttpGetII	 
]II 
[JJ 	
RouteJJ	 
(JJ 
$strJJ -
)JJ- .
]JJ. /
publicKK 
asyncKK 
TaskKK 
<KK 
ActionResultKK &
<KK& '
boolKK' +
>KK+ ,
>KK, -
CheckUsernameKK. ;
(KK; <
stringKK< B
usernameKKC K
)KKK L
{LL 	
tryMM 
{NN 
boolOO 
isAvailableOO  
=OO! "
awaitOO# (
_userServiceOO) 5
.OO5 6"
CheckUsernameAvailableOO6 L
(OOL M
usernameOOM U
)OOU V
;OOV W
returnPP 
OkPP 
(PP 
isAvailablePP %
)PP% &
;PP& '
}QQ 
catchRR 
(RR 
	ExceptionRR 
eRR 
)RR 
{SS 
returnTT 

BadRequestTT !
(TT! "
eTT" #
)TT# $
;TT$ %
}UU 
}VV 	
[XX 	
HttpGetXX	 
]XX 
[YY 	
RouteYY	 
(YY 
$strYY '
)YY' (
]YY( )
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
ActionResultZZ &
<ZZ& '
UserDetailsModelZZ' 7
>ZZ7 8
>ZZ8 9

CheckEmailZZ: D
(ZZD E
stringZZE K
emailZZL Q
)ZZQ R
{[[ 	
try\\ 
{]] 
bool^^ 
isAvailable^^  
=^^! "
await^^# (
_userService^^) 5
.^^5 6
CheckEmailAvailable^^6 I
(^^I J
email^^J O
)^^O P
;^^P Q
return__ 
Ok__ 
(__ 
isAvailable__ %
)__% &
;__& '
}`` 
catchaa 
(aa 
	Exceptionaa 
eaa 
)aa 
{bb 
returncc 

BadRequestcc !
(cc! "
ecc" #
)cc# $
;cc$ %
}dd 
}ee 	
[gg 	
HttpPostgg	 
]gg 
[hh 	
Routehh	 
(hh 
$strhh 
)hh 
]hh 
publicii 
asyncii 
Taskii 
<ii 
ActionResultii &
<ii& '
boolii' +
>ii+ ,
>ii, -
SendSupportTicketii. ?
(ii? @
SupportTicketii@ M
supportTicketiiN [
)ii[ \
{jj 	
trykk 
{ll 
awaitmm 
_emailServicemm #
.mm# $
SendSupportTicketmm$ 5
(mm5 6
supportTicketmm6 C
)mmC D
;mmD E
returnnn 
Oknn 
(nn 
truenn 
)nn 
;nn  
}oo 
catchpp 
(pp 
	Exceptionpp 
epp 
)pp 
{qq 
returnrr 

BadRequestrr !
(rr! "
err" #
)rr# $
;rr$ %
}ss 
}tt 	
[vv 	
GeneTreeAuthorizevv	 
]vv 
[ww 	
HttpGetww	 
]ww 
[xx 	
Routexx	 
(xx 
$strxx  
)xx  !
]xx! "
publicyy 
asyncyy 
Taskyy 
<yy 
ActionResultyy &
<yy& '
UserDetailsModelyy' 7
>yy7 8
>yy8 9
GetPersonalInfoyy: I
(yyI J
stringyyJ P
usernameyyQ Y
)yyY Z
{zz 	
try{{ 
{|| 
UserDetailsModel}}  
userDetails}}! ,
=}}- .
await}}/ 4
_userService}}5 A
.}}A B
GetUser}}B I
(}}I J
username}}J R
)}}R S
;}}S T
if~~ 
(~~ 
userDetails~~ 
==~~  "
null~~# '
)~~' (
{ 
return
ÄÄ 
NotFound
ÄÄ #
(
ÄÄ# $
)
ÄÄ$ %
;
ÄÄ% &
}
ÅÅ 
return
ÇÇ 
Ok
ÇÇ 
(
ÇÇ 
userDetails
ÇÇ %
)
ÇÇ% &
;
ÇÇ& '
}
ÉÉ 
catch
ÑÑ 
(
ÑÑ 
	Exception
ÑÑ 
e
ÑÑ 
)
ÑÑ 
{
ÖÖ 
return
ÜÜ 

BadRequest
ÜÜ !
(
ÜÜ! "
e
ÜÜ" #
)
ÜÜ# $
;
ÜÜ$ %
}
áá 
}
àà 	
[
ää 	
GeneTreeAuthorize
ää	 
]
ää 
[
ãã 	
HttpGet
ãã	 
]
ãã 
[
åå 	
Route
åå	 
(
åå 
$str
åå 
)
åå 
]
åå 
public
çç 
async
çç 
Task
çç 
<
çç 
ActionResult
çç &
<
çç& '
UserDetailsModel
çç' 7
>
çç7 8
>
çç8 9
GetUserInfo
çç: E
(
ççE F
Guid
ççF J
id
ççK M
)
ççM N
{
éé 	
try
èè 
{
êê 
UserDetailsModel
ëë  
userDetails
ëë! ,
=
ëë- .
await
ëë/ 4
_userService
ëë5 A
.
ëëA B
GetUserByIdAsync
ëëB R
(
ëëR S
id
ëëS U
)
ëëU V
;
ëëV W
if
íí 
(
íí 
userDetails
íí 
==
íí  "
null
íí# '
)
íí' (
{
ìì 
return
îî 
NotFound
îî #
(
îî# $
)
îî$ %
;
îî% &
}
ïï 
return
ññ 
Ok
ññ 
(
ññ 
userDetails
ññ %
)
ññ% &
;
ññ& '
}
óó 
catch
òò 
(
òò 
	Exception
òò 
e
òò 
)
òò 
{
ôô 
return
öö 

BadRequest
öö !
(
öö! "
e
öö" #
)
öö# $
;
öö$ %
}
õõ 
}
úú 	
[
ûû 	
GeneTreeAuthorize
ûû	 
]
ûû 
[
üü 	
HttpGet
üü	 
]
üü 
[
†† 	
Route
††	 
(
†† 
$str
†† '
)
††' (
]
††( )
public
°° 
async
°° 
Task
°° 
<
°° 
ActionResult
°° &
<
°°& ' 
GenericPersonModel
°°' 9
>
°°9 :
>
°°: ;
GetTreeRoot
°°< G
(
°°G H
Guid
°°H L
treeId
°°M S
)
°°S T
{
¢¢ 	
try
££ 
{
§§  
GenericPersonModel
•• "
userDetails
••# .
=
••/ 0
await
••1 6
_userService
••7 C
.
••C D
GetTreeRoot
••D O
(
••O P
treeId
••P V
)
••V W
;
••W X
if
¶¶ 
(
¶¶ 
userDetails
¶¶ 
==
¶¶  "
null
¶¶# '
)
¶¶' (
{
ßß 
return
®® 
NotFound
®® #
(
®®# $
)
®®$ %
;
®®% &
}
©© 
return
™™ 
Ok
™™ 
(
™™ 
userDetails
™™ %
)
™™% &
;
™™& '
}
´´ 
catch
¨¨ 
(
¨¨ 
	Exception
¨¨ 
e
¨¨ 
)
¨¨ 
{
≠≠ 
return
ÆÆ 

BadRequest
ÆÆ !
(
ÆÆ! "
e
ÆÆ" #
)
ÆÆ# $
;
ÆÆ$ %
}
ØØ 
}
∞∞ 	
[
≤≤ 	
GeneTreeAuthorize
≤≤	 
]
≤≤ 
[
≥≥ 	
HttpPut
≥≥	 
]
≥≥ 
[
¥¥ 	
Route
¥¥	 
(
¥¥ 
$str
¥¥ 
)
¥¥ 
]
¥¥ 
public
µµ 
async
µµ 
Task
µµ 
<
µµ 
ActionResult
µµ &
<
µµ& '
UserDetailsModel
µµ' 7
>
µµ7 8
>
µµ8 9

UpdateUser
µµ: D
(
µµD E
Guid
µµE I
id
µµJ L
,
µµL M
UserUpdateModel
µµN ]
user
µµ^ b
)
µµb c
{
∂∂ 	
try
∑∑ 
{
∏∏ 
UserDetailsModel
ππ  
updatedUser
ππ! ,
=
ππ- .
await
ππ/ 4
_userService
ππ5 A
.
ππA B

UpdateUser
ππB L
(
ππL M
id
ππM O
,
ππO P
user
ππQ U
)
ππU V
;
ππV W
if
∫∫ 
(
∫∫ 
updatedUser
∫∫ 
==
∫∫  "
null
∫∫# '
)
∫∫' (
{
ªª 
return
ºº 
NotFound
ºº #
(
ºº# $
)
ºº$ %
;
ºº% &
}
ΩΩ 
return
ææ 
Ok
ææ 
(
ææ 
updatedUser
ææ %
)
ææ% &
;
ææ& '
}
øø 
catch
¿¿ 
(
¿¿ 
	Exception
¿¿ 
e
¿¿ 
)
¿¿ 
{
¡¡ 
return
¬¬ 

BadRequest
¬¬ !
(
¬¬! "
e
¬¬" #
)
¬¬# $
;
¬¬$ %
}
√√ 
}
ƒƒ 	
[
∆∆ 	
GeneTreeAuthorize
∆∆	 
]
∆∆ 
[
«« 	
HttpGet
««	 
]
«« 
[
»» 	
Route
»»	 
(
»» 
$str
»» #
)
»»# $
]
»»$ %
public
…… 
async
…… 
Task
…… 
<
…… 
ActionResult
…… &
<
……& '
UserSettingsModel
……' 8
>
……8 9
>
……9 :
GetUserSettings
……; J
(
……J K
Guid
……K O
id
……P R
)
……R S
{
   	
try
ÀÀ 
{
ÃÃ 
UserSettingsModel
ÕÕ !
updatedUser
ÕÕ" -
=
ÕÕ. /
await
ÕÕ0 5
_userService
ÕÕ6 B
.
ÕÕB C
GetUserSettings
ÕÕC R
(
ÕÕR S
id
ÕÕS U
)
ÕÕU V
;
ÕÕV W
if
ŒŒ 
(
ŒŒ 
updatedUser
ŒŒ 
==
ŒŒ  "
null
ŒŒ# '
)
ŒŒ' (
{
œœ 
return
–– 
NotFound
–– #
(
––# $
)
––$ %
;
––% &
}
—— 
return
““ 
Ok
““ 
(
““ 
updatedUser
““ %
)
““% &
;
““& '
}
”” 
catch
‘‘ 
(
‘‘ 
	Exception
‘‘ 
e
‘‘ 
)
‘‘ 
{
’’ 
return
÷÷ 

BadRequest
÷÷ !
(
÷÷! "
e
÷÷" #
)
÷÷# $
;
÷÷$ %
}
◊◊ 
}
ÿÿ 	
[
⁄⁄ 	
GeneTreeAuthorize
⁄⁄	 
]
⁄⁄ 
[
€€ 	
HttpPut
€€	 
]
€€ 
[
‹‹ 	
Route
‹‹	 
(
‹‹ 
$str
‹‹ #
)
‹‹# $
]
‹‹$ %
public
›› 
async
›› 
Task
›› 
<
›› 
ActionResult
›› &
<
››& '
UserSettingsModel
››' 8
>
››8 9
>
››9 : 
UpdateUserSettings
››; M
(
››M N
Guid
››N R
id
››S U
,
››U V
UserSettingsModel
››W h
user
››i m
)
››m n
{
ﬁﬁ 	
try
ﬂﬂ 
{
‡‡ 
UserSettingsModel
·· !
updatedUser
··" -
=
··. /
await
··0 5
_userService
··6 B
.
··B C 
UpdateUserSettings
··C U
(
··U V
id
··V X
,
··X Y
user
··Z ^
)
··^ _
;
··_ `
if
‚‚ 
(
‚‚ 
updatedUser
‚‚ 
==
‚‚  "
null
‚‚# '
)
‚‚' (
{
„„ 
return
‰‰ 
NotFound
‰‰ #
(
‰‰# $
)
‰‰$ %
;
‰‰% &
}
ÂÂ 
return
ÊÊ 
Ok
ÊÊ 
(
ÊÊ 
updatedUser
ÊÊ %
)
ÊÊ% &
;
ÊÊ& '
}
ÁÁ 
catch
ËË 
(
ËË 
	Exception
ËË 
e
ËË 
)
ËË 
{
ÈÈ 
return
ÍÍ 

BadRequest
ÍÍ !
(
ÍÍ! "
e
ÍÍ" #
)
ÍÍ# $
;
ÍÍ$ %
}
ÎÎ 
}
ÏÏ 	
[
ÓÓ 	
GeneTreeAuthorize
ÓÓ	 
]
ÓÓ 
[
ÔÔ 	
HttpPut
ÔÔ	 
]
ÔÔ 
[
 	
Route
	 
(
 
$str
 '
)
' (
]
( )
public
ÒÒ 
async
ÒÒ 
Task
ÒÒ 
<
ÒÒ 
ActionResult
ÒÒ &
<
ÒÒ& '
PositionModel
ÒÒ' 4
>
ÒÒ4 5
>
ÒÒ5 6 
UpdateUserPosition
ÒÒ7 I
(
ÒÒI J
Guid
ÒÒJ N
userId
ÒÒO U
,
ÒÒU V
UserPositionModel
ÒÒW h
position
ÒÒi q
)
ÒÒq r
{
ÚÚ 	
try
ÛÛ 
{
ÙÙ 
PositionModel
ıı 
updatedPosition
ıı -
=
ıı. /
await
ıı0 5
_userService
ıı6 B
.
ııB C 
UpdateUserPosition
ııC U
(
ııU V
userId
ııV \
,
ıı\ ]
position
ıı^ f
)
ııf g
;
ııg h
if
ˆˆ 
(
ˆˆ 
updatedPosition
ˆˆ #
==
ˆˆ$ &
null
ˆˆ' +
)
ˆˆ+ ,
{
˜˜ 
return
¯¯ 
NotFound
¯¯ #
(
¯¯# $
)
¯¯$ %
;
¯¯% &
}
˘˘ 
return
˙˙ 
Ok
˙˙ 
(
˙˙ 
updatedPosition
˙˙ )
)
˙˙) *
;
˙˙* +
}
˚˚ 
catch
¸¸ 
(
¸¸ 
	Exception
¸¸ 
e
¸¸ 
)
¸¸ 
{
˝˝ 
return
˛˛ 

BadRequest
˛˛ !
(
˛˛! "
e
˛˛" #
)
˛˛# $
;
˛˛$ %
}
ˇˇ 
}
ÄÄ 	
}
ÅÅ 
}ÇÇ ˝
SE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Program.cs
	namespace		 	
GenealogyTree		
 
.		 
API		 
{

 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
var 
host 
= 
CreateHostBuilder (
(( )
args) -
)- .
.. /
Build/ 4
(4 5
)5 6
;6 7
CreateDbIfNotExists 
(  
host  $
)$ %
;% &
host 
. 
Run 
( 
) 
; 
} 	
public 
static 
IWebHost 
BuildWebHost +
(+ ,
string, 2
[2 3
]3 4
args5 9
)9 :
=>; =
WebHost 
.  
CreateDefaultBuilder (
(( )
args) -
)- .
. 

UseStartup 
<  
Startup  '
>' (
(( )
)) *
. 
Build 
( 
) 
; 
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
private   
static   
void   
CreateDbIfNotExists   /
(  / 0
IHost  0 5
host  6 :
)  : ;
{!! 	
using"" 
("" 
var"" 
scope"" 
="" 
host"" #
.""# $
Services""$ ,
."", -
CreateScope""- 8
(""8 9
)""9 :
)"": ;
{## 
var$$ 
services$$ 
=$$ 
scope$$ $
.$$$ %
ServiceProvider$$% 4
;$$4 5
try%% 
{&& 
var'' 
context'' 
=''  !
services''" *
.''* +
GetRequiredService''+ =
<''= >"
GenealogyTreeDbContext''> T
>''T U
(''U V
)''V W
;''W X
DbInitializer(( !
.((! "

Initialize((" ,
(((, -
context((- 4
)((4 5
;((5 6
})) 
catch** 
(** 
	Exception**  
ex**! #
)**# $
{++ 
var,, 
logger,, 
=,,  
services,,! )
.,,) *
GetRequiredService,,* <
<,,< =
ILogger,,= D
<,,D E
Program,,E L
>,,L M
>,,M N
(,,N O
),,O P
;,,P Q
logger-- 
.-- 
LogError-- #
(--# $
ex--$ &
,--& '
$str--( L
)--L M
;--M N
}.. 
}// 
}00 	
}33 
}44 À>
SE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.API\Startup.cs
	namespace 	
GenealogyTree
 
. 
API 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{   	
services"" 
."" 
AddDbContext"" !
<""! ""
GenealogyTreeDbContext""" 8
>""8 9
(""9 :
options"": A
=>""B D
options## #
.### $
UseSqlServer##$ 0
(##0 1
Configuration##1 >
.##> ?
GetConnectionString##? R
(##R S
$str##S f
)##f g
)##g h
)$$ 
;$$ 
var&& 
mappingConfig&& 
=&& 
new&&  #
MapperConfiguration&&$ 7
(&&7 8
mc&&8 :
=>&&; =
{&&> ?
mc&&@ B
.&&B C

AddProfile&&C M
(&&M N
new&&N Q
MappingProfile&&R `
(&&` a
)&&a b
)&&b c
;&&c d
}&&e f
)&&f g
;&&g h
IMapper'' 
mapper'' 
='' 
mappingConfig'' *
.''* +
CreateMapper''+ 7
(''7 8
)''8 9
;''9 :
services(( 
.(( 
AddSingleton(( !
(((! "
mapper((" (
)((( )
;(() *
services)) 
.)) 
	AddScoped)) 
<)) 
IUnitOfWork)) *
,))* +

UnitOfWork)), 6
>))6 7
())7 8
)))8 9
;))9 :
services** 
.** 
	Configure** 
<** 
FormOptions** *
>*** +
(**+ ,
options**, 3
=>**4 6
{++ 
options,, 
.,, 
ValueLengthLimit,, (
=,,) *
int,,+ .
.,,. /
MaxValue,,/ 7
;,,7 8
options-- 
.-- $
MultipartBodyLengthLimit-- 0
=--1 2
int--3 6
.--6 7
MaxValue--7 ?
;--? @
options.. 
... !
MemoryBufferThreshold.. -
=... /
int..0 3
...3 4
MaxValue..4 <
;..< =
}// 
)// 
;// 
services00 
.00 
AddControllers00 #
(00# $
)00$ %
;00% &
services22 
.22 
AddSwaggerGen22 "
(22" #
options22# *
=>22+ -
{33 
options44 
.44 

SwaggerDoc44 "
(44" #
$str44# '
,44' (
new44) ,
OpenApiInfo44- 8
{449 :
Title44; @
=44A B
$str44C V
,44V W
Version44X _
=44` a
$str44b f
}44g h
)44h i
;44i j
options55 
.55 !
AddSecurityDefinition55 -
(55- .
$str55. :
,55: ;
new55< ?!
OpenApiSecurityScheme55@ U
{66 
Name77 
=77 
$str77 *
,77* +
Type88 
=88 
SecuritySchemeType88 -
.88- .
Http88. 2
,882 3
Scheme99 
=99 
$str99 %
,99% &
BearerFormat::  
=::! "
$str::# (
,::( )
In;; 
=;; 
ParameterLocation;; *
.;;* +
Header;;+ 1
,;;1 2
Description<< 
=<<  !
$str<<" U
}== 
)== 
;== 
options>> 
.>> "
AddSecurityRequirement>> .
(>>. /
new>>/ 2&
OpenApiSecurityRequirement>>3 M
{?? 
{@@ 
newAA !
OpenApiSecuritySchemeAA 3
{BB 
	ReferenceCC  )
=CC* +
newCC, /
OpenApiReferenceCC0 @
{DD  !
TypeEE$ (
=EE) *
ReferenceTypeEE+ 8
.EE8 9
SecuritySchemeEE9 G
,EEG H
IdFF$ &
=FF' (
$strFF) 5
}GG  !
}HH 
,HH 
ArrayII !
.II! "
EmptyII" '
<II' (
stringII( .
>II. /
(II/ 0
)II0 1
}JJ 
}KK 
)KK 
;KK 
}LL 
)LL 
;LL 
servicesMM 
.NN 3
'RegisterAssemblyPublicNonGenericClassesNN 7
(NN7 8
AssemblyNN8 @
.NN@ A
GetAssemblyNNA L
(NNL M
typeofNNM S
(NNS T
PersonServiceNNT a
)NNa b
)NNb c
)NNc d
.OO 
WhereOO 
(OO 
xOO 
=>OO 
xOO 
.OO 
NameOO !
.OO! "
EndsWithOO" *
(OO* +
$strOO+ 4
)OO4 5
)OO5 6
.OO6 7)
AsPublicImplementedInterfacesOO7 T
(OOT U
ServiceLifetimeOOU d
.OOd e
ScopedOOe k
)OOk l
;OOl m
servicesPP 
.PP 
	ConfigurePP 
<PP 
	SmtpModelPP (
>PP( )
(PP) *
ConfigurationPP* 7
.PP7 8

GetSectionPP8 B
(PPB C
$strPPC I
)PPI J
)PPJ K
;PPK L
}QQ 	
publicTT 
voidTT 
	ConfigureTT 
(TT 
IApplicationBuilderTT 1
appTT2 5
,TT5 6
IWebHostEnvironmentTT7 J
envTTK N
)TTN O
{UU 	
ifVV 
(VV 
envVV 
.VV 
IsDevelopmentVV !
(VV! "
)VV" #
)VV# $
{WW 
appXX 
.XX %
UseDeveloperExceptionPageXX -
(XX- .
)XX. /
;XX/ 0
appYY 
.YY 

UseSwaggerYY 
(YY 
)YY  
;YY  !
appZZ 
.ZZ 
UseSwaggerUIZZ  
(ZZ  !
cZZ! "
=>ZZ# %
cZZ& '
.ZZ' (
SwaggerEndpointZZ( 7
(ZZ7 8
$strZZ8 R
,ZZR S
$strZZT j
)ZZj k
)ZZk l
;ZZl m
}[[ 
app]] 
.]] 
UseCors]] 
(]] 
options]] 
=>]]  "
{^^ 
options__ 
.__ 
AllowAnyOrigin__ &
(__& '
)__' (
.`` 
AllowAnyHeader`` #
(``# $
)``$ %
.aa 
AllowAnyMethodaa #
(aa# $
)aa$ %
;aa% &
}bb 
)bb 
;bb 
appdd 
.dd 
UseHttpsRedirectiondd #
(dd# $
)dd$ %
;dd% &
appee 
.ee 
UseStaticFilesee 
(ee 
)ee  
;ee  !
appff 
.ff 

UseRoutingff 
(ff 
)ff 
;ff 
appgg 
.gg 
UseAuthenticationgg !
(gg! "
)gg" #
;gg# $
apphh 
.hh 
UseAuthorizationhh  
(hh  !
)hh! "
;hh" #
appjj 
.jj 
UseEndpointsjj 
(jj 
	endpointsjj &
=>jj' )
{kk 
	endpointsll 
.ll 
MapControllersll (
(ll( )
)ll) *
;ll* +
}mm 
)mm 
;mm 
}nn 	
}oo 
}pp 