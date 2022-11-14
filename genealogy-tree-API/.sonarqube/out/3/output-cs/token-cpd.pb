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
if.. 
(.. 
!.. 
parseSucceded.. &
||..' )
!..* +

allowRoles..+ 5
...5 6
Contains..6 >
(..> ?
(..? @
	UserRoles..@ I
)..I J
userRole..J R
)..R S
)..S T
{// %
AppendUnauthorizedRequest00 1
(001 2
context002 9
)009 :
;00: ;
}11 
}22 
else33 
{44 %
AppendUnauthorizedRequest55 -
(55- .
context55. 5
)555 6
;556 7
}66 
}77 
catch88 
{99 %
AppendUnauthorizedRequest:: )
(::) *
context::* 1
)::1 2
;::2 3
};; 
}<< 	
}== 
}>> ˚
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
public

 !
MaxImageSizeAttribute

 $
(

$ %
int

% (
maxImageSize

) 5
)

5 6
{ 	
_maxImageSize 
= 
maxImageSize (
;( )
} 	
	protected 
override 
ValidationResult +
IsValid, 3
(3 4
object4 :
value; @
,@ A
ValidationContextB S
validationContextT e
)e f
{ 	
var 
image 
= 
( 
value 
as !
	IFormFile" +
)+ ,
;, -
if 
( 
image 
!= 
null 
&&  
image! &
.& '
Length' -
>. /
_maxImageSize0 =
*> ?
$num@ D
)D E
{ 
return 
new 
ValidationResult +
(+ ,
$", .
$str. A
{A B
_maxImageSizeB O
}O P
$strP S
"S T
)T U
;U V
} 
return 
ValidationResult #
.# $
Success$ +
;+ ,
} 	
} 
} …%
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
if 
( 
loginResponse !
==" $
null% )
)) *
{ 
return 
NotFound #
(# $
)$ %
;% &
} 
return!! 
Ok!! 
(!! 
loginResponse!! '
)!!' (
;!!( )
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
[)) 	
HttpPost))	 
])) 
[** 	
Route**	 
(** 
$str** 
)** 
]** 
public++ 
async++ 
Task++ 
<++ 
ActionResult++ &
<++& '
UserDetailsModel++' 7
>++7 8
>++8 9
Register++: B
(++B C
RegisterModel++C P
userRegister++Q ]
)++] ^
{,, 	
try-- 
{.. 
UserDetailsModel//  
userDetails//! ,
=//- .
await/// 4
_authService//5 A
.//A B
Register//B J
(//J K
userRegister//K W
)//W X
;//X Y
if11 
(11 
userDetails11 
==11  "
null11# '
)11' (
{22 
return33 
NotFound33 #
(33# $
)33$ %
;33% &
}44 
return66 
Ok66 
(66 
userDetails66 %
)66% &
;66& '
}77 
catch88 
(88 
	Exception88 
e88 
)88 
{99 
return:: 

BadRequest:: !
(::! "
e::" #
)::# $
;::$ %
};; 
}<< 	
[>> 	
GeneTreeAuthorize>>	 
]>> 
[?? 	
HttpPut??	 
]?? 
[@@ 	
Route@@	 
(@@ 
$str@@ 
)@@  
]@@  !
publicAA 
asyncAA 
TaskAA 
<AA 
ActionResultAA &
<AA& '
UserDetailsModelAA' 7
>AA7 8
>AA8 9
ChangePasswordAA: H
(AAH I
UpdatePasswordModelAAI \
updatePasswordAA] k
)AAk l
{BB 	
tryCC 
{DD 
UserDetailsModelEE  
updatedUserEE! ,
=EE- .
awaitEE/ 4
_authServiceEE5 A
.EEA B
UpdatePasswordEEB P
(EEP Q
updatePasswordEEQ _
)EE_ `
;EE` a
ifGG 
(GG 
updatedUserGG 
==GG  "
nullGG# '
)GG' (
{HH 
returnII 
NotFoundII #
(II# $
)II$ %
;II% &
}JJ 
returnMM 
OkMM 
(MM 
updatedUserMM %
)MM% &
;MM& '
}NN 
catchOO 
(OO 
	ExceptionOO 
eOO 
)OO 
{PP 
returnQQ 

BadRequestQQ !
(QQ! "
eQQ" #
)QQ# $
;QQ$ %
}RR 
}SS 	
}TT 
}UU ÿ0
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
if   
(   
nationalities   !
==  " $
null  % )
)  ) *
{!! 
return"" 
NotFound"" #
(""# $
)""$ %
;""% &
}## 
return%% 
Ok%% 
(%% 
nationalities%% '
)%%' (
;%%( )
}&& 
catch'' 
('' 
	Exception'' 
e'' 
)'' 
{(( 
return)) 

BadRequest)) !
())! "
e))" #
)))# $
;))$ %
}** 
}++ 	
[-- 	
GeneTreeAuthorize--	 
(-- 
	UserRoles-- $
.--$ %
Admin--% *
)--* +
]--+ ,
[.. 	
HttpPost..	 
].. 
[// 	
Route//	 
(// 
$str// 
)// 
]// 
public00 
async00 
Task00 
<00 
ActionResult00 &
<00& '
GenericNameModel00' 7
>007 8
>008 9
AddNationality00: H
(00H I
string00I O
nationalityName00P _
)00_ `
{11 	
try22 
{33 
GenericNameModel44  
nationality44! ,
=44- .
await44/ 4
_nationalityService445 H
.44H I
AddNationalityAsync44I \
(44\ ]
nationalityName44] l
)44l m
;44m n
return55 
Ok55 
(55 
nationality55 %
)55% &
;55& '
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
$str>> 
)>> 
]>> 
public?? 
async?? 
Task?? 
<?? 
ActionResult?? &
<??& '
List??' +
<??+ ,
GenericNameModel??, <
>??< =
>??= >
>??> ?
GetAllReligions??@ O
(??O P
)??P Q
{@@ 	
tryAA 
{BB 
ListCC 
<CC 
GenericNameModelCC %
>CC% &
	religionsCC' 0
=CC1 2
awaitCC3 8
_religionServiceCC9 I
.CCI J 
GetAllReligionsAsyncCCJ ^
(CC^ _
)CC_ `
;CC` a
ifEE 
(EE 
	religionsEE 
==EE  
nullEE! %
)EE% &
{FF 
returnGG 
NotFoundGG #
(GG# $
)GG$ %
;GG% &
}HH 
returnJJ 
OkJJ 
(JJ 
	religionsJJ #
)JJ# $
;JJ$ %
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
[RR 	
GeneTreeAuthorizeRR	 
(RR 
	UserRolesRR $
.RR$ %
AdminRR% *
)RR* +
]RR+ ,
[SS 	
HttpPostSS	 
]SS 
[TT 	
RouteTT	 
(TT 
$strTT 
)TT 
]TT 
publicUU 
asyncUU 
TaskUU 
<UU 
ActionResultUU &
<UU& '
GenericNameModelUU' 7
>UU7 8
>UU8 9
AddReligionUU: E
(UUE F
stringUUF L
religionNameUUM Y
)UUY Z
{VV 	
tryWW 
{XX 
GenericNameModelYY  
religionYY! )
=YY* +
awaitYY, 1
_religionServiceYY2 B
.YYB C
AddReligionAsyncYYC S
(YYS T
religionNameYYT `
)YY` a
;YYa b
returnZZ 
OkZZ 
(ZZ 
religionZZ "
)ZZ" #
;ZZ# $
}[[ 
catch\\ 
(\\ 
	Exception\\ 
e\\ 
)\\ 
{]] 
return^^ 

BadRequest^^ !
(^^! "
e^^" #
)^^# $
;^^$ %
}__ 
}`` 	
}aa 
}bb ÁL
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
public 
EducationController "
(" #
IEducationService# 4
educationService5 E
)E F
{ 	
_educationService 
= 
educationService  0
;0 1
} 	
[ 	
GeneTreeAuthorize	 
] 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str #
)# $
]$ %
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
EducationModel, :
>: ;
>; <
>< =
GetPersonEducations> Q
(Q R
GuidR V
userIdW ]
)] ^
{ 	
try 
{ 
List 
< 
EducationModel #
># $
returnEvent% 0
=1 2
await3 8
Task9 =
.= >
Run> A
(A B
(B C
)C D
=>E G
_educationServiceH Y
.Y Z#
GetAllEducationsForUserZ q
(q r
userIdr x
)x y
)y z
;z {
if!! 
(!! 
returnEvent!! 
==!!  "
null!!# '
)!!' (
{"" 
return## 
NotFound## #
(### $
)##$ %
;##% &
}$$ 
return&& 
Ok&& 
(&& 
returnEvent&& %
)&&% &
;&&& '
}'' 
catch(( 
((( 
	Exception(( 
e(( 
)(( 
{)) 
return** 

BadRequest** !
(**! "
e**" #
)**# $
;**$ %
}++ 
},, 	
[.. 	
GeneTreeAuthorize..	 
].. 
[// 	
HttpGet//	 
]// 
[00 	
Route00	 
(00 
$str00 
)00 
]00 
public11 
async11 
Task11 
<11 
ActionResult11 &
<11& '
EducationModel11' 5
>115 6
>116 7
GetEducation118 D
(11D E
int11E H
id11I K
)11K L
{22 	
try33 
{44 
EducationModel55 
returnEvent55 *
=55+ ,
await55- 2
_educationService553 D
.55D E
GetEducationAsync55E V
(55V W
id55W Y
)55Y Z
;55Z [
if77 
(77 
returnEvent77 
==77  "
null77# '
)77' (
{88 
return99 
NotFound99 #
(99# $
)99$ %
;99% &
}:: 
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
[DD 	
GeneTreeAuthorizeDD	 
]DD 
[EE 	
HttpPostEE	 
]EE 
[FF 	
RouteFF	 
(FF 
$strFF 
)FF 
]FF 
publicGG 
asyncGG 
TaskGG 
<GG 
ActionResultGG &
<GG& '
EducationModelGG' 5
>GG5 6
>GG6 7
AddEducationGG8 D
(GGD E
EducationModelGGE S
	educationGGT ]
)GG] ^
{HH 	
tryII 
{JJ 
EducationModelKK 
returnEventKK *
=KK+ ,
awaitKK- 2
_educationServiceKK3 D
.KKD E
AddEducationAsyncKKE V
(KKV W
	educationKKW `
)KK` a
;KKa b
returnLL 
OkLL 
(LL 
returnEventLL %
)LL% &
;LL& '
}MM 
catchNN 
(NN 
	ExceptionNN 
eNN 
)NN 
{OO 
returnPP 

BadRequestPP !
(PP! "
ePP" #
)PP# $
;PP$ %
}QQ 
}RR 	
[TT 	
GeneTreeAuthorizeTT	 
]TT 
[UU 	
HttpPutUU	 
]UU 
[VV 	
RouteVV	 
(VV 
$strVV 
)VV 
]VV 
publicWW 
asyncWW 
TaskWW 
<WW 
ActionResultWW &
<WW& '
EducationModelWW' 5
>WW5 6
>WW6 7
UpdateEducationWW8 G
(WWG H
EducationModelWWH V
	educationWWW `
)WW` a
{XX 	
tryYY 
{ZZ 
EducationModel[[ 
returnEvent[[ *
=[[+ ,
await[[- 2
_educationService[[3 D
.[[D E 
UpdateEducationAsync[[E Y
([[Y Z
	education[[Z c
)[[c d
;[[d e
return\\ 
Ok\\ 
(\\ 
returnEvent\\ %
)\\% &
;\\& '
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
[dd 	
GeneTreeAuthorizedd	 
]dd 
[ee 	

HttpDeleteee	 
]ee 
[ff 	
Routeff	 
(ff 
$strff 
)ff 
]ff 
publicgg 
asyncgg 
Taskgg 
<gg 
ActionResultgg &
>gg& '
DeleteEducationgg( 7
(gg7 8
intgg8 ;
idgg< >
)gg> ?
{hh 	
tryii 
{jj 
EducationModelkk 
returnEventkk *
=kk+ ,
awaitkk- 2
_educationServicekk3 D
.kkD E 
DeleteEducationAsynckkE Y
(kkY Z
idkkZ \
)kk\ ]
;kk] ^
returnll 
Okll 
(ll 
returnEventll %
)ll% &
;ll& '
}mm 
catchnn 
(nn 
	Exceptionnn 
enn 
)nn 
{oo 
returnpp 

BadRequestpp !
(pp! "
epp" #
)pp# $
;pp$ %
}qq 
}rr 	
[tt 	
HttpGettt	 
]tt 
[uu 	
Routeuu	 
(uu 
$struu 
)uu 
]uu 
publicvv 
asyncvv 
Taskvv 
<vv 
ActionResultvv &
<vv& '
Listvv' +
<vv+ ,
GenericNameModelvv, <
>vv< =
>vv= >
>vv> ?
GetEducationLevelsvv@ R
(vvR S
)vvS T
{ww 	
tryxx 
{yy 
Listzz 
<zz 
GenericNameModelzz %
>zz% &
returnEventzz' 2
=zz3 4
awaitzz5 :
_educationServicezz; L
.zzL M&
GetAllEducationLevelsAsynczzM g
(zzg h
)zzh i
;zzi j
if|| 
(|| 
returnEvent|| 
==||  "
null||# '
)||' (
{}} 
return~~ 
NotFound~~ #
(~~# $
)~~$ %
;~~% &
} 
return
ÅÅ 
Ok
ÅÅ 
(
ÅÅ 
returnEvent
ÅÅ %
)
ÅÅ% &
;
ÅÅ& '
}
ÇÇ 
catch
ÉÉ 
(
ÉÉ 
	Exception
ÉÉ 
e
ÉÉ 
)
ÉÉ 
{
ÑÑ 
return
ÖÖ 

BadRequest
ÖÖ !
(
ÖÖ! "
e
ÖÖ" #
)
ÖÖ# $
;
ÖÖ$ %
}
ÜÜ 
}
áá 	
[
ââ 	
GeneTreeAuthorize
ââ	 
(
ââ 
	UserRoles
ââ $
.
ââ$ %
Admin
ââ% *
)
ââ* +
]
ââ+ ,
[
ää 	
HttpPost
ää	 
]
ää 
[
ãã 	
Route
ãã	 
(
ãã 
$str
ãã 
)
ãã 
]
ãã 
public
åå 
async
åå 
Task
åå 
<
åå 
ActionResult
åå &
<
åå& '
GenericNameModel
åå' 7
>
åå7 8
>
åå8 9
AddEducationLevel
åå: K
(
ååK L
string
ååL R
name
ååS W
)
ååW X
{
çç 	
try
éé 
{
èè 
GenericNameModel
êê  
returnEvent
êê! ,
=
êê- .
await
êê/ 4
_educationService
êê5 F
.
êêF G$
AddEducationLevelAsync
êêG ]
(
êê] ^
name
êê^ b
)
êêb c
;
êêc d
return
ëë 
Ok
ëë 
(
ëë 
returnEvent
ëë %
)
ëë% &
;
ëë& '
}
íí 
catch
ìì 
(
ìì 
	Exception
ìì 
e
ìì 
)
ìì 
{
îî 
return
ïï 

BadRequest
ïï !
(
ïï! "
e
ïï" #
)
ïï# $
;
ïï$ %
}
ññ 
}
óó 	
}
òò 
}ôô –5
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
public 
MarriageController !
(! "
IMarriageService" 2
marriageService3 B
)B C
{ 	
_marriageService 
= 
marriageService .
;. /
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
MarriedPersonModel, >
>> ?
>? @
>@ A
GetPersonMarriagesB T
(T U
intU X
personIdY a
)a b
{ 	
try 
{ 
List 
< 
MarriedPersonModel '
>' (
returnEvent) 4
=5 6
await7 <
_marriageService= M
.M N$
GetAllMarriagesForPersonN f
(f g
personIdg o
)o p
;p q
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
[++ 	
HttpGet++	 
]++ 
[,, 	
Route,,	 
(,, 
$str,, 
),, 
],, 
public-- 
async-- 
Task-- 
<-- 
ActionResult-- &
<--& ' 
MarriageDetailsModel--' ;
>--; <
>--< =
GetMarriage--> I
(--I J
int--J M
id--N P
)--P Q
{.. 	
try// 
{00  
MarriageDetailsModel11 $
returnEvent11% 0
=111 2
await113 8
_marriageService119 I
.11I J
GetMarriageAsync11J Z
(11Z [
id11[ ]
)11] ^
;11^ _
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
return88 
Ok88 
(88 
returnEvent88 %
)88% &
;88& '
}99 
catch:: 
(:: 
	Exception:: 
e:: 
):: 
{;; 
return<< 

BadRequest<< !
(<<! "
e<<" #
)<<# $
;<<$ %
}== 
}?? 	
[AA 	
HttpPostAA	 
]AA 
[BB 	
RouteBB	 
(BB 
$strBB 
)BB 
]BB 
publicCC 
asyncCC 
TaskCC 
<CC 
ActionResultCC &
<CC& ' 
MarriageDetailsModelCC' ;
>CC; <
>CC< =
AddMarriageCC> I
(CCI J%
MarriageCreateUpdateModelCCJ c
marriageCCd l
)CCl m
{DD 	
tryEE 
{FF  
MarriageDetailsModelGG $
returnEventGG% 0
=GG1 2
awaitGG3 8
_marriageServiceGG9 I
.GGI J
AddMarriageAsyncGGJ Z
(GGZ [
marriageGG[ c
)GGc d
;GGd e
returnHH 
OkHH 
(HH 
returnEventHH %
)HH% &
;HH& '
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
<RR& ' 
MarriageDetailsModelRR' ;
>RR; <
>RR< =
UpdateMarriageRR> L
(RRL M%
MarriageCreateUpdateModelRRM f
marriageRRg o
)RRo p
{SS 	
tryTT 
{UU  
MarriageDetailsModelVV $
returnEventVV% 0
=VV1 2
awaitVV3 8
_marriageServiceVV9 I
.VVI J
UpdateMarriageAsyncVVJ ]
(VV] ^
marriageVV^ f
)VVf g
;VVg h
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
[__ 	

HttpDelete__	 
]__ 
[`` 	
Route``	 
(`` 
$str`` 
)`` 
]`` 
publicaa 
asyncaa 
Taskaa 
<aa 
ActionResultaa &
<aa& ' 
MarriageDetailsModelaa' ;
>aa; <
>aa< =
DeleteMarriageaa> L
(aaL M
intaaM P
idaaQ S
)aaS T
{bb 	
trycc 
{dd  
MarriageDetailsModelee $
returnEventee% 0
=ee1 2
awaitee3 8
_marriageServiceee9 I
.eeI J
DeleteMarriageAsynceeJ ]
(ee] ^
idee^ `
)ee` a
;eea b
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
}mm 
}nn Õ,
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
public  
OccupationController #
(# $
IOccupationService$ 6
occupationService7 H
)H I
{ 	
_occupationService 
=  
occupationService! 2
;2 3
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
]  
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
OccupationModel, ;
>; <
>< =
>= >
GetUserOccupations? Q
(Q R
GuidR V
userIdW ]
)] ^
{ 	
try 
{ 
List 
< 
OccupationModel $
>$ %
returnEvent& 1
=2 3
await4 9
Task: >
.> ?
Run? B
(B C
(C D
)D E
=>F H
_occupationServiceI [
.[ \$
GetAllOccupationsForUser\ t
(t u
userIdu {
){ |
)| }
;} ~
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
return$$ 
Ok$$ 
($$ 
returnEvent$$ %
)$$% &
;$$& '
}%% 
catch&& 
(&& 
	Exception&& 
e&& 
)&& 
{'' 
return(( 

BadRequest(( !
(((! "
e((" #
)((# $
;(($ %
})) 
}** 	
[,, 	
HttpPost,,	 
],, 
[-- 	
Route--	 
(-- 
$str-- 
)-- 
]-- 
public.. 
async.. 
Task.. 
<.. 
ActionResult.. &
<..& '
OccupationModel..' 6
>..6 7
>..7 8
AddOccupation..9 F
(..F G
OccupationModel..G V

occupation..W a
)..a b
{// 	
try00 
{11 
OccupationModel22 
returnEvent22  +
=22, -
await22. 3
_occupationService224 F
.22F G
AddOccupationAsync22G Y
(22Y Z

occupation22Z d
)22d e
;22e f
return33 
Ok33 
(33 
returnEvent33 %
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
HttpPut;;	 
];; 
[<< 	
Route<<	 
(<< 
$str<< 
)<< 
]<< 
public== 
async== 
Task== 
<== 
ActionResult== &
<==& '
OccupationModel==' 6
>==6 7
>==7 8
UpdateOccupation==9 I
(==I J
OccupationModel==J Y

occupation==Z d
)==d e
{>> 	
try?? 
{@@ 
OccupationModelAA 
returnEventAA  +
=AA, -
awaitAA. 3
_occupationServiceAA4 F
.AAF G!
UpdateOccupationAsyncAAG \
(AA\ ]

occupationAA] g
)AAg h
;AAh i
returnBB 
OkBB 
(BB 
returnEventBB %
)BB% &
;BB& '
}CC 
catchDD 
(DD 
	ExceptionDD 
eDD 
)DD 
{EE 
returnFF 

BadRequestFF !
(FF! "
eFF" #
)FF# $
;FF$ %
}GG 
}HH 	
[JJ 	

HttpDeleteJJ	 
]JJ 
[KK 	
RouteKK	 
(KK 
$strKK 
)KK 
]KK 
publicLL 
asyncLL 
TaskLL 
<LL 
ActionResultLL &
<LL& '
OccupationModelLL' 6
>LL6 7
>LL7 8
DeleteOccupationLL9 I
(LLI J
intLLJ M
idLLN P
)LLP Q
{MM 	
tryNN 
{OO 
OccupationModelPP 
returnEventPP  +
=PP, -
awaitPP. 3
_occupationServicePP4 F
.PPF G!
DeleteOccupationAsyncPPG \
(PP\ ]
idPP] _
)PP_ `
;PP` a
returnQQ 
OkQQ 
(QQ 
returnEventQQ %
)QQ% &
;QQ& '
}RR 
catchSS 
(SS 
	ExceptionSS 
eSS 
)SS 
{TT 
returnUU 

BadRequestUU !
(UU! "
eUU" #
)UU# $
;UU$ %
}VV 
}WW 	
}XX 
}YY °Y
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
public !
ParentChildController $
($ %
IParentChildService% 8
parentChildService9 K
)K L
{ 	
_parentChildService 
=  !
parentChildService" 4
;4 5
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str &
)& '
]' (
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
ParentChildModel, <
>< =
>= >
>> ?
GetAllParents@ M
(M N
intN Q
childIdR Y
)Y Z
{ 	
try 
{ 
List 
< 
ParentChildModel %
>% &
parents' .
=/ 0
await1 6
_parentChildService7 J
.J K"
GetAllParentsForPersonK a
(a b
childIdb i
)i j
;j k
if   
(   
parents   
==   
null   #
)  # $
{!! 
return"" 
NotFound"" #
(""# $
)""$ %
;""% &
}## 
return%% 
Ok%% 
(%% 
parents%% !
)%%! "
;%%" #
}&& 
catch'' 
('' 
	Exception'' 
e'' 
)'' 
{(( 
return)) 

BadRequest)) !
())! "
e))" #
)))# $
;))$ %
}** 
}++ 	
[-- 	
HttpGet--	 
]-- 
[.. 	
Route..	 
(.. 
$str.. (
)..( )
]..) *
public// 
async// 
Task// 
<// 
ActionResult// &
<//& '
List//' +
<//+ ,
ParentChildModel//, <
>//< =
>//= >
>//> ?
GetAllChildren//@ N
(//N O
int//O R
parentId//S [
)//[ \
{00 	
try11 
{22 
List33 
<33 
ParentChildModel33 %
>33% &
children33' /
=330 1
await332 7
_parentChildService338 K
.33K L#
GetAllChildrenForPerson33L c
(33c d
parentId33d l
)33l m
;33m n
if55 
(55 
children55 
==55 
null55  $
)55$ %
{66 
return77 
NotFound77 #
(77# $
)77$ %
;77% &
}88 
return:: 
Ok:: 
(:: 
children:: "
)::" #
;::# $
};; 
catch<< 
(<< 
	Exception<< 
e<< 
)<< 
{== 
return>> 

BadRequest>> !
(>>! "
e>>" #
)>># $
;>>$ %
}?? 
}@@ 	
[BB 	
HttpGetBB	 
]BB 
[CC 	
RouteCC	 
(CC 
$strCC 3
)CC3 4
]CC4 5
publicDD 
asyncDD 
TaskDD 
<DD 
ActionResultDD &
<DD& '
ListDD' +
<DD+ ,
GenericPersonModelDD, >
>DD> ?
>DD? @
>DD@ A"
GetParentSpouceOptionsDDB X
(DDX Y
intDDY \
personIdDD] e
)DDe f
{EE 	
tryFF 
{GG 
ListHH 
<HH 
GenericPersonModelHH '
>HH' (
parentsHH) 0
=HH1 2
awaitHH3 8
_parentChildServiceHH9 L
.HHL M"
GetParentSpouceOptionsHHM c
(HHc d
personIdHHd l
)HHl m
;HHm n
ifJJ 
(JJ 
parentsJJ 
==JJ 
nullJJ #
)JJ# $
{KK 
returnLL 
NotFoundLL #
(LL# $
)LL$ %
;LL% &
}MM 
returnOO 
OkOO 
(OO 
parentsOO !
)OO! "
;OO" #
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
[XX 	
HttpGetXX	 
]XX 
[YY 	
RouteYY	 
(YY 
$strYY /
)YY/ 0
]YY0 1
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
ActionResultZZ &
<ZZ& '
ListZZ' +
<ZZ+ ,
GenericPersonModelZZ, >
>ZZ> ?
>ZZ? @
>ZZ@ A
GetChildrenOptionsZZB T
(ZZT U
intZZU X
personIdZZY a
)ZZa b
{[[ 	
try\\ 
{]] 
List^^ 
<^^ 
GenericPersonModel^^ '
>^^' (
parents^^) 0
=^^1 2
await^^3 8
_parentChildService^^9 L
.^^L M
GetChildrenOptions^^M _
(^^_ `
personId^^` h
)^^h i
;^^i j
if`` 
(`` 
parents`` 
==`` 
null`` #
)``# $
{aa 
returnbb 
NotFoundbb #
(bb# $
)bb$ %
;bb% &
}cc 
returnee 
Okee 
(ee 
parentsee !
)ee! "
;ee" #
}ff 
catchgg 
(gg 
	Exceptiongg 
egg 
)gg 
{hh 
returnii 

BadRequestii !
(ii! "
eii" #
)ii# $
;ii$ %
}jj 
}kk 	
[mm 	
HttpGetmm	 
]mm 
[nn 	
Routenn	 
(nn 
$strnn 
)nn 
]nn 
publicoo 
asyncoo 
Taskoo 
<oo 
ActionResultoo &
<oo& '#
ParentChildDetailsModeloo' >
>oo> ?
>oo? @
GetParentChildooA O
(ooO P
intooP S
idooT V
)ooV W
{pp 	
tryqq 
{rr #
ParentChildDetailsModelss '
returnEventss( 3
=ss4 5
awaitss6 ;
_parentChildServicess< O
.ssO P
GetParentChildAsyncssP c
(ssc d
idssd f
)ssf g
;ssg h
iftt 
(tt 
returnEventtt 
==tt  "
nulltt# '
)tt' (
{uu 
returnvv 
NotFoundvv #
(vv# $
)vv$ %
;vv% &
}ww 
returnxx 
Okxx 
(xx 
returnEventxx %
)xx% &
;xx& '
}yy 
catchzz 
(zz 
	Exceptionzz 
ezz 
)zz 
{{{ 
return|| 

BadRequest|| !
(||! "
e||" #
)||# $
;||$ %
}}} 
}~~ 	
[
ÄÄ 	
HttpPost
ÄÄ	 
]
ÄÄ 
[
ÅÅ 	
Route
ÅÅ	 
(
ÅÅ 
$str
ÅÅ 
)
ÅÅ 
]
ÅÅ 
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
<
ÇÇ 
ActionResult
ÇÇ &
<
ÇÇ& '%
ParentChildDetailsModel
ÇÇ' >
>
ÇÇ> ?
>
ÇÇ? @
AddParentChild
ÇÇA O
(
ÇÇO P*
ParentChildCreateUpdateModel
ÇÇP l
parentChild
ÇÇm x
)
ÇÇx y
{
ÉÉ 	
try
ÑÑ 
{
ÖÖ %
ParentChildDetailsModel
ÜÜ '
returnEvent
ÜÜ( 3
=
ÜÜ4 5
await
ÜÜ6 ;!
_parentChildService
ÜÜ< O
.
ÜÜO P!
AddParentChildAsync
ÜÜP c
(
ÜÜc d
parentChild
ÜÜd o
)
ÜÜo p
;
ÜÜp q
return
áá 
Ok
áá 
(
áá 
returnEvent
áá %
)
áá% &
;
áá& '
}
àà 
catch
ââ 
(
ââ 
	Exception
ââ 
e
ââ 
)
ââ 
{
ää 
return
ãã 

BadRequest
ãã !
(
ãã! "
e
ãã" #
)
ãã# $
;
ãã$ %
}
åå 
}
çç 	
[
èè 	
HttpPut
èè	 
]
èè 
[
êê 	
Route
êê	 
(
êê 
$str
êê 
)
êê 
]
êê 
public
ëë 
async
ëë 
Task
ëë 
<
ëë 
ActionResult
ëë &
<
ëë& '%
ParentChildDetailsModel
ëë' >
>
ëë> ?
>
ëë? @ 
UpdateRelativeLink
ëëA S
(
ëëS T*
ParentChildCreateUpdateModel
ëëT p
parentChild
ëëq |
)
ëë| }
{
íí 	
try
ìì 
{
îî %
ParentChildDetailsModel
ïï '
returnEvent
ïï( 3
=
ïï4 5
await
ïï6 ;!
_parentChildService
ïï< O
.
ïïO P$
UpdateParentChildAsync
ïïP f
(
ïïf g
parentChild
ïïg r
)
ïïr s
;
ïïs t
return
ññ 
Ok
ññ 
(
ññ 
returnEvent
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
ûû 	

HttpDelete
ûû	 
]
ûû 
[
üü 	
Route
üü	 
(
üü 
$str
üü 
)
üü 
]
üü 
public
†† 
async
†† 
Task
†† 
<
†† 
ActionResult
†† &
<
††& '%
ParentChildDetailsModel
††' >
>
††> ?
>
††? @ 
DeleteRelativeLink
††A S
(
††S T
int
††T W
id
††X Z
)
††Z [
{
°° 	
try
¢¢ 
{
££ %
ParentChildDetailsModel
§§ '
returnEvent
§§( 3
=
§§4 5
await
§§6 ;!
_parentChildService
§§< O
.
§§O P$
DeleteParentChildAsync
§§P f
(
§§f g
id
§§g i
)
§§i j
;
§§j k
return
•• 
Ok
•• 
(
•• 
returnEvent
•• %
)
••% &
;
••& '
}
¶¶ 
catch
ßß 
(
ßß 
	Exception
ßß 
e
ßß 
)
ßß 
{
®® 
return
©© 

BadRequest
©© !
(
©©! "
e
©©" #
)
©©# $
;
©©$ %
}
™™ 
}
´´ 	
}
¨¨ 
}≠≠ åh
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
if&& 
(&& 
returnEvent&& 
==&&  "
null&&# '
)&&' (
{'' 
return(( 
NotFound(( #
(((# $
)(($ %
;((% &
})) 
return++ 
Ok++ 
(++ 
returnEvent++ %
)++% &
;++& '
},, 
catch-- 
(-- 
	Exception-- 
e-- 
)-- 
{.. 
return// 

BadRequest// !
(//! "
e//" #
)//# $
;//$ %
}00 
}11 	
[33 	
HttpGet33	 
]33 
[44 	
Route44	 
(44 
$str44 '
)44' (
]44( )
public55 
async55 
Task55 
<55 
ActionResult55 &
<55& '
PersonTreeInfoModel55' :
>55: ;
>55; <#
GetPeopleTreeDataInTree55= T
(55T U
Guid55U Y
treeId55Z `
)55` a
{66 	
try77 
{88 
List99 
<99 
PersonTreeInfoModel99 (
>99( )
returnEvent99* 5
=996 7
await998 =
_personService99> L
.99L M#
GetPeopleTreeDataInTree99M d
(99d e
treeId99e k
)99k l
;99l m
if;; 
(;; 
returnEvent;; 
==;;  "
null;;# '
);;' (
{<< 
return== 
NotFound== #
(==# $
)==$ %
;==% &
}>> 
return@@ 
Ok@@ 
(@@ 
returnEvent@@ %
)@@% &
;@@& '
}AA 
catchBB 
(BB 
	ExceptionBB 
eBB 
)BB 
{CC 
returnDD 

BadRequestDD !
(DD! "
eDD" #
)DD# $
;DD$ %
}EE 
}FF 	
[HH 	
HttpGetHH	 
]HH 
[II 	
RouteII	 
(II 
$strII %
)II% &
]II& '
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
ActionResultJJ &
<JJ& '
EventInTreeModelJJ' 7
>JJ7 8
>JJ8 9
GetEventsInTreeJJ: I
(JJI J
GuidJJJ N
treeIdJJO U
)JJU V
{KK 	
tryLL 
{MM 
ListNN 
<NN 
EventInTreeModelNN %
>NN% &
returnEventNN' 2
=NN3 4
awaitNN5 :
_personServiceNN; I
.NNI J
GetEventsInTreeNNJ Y
(NNY Z
treeIdNNZ `
)NN` a
;NNa b
ifPP 
(PP 
returnEventPP 
==PP  "
nullPP# '
)PP' (
{QQ 
returnRR 
NotFoundRR #
(RR# $
)RR$ %
;RR% &
}SS 
returnUU 
OkUU 
(UU 
returnEventUU %
)UU% &
;UU& '
}VV 
catchWW 
(WW 
	ExceptionWW 
eWW 
)WW 
{XX 
returnYY 

BadRequestYY !
(YY! "
eYY" #
)YY# $
;YY$ %
}ZZ 
}[[ 	
[]] 	
HttpGet]]	 
]]] 
[^^ 	
Route^^	 
(^^ 
$str^^ .
)^^. /
]^^/ 0
public__ 
async__ 
Task__ 
<__ 
ActionResult__ &
<__& '
PersonTreeInfoModel__' :
>__: ;
>__; <$
GetPeopleWithoutRelative__= U
(__U V
Guid__V Z
treeId__[ a
)__a b
{`` 	
tryaa 
{bb 
Listcc 
<cc 
GenericPersonModelcc '
>cc' (
returnEventcc) 4
=cc5 6
awaitcc7 <
_personServicecc= K
.ccK L$
GetPeopleWithoutRelativeccL d
(ccd e
treeIdcce k
)cck l
;ccl m
ifee 
(ee 
returnEventee 
==ee  "
nullee# '
)ee' (
{ff 
returngg 
NotFoundgg #
(gg# $
)gg$ %
;gg% &
}hh 
returnjj 
Okjj 
(jj 
returnEventjj %
)jj% &
;jj& '
}kk 
catchll 
(ll 
	Exceptionll 
ell 
)ll 
{mm 
returnnn 

BadRequestnn !
(nn! "
enn" #
)nn# $
;nn$ %
}oo 
}pp 	
[rr 	
HttpGetrr	 
]rr 
[ss 	
Routess	 
(ss 
$strss 
)ss 
]ss 
publictt 
asynctt 
Tasktt 
<tt 
ActionResulttt &
<tt& '
PersonDetailsModeltt' 9
>tt9 :
>tt: ;
GetPersonDetailstt< L
(ttL M
intttM P
idttQ S
)ttS T
{uu 	
tryvv 
{ww 
PersonDetailsModelxx "
returnEventxx# .
=xx/ 0
awaitxx1 6
_personServicexx7 E
.xxE F
GetPersonAsyncxxF T
(xxT U
idxxU W
)xxW X
;xxX Y
ifzz 
(zz 
returnEventzz 
==zz  "
nullzz# '
)zz' (
{{{ 
return|| 
NotFound|| #
(||# $
)||$ %
;||% &
}}} 
return 
Ok 
( 
returnEvent %
)% &
;& '
}
ÄÄ 
catch
ÅÅ 
(
ÅÅ 
	Exception
ÅÅ 
e
ÅÅ 
)
ÅÅ 
{
ÇÇ 
return
ÉÉ 

BadRequest
ÉÉ !
(
ÉÉ! "
e
ÉÉ" #
)
ÉÉ# $
;
ÉÉ$ %
}
ÑÑ 
}
ÖÖ 	
[
áá 	
HttpPost
áá	 
]
áá 
[
àà 	
Route
àà	 
(
àà 
$str
àà 
)
àà 
]
àà 
public
ââ 
async
ââ 
Task
ââ 
<
ââ 
ActionResult
ââ &
<
ââ& ' 
PersonDetailsModel
ââ' 9
>
ââ9 :
>
ââ: ;
	AddPerson
ââ< E
(
ââE F
[
ââF G
FromBody
ââG O
]
ââO P%
PersonCreateUpdateModel
ââQ h
person
ââi o
)
ââo p
{
ää 	
try
ãã 
{
åå  
PersonDetailsModel
çç "
returnEvent
çç# .
=
çç/ 0
await
çç1 6
_personService
çç7 E
.
ççE F
AddPersonAsync
ççF T
(
ççT U
person
ççU [
)
çç[ \
;
çç\ ]
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
HttpPut
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
óó 
)
óó 
]
óó 
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
òò& ' 
PersonDetailsModel
òò' 9
>
òò9 :
>
òò: ;
UpdatePerson
òò< H
(
òòH I%
PersonCreateUpdateModel
òòI `
person
òòa g
)
òòg h
{
ôô 	
try
öö 
{
õõ  
PersonDetailsModel
úú "
returnEvent
úú# .
=
úú/ 0
await
úú1 6
_personService
úú7 E
.
úúE F
UpdatePersonAsync
úúF W
(
úúW X
person
úúX ^
)
úú^ _
;
úú_ `
return
ùù 
Ok
ùù 
(
ùù 
returnEvent
ùù %
)
ùù% &
;
ùù& '
}
ûû 
catch
üü 
(
üü 
	Exception
üü 
e
üü 
)
üü 
{
†† 
return
°° 

BadRequest
°° !
(
°°! "
e
°°" #
)
°°# $
;
°°$ %
}
¢¢ 
}
££ 	
[
•• 	

HttpDelete
••	 
]
•• 
[
¶¶ 	
Route
¶¶	 
(
¶¶ 
$str
¶¶ 
)
¶¶ 
]
¶¶ 
public
ßß 
async
ßß 
Task
ßß 
<
ßß 
ActionResult
ßß &
<
ßß& ' 
PersonDetailsModel
ßß' 9
>
ßß9 :
>
ßß: ;
DeletePerson
ßß< H
(
ßßH I
int
ßßI L
id
ßßM O
)
ßßO P
{
®® 	
try
©© 
{
™™  
PersonDetailsModel
´´ "
returnEvent
´´# .
=
´´/ 0
await
´´1 6
_personService
´´7 E
.
´´E F
DeletePersonAsync
´´F W
(
´´W X
id
´´X Z
)
´´Z [
;
´´[ \
return
¨¨ 
Ok
¨¨ 
(
¨¨ 
returnEvent
¨¨ %
)
¨¨% &
;
¨¨& '
}
≠≠ 
catch
ÆÆ 
(
ÆÆ 
	Exception
ÆÆ 
e
ÆÆ 
)
ÆÆ 
{
ØØ 
return
∞∞ 

BadRequest
∞∞ !
(
∞∞! "
e
∞∞" #
)
∞∞# $
;
∞∞$ %
}
±± 
}
≤≤ 	
[
¥¥ 	
HttpPost
¥¥	 
]
¥¥ 
[
µµ 	
Route
µµ	 
(
µµ 
$str
µµ %
)
µµ% &
]
µµ& '
public
∂∂ 
async
∂∂ 
Task
∂∂ 
<
∂∂ 
ActionResult
∂∂ &
<
∂∂& '
	ImageFile
∂∂' 0
>
∂∂0 1
>
∂∂1 2
UploadPhoto
∂∂3 >
(
∂∂> ?
int
∂∂? B
personId
∂∂C K
,
∂∂K L
[
∂∂M N
Required
∂∂N V
]
∂∂V W
[
∂∂W X
FromForm
∂∂X `
]
∂∂` a
[
∂∂a b
MaxImageSize
∂∂b n
(
∂∂n o
$num
∂∂o p
*
∂∂q r
$num
∂∂s w
)
∂∂w x
]
∂∂x y
	IFormFile∂∂z É
image∂∂Ñ â
)∂∂â ä
{
∑∑ 	
try
∏∏ 
{
ππ 
Image
∫∫ 
createdImage
∫∫ "
=
∫∫# $
await
∫∫% *
_imageService
∫∫+ 8
.
∫∫8 9
AddImageAsync
∫∫9 F
(
∫∫F G
image
∫∫G L
.
∫∫L M
ToImageFile
∫∫M X
(
∫∫X Y
)
∫∫Y Z
)
∫∫Z [
;
∫∫[ \
	ImageFile
ªª 
	imageFile
ªª #
=
ªª$ %
await
ªª& +
_personService
ªª, :
.
ªª: ; 
UpdatePictureAsync
ªª; M
(
ªªM N
personId
ªªN V
,
ªªV W
createdImage
ªªX d
.
ªªd e
Id
ªªe g
)
ªªg h
;
ªªh i
return
ºº 
Ok
ºº 
(
ºº 
	imageFile
ºº #
)
ºº# $
;
ºº$ %
}
ΩΩ 
catch
ææ 
(
ææ 
	Exception
ææ 
e
ææ 
)
ææ 
{
øø 
return
¿¿ 

BadRequest
¿¿ !
(
¿¿! "
e
¿¿" #
)
¿¿# $
;
¿¿$ %
}
¡¡ 
}
¬¬ 	
}
√√ 
}ƒƒ ≤Ö
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
ifGG 
(GG 
relativeGG 
==GG 
nullGG  $
)GG$ %
{HH 
returnII 
NotFoundII #
(II# $
)II$ %
;II% &
}JJ 
returnLL 
OkLL 
(LL 
relativeLL "
)LL" #
;LL# $
}MM 
catchNN 
(NN 
	ExceptionNN 
eNN 
)NN 
{OO 
returnPP 

BadRequestPP !
(PP! "
ePP" #
)PP# $
;PP$ %
}QQ 
}RR 	
[TT 	
HttpPostTT	 
]TT 
[UU 	
RouteUU	 
(UU 
$strUU 
)UU 
]UU 
publicVV 
asyncVV 
TaskVV 
<VV 
ActionResultVV &
<VV& '
UsersToLinkModelVV' 7
>VV7 8
>VV8 9
UserRespondedVV: G
(VVG H
UsersToLinkModelVVH X
usersToLinkVVY d
)VVd e
{WW 	
tryXX 
{YY 
RelativeModelZZ 
returnEventZZ )
=ZZ* +
awaitZZ, 1
_relativeServiceZZ2 B
.ZZB C
AddRelativeUserZZC R
(ZZR S
usersToLinkZZS ^
)ZZ^ _
;ZZ_ `
return[[ 
Ok[[ 
([[ 
returnEvent[[ %
)[[% &
;[[& '
}\\ 
catch]] 
(]] 
	Exception]] 
e]] 
)]] 
{^^ 
return__ 

BadRequest__ !
(__! "
e__" #
)__# $
;__$ %
}`` 
}aa 	
[cc 	

HttpDeletecc	 
]cc 
[dd 	
Routedd	 
(dd 
$strdd 
)dd 
]dd 
publicee 
asyncee 
Taskee 
<ee 
ActionResultee &
<ee& '
RelativeModelee' 4
>ee4 5
>ee5 6
RemoveRelativeee7 E
(eeE F
inteeF I
ideeJ L
)eeL M
{ff 	
trygg 
{hh 
RelativeModelii 
returnEventii )
=ii* +
awaitii, 1
_relativeServiceii2 B
.iiB C
DeleteRelativeiiC Q
(iiQ R
idiiR T
)iiT U
;iiU V
returnjj 
Okjj 
(jj 
returnEventjj %
)jj% &
;jj& '
}kk 
catchll 
(ll 
	Exceptionll 
ell 
)ll 
{mm 
returnnn 

BadRequestnn !
(nn! "
enn" #
)nn# $
;nn$ %
}oo 
}pp 	
[rr 	
HttpGetrr	 
]rr 
[ss 	
Routess	 
(ss 
$strss +
)ss+ ,
]ss, -
publictt 
asynctt 
Tasktt 
<tt 
ActionResulttt &
<tt& '
Listtt' +
<tt+ ,
RequestDetailsModeltt, ?
>tt? @
>tt@ A
>ttA B
RequestsSentttC O
(ttO P
GuidttP T
userIdttU [
)tt[ \
{uu 	
tryvv 
{ww 
Listxx 
<xx 
RequestDetailsModelxx (
>xx( )
returnEventxx* 5
=xx6 7
awaitxx8 =
_requestServicexx> M
.xxM N
GetRequestsSentxxN ]
(xx] ^
userIdxx^ d
)xxd e
;xxe f
ifzz 
(zz 
returnEventzz 
==zz  "
nullzz# '
)zz' (
{{{ 
return|| 
NotFound|| #
(||# $
)||$ %
;||% &
}}} 
return 
Ok 
( 
returnEvent %
)% &
;& '
}
ÄÄ 
catch
ÅÅ 
(
ÅÅ 
	Exception
ÅÅ 
e
ÅÅ 
)
ÅÅ 
{
ÇÇ 
return
ÉÉ 

BadRequest
ÉÉ !
(
ÉÉ! "
e
ÉÉ" #
)
ÉÉ# $
;
ÉÉ$ %
}
ÑÑ 
}
ÖÖ 	
[
áá 	
HttpGet
áá	 
]
áá 
[
àà 	
Route
àà	 
(
àà 
$str
àà /
)
àà/ 0
]
àà0 1
public
ââ 
async
ââ 
Task
ââ 
<
ââ 
ActionResult
ââ &
<
ââ& '
List
ââ' +
<
ââ+ ,!
RequestDetailsModel
ââ, ?
>
ââ? @
>
ââ@ A
>
ââA B
RequestsReceived
ââC S
(
ââS T
Guid
ââT X
userId
ââY _
)
ââ_ `
{
ää 	
try
ãã 
{
åå 
List
çç 
<
çç !
RequestDetailsModel
çç (
>
çç( )
returnEvent
çç* 5
=
çç6 7
await
çç8 =
_requestService
çç> M
.
ççM N!
GetRequestsReceived
ççN a
(
çça b
userId
ççb h
)
ççh i
;
ççi j
if
èè 
(
èè 
returnEvent
èè 
==
èè  "
null
èè# '
)
èè' (
{
êê 
return
ëë 
NotFound
ëë #
(
ëë# $
)
ëë$ %
;
ëë% &
}
íí 
return
îî 
Ok
îî 
(
îî 
returnEvent
îî %
)
îî% &
;
îî& '
}
ïï 
catch
ññ 
(
ññ 
	Exception
ññ 
e
ññ 
)
ññ 
{
óó 
return
òò 

BadRequest
òò !
(
òò! "
e
òò" #
)
òò# $
;
òò$ %
}
ôô 
}
öö 	
[
úú 	
HttpGet
úú	 
]
úú 
[
ùù 	
Route
ùù	 
(
ùù 
$str
ùù 0
)
ùù0 1
]
ùù1 2
public
ûû 
async
ûû 
Task
ûû 
<
ûû 
ActionResult
ûû &
<
ûû& '
List
ûû' +
<
ûû+ ,"
RequestResponseModel
ûû, @
>
ûû@ A
>
ûûA B
>
ûûB C
RequestsResponded
ûûD U
(
ûûU V
Guid
ûûV Z
userId
ûû[ a
)
ûûa b
{
üü 	
try
†† 
{
°° 
List
¢¢ 
<
¢¢ "
RequestResponseModel
¢¢ )
>
¢¢) *
returnEvent
¢¢+ 6
=
¢¢7 8
await
¢¢9 >
_requestService
¢¢? N
.
¢¢N O"
GetRequestsResponded
¢¢O c
(
¢¢c d
userId
¢¢d j
)
¢¢j k
;
¢¢k l
if
§§ 
(
§§ 
returnEvent
§§ 
==
§§  "
null
§§# '
)
§§' (
{
•• 
return
¶¶ 
NotFound
¶¶ #
(
¶¶# $
)
¶¶$ %
;
¶¶% &
}
ßß 
return
©© 
Ok
©© 
(
©© 
returnEvent
©© %
)
©©% &
;
©©& '
}
™™ 
catch
´´ 
(
´´ 
	Exception
´´ 
e
´´ 
)
´´ 
{
¨¨ 
return
≠≠ 

BadRequest
≠≠ !
(
≠≠! "
e
≠≠" #
)
≠≠# $
;
≠≠$ %
}
ÆÆ 
}
ØØ 	
[
±± 	
HttpPost
±±	 
]
±± 
[
≤≤ 	
Route
≤≤	 
(
≤≤ 
$str
≤≤ 
)
≤≤ 
]
≤≤ 
public
≥≥ 
async
≥≥ 
Task
≥≥ 
<
≥≥ 
ActionResult
≥≥ &
<
≥≥& '&
RequestCreateUpdateModel
≥≥' ?
>
≥≥? @
>
≥≥@ A
SendRequest
≥≥B M
(
≥≥M N&
RequestCreateUpdateModel
≥≥N f
request
≥≥g n
)
≥≥n o
{
¥¥ 	
try
µµ 
{
∂∂ &
RequestCreateUpdateModel
∑∑ (
returnEvent
∑∑) 4
=
∑∑5 6
await
∑∑7 <
_requestService
∑∑= L
.
∑∑L M

AddRequest
∑∑M W
(
∑∑W X
request
∑∑X _
)
∑∑_ `
;
∑∑` a
if
ππ 
(
ππ 
returnEvent
ππ 
==
ππ  "
null
ππ# '
)
ππ' (
{
∫∫ 
return
ªª 
NotFound
ªª #
(
ªª# $
)
ªª$ %
;
ªª% &
}
ºº 
return
ææ 
Ok
ææ 
(
ææ 
returnEvent
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
∆∆ 	
HttpPut
∆∆	 
]
∆∆ 
[
«« 	
Route
««	 
(
«« 
$str
«« !
)
««! "
]
««" #
public
»» 
async
»» 
Task
»» 
<
»» 
ActionResult
»» &
<
»»& '
UsersToLinkModel
»»' 7
>
»»7 8
>
»»8 9
RespondToRequest
»»: J
(
»»J K
int
»»K N
id
»»O Q
,
»»Q R"
RequestResponseModel
»»S g
request
»»h o
)
»»o p
{
…… 	
try
   
{
ÀÀ 
UsersToLinkModel
ÃÃ  
returnEvent
ÃÃ! ,
=
ÃÃ- .
await
ÃÃ/ 4
_requestService
ÃÃ5 D
.
ÃÃD E
RespondToRequest
ÃÃE U
(
ÃÃU V
id
ÃÃV X
,
ÃÃX Y
request
ÃÃZ a
)
ÃÃa b
;
ÃÃb c
return
ÕÕ 
Ok
ÕÕ 
(
ÕÕ 
returnEvent
ÕÕ %
)
ÕÕ% &
;
ÕÕ& '
}
ŒŒ 
catch
œœ 
(
œœ 
	Exception
œœ 
e
œœ 
)
œœ 
{
–– 
return
—— 

BadRequest
—— !
(
——! "
e
——" #
)
——# $
;
——$ %
}
““ 
}
”” 	
[
’’ 	

HttpDelete
’’	 
]
’’ 
[
÷÷ 	
Route
÷÷	 
(
÷÷ 
$str
÷÷ !
)
÷÷! "
]
÷÷" #
public
◊◊ 
async
◊◊ 
Task
◊◊ 
<
◊◊ 
ActionResult
◊◊ &
<
◊◊& '!
RequestDetailsModel
◊◊' :
>
◊◊: ;
>
◊◊; <
RemoveRequest
◊◊= J
(
◊◊J K
int
◊◊K N
id
◊◊O Q
)
◊◊Q R
{
ÿÿ 	
try
ŸŸ 
{
⁄⁄ !
RequestDetailsModel
€€ #
returnEvent
€€$ /
=
€€0 1
await
€€2 7
_requestService
€€8 G
.
€€G H
DeleteRequest
€€H U
(
€€U V
id
€€V X
)
€€X Y
;
€€Y Z
return
‹‹ 
Ok
‹‹ 
(
‹‹ 
returnEvent
‹‹ %
)
‹‹% &
;
‹‹& '
}
›› 
catch
ﬁﬁ 
(
ﬁﬁ 
	Exception
ﬁﬁ 
e
ﬁﬁ 
)
ﬁﬁ 
{
ﬂﬂ 
return
‡‡ 

BadRequest
‡‡ !
(
‡‡! "
e
‡‡" #
)
‡‡# $
;
‡‡$ %
}
·· 
}
‚‚ 	
[
ÂÂ 	
HttpGet
ÂÂ	 
]
ÂÂ 
[
ÊÊ 	
Route
ÊÊ	 
(
ÊÊ 
$str
ÊÊ '
)
ÊÊ' (
]
ÊÊ( )
public
ÁÁ 
async
ÁÁ 
Task
ÁÁ 
<
ÁÁ 
ActionResult
ÁÁ &
<
ÁÁ& '
List
ÁÁ' +
<
ÁÁ+ ,
UserPositionModel
ÁÁ, =
>
ÁÁ= >
>
ÁÁ> ?
>
ÁÁ? @
RelativesPosition
ÁÁA R
(
ÁÁR S
Guid
ÁÁS W
userId
ÁÁX ^
)
ÁÁ^ _
{
ËË 	
try
ÈÈ 
{
ÍÍ 
List
ÎÎ 
<
ÎÎ 
UserPositionModel
ÎÎ &
>
ÎÎ& '
returnEvent
ÎÎ( 3
=
ÎÎ4 5
await
ÎÎ6 ;
_relativeService
ÎÎ< L
.
ÎÎL M"
GetRelativesPosition
ÎÎM a
(
ÎÎa b
userId
ÎÎb h
)
ÎÎh i
;
ÎÎi j
if
ÌÌ 
(
ÌÌ 
returnEvent
ÌÌ 
==
ÌÌ  "
null
ÌÌ# '
)
ÌÌ' (
{
ÓÓ 
return
ÔÔ 
NotFound
ÔÔ #
(
ÔÔ# $
)
ÔÔ$ %
;
ÔÔ% &
}
 
return
ÚÚ 
Ok
ÚÚ 
(
ÚÚ 
returnEvent
ÚÚ %
)
ÚÚ% &
;
ÚÚ& '
}
ÛÛ 
catch
ÙÙ 
(
ÙÙ 
	Exception
ÙÙ 
e
ÙÙ 
)
ÙÙ 
{
ıı 
return
ˆˆ 

BadRequest
ˆˆ !
(
ˆˆ! "
e
ˆˆ" #
)
ˆˆ# $
;
ˆˆ$ %
}
˜˜ 
}
¯¯ 	
}
˘˘ 
}˙˙ ”å
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
ìì 
(
ìì 
userDetails
ìì 
==
ìì  "
null
ìì# '
)
ìì' (
{
îî 
return
ïï 
NotFound
ïï #
(
ïï# $
)
ïï$ %
;
ïï% &
}
ññ 
return
òò 
Ok
òò 
(
òò 
userDetails
òò %
)
òò% &
;
òò& '
}
ôô 
catch
öö 
(
öö 
	Exception
öö 
e
öö 
)
öö 
{
õõ 
return
úú 

BadRequest
úú !
(
úú! "
e
úú" #
)
úú# $
;
úú$ %
}
ùù 
}
ûû 	
[
†† 	
GeneTreeAuthorize
††	 
]
†† 
[
°° 	
HttpGet
°°	 
]
°° 
[
¢¢ 	
Route
¢¢	 
(
¢¢ 
$str
¢¢ '
)
¢¢' (
]
¢¢( )
public
££ 
async
££ 
Task
££ 
<
££ 
ActionResult
££ &
<
££& ' 
GenericPersonModel
££' 9
>
££9 :
>
££: ;
GetTreeRoot
££< G
(
££G H
Guid
££H L
treeId
££M S
)
££S T
{
§§ 	
try
•• 
{
¶¶  
GenericPersonModel
ßß "
userDetails
ßß# .
=
ßß/ 0
await
ßß1 6
_userService
ßß7 C
.
ßßC D
GetTreeRoot
ßßD O
(
ßßO P
treeId
ßßP V
)
ßßV W
;
ßßW X
if
©© 
(
©© 
userDetails
©© 
==
©©  "
null
©©# '
)
©©' (
{
™™ 
return
´´ 
NotFound
´´ #
(
´´# $
)
´´$ %
;
´´% &
}
¨¨ 
return
ÆÆ 
Ok
ÆÆ 
(
ÆÆ 
userDetails
ÆÆ %
)
ÆÆ% &
;
ÆÆ& '
}
ØØ 
catch
∞∞ 
(
∞∞ 
	Exception
∞∞ 
e
∞∞ 
)
∞∞ 
{
±± 
return
≤≤ 

BadRequest
≤≤ !
(
≤≤! "
e
≤≤" #
)
≤≤# $
;
≤≤$ %
}
≥≥ 
}
¥¥ 	
[
∂∂ 	
GeneTreeAuthorize
∂∂	 
]
∂∂ 
[
∑∑ 	
HttpPut
∑∑	 
]
∑∑ 
[
∏∏ 	
Route
∏∏	 
(
∏∏ 
$str
∏∏ 
)
∏∏ 
]
∏∏ 
public
ππ 
async
ππ 
Task
ππ 
<
ππ 
ActionResult
ππ &
<
ππ& '
UserDetailsModel
ππ' 7
>
ππ7 8
>
ππ8 9

UpdateUser
ππ: D
(
ππD E
Guid
ππE I
id
ππJ L
,
ππL M
UserUpdateModel
ππN ]
user
ππ^ b
)
ππb c
{
∫∫ 	
try
ªª 
{
ºº 
UserDetailsModel
ΩΩ  
updatedUser
ΩΩ! ,
=
ΩΩ- .
await
ΩΩ/ 4
_userService
ΩΩ5 A
.
ΩΩA B

UpdateUser
ΩΩB L
(
ΩΩL M
id
ΩΩM O
,
ΩΩO P
user
ΩΩQ U
)
ΩΩU V
;
ΩΩV W
if
øø 
(
øø 
updatedUser
øø 
==
øø  "
null
øø# '
)
øø' (
{
¿¿ 
return
¡¡ 
NotFound
¡¡ #
(
¡¡# $
)
¡¡$ %
;
¡¡% &
}
¬¬ 
return
ƒƒ 
Ok
ƒƒ 
(
ƒƒ 
updatedUser
ƒƒ %
)
ƒƒ% &
;
ƒƒ& '
}
≈≈ 
catch
∆∆ 
(
∆∆ 
	Exception
∆∆ 
e
∆∆ 
)
∆∆ 
{
«« 
return
»» 

BadRequest
»» !
(
»»! "
e
»»" #
)
»»# $
;
»»$ %
}
…… 
}
   	
[
ÃÃ 	
GeneTreeAuthorize
ÃÃ	 
]
ÃÃ 
[
ÕÕ 	
HttpGet
ÕÕ	 
]
ÕÕ 
[
ŒŒ 	
Route
ŒŒ	 
(
ŒŒ 
$str
ŒŒ #
)
ŒŒ# $
]
ŒŒ$ %
public
œœ 
async
œœ 
Task
œœ 
<
œœ 
ActionResult
œœ &
<
œœ& '
UserSettingsModel
œœ' 8
>
œœ8 9
>
œœ9 :
GetUserSettings
œœ; J
(
œœJ K
Guid
œœK O
id
œœP R
)
œœR S
{
–– 	
try
—— 
{
““ 
UserSettingsModel
”” !
updatedUser
””" -
=
””. /
await
””0 5
_userService
””6 B
.
””B C
GetUserSettings
””C R
(
””R S
id
””S U
)
””U V
;
””V W
if
’’ 
(
’’ 
updatedUser
’’ 
==
’’  "
null
’’# '
)
’’' (
{
÷÷ 
return
◊◊ 
NotFound
◊◊ #
(
◊◊# $
)
◊◊$ %
;
◊◊% &
}
ÿÿ 
return
⁄⁄ 
Ok
⁄⁄ 
(
⁄⁄ 
updatedUser
⁄⁄ %
)
⁄⁄% &
;
⁄⁄& '
}
€€ 
catch
‹‹ 
(
‹‹ 
	Exception
‹‹ 
e
‹‹ 
)
‹‹ 
{
›› 
return
ﬁﬁ 

BadRequest
ﬁﬁ !
(
ﬁﬁ! "
e
ﬁﬁ" #
)
ﬁﬁ# $
;
ﬁﬁ$ %
}
ﬂﬂ 
}
‡‡ 	
[
‚‚ 	
GeneTreeAuthorize
‚‚	 
]
‚‚ 
[
„„ 	
HttpPut
„„	 
]
„„ 
[
‰‰ 	
Route
‰‰	 
(
‰‰ 
$str
‰‰ #
)
‰‰# $
]
‰‰$ %
public
ÂÂ 
async
ÂÂ 
Task
ÂÂ 
<
ÂÂ 
ActionResult
ÂÂ &
<
ÂÂ& '
UserSettingsModel
ÂÂ' 8
>
ÂÂ8 9
>
ÂÂ9 : 
UpdateUserSettings
ÂÂ; M
(
ÂÂM N
Guid
ÂÂN R
id
ÂÂS U
,
ÂÂU V
UserSettingsModel
ÂÂW h
user
ÂÂi m
)
ÂÂm n
{
ÊÊ 	
try
ÁÁ 
{
ËË 
UserSettingsModel
ÈÈ !
updatedUser
ÈÈ" -
=
ÈÈ. /
await
ÈÈ0 5
_userService
ÈÈ6 B
.
ÈÈB C 
UpdateUserSettings
ÈÈC U
(
ÈÈU V
id
ÈÈV X
,
ÈÈX Y
user
ÈÈZ ^
)
ÈÈ^ _
;
ÈÈ_ `
if
ÎÎ 
(
ÎÎ 
updatedUser
ÎÎ 
==
ÎÎ  "
null
ÎÎ# '
)
ÎÎ' (
{
ÏÏ 
return
ÌÌ 
NotFound
ÌÌ #
(
ÌÌ# $
)
ÌÌ$ %
;
ÌÌ% &
}
ÓÓ 
return
 
Ok
 
(
 
updatedUser
 %
)
% &
;
& '
}
ÒÒ 
catch
ÚÚ 
(
ÚÚ 
	Exception
ÚÚ 
e
ÚÚ 
)
ÚÚ 
{
ÛÛ 
return
ÙÙ 

BadRequest
ÙÙ !
(
ÙÙ! "
e
ÙÙ" #
)
ÙÙ# $
;
ÙÙ$ %
}
ıı 
}
ˆˆ 	
[
¯¯ 	
GeneTreeAuthorize
¯¯	 
]
¯¯ 
[
˘˘ 	
HttpPut
˘˘	 
]
˘˘ 
[
˙˙ 	
Route
˙˙	 
(
˙˙ 
$str
˙˙ '
)
˙˙' (
]
˙˙( )
public
˚˚ 
async
˚˚ 
Task
˚˚ 
<
˚˚ 
ActionResult
˚˚ &
<
˚˚& '
PositionModel
˚˚' 4
>
˚˚4 5
>
˚˚5 6 
UpdateUserPosition
˚˚7 I
(
˚˚I J
Guid
˚˚J N
userId
˚˚O U
,
˚˚U V
UserPositionModel
˚˚W h
position
˚˚i q
)
˚˚q r
{
¸¸ 	
try
˝˝ 
{
˛˛ 
PositionModel
ˇˇ 
updatedPosition
ˇˇ -
=
ˇˇ. /
await
ˇˇ0 5
_userService
ˇˇ6 B
.
ˇˇB C 
UpdateUserPosition
ˇˇC U
(
ˇˇU V
userId
ˇˇV \
,
ˇˇ\ ]
position
ˇˇ^ f
)
ˇˇf g
;
ˇˇg h
if
ÅÅ 
(
ÅÅ 
updatedPosition
ÅÅ #
==
ÅÅ$ &
null
ÅÅ' +
)
ÅÅ+ ,
{
ÇÇ 
return
ÉÉ 
NotFound
ÉÉ #
(
ÉÉ# $
)
ÉÉ$ %
;
ÉÉ% &
}
ÑÑ 
return
ÜÜ 
Ok
ÜÜ 
(
ÜÜ 
updatedPosition
ÜÜ )
)
ÜÜ) *
;
ÜÜ* +
}
áá 
catch
àà 
(
àà 
	Exception
àà 
e
àà 
)
àà 
{
ââ 
return
ää 

BadRequest
ää !
(
ää! "
e
ää" #
)
ää# $
;
ää$ %
}
ãã 
}
åå 	
}
çç 
}éé ˝
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
try&& 
{'' 
var(( 
context(( 
=((  !
services((" *
.((* +
GetRequiredService((+ =
<((= >"
GenealogyTreeDbContext((> T
>((T U
(((U V
)((V W
;((W X
DbInitializer)) !
.))! "

Initialize))" ,
()), -
context))- 4
)))4 5
;))5 6
}** 
catch++ 
(++ 
	Exception++  
ex++! #
)++# $
{,, 
var-- 
logger-- 
=--  
services--! )
.--) *
GetRequiredService--* <
<--< =
ILogger--= D
<--D E
Program--E L
>--L M
>--M N
(--N O
)--O P
;--P Q
logger.. 
... 
LogError.. #
(..# $
ex..$ &
,..& '
$str..( L
)..L M
;..M N
}// 
}00 
}11 	
}44 
}55 À>
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
services)) 
.)) 
AddSingleton)) !
())! "
mapper))" (
)))( )
;))) *
services** 
.** 
	AddScoped** 
<** 
IUnitOfWork** *
,*** +

UnitOfWork**, 6
>**6 7
(**7 8
)**8 9
;**9 :
services,, 
.,, 
	Configure,, 
<,, 
FormOptions,, *
>,,* +
(,,+ ,
options,,, 3
=>,,4 6
{-- 
options.. 
... 
ValueLengthLimit.. (
=..) *
int..+ .
.... /
MaxValue../ 7
;..7 8
options// 
.// $
MultipartBodyLengthLimit// 0
=//1 2
int//3 6
.//6 7
MaxValue//7 ?
;//? @
options00 
.00 !
MemoryBufferThreshold00 -
=00. /
int000 3
.003 4
MaxValue004 <
;00< =
}11 
)11 
;11 
services33 
.33 
AddControllers33 #
(33# $
)33$ %
;33% &
services55 
.55 
AddSwaggerGen55 "
(55" #
options55# *
=>55+ -
{66 
options77 
.77 

SwaggerDoc77 "
(77" #
$str77# '
,77' (
new77) ,
OpenApiInfo77- 8
{779 :
Title77; @
=77A B
$str77C V
,77V W
Version77X _
=77` a
$str77b f
}77g h
)77h i
;77i j
options99 
.99 !
AddSecurityDefinition99 -
(99- .
$str99. :
,99: ;
new99< ?!
OpenApiSecurityScheme99@ U
{:: 
Name;; 
=;; 
$str;; *
,;;* +
Type<< 
=<< 
SecuritySchemeType<< -
.<<- .
Http<<. 2
,<<2 3
Scheme== 
=== 
$str== %
,==% &
BearerFormat>>  
=>>! "
$str>># (
,>>( )
In?? 
=?? 
ParameterLocation?? *
.??* +
Header??+ 1
,??1 2
Description@@ 
=@@  !
$str@@" U
}AA 
)AA 
;AA 
optionsCC 
.CC "
AddSecurityRequirementCC .
(CC. /
newCC/ 2&
OpenApiSecurityRequirementCC3 M
{DD 
{EE 
newFF !
OpenApiSecuritySchemeFF 3
{GG 
	ReferenceHH  )
=HH* +
newHH, /
OpenApiReferenceHH0 @
{II  !
TypeJJ$ (
=JJ) *
ReferenceTypeJJ+ 8
.JJ8 9
SecuritySchemeJJ9 G
,JJG H
IdKK$ &
=KK' (
$strKK) 5
}LL  !
}MM 
,MM 
ArrayNN !
.NN! "
EmptyNN" '
<NN' (
stringNN( .
>NN. /
(NN/ 0
)NN0 1
}OO 
}PP 
)PP 
;PP 
}QQ 
)QQ 
;QQ 
servicesSS 
.TT 3
'RegisterAssemblyPublicNonGenericClassesTT 7
(TT7 8
AssemblyTT8 @
.TT@ A
GetAssemblyTTA L
(TTL M
typeofTTM S
(TTS T
PersonServiceTTT a
)TTa b
)TTb c
)TTc d
.UU 
WhereUU 
(UU 
xUU 
=>UU 
xUU 
.UU 
NameUU !
.UU! "
EndsWithUU" *
(UU* +
$strUU+ 4
)UU4 5
)UU5 6
.UU6 7)
AsPublicImplementedInterfacesUU7 T
(UUT U
ServiceLifetimeUUU d
.UUd e
ScopedUUe k
)UUk l
;UUl m
servicesWW 
.WW 
	ConfigureWW 
<WW 
	SmtpModelWW (
>WW( )
(WW) *
ConfigurationWW* 7
.WW7 8

GetSectionWW8 B
(WWB C
$strWWC I
)WWI J
)WWJ K
;WWK L
}XX 	
public[[ 
void[[ 
	Configure[[ 
([[ 
IApplicationBuilder[[ 1
app[[2 5
,[[5 6
IWebHostEnvironment[[7 J
env[[K N
)[[N O
{\\ 	
if]] 
(]] 
env]] 
.]] 
IsDevelopment]] !
(]]! "
)]]" #
)]]# $
{^^ 
app__ 
.__ %
UseDeveloperExceptionPage__ -
(__- .
)__. /
;__/ 0
app`` 
.`` 

UseSwagger`` 
(`` 
)``  
;``  !
appaa 
.aa 
UseSwaggerUIaa  
(aa  !
caa! "
=>aa# %
caa& '
.aa' (
SwaggerEndpointaa( 7
(aa7 8
$straa8 R
,aaR S
$straaT j
)aaj k
)aak l
;aal m
}bb 
appdd 
.dd 
UseCorsdd 
(dd 
optionsdd 
=>dd  "
{ee 
optionsff 
.ff 
AllowAnyOriginff &
(ff& '
)ff' (
.gg 
AllowAnyHeadergg #
(gg# $
)gg$ %
.hh 
AllowAnyMethodhh #
(hh# $
)hh$ %
;hh% &
}ii 
)ii 
;ii 
appkk 
.kk 
UseHttpsRedirectionkk #
(kk# $
)kk$ %
;kk% &
appll 
.ll 
UseStaticFilesll 
(ll 
)ll  
;ll  !
appmm 
.mm 

UseRoutingmm 
(mm 
)mm 
;mm 
appnn 
.nn 
UseAuthenticationnn !
(nn! "
)nn" #
;nn# $
appoo 
.oo 
UseAuthorizationoo  
(oo  !
)oo! "
;oo" #
appqq 
.qq 
UseEndpointsqq 
(qq 
	endpointsqq &
=>qq' )
{rr 
	endpointsss 
.ss 
MapControllersss (
(ss( )
)ss) *
;ss* +
}tt 
)tt 
;tt 
}uu 	
}vv 
}ww 