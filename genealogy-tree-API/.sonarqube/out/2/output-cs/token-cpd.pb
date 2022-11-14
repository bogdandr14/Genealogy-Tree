�O
aE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Auth\AuthService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Auth! %
{ 
public 

class 
AuthService 
: 
BaseService *
,* +
IAuthService, 8
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
public 
AuthService 
( 
IUnitOfWork &

unitOfWork' 1
,1 2
IMapper3 :
mapper; A
)A B
:C D
baseE I
(I J

unitOfWorkJ T
)T U
{ 	
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
LoginResponseModel ,
>, -
Login. 3
(3 4

LoginModel4 >
	userLogin? H
)H I
{ 	
User 
user 
= 

unitOfWork "
." #
User# '
.' (
Filter( .
(. /
x/ 0
=>1 3
x4 5
.5 6
Username6 >
==? A
	userLoginB K
.K L
UsernameL T
)T U
.U V
IncludeV ]
(] ^
u^ _
=>` b
uc d
.d e
Persone k
)k l
.l m
FirstOrDefaultm {
({ |
)| }
;} ~
if 
( 
user 
!= 
null 
&& 
HashGenerator  -
.- .
ValidateHash. :
(: ;
	userLogin; D
.D E
PasswordE M
,M N
userO S
.S T
PasswordSaltT `
,` a
userb f
.f g
PasswordHashg s
)s t
)t u
{ 
LoginResponseModel "
loginResponseModel# 5
=6 7
_mapper8 ?
.? @
Map@ C
<C D
LoginResponseModelD V
>V W
(W X
userX \
)\ ]
;] ^
loginResponseModel "
." #
Token# (
=) *
await+ 0
Task1 5
.5 6
Run6 9
(9 :
(: ;
); <
=>= ?
TokenService@ L
.L M
GenerateTokenM Z
(Z [
user[ _
,_ `
	UserRolesa j
.j k
Userk o
)o p
)p q
;q r
return 
loginResponseModel )
;) *
}   
return!! 
null!! 
;!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
UserDetailsModel$$ *
>$$* +
Register$$, 4
($$4 5
RegisterModel$$5 B
userRegister$$C O
)$$O P
{%% 	
if&& 
(&& 

unitOfWork&& 
.&& 
User&& 
.&&  
Filter&&  &
(&&& '
x&&' (
=>&&) +
x&&, -
.&&- .
Username&&. 6
==&&7 9
userRegister&&: F
.&&F G
Username&&G O
)&&O P
.&&P Q
FirstOrDefault&&Q _
(&&_ `
)&&` a
!=&&b d
default&&e l
(&&l m
User&&m q
)&&q r
)&&r s
{'' 
return(( 
null(( 
;(( 
})) 
if++ 
(++ 

unitOfWork++ 
.++ 
User++ 
.++  
Filter++  &
(++& '
x++' (
=>++) +
x++, -
.++- .
Email++. 3
==++4 6
userRegister++7 C
.++C D
Email++D I
)++I J
.++J K
FirstOrDefault++K Y
(++Y Z
)++Z [
!=++\ ^
default++_ f
(++f g
User++g k
)++k l
)++l m
{,, 
return-- 
null-- 
;-- 
}.. 
Tree00 
userTree00 
=00 
new00 
Tree00  $
(00$ %
)00% &
{11 

LastUpdate22 
=22 
DateTime22 %
.22% &
UtcNow22& ,
}33 
;33 
userTree55 
=55 
await55 

unitOfWork55 '
.55' (
Tree55( ,
.55, -
Create55- 3
(553 4
userTree554 <
)55< =
;55= >
Person77 
person77 
=77 
_mapper77 #
.77# $
Map77$ '
<77' (
Person77( .
>77. /
(77/ 0
userRegister770 <
)77< =
;77= >
person99 
.99 
TreeId99 
=99 
userTree99 $
.99$ %
Id99% '
;99' (
person:: 
.:: 
LivingPlace:: 
=::  
new::! $
Location::% -
(::- .
)::. /
;::/ 0
person;; 
.;; 

BirthPlace;; 
=;; 
new;;  #
Location;;$ ,
(;;, -
);;- .
;;;. /
Person<< 
personCreated<<  
=<<! "
await<<# (

unitOfWork<<) 3
.<<3 4
Person<<4 :
.<<: ;
Create<<; A
(<<A B
person<<B H
)<<H I
;<<I J
Position== 
newPosition==  
===! "
new==# &
Position==' /
(==/ 0
)==0 1
;==1 2
Position>> 
position>> 
=>> 
await>>  %

unitOfWork>>& 0
.>>0 1
Position>>1 9
.>>9 :
Create>>: @
(>>@ A
newPosition>>A L
)>>L M
;>>M N
User@@ 
user@@ 
=@@ 
_mapper@@ 
.@@  
Map@@  #
<@@# $
User@@$ (
>@@( )
(@@) *
userRegister@@* 6
)@@6 7
;@@7 8
userAA 
.AA 
IdAA 
=AA 
GuidAA 
.AA 
NewGuidAA "
(AA" #
)AA# $
;AA$ %
userBB 
.BB 
PersonIdBB 
=BB 
personCreatedBB )
.BB) *
IdBB* ,
;BB, -
userCC 
.CC 

PositionIdCC 
=CC 
positionCC &
.CC& '
IdCC' )
;CC) *
userDD 
.DD 
PasswordSaltDD 
=DD 
SaltGeneratorDD  -
.DD- .
CreateDD. 4
(DD4 5
)DD5 6
;DD6 7
userEE 
.EE 
PasswordHashEE 
=EE 
HashGeneratorEE  -
.EE- .

CreateHashEE. 8
(EE8 9
userRegisterEE9 E
.EEE F
PasswordEEF N
,EEN O
userEEP T
.EET U
PasswordSaltEEU a
)EEa b
;EEb c
UserFF 
createdUserFF 
=FF 
awaitFF $

unitOfWorkFF% /
.FF/ 0
UserFF0 4
.FF4 5
CreateFF5 ;
(FF; <
userFF< @
)FF@ A
;FFA B
UserDetailsModelGG 
returnEventGG (
=GG) *
_mapperGG+ 2
.GG2 3
MapGG3 6
<GG6 7
UserDetailsModelGG7 G
>GGG H
(GGH I
createdUserGGI T
)GGT U
;GGU V
returnII 
returnEventII 
;II 
}JJ 	
publicLL 
asyncLL 
TaskLL 
<LL 
UserDetailsModelLL *
>LL* +
UpdatePasswordLL, :
(LL: ;
UpdatePasswordModelLL; N
updatePasswordLLO ]
)LL] ^
{MM 	
UserNN 
userNN 
=NN 

unitOfWorkNN "
.NN" #
UserNN# '
.NN' (
FilterNN( .
(NN. /
xNN/ 0
=>NN1 3
xNN4 5
.NN5 6
UsernameNN6 >
==NN? A
updatePasswordNNB P
.NNP Q
UsernameNNQ Y
)NNY Z
.NNZ [
FirstOrDefaultNN[ i
(NNi j
)NNj k
;NNk l
ifPP 
(PP 
userPP 
!=PP 
defaultPP 
(PP  
UserPP  $
)PP$ %
&&PP& (
HashGeneratorPP) 6
.PP6 7
ValidateHashPP7 C
(PPC D
updatePasswordPPD R
.PPR S
CurrentPasswordPPS b
,PPb c
userPPd h
.PPh i
PasswordSaltPPi u
,PPu v
userPPw {
.PP{ |
PasswordHash	PP| �
)
PP� �
)
PP� �
{QQ 
userRR 
.RR 
PasswordSaltRR !
=RR" #
SaltGeneratorRR$ 1
.RR1 2
CreateRR2 8
(RR8 9
)RR9 :
;RR: ;
userSS 
.SS 
PasswordHashSS !
=SS" #
HashGeneratorSS$ 1
.SS1 2

CreateHashSS2 <
(SS< =
updatePasswordSS= K
.SSK L
NewPasswordSSL W
,SSW X
userSSY ]
.SS] ^
PasswordSaltSS^ j
)SSj k
;SSk l
awaitTT 

unitOfWorkTT  
.TT  !
UserTT! %
.TT% &
UpdateTT& ,
(TT, -
userTT- 1
)TT1 2
;TT2 3
UserDetailsModelUU  
returnEventUU! ,
=UU- .
_mapperUU/ 6
.UU6 7
MapUU7 :
<UU: ;
UserDetailsModelUU; K
>UUK L
(UUL M
userUUM Q
)UUQ R
;UUR S
returnVV 
returnEventVV "
;VV" #
}WW 
elseXX 
{YY 
returnZZ 
nullZZ 
;ZZ 
}[[ 
}\\ 	
}]] 
}^^ �
cE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Auth\HashGenerator.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Auth! %
{ 
internal 
static 
class 
HashGenerator '
{ 
public		 
static		 
string		 

CreateHash		 '
(		' (
string		( .
value		/ 4
,		4 5
string		6 <
salt		= A
)		A B
{

 	
var 
hash 
= 
KeyDerivation $
.$ %
Pbkdf2% +
(+ ,
password  (
:( )
value* /
,/ 0
salt  $
:$ %
Encoding& .
.. /
UTF8/ 3
.3 4
GetBytes4 <
(< =
salt= A
)A B
,B C
prf  #
:# $
KeyDerivationPrf% 5
.5 6

HMACSHA5126 @
,@ A
iterationCount  .
:. /
$num0 5
,5 6
numBytesRequested  1
:1 2
$num3 6
/7 8
$num9 :
): ;
;; <
return 
Convert 
. 
ToBase64String )
() *
hash* .
). /
;/ 0
} 	
public 
static 
bool 
ValidateHash '
(' (
string( .
value/ 4
,4 5
string6 <
salt= A
,A B
stringC I
hashJ N
)N O
=> 

CreateHash 
( 
value 
,  
salt! %
)% &
.& '
Equals' -
(- .
hash. 2
)2 3
;3 4
} 
} �	
cE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Auth\SaltGenerator.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Auth! %
{ 
internal 
static 
class 
SaltGenerator '
{ 
public 
static 
string 
Create #
(# $
)$ %
{		 	
byte

 
[

 
]

 
salt

 
=

 
new

 
byte

 "
[

" #
$num

# &
/

' (
$num

) *
]

* +
;

+ ,
using 
( 
var 
rngCsp 
= 
new  #$
RNGCryptoServiceProvider$ <
(< =
)= >
)> ?
{ 
rngCsp 
. 
GetNonZeroBytes &
(& '
salt' +
)+ ,
;, -
return 
Convert 
. 
ToBase64String -
(- .
salt. 2
)2 3
;3 4
} 
} 	
} 
} �3
bE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Auth\TokenService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Auth! %
{ 
public 

static 
class 
TokenService $
{ 
public 
static 
readonly 
string %
UserRole& .
=/ 0
$str1 <
;< =
public 
static 
string 
GenerateToken *
(* +
User+ /
user0 4
,4 5
	UserRoles6 ?
userRole@ H
)H I
{ 	
var 

authClaims 
= 
new  
List! %
<% &
Claim& +
>+ ,
{ 
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2

UniqueName2 <
,< =
user> B
.B C
UsernameC K
)K L
,L M
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2
	GivenName2 ;
,; <
user= A
.A B
PersonB H
.H I
	FirstNameI R
)R S
,S T
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2

FamilyName2 <
,< =
user> B
.B C
PersonC I
.I J
LastNameJ R
)R S
,S T
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2
Email2 7
,7 8
user9 =
.= >
Email> C
)C D
,D E
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2
Jti2 5
,5 6
user7 ;
.; <
Id< >
.> ?
ToString? G
(G H
)H I
)I J
,J K
new 
Claim 
( 
UserRole "
," #
($ %
(% &
int& )
)) *
userRole* 2
)2 3
.3 4
ToString4 <
(< =
)= >
)> ?
} 
; 
var 
authSignIngKey 
=  
new! $ 
SymmetricSecurityKey% 9
(9 :
Encoding: B
.B C
UTF8C G
.G H
GetBytesH P
(P Q
ConstantsJwtQ ]
.] ^
Secret^ d
)d e
)e f
;f g
var   
token   
=   
new   
JwtSecurityToken   ,
(  , -
ConstantsJwt!! 
.!! 
Issuer!! #
,!!# $
ConstantsJwt"" 
."" 
Audience"" %
,""% &

authClaims## 
,## 
expires$$ 
:$$ 
DateTime$$ !
.$$! "
UtcNow$$" (
.$$( )

AddMinutes$$) 3
($$3 4
$num$$4 7
)$$7 8
,$$8 9
signingCredentials%% "
:%%" #
new%%$ '
SigningCredentials%%( :
(%%: ;
authSignIngKey%%; I
,%%I J
SecurityAlgorithms%%K ]
.%%] ^

HmacSha256%%^ h
)%%h i
)&& 
;&& 
return(( 
new(( #
JwtSecurityTokenHandler(( .
(((. /
)((/ 0
.((0 1

WriteToken((1 ;
(((; <
token((< A
)((A B
;((B C
})) 	
public++ 
static++ 
string++ 
GetClaim++ %
(++% &
string++& ,
token++- 2
,++2 3
string++4 :
	claimName++; D
)++D E
{,, 	
var-- 
tokenHandler-- 
=-- 
new-- "#
JwtSecurityTokenHandler--# :
(--: ;
)--; <
;--< =
var.. 
securityToken.. 
=.. 
tokenHandler..  ,
..., -
	ReadToken..- 6
(..6 7
token..7 <
)..< =
as..> @
JwtSecurityToken..A Q
;..Q R
return// 
securityToken//  
.//  !
Claims//! '
.//' (
FirstOrDefault//( 6
(//6 7
claim//7 <
=>//= ?
claim//@ E
.//E F
Type//F J
==//K M
	claimName//N W
)//W X
?//X Y
.//Y Z
Value//Z _
;//_ `
}00 	
public22 
static22 
bool22 
ValidateToken22 (
(22( )
string22) /
token220 5
)225 6
{33 	
var55 
tokenHandler55 
=55 
new55 "#
JwtSecurityTokenHandler55# :
(55: ;
)55; <
;55< =
var77 
key77 
=77 
new77  
SymmetricSecurityKey77 .
(77. /
Encoding77/ 7
.777 8
UTF8778 <
.77< =
GetBytes77= E
(77E F
ConstantsJwt77F R
.77R S
Secret77S Y
)77Y Z
)77Z [
;77[ \
try99 
{:: 
tokenHandler<< 
.<< 
ValidateToken<< *
(<<* +
token<<+ 0
,<<0 1
new<<2 5%
TokenValidationParameters<<6 O
{== $
ValidateIssuerSigningKey>> ,
=>>- .
true>>/ 3
,>>3 4
ValidateIssuer?? "
=??# $
true??% )
,??) *
ValidateAudience@@ $
=@@% &
true@@' +
,@@+ ,
IssuerSigningKeyAA $
=AA% &
keyAA' *
,AA* +
ValidIssuerBB 
=BB  !
ConstantsJwtBB" .
.BB. /
IssuerBB/ 5
,BB5 6
ValidAudienceCC !
=CC" #
ConstantsJwtCC$ 0
.CC0 1
AudienceCC1 9
,CC9 :
	ClockSkewDD 
=DD 
TimeSpanDD  (
.DD( )
ZeroDD) -
}EE 
,EE 
outEE 
SecurityTokenEE $
validatedTokenEE% 3
)EE3 4
;EE4 5
returnFF 
trueFF 
;FF 
}GG 
catchHH 
{II 
returnKK 
falseKK 
;KK 
}LL 
}MM 	
}NN 
}OO �
_E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Auth\UserRoles.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Auth! %
{ 
public 

enum 
	UserRoles 
{ 
User 
= 
$num 
, 
Admin 
= 
$num 
} 
} �
gE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Email\EmailDescription.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Email! &
{ 
public		 

class		 
EmailDescription		 !
{

 
public 
string 

ReportedBy  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
SupportNote !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	ReplyNote 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} �
jE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Email\EmailLanguageHelper.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Email! &
{ 
public 

static 
class 
EmailLanguageHelper +
{ 
const 
string 
ReportedByEng "
=# $
$str% 2
;2 3
const 
string 
ReportedByRo !
=" #
$str$ .
;. /
const 
string 
SupportNoteEng #
=$ %
$str	& �
;
� �
const		 
string		 
SupportNoteRo		 "
=		# $
$str			% �
;
		� �
const 
string 
ReplyNoteEng !
=" #
$str$ n
;n o
const 
string 
ReplyNoteRo  
=! "
$str# q
;q r
public 
static 
EmailDescription &
GetEmailDescription' :
(: ;
string; A
langB F
)F G
{ 	
switch 
( 
lang 
) 
{ 
case 
$str 
: 
return 
new 
EmailDescription /
(/ 0
)0 1
{ 

ReportedBy "
=# $
ReportedByRo% 1
,1 2
	ReplyNote !
=" #
ReplyNoteRo$ /
,/ 0
SupportNote #
=$ %
SupportNoteRo& 3
} 
; 
case 
$str 
: 
default 
: 
return 
new 
EmailDescription /
(/ 0
)0 1
{ 

ReportedBy "
=# $
ReportedByEng% 2
,2 3
	ReplyNote !
=" #
ReplyNoteEng$ 0
,0 1
SupportNote   #
=  $ %
SupportNoteEng  & 4
}!! 
;!! 
}"" 
}$$ 	
}%% 
}&& �E
cE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Email\EmailService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Email! &
{ 
public 

class 
EmailService 
: 
BaseService  +
,+ ,
IEmailService- :
{ 
private 
readonly 
	SmtpModel "
_smtp# (
;( )
public 
IConfiguration 
_configuration ,
{- .
get/ 2
;2 3
}4 5
public 
EmailService 
( 
IUnitOfWork '

unitOfWork( 2
,2 3
IOptions4 <
<< =
	SmtpModel= F
>F G
smtpH L
,L M
IConfigurationN \
configuration] j
)j k
:l m
basen r
(r s

unitOfWorks }
)} ~
{ 	
_smtp 
= 
smtp 
. 
Value 
; 
_configuration 
= 
configuration *
;* +
} 	
public 
async 
Task 
SendSupportTicket +
(+ ,
SupportTicket, 9
supportTicket: G
)G H
{ 	
MailMessage 
mailMessage #
=$ %!
GetDefaultMailMessage& ;
(; <
)< =
;= >
mailMessage   
.   
Subject   
=    !
$str  " %
+  & '
supportTicket  ( 5
.  5 6
Type  6 :
+  ; <
$str  = A
+  B C
supportTicket  D Q
.  Q R
Language  R Z
.  Z [
ToUpper  [ b
(  b c
)  c d
+  e f
$str  g k
+  l m
supportTicket  n {
.  { |
Subject	  | �
;
  � �
string!! 
path!! 
=!! 
	Directory!! #
.!!# $
GetCurrentDirectory!!$ 7
(!!7 8
)!!8 9
+!!: ;
_configuration!!< J
[!!J K
$str!!K \
]!!\ ]
;!!] ^
mailMessage"" 
."" 
Body"" 
="" %
GetSupportTicketEmailBody"" 8
(""8 9
supportTicket""9 F
,""F G
path""H L
)""L M
;""M N
mailMessage## 
.## 
To## 
.## 
Add## 
(## 
_smtp## $
.##$ %
From##% )
)##) *
;##* +
if%% 
(%% 
IsValidEmail%% 
(%% 
supportTicket%% *
.%%* +
EmailContact%%+ 7
)%%7 8
)%%8 9
{&& 
mailMessage'' 
.'' 
CC'' 
.'' 
Add'' "
(''" #
supportTicket''# 0
.''0 1
EmailContact''1 =
)''= >
;''> ?
}(( 
await** 
Task** 
.** 
Run** 
(** 
(** 
)** 
=>**  
	SendEmail**! *
(*** +
mailMessage**+ 6
)**6 7
)**7 8
;**8 9
}++ 	
private-- 

SmtpClient-- 
GetSMTPClient-- (
(--( )
)--) *
{.. 	
NetworkCredential// 
networkCredential// /
=//0 1
new//2 5
NetworkCredential//6 G
(//G H
_smtp//H M
.//M N
From//N R
,//R S
_smtp//T Y
.//Y Z
Password//Z b
)//b c
;//c d

SmtpClient00 
client00 
=00 
new00  #

SmtpClient00$ .
{11 
Host22 
=22 
_smtp22 
.22 
Host22 !
,22! "
Port33 
=33 
_smtp33 
.33 
Port33 !
,33! "
	EnableSsl44 
=44 
true44  
,44  !!
UseDefaultCredentials55 %
=55& '
_smtp55( -
.55- .!
UseDefaultCredentials55. C
,55C D
Credentials66 
=66 
networkCredential66 /
}77 
;77 
return88 
client88 
;88 
}99 	
private;; 
void;; 
	SendEmail;; 
(;; 
MailMessage;; *
mailMessage;;+ 6
);;6 7
{<< 	
try== 
{>> 
GetSMTPClient?? 
(?? 
)?? 
.??  
Send??  $
(??$ %
mailMessage??% 0
)??0 1
;??1 2
}@@ 
catchAA 
{BB 
ConsoleCC 
.CC 
	WriteLineCC !
(CC! "
$strCC" H
)CCH I
;CCI J
}DD 
}EE 	
privateGG 
MailMessageGG !
GetDefaultMailMessageGG 1
(GG1 2
)GG2 3
{HH 	
MailMessageII 
messageII 
=II  !
newII" %
MailMessageII& 1
{JJ 
FromKK 
=KK 
newKK 
MailAddressKK &
(KK& '
_smtpKK' ,
.KK, -
FromKK- 1
)KK1 2
,KK2 3

IsBodyHtmlLL 
=LL 
_smtpLL "
.LL" #

IsBodyHtmlLL# -
,LL- .
}MM 
;MM 
returnOO 
messageOO 
;OO 
}PP 	
privateRR 
staticRR 
boolRR 
IsValidEmailRR (
(RR( )
stringRR) /
emailaddressRR0 <
)RR< =
{SS 	
tryTT 
{UU 
returnVV 
MailAddressVV "
.VV" #
	TryCreateVV# ,
(VV, -
emailaddressVV- 9
,VV9 :
outVV; >
MailAddressVV? J
_VVK L
)VVL M
;VVM N
}WW 
catchXX 
(XX 
FormatExceptionXX "
)XX" #
{YY 
returnZZ 
falseZZ 
;ZZ 
}[[ 
}\\ 	
private^^ 
static^^ 
string^^ %
GetSupportTicketEmailBody^^ 7
(^^7 8
SupportTicket^^8 E
supportTicket^^F S
,^^S T
string^^U [
path^^\ `
)^^` a
{__ 	
StreamReader`` 
reader`` 
=``  !
File``" &
.``& '
OpenText``' /
(``/ 0
path``0 4
)``4 5
;``5 6
stringaa 
bodyaa 
=aa 
readeraa  
.aa  !
	ReadToEndaa! *
(aa* +
)aa+ ,
;aa, -
PropertyInfobb 
[bb 
]bb 
stbb 
=bb 
supportTicketbb  -
.bb- .
GetTypebb. 5
(bb5 6
)bb6 7
.bb7 8
GetPropertiesbb8 E
(bbE F
)bbF G
;bbG H
foreachdd 
(dd 
PropertyInfodd !
fdd" #
indd$ &
stdd' )
)dd) *
{ee 
bodyff 
=ff 
bodyff 
.ff 
Replaceff #
(ff# $
$strff$ '
+ff( )
fff* +
.ff+ ,
Nameff, 0
+ff1 2
$strff3 6
,ff6 7
fff8 9
.ff9 :
GetValueff: B
(ffB C
supportTicketffC P
)ffP Q
.ffQ R
ToStringffR Z
(ffZ [
)ff[ \
)ff\ ]
;ff] ^
}gg 
EmailDescriptionii 
emailDescriptionii -
=ii. /
EmailLanguageHelperii0 C
.iiC D
GetEmailDescriptioniiD W
(iiW X
supportTicketiiX e
.iie f
Languageiif n
)iin o
;iio p
PropertyInfojj 
[jj 
]jj 
edjj 
=jj 
emailDescriptionjj  0
.jj0 1
GetTypejj1 8
(jj8 9
)jj9 :
.jj: ;
GetPropertiesjj; H
(jjH I
)jjI J
;jjJ K
foreachll 
(ll 
PropertyInfoll !
fll" #
inll$ &
edll' )
)ll) *
{mm 
bodynn 
=nn 
bodynn 
.nn 
Replacenn #
(nn# $
$strnn$ '
+nn( )
fnn* +
.nn+ ,
Namenn, 0
+nn1 2
$strnn3 6
,nn6 7
fnn8 9
.nn9 :
GetValuenn: B
(nnB C
emailDescriptionnnC S
)nnS T
.nnT U
ToStringnnU ]
(nn] ^
)nn^ _
)nn_ `
;nn` a
}oo 
returnpp 
bodypp 
;pp 
}qq 	
}rr 
}ss �
eE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Helpers\ConstantsJwt.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Helpers! (
{ 
public 

static 
class 
ConstantsJwt $
{ 
public 
const 
string 
Issuer "
=# $
$str% =
;= >
public 
const 
string 
Audience $
=% &
$str' >
;> ?
public 
const 
string 
Secret "
=# $
$str% g
;g h
} 
}		 �

kE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Helpers\ImageFileExtension.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Helpers! (
{ 
public 

static 
class 
FileExtensions &
{ 
public		 
static		 
	ImageFile		 
ToImageFile		  +
(		+ ,
this		, 0
	IFormFile		1 :
file		; ?
)		? @
{

 	
if 
( 
file 
is 
null 
) 
{ 
return 
null 
; 
} 
return 
new 
	ImageFile  
{ 
Name 
= 
Guid 
. 
NewGuid #
(# $
)$ %
,% &
MimeType 
= 
file 
.  
ContentType  +
,+ ,
Stream 
= 
file 
. 
OpenReadStream ,
(, -
)- .
,. /
SizeInBytes 
= 
file "
." #
Length# )
} 
; 
} 	
} 
} ��
gE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Helpers\MappingProfile.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Helpers! (
{ 
public 

class 
MappingProfile 
:  !
Profile" )
{ 
public 
static 
string 
MemberExclusionKey /
{0 1
get2 5
;5 6
}7 8
=9 :
$str; D
;D E
public 
MappingProfile 
( 
) 
{ 	
ConfigureMappings 
( 
) 
;  
} 	
private 
void 
ConfigureMappings &
(& '
)' (
{ 	
	CreateMap"" 
<"" 
	Education"" 
,""  
EducationModel""! /
>""/ 0
(""0 1
)""1 2
.## 

ReverseMap## 
(## 
)## 
;## 
	CreateMap%% 
<%% 
EducationLevel%% $
,%%$ %
GenericNameModel%%& 6
>%%6 7
(%%7 8
)%%8 9
.&& 

ReverseMap&& 
(&& 
)&& 
;&& 
	CreateMap)) 
<)) 
Image)) 
,)) 
	ImageFile)) &
>))& '
())' (
)))( )
.** 
	ForMember** 
(** 
x** 
=>** 
x**  !
.**! "
Name**" &
,**& '
y**( )
=>*** ,
y**- .
.**. /
MapFrom**/ 6
(**6 7
z**7 8
=>**9 ;
Guid**< @
.**@ A
Parse**A F
(**F G
Path**G K
.**K L'
GetFileNameWithoutExtension**L g
(**g h
z**h i
.**i j
FileName**j r
)**r s
)**s t
)**t u
)**u v
;**v w
	CreateMap,, 
<,, 
	ImageFile,, 
,,,  
Image,,! &
>,,& '
(,,' (
),,( )
;,,) *
	CreateMap// 
<// 
Location// 
,// 
LocationModel//  -
>//- .
(//. /
)/// 0
.00 

ReverseMap00 
(00 
)00 
;00 
	CreateMap33 
<33 
Marriage33 
,33 
MarriedPersonModel33  2
>332 3
(333 4
)334 5
.44 
	ForMember44 
(44 
x44 
=>44 
x44  !
.44! "
MarriageStarted44" 1
,441 2
y443 4
=>445 7
y448 9
.449 :
MapFrom44: A
(44A B
z44B C
=>44D F
z44G H
.44H I
	StartDate44I R
)44R S
)44S T
.55 
	ForMember55 
(55 
x55 
=>55 
x55  !
.55! "
MarriageEnded55" /
,55/ 0
y551 2
=>553 5
y556 7
.557 8
MapFrom558 ?
(55? @
z55@ A
=>55B D
z55E F
.55F G
EndDate55G N
)55N O
)55O P
.66 
	ForMember66 
(66 
x66 
=>66 
x66  !
.66! "
PersonMarriedTo66" 1
,661 2
y663 4
=>665 7
y668 9
.669 :
MapFrom66: A
(66A B
z66B C
=>66D F
DefineMapping66G T
(66T U
z66U V
.66V W
FirstPerson66W b
,66b c
z66d e
.66e f
SecondPerson66f r
)66r s
)66s t
)66t u
;66u v
	CreateMap88 
<88 
Marriage88 
,88  
MarriageDetailsModel88  4
>884 5
(885 6
)886 7
.99 
	ForMember99 
(99 
x99 
=>99 
x99  !
.99! "
MarriageStarted99" 1
,991 2
y993 4
=>995 7
y998 9
.999 :
MapFrom99: A
(99A B
z99B C
=>99D F
z99G H
.99H I
	StartDate99I R
)99R S
)99S T
.:: 
	ForMember:: 
(:: 
x:: 
=>:: 
x::  !
.::! "
MarriageEnded::" /
,::/ 0
y::1 2
=>::3 5
y::6 7
.::7 8
MapFrom::8 ?
(::? @
z::@ A
=>::B D
z::E F
.::F G
EndDate::G N
)::N O
)::O P
.;; 
	ForMember;; 
(;; 
x;; 
=>;; 
x;;  !
.;;! "
PersonMarriedTo;;" 1
,;;1 2
y;;3 4
=>;;5 7
y;;8 9
.;;9 :
MapFrom;;: A
(;;A B
z;;B C
=>;;D F
z;;G H
.;;H I
SecondPerson;;I U
);;U V
);;V W
.<< 

ReverseMap<< 
(<< 
)<< 
;<< 
	CreateMap>> 
<>> 
Marriage>> 
,>> %
MarriageCreateUpdateModel>>  9
>>>9 :
(>>: ;
)>>; <
.?? 

ReverseMap?? 
(?? 
)?? 
;?? 
	CreateMapBB 
<BB 
NationalityBB !
,BB! "
GenericNameModelBB# 3
>BB3 4
(BB4 5
)BB5 6
.CC 

ReverseMapCC 
(CC 
)CC 
;CC 
	CreateMapFF 
<FF 

OccupationFF  
,FF  !
OccupationModelFF" 1
>FF1 2
(FF2 3
)FF3 4
.GG 

ReverseMapGG 
(GG 
)GG 
;GG 
	CreateMapJJ 
<JJ 
ParentChildJJ !
,JJ! "
ParentModelJJ# .
>JJ. /
(JJ/ 0
)JJ0 1
.KK 
	ForMemberKK 
(KK 
xKK 
=>KK 
xKK  !
.KK! "
ParentChildIdKK" /
,KK/ 0
yKK1 2
=>KK3 5
yKK6 7
.KK7 8
MapFromKK8 ?
(KK? @
zKK@ A
=>KKB D
zKKE F
.KKF G
IdKKG I
)KKI J
)KKJ K
.LL 
	ForMemberLL 
(LL 
xLL 
=>LL 
xLL  !
.LL! "
TreeIdLL" (
,LL( )
yLL* +
=>LL, .
yLL/ 0
.LL0 1
MapFromLL1 8
(LL8 9
zLL9 :
=>LL; =
zLL> ?
.LL? @
ParentLL@ F
.LLF G
TreeIdLLG M
)LLM N
)LLN O
.MM 
	ForMemberMM 
(MM 
xMM 
=>MM 
xMM  !
.MM! "
PersonIdMM" *
,MM* +
yMM, -
=>MM. 0
yMM1 2
.MM2 3
MapFromMM3 :
(MM: ;
zMM; <
=>MM= ?
zMM@ A
.MMA B
ParentMMB H
.MMH I
IdMMI K
)MMK L
)MML M
.NN 
	ForMemberNN 
(NN 
xNN 
=>NN 
xNN  !
.NN! "
	FirstNameNN" +
,NN+ ,
yNN- .
=>NN/ 1
yNN2 3
.NN3 4
MapFromNN4 ;
(NN; <
zNN< =
=>NN> @
zNNA B
.NNB C
ParentNNC I
.NNI J
	FirstNameNNJ S
)NNS T
)NNT U
.OO 
	ForMemberOO 
(OO 
xOO 
=>OO 
xOO  !
.OO! "
LastNameOO" *
,OO* +
yOO, -
=>OO. 0
yOO1 2
.OO2 3
MapFromOO3 :
(OO: ;
zOO; <
=>OO= ?
zOO@ A
.OOA B
ParentOOB H
.OOH I
LastNameOOI Q
)OOQ R
)OOR S
.PP 
	ForMemberPP 
(PP 
xPP 
=>PP 
xPP  !
.PP! "
GenderPP" (
,PP( )
yPP* +
=>PP, .
yPP/ 0
.PP0 1
MapFromPP1 8
(PP8 9
zPP9 :
=>PP; =
zPP> ?
.PP? @
ParentPP@ F
.PPF G
GenderPPG M
.PPM N
ToStringPPN V
(PPV W
)PPW X
)PPX Y
)PPY Z
.QQ 
	ForMemberQQ 
(QQ 
xQQ 
=>QQ 
xQQ  !
.QQ! "
ImageIdQQ" )
,QQ) *
yQQ+ ,
=>QQ- /
yQQ0 1
.QQ1 2
MapFromQQ2 9
(QQ9 :
zQQ: ;
=>QQ< >
zQQ? @
.QQ@ A
ParentQQA G
.QQG H
ImageIdQQH O
)QQO P
)QQP Q
.RR 
	ForMemberRR 
(RR 
xRR 
=>RR 
xRR  !
.RR! "
	BirthDateRR" +
,RR+ ,
yRR- .
=>RR/ 1
yRR2 3
.RR3 4
MapFromRR4 ;
(RR; <
zRR< =
=>RR> @
zRRA B
.RRB C
ParentRRC I
.RRI J
	BirthDateRRJ S
)RRS T
)RRT U
.SS 
	ForMemberSS 
(SS 
xSS 
=>SS 
xSS  !
.SS! "
	DeathDateSS" +
,SS+ ,
ySS- .
=>SS/ 1
ySS2 3
.SS3 4
MapFromSS4 ;
(SS; <
zSS< =
=>SS> @
zSSA B
.SSB C
ParentSSC I
.SSI J
	DeathDateSSJ S
)SSS T
)SST U
.TT 

ReverseMapTT 
(TT 
)TT 
;TT 
	CreateMapVV 
<VV 
ParentModelVV !
,VV! "
ParentChildModelVV# 3
>VV3 4
(VV4 5
)VV5 6
.WW 

ReverseMapWW 
(WW 
)WW 
;WW 
	CreateMapZZ 
<ZZ 
ParentChildZZ !
,ZZ! "

ChildModelZZ# -
>ZZ- .
(ZZ. /
)ZZ/ 0
.[[ 
	ForMember[[ 
([[ 
x[[ 
=>[[ 
x[[  !
.[[! "
ParentChildId[[" /
,[[/ 0
y[[1 2
=>[[3 5
y[[6 7
.[[7 8
MapFrom[[8 ?
([[? @
z[[@ A
=>[[B D
z[[E F
.[[F G
Id[[G I
)[[I J
)[[J K
.\\ 
	ForMember\\ 
(\\ 
x\\ 
=>\\ 
x\\  !
.\\! "
TreeId\\" (
,\\( )
y\\* +
=>\\, .
y\\/ 0
.\\0 1
MapFrom\\1 8
(\\8 9
z\\9 :
=>\\; =
z\\> ?
.\\? @
Child\\@ E
.\\E F
TreeId\\F L
)\\L M
)\\M N
.]] 
	ForMember]] 
(]] 
x]] 
=>]] 
x]]  !
.]]! "
PersonId]]" *
,]]* +
y]], -
=>]]. 0
y]]1 2
.]]2 3
MapFrom]]3 :
(]]: ;
z]]; <
=>]]= ?
z]]@ A
.]]A B
Child]]B G
.]]G H
Id]]H J
)]]J K
)]]K L
.^^ 
	ForMember^^ 
(^^ 
x^^ 
=>^^ 
x^^  !
.^^! "
	FirstName^^" +
,^^+ ,
y^^- .
=>^^/ 1
y^^2 3
.^^3 4
MapFrom^^4 ;
(^^; <
z^^< =
=>^^> @
z^^A B
.^^B C
Child^^C H
.^^H I
	FirstName^^I R
)^^R S
)^^S T
.__ 
	ForMember__ 
(__ 
x__ 
=>__ 
x__  !
.__! "
LastName__" *
,__* +
y__, -
=>__. 0
y__1 2
.__2 3
MapFrom__3 :
(__: ;
z__; <
=>__= ?
z__@ A
.__A B
Child__B G
.__G H
LastName__H P
)__P Q
)__Q R
.`` 
	ForMember`` 
(`` 
x`` 
=>`` 
x``  !
.``! "
Gender``" (
,``( )
y``* +
=>``, .
y``/ 0
.``0 1
MapFrom``1 8
(``8 9
z``9 :
=>``; =
z``> ?
.``? @
Child``@ E
.``E F
Gender``F L
.``L M
ToString``M U
(``U V
)``V W
)``W X
)``X Y
.aa 
	ForMemberaa 
(aa 
xaa 
=>aa 
xaa  !
.aa! "
ImageIdaa" )
,aa) *
yaa+ ,
=>aa- /
yaa0 1
.aa1 2
MapFromaa2 9
(aa9 :
zaa: ;
=>aa< >
zaa? @
.aa@ A
ChildaaA F
.aaF G
ImageIdaaG N
)aaN O
)aaO P
.bb 
	ForMemberbb 
(bb 
xbb 
=>bb 
xbb  !
.bb! "
	BirthDatebb" +
,bb+ ,
ybb- .
=>bb/ 1
ybb2 3
.bb3 4
MapFrombb4 ;
(bb; <
zbb< =
=>bb> @
zbbA B
.bbB C
ChildbbC H
.bbH I
	BirthDatebbI R
)bbR S
)bbS T
.cc 
	ForMembercc 
(cc 
xcc 
=>cc 
xcc  !
.cc! "
	DeathDatecc" +
,cc+ ,
ycc- .
=>cc/ 1
ycc2 3
.cc3 4
MapFromcc4 ;
(cc; <
zcc< =
=>cc> @
zccA B
.ccB C
ChildccC H
.ccH I
	DeathDateccI R
)ccR S
)ccS T
.dd 

ReverseMapdd 
(dd 
)dd 
;dd 
	CreateMapff 
<ff 

ChildModelff  
,ff  !
ParentChildModelff" 2
>ff2 3
(ff3 4
)ff4 5
.gg 

ReverseMapgg 
(gg 
)gg 
;gg 
	CreateMapjj 
<jj 
ParentChildjj !
,jj! "#
ParentChildDetailsModeljj# :
>jj: ;
(jj; <
)jj< =
.kk 
	ForMemberkk 
(kk 
xkk 
=>kk 
xkk  !
.kk! "

RelativeIdkk" ,
,kk, -
ykk. /
=>kk0 2
ykk3 4
.kk4 5
MapFromkk5 <
(kk< =
zkk= >
=>kk? A
zkkB C
.kkC D
IdkkD F
)kkF G
)kkG H
.ll 

ReverseMapll 
(ll 
)ll 
;ll 
	CreateMapnn 
<nn 
ParentChildnn !
,nn! "(
ParentChildCreateUpdateModelnn# ?
>nn? @
(nn@ A
)nnA B
.oo 
	ForMemberoo 
(oo 
xoo 
=>oo 
xoo  !
.oo! "

RelativeIdoo" ,
,oo, -
yoo. /
=>oo0 2
yoo3 4
.oo4 5
MapFromoo5 <
(oo< =
zoo= >
=>oo? A
zooB C
.ooC D
IdooD F
)ooF G
)ooG H
.pp 

ReverseMappp 
(pp 
)pp 
;pp 
	CreateMapss 
<ss 
Personss 
,ss 
GenericPersonModelss 0
>ss0 1
(ss1 2
)ss2 3
.tt 
	ForMembertt 
(tt 
xtt 
=>tt 
xtt  !
.tt! "
PersonIdtt" *
,tt* +
ytt, -
=>tt. 0
ytt1 2
.tt2 3
MapFromtt3 :
(tt: ;
ztt; <
=>tt= ?
ztt@ A
.ttA B
IdttB D
)ttD E
)ttE F
.uu 
	ForMemberuu 
(uu 
xuu 
=>uu 
xuu  !
.uu! "
UserIduu" (
,uu( )
yuu* +
=>uu, .
{vv 
yww 
.ww 
PreConditionww "
(ww" #
srcww# &
=>ww' )
(ww* +
srcww+ .
.ww. /
RelativeForPersonww/ @
!=wwA C
nullwwD H
)wwH I
)wwI J
;wwJ K
yxx 
.xx 
MapFromxx 
(xx 
zxx 
=>xx  "
zxx# $
.xx$ %
RelativeForPersonxx% 6
.xx6 7
RelativeUserIdxx7 E
)xxE F
;xxF G
}yy 
)yy 
.zz 

ReverseMapzz 
(zz 
)zz 
;zz 
	CreateMap|| 
<|| 
Person|| 
,|| 
PersonTreeInfoModel|| 1
>||1 2
(||2 3
)||3 4
.}} 
	ForMember}} 
(}} 
x}} 
=>}} 
x}}  !
.}}! "
PersonId}}" *
,}}* +
y}}, -
=>}}. 0
y}}1 2
.}}2 3
MapFrom}}3 :
(}}: ;
z}}; <
=>}}= ?
z}}@ A
.}}A B
Id}}B D
)}}D E
)}}E F
.~~ 
	ForMember~~ 
(~~ 
x~~ 
=>~~ 
x~~  !
.~~! "
UserId~~" (
,~~( )
y~~* +
=>~~, .
{ 
y
�� 
.
�� 
PreCondition
�� "
(
��" #
src
��# &
=>
��' )
(
��* +
src
��+ .
.
��. /
RelativeForPerson
��/ @
!=
��A C
null
��D H
)
��H I
)
��I J
;
��J K
y
�� 
.
�� 
MapFrom
�� 
(
�� 
z
�� 
=>
��  "
z
��# $
.
��$ %
RelativeForPerson
��% 6
.
��6 7
RelativeUserId
��7 E
)
��E F
;
��F G
}
�� 
)
�� 
.
�� 

ReverseMap
�� 
(
�� 
)
�� 
;
�� 
	CreateMap
�� 
<
�� 
Person
�� 
,
��  
PersonDetailsModel
�� 0
>
��0 1
(
��1 2
)
��2 3
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
PersonId
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
Id
��B D
)
��D E
)
��E F
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
Gender
��" (
,
��( )
y
��* +
=>
��, .
y
��/ 0
.
��0 1
MapFrom
��1 8
(
��8 9
z
��9 :
=>
��; =
z
��> ?
.
��? @
Gender
��@ F
==
��G I
$char
��J M
?
��N O
$str
��P S
:
��T U
$str
��V Y
)
��Y Z
)
��Z [
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
UserId
��" (
,
��( )
y
��* +
=>
��, .
{
�� 
y
�� 
.
�� 
PreCondition
�� "
(
��" #
src
��# &
=>
��' )
(
��* +
src
��+ .
.
��. /
RelativeForPerson
��/ @
!=
��A C
null
��D H
)
��H I
)
��I J
;
��J K
y
�� 
.
�� 
MapFrom
�� 
(
�� 
z
�� 
=>
��  "
z
��# $
.
��$ %
RelativeForPerson
��% 6
.
��6 7
RelativeUserId
��7 E
)
��E F
;
��F G
}
�� 
)
�� 
;
�� 
	CreateMap
�� 
<
�� 
Person
�� 
,
�� %
PersonCreateUpdateModel
�� 5
>
��5 6
(
��6 7
)
��7 8
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
PersonId
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
Id
��B D
)
��D E
)
��E F
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
UserId
��" (
,
��( )
y
��* +
=>
��, .
{
�� 
y
�� 
.
�� 
PreCondition
�� "
(
��" #
src
��# &
=>
��' )
(
��* +
src
��+ .
.
��. /
RelativeForPerson
��/ @
!=
��A C
null
��D H
)
��H I
)
��I J
;
��J K
y
�� 
.
�� 
MapFrom
�� 
(
�� 
z
�� 
=>
��  "
z
��# $
.
��$ %
RelativeForPerson
��% 6
.
��6 7
RelativeUserId
��7 E
)
��E F
;
��F G
}
�� 
)
�� 
.
�� 

ReverseMap
�� 
(
�� 
)
�� 
;
��  
	CreateMap
�� 
<
�� 
Religion
�� 
,
�� 
GenericNameModel
��  0
>
��0 1
(
��1 2
)
��2 3
.
�� 

ReverseMap
�� 
(
�� 
)
�� 
;
�� 
	CreateMap
�� 
<
�� 
Relative
�� 
,
�� 
RelativeModel
��  -
>
��- .
(
��. /
)
��/ 0
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "$
RelativePersonInTreeId
��" 8
,
��8 9
y
��: ;
=>
��< >
y
��? @
.
��@ A
MapFrom
��A H
(
��H I
z
��I J
=>
��K M
z
��N O
.
��O P+
RelativePersonInPrimaryTreeId
��P m
)
��m n
)
��n o
.
�� 

ReverseMap
�� 
(
�� 
)
�� 
;
�� 
	CreateMap
�� 
<
�� 
Relative
�� 
,
�� 
UsersToLinkModel
��  0
>
��0 1
(
��1 2
)
��2 3
.
�� 

ReverseMap
�� 
(
�� 
)
�� 
;
�� 
	CreateMap
�� 
<
�� 
Request
�� 
,
�� !
RequestDetailsModel
�� 2
>
��2 3
(
��3 4
)
��4 5
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
ReceiverUser
��" .
,
��. /
y
��0 1
=>
��2 4
y
��5 6
.
��6 7
MapFrom
��7 >
(
��> ?
z
��? @
=>
��A C
z
��D E
.
��E F
Receiver
��F N
)
��N O
)
��O P
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "

SenderUser
��" ,
,
��, -
y
��. /
=>
��0 2
y
��3 4
.
��4 5
MapFrom
��5 <
(
��< =
z
��= >
=>
��? A
z
��B C
.
��C D
Sender
��D J
)
��J K
)
��K L
.
�� 

ReverseMap
�� 
(
�� 
)
�� 
;
�� 
	CreateMap
�� 
<
�� 
Request
�� 
,
�� &
RequestCreateUpdateModel
�� 7
>
��7 8
(
��8 9
)
��9 :
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
ReceiverUser
��" .
,
��. /
y
��0 1
=>
��2 4
y
��5 6
.
��6 7
MapFrom
��7 >
(
��> ?
z
��? @
=>
��A C
z
��D E
.
��E F
Receiver
��F N
)
��N O
)
��O P
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
SenderUserId
��" .
,
��. /
y
��0 1
=>
��2 4
y
��5 6
.
��6 7
MapFrom
��7 >
(
��> ?
z
��? @
=>
��A C
z
��D E
.
��E F
SenderId
��F N
)
��N O
)
��O P
;
��P Q
	CreateMap
�� 
<
�� &
RequestCreateUpdateModel
�� .
,
��. /
Request
��0 7
>
��7 8
(
��8 9
)
��9 :
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "

ReceiverId
��" ,
,
��, -
y
��. /
=>
��0 2
y
��3 4
.
��4 5
MapFrom
��5 <
(
��< =
z
��= >
=>
��? A
z
��B C
.
��C D
ReceiverUser
��D P
.
��P Q
UserId
��Q W
)
��W X
)
��X Y
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
SenderId
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
SenderUserId
��B N
)
��N O
)
��O P
;
��P Q
	CreateMap
�� 
<
�� 
Request
�� 
,
�� "
RequestResponseModel
�� 3
>
��3 4
(
��4 5
)
��5 6
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
ReceiverUser
��" .
,
��. /
y
��0 1
=>
��2 4
y
��5 6
.
��6 7
MapFrom
��7 >
(
��> ?
z
��? @
=>
��A C
z
��D E
.
��E F
Receiver
��F N
)
��N O
)
��O P
;
��P Q
	CreateMap
�� 
<
�� 
User
�� 
,
�� 
UserSettingsModel
�� -
>
��- .
(
��. /
)
��/ 0
.
�� 

ReverseMap
�� 
(
�� 
)
�� 
;
�� 
	CreateMap
�� 
<
�� 
User
�� 
,
�� 
UserDetailsModel
�� ,
>
��, -
(
��- .
)
��. /
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
	FirstName
��" +
,
��+ ,
y
��- .
=>
��/ 1
y
��2 3
.
��3 4
MapFrom
��4 ;
(
��; <
z
��< =
=>
��> @
z
��A B
.
��B C
Person
��C I
.
��I J
	FirstName
��J S
)
��S T
)
��T U
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
LastName
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
Person
��B H
.
��H I
LastName
��I Q
)
��Q R
)
��R S
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
	BirthDate
��" +
,
��+ ,
y
��- .
=>
��/ 1
y
��2 3
.
��3 4
MapFrom
��4 ;
(
��; <
z
��< =
=>
��> @
z
��A B
.
��B C
Person
��C I
.
��I J
	BirthDate
��J S
)
��S T
)
��T U
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
Gender
��" (
,
��( )
y
��* +
=>
��, .
y
��/ 0
.
��0 1
MapFrom
��1 8
(
��8 9
z
��9 :
=>
��; =
z
��> ?
.
��? @
Person
��@ F
.
��F G
Gender
��G M
)
��M N
)
��N O
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
Nationality
��" -
,
��- .
y
��/ 0
=>
��1 3
y
��4 5
.
��5 6
MapFrom
��6 =
(
��= >
z
��> ?
=>
��@ B
z
��C D
.
��D E
Person
��E K
.
��K L
Nationality
��L W
)
��W X
)
��X Y
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
Religion
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
Person
��B H
.
��H I
Religion
��I Q
)
��Q R
)
��R S
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "

BirthPlace
��" ,
,
��, -
y
��. /
=>
��0 2
y
��3 4
.
��4 5
MapFrom
��5 <
(
��< =
z
��= >
=>
��? A
z
��B C
.
��C D
Person
��D J
.
��J K

BirthPlace
��K U
)
��U V
)
��V W
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
LivingPlace
��" -
,
��- .
y
��/ 0
=>
��1 3
y
��4 5
.
��5 6
MapFrom
��6 =
(
��= >
z
��> ?
=>
��@ B
z
��C D
.
��D E
Person
��E K
.
��K L
LivingPlace
��L W
)
��W X
)
��X Y
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
Parents
��" )
,
��) *
y
��+ ,
=>
��- /
y
��0 1
.
��1 2
MapFrom
��2 9
(
��9 :
z
��: ;
=>
��< >
z
��? @
.
��@ A
Person
��A G
.
��G H
Parents
��H O
.
��O P
ToList
��P V
(
��V W
)
��W X
)
��X Y
)
��Y Z
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
Children
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
Person
��B H
.
��H I
Children
��I Q
.
��Q R
ToList
��R X
(
��X Y
)
��Y Z
)
��Z [
)
��[ \
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
UserId
��" (
,
��( )
y
��* +
=>
��, .
y
��/ 0
.
��0 1
MapFrom
��1 8
(
��8 9
z
��9 :
=>
��; =
z
��> ?
.
��? @
Id
��@ B
)
��B C
)
��C D
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
TreeId
��" (
,
��( )
y
��* +
=>
��, .
y
��/ 0
.
��0 1
MapFrom
��1 8
(
��8 9
z
��9 :
=>
��; =
z
��> ?
.
��? @
Person
��@ F
.
��F G
TreeId
��G M
)
��M N
)
��N O
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
PersonId
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
Person
��B H
.
��H I
Id
��I K
)
��K L
)
��L M
.
�� 

ReverseMap
�� 
(
�� 
)
�� 
;
�� 
	CreateMap
�� 
<
�� 
User
�� 
,
�� 
UserUpdateModel
�� +
>
��+ ,
(
��, -
)
��- .
.
�� 

ReverseMap
�� 
(
�� 
)
�� 
;
�� 
	CreateMap
�� 
<
�� 
User
�� 
,
��  
GenericPersonModel
�� .
>
��. /
(
��/ 0
)
��0 1
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
UserId
��" (
,
��( )
y
��* +
=>
��, .
y
��/ 0
.
��0 1
MapFrom
��1 8
(
��8 9
z
��9 :
=>
��; =
z
��> ?
.
��? @
Id
��@ B
)
��B C
)
��C D
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
PersonId
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
Person
��B H
.
��H I
Id
��I K
)
��K L
)
��L M
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
TreeId
��" (
,
��( )
y
��* +
=>
��, .
y
��/ 0
.
��0 1
MapFrom
��1 8
(
��8 9
z
��9 :
=>
��; =
z
��> ?
.
��? @
Person
��@ F
.
��F G
TreeId
��G M
)
��M N
)
��N O
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
	FirstName
��" +
,
��+ ,
y
��- .
=>
��/ 1
y
��2 3
.
��3 4
MapFrom
��4 ;
(
��; <
z
��< =
=>
��> @
z
��A B
.
��B C
Person
��C I
.
��I J
	FirstName
��J S
)
��S T
)
��T U
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
LastName
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
Person
��B H
.
��H I
LastName
��I Q
)
��Q R
)
��R S
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
	BirthDate
��" +
,
��+ ,
y
��- .
=>
��/ 1
y
��2 3
.
��3 4
MapFrom
��4 ;
(
��; <
z
��< =
=>
��> @
z
��A B
.
��B C
Person
��C I
.
��I J
	BirthDate
��J S
)
��S T
)
��T U
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
Gender
��" (
,
��( )
y
��* +
=>
��, .
y
��/ 0
.
��0 1
MapFrom
��1 8
(
��8 9
z
��9 :
=>
��; =
z
��> ?
.
��? @
Person
��@ F
.
��F G
Gender
��G M
.
��M N
ToString
��N V
(
��V W
)
��W X
)
��X Y
)
��Y Z
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
	BirthDate
��" +
,
��+ ,
y
��- .
=>
��/ 1
y
��2 3
.
��3 4
MapFrom
��4 ;
(
��; <
z
��< =
=>
��> @
z
��A B
.
��B C
Person
��C I
.
��I J
	BirthDate
��J S
)
��S T
)
��T U
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
ImageId
��" )
,
��) *
y
��+ ,
=>
��- /
y
��0 1
.
��1 2
MapFrom
��2 9
(
��9 :
z
��: ;
=>
��< >
z
��? @
.
��@ A
Person
��A G
.
��G H
ImageId
��H O
)
��O P
)
��P Q
.
�� 

ReverseMap
�� 
(
�� 
)
�� 
;
�� 
	CreateMap
�� 
<
�� 
User
�� 
,
�� 
UserPositionModel
�� -
>
��- .
(
��. /
)
��/ 0
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
UserId
��" (
,
��( )
y
��* +
=>
��, .
y
��/ 0
.
��0 1
MapFrom
��1 8
(
��8 9
z
��9 :
=>
��; =
z
��> ?
.
��? @
Id
��@ B
)
��B C
)
��C D
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
	FirstName
��" +
,
��+ ,
y
��- .
=>
��/ 1
y
��2 3
.
��3 4
MapFrom
��4 ;
(
��; <
z
��< =
=>
��> @
z
��A B
.
��B C
Person
��C I
.
��I J
	FirstName
��J S
)
��S T
)
��T U
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
LastName
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
Person
��B H
.
��H I
LastName
��I Q
)
��Q R
)
��R S
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
Latitude
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
Position
��B J
.
��J K
Latitude
��K S
)
��S T
)
��T U
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
	Longitude
��" +
,
��+ ,
y
��- .
=>
��/ 1
y
��2 3
.
��3 4
MapFrom
��4 ;
(
��; <
z
��< =
=>
��> @
z
��A B
.
��B C
Position
��C K
.
��K L
	Longitude
��L U
)
��U V
)
��V W
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
	UpdatedOn
��" +
,
��+ ,
y
��- .
=>
��/ 1
y
��2 3
.
��3 4
MapFrom
��4 ;
(
��; <
z
��< =
=>
��> @
z
��A B
.
��B C
Position
��C K
.
��K L
	UpdatedOn
��L U
)
��U V
)
��V W
;
��W X
	CreateMap
�� 
<
�� 
Position
�� 
,
�� 
PositionModel
��  -
>
��- .
(
��. /
)
��/ 0
;
��0 1
	CreateMap
�� 
<
�� 
User
�� 
,
�� 
RegisterModel
�� )
>
��) *
(
��* +
)
��+ ,
.
�� 

ReverseMap
�� 
(
�� 
)
�� 
;
�� 
	CreateMap
�� 
<
�� 
RegisterModel
�� #
,
��# $
Person
��% +
>
��+ ,
(
��, -
)
��- .
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
Gender
��" (
,
��( )
y
��* +
=>
��, .
y
��/ 0
.
��0 1
MapFrom
��1 8
(
��8 9
z
��9 :
=>
��; =
z
��> ?
.
��? @
Gender
��@ F
==
��G I
$str
��J M
?
��N O
$char
��P S
:
��T U
$char
��V Y
)
��Y Z
)
��Z [
;
��[ \
	CreateMap
�� 
<
�� 
User
�� 
,
��  
LoginResponseModel
�� .
>
��. /
(
��/ 0
)
��0 1
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
TreeId
��" (
,
��( )
y
��* +
=>
��, .
y
��/ 0
.
��0 1
MapFrom
��1 8
(
��8 9
z
��9 :
=>
��; =
z
��> ?
.
��? @
Person
��@ F
.
��F G
TreeId
��G M
)
��M N
)
��N O
.
�� 
	ForMember
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
PersonId
��" *
,
��* +
y
��, -
=>
��. 0
y
��1 2
.
��2 3
MapFrom
��3 :
(
��: ;
z
��; <
=>
��= ?
z
��@ A
.
��A B
Person
��B H
.
��H I
Id
��I K
)
��K L
)
��L M
;
��M N
}
�� 	
private
�� 
static
�� 
T
�� 
DefineMapping
�� &
<
��& '
T
��' (
>
��( )
(
��) *
T
��* +
first
��, 1
,
��1 2
T
��3 4
second
��5 ;
)
��; <
{
�� 	
if
�� 
(
�� 
first
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
return
�� 
first
�� 
;
�� 
}
�� 
if
�� 
(
�� 
second
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
return
�� 
second
�� 
;
�� 
}
�� 
return
�� 
default
�� 
(
�� 
T
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �
eE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\BaseService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Services! )
{ 
public 

class 
BaseService 
{ 
	protected 
IUnitOfWork 

unitOfWork (
;( )
public		 
BaseService		 
(		 
IUnitOfWork		 &
iRepositoryWrapper		' 9
)		9 :
{

 	

unitOfWork 
= 
iRepositoryWrapper +
;+ ,
} 	
} 
} �E
jE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\EducationService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Services! )
{ 
public 

class 
EducationService !
:" #
BaseService$ /
,/ 0
IEducationService1 B
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
public 
EducationService 
(  
IUnitOfWork  +

unitOfWork, 6
,6 7
IMapper8 ?
mapper@ F
)F G
:H I
baseJ N
(N O

unitOfWorkO Y
)Y Z
{ 	
_mapper 
= 
mapper 
; 
} 	
public 
List 
< 
EducationModel "
>" ##
GetAllEducationsForUser$ ;
(; <
Guid< @
userIdA G
)G H
{ 	
List 
< 
	Education 
> 

educations &
=' (

unitOfWork) 3
.3 4
	Education4 =
.= >
Filter> D
(D E
xE F
=>G I
xJ K
.K L
UserIdL R
==S U
userIdV \
)\ ]
.] ^
Include^ e
(e f
ef g
=>h j
ek l
.l m
EducationLevelm {
){ |
.| }
ToList	} �
(
� �
)
� �
;
� �
List 
< 
EducationModel 
>  
returnEvent! ,
=- .
_mapper/ 6
.6 7
Map7 :
<: ;
List; ?
<? @
EducationModel@ N
>N O
>O P
(P Q

educationsQ [
)[ \
;\ ]
return 
returnEvent 
; 
} 	
public   
async   
Task   
<   
EducationModel   (
>  ( )
GetEducationAsync  * ;
(  ; <
int  < ?
educationId  @ K
)  K L
{!! 	
	Education"" 
	education"" 
=""  !
await""" '

unitOfWork""( 2
.""2 3
	Education""3 <
.""< =
FindById""= E
(""E F
educationId""F Q
)""Q R
;""R S
EducationModel## 
returnEvent## &
=##' (
_mapper##) 0
.##0 1
Map##1 4
<##4 5
EducationModel##5 C
>##C D
(##D E
	education##E N
)##N O
;##O P
return$$ 
returnEvent$$ 
;$$ 
}%% 	
public'' 
async'' 
Task'' 
<'' 
EducationModel'' (
>''( )
AddEducationAsync''* ;
(''; <
EducationModel''< J
	education''K T
)''T U
{(( 	
if)) 
()) 
	education)) 
==)) 
null)) !
)))! "
{** 
return++ 
null++ 
;++ 
},, 
	Education.. 
educationEntity.. %
=..& '
_mapper..( /
.../ 0
Map..0 3
<..3 4
	Education..4 =
>..= >
(..> ?
	education..? H
)..H I
;..I J
educationEntity// 
.// 
EducationLevel// *
=//+ ,
null//- 1
;//1 2
educationEntity00 
=00 
await00 #

unitOfWork00$ .
.00. /
	Education00/ 8
.008 9
Create009 ?
(00? @
educationEntity00@ O
)00O P
;00P Q
EducationModel11 
returnEvent11 &
=11' (
_mapper11) 0
.110 1
Map111 4
<114 5
EducationModel115 C
>11C D
(11D E
educationEntity11E T
)11T U
;11U V
return33 
returnEvent33 
;33 
}44 	
public55 
async55 
Task55 
<55 
EducationModel55 (
>55( ) 
UpdateEducationAsync55* >
(55> ?
EducationModel55? M
	education55N W
)55W X
{66 	
if77 
(77 
	education77 
==77 
null77 !
)77! "
{88 
return99 
null99 
;99 
}:: 
	Education<< 
educationEntity<< %
=<<& '
_mapper<<( /
.<</ 0
Map<<0 3
<<<3 4
	Education<<4 =
><<= >
(<<> ?
	education<<? H
)<<H I
;<<I J
educationEntity== 
.== 
EducationLevel== *
===+ ,
null==- 1
;==1 2
educationEntity>> 
=>> 
await>> #

unitOfWork>>$ .
.>>. /
	Education>>/ 8
.>>8 9
Update>>9 ?
(>>? @
educationEntity>>@ O
)>>O P
;>>P Q
EducationModel?? 
returnEvent?? &
=??' (
_mapper??) 0
.??0 1
Map??1 4
<??4 5
EducationModel??5 C
>??C D
(??D E
educationEntity??E T
)??T U
;??U V
returnAA 
returnEventAA 
;AA 
}BB 	
publicDD 
asyncDD 
TaskDD 
<DD 
EducationModelDD (
>DD( ) 
DeleteEducationAsyncDD* >
(DD> ?
intDD? B
educationIdDDC N
)DDN O
{EE 	
	EducationFF 
educationEntityFF %
=FF& '
awaitFF( -

unitOfWorkFF. 8
.FF8 9
	EducationFF9 B
.FFB C
DeleteFFC I
(FFI J
educationIdFFJ U
)FFU V
;FFV W
EducationModelGG 
returnEventGG &
=GG' (
_mapperGG) 0
.GG0 1
MapGG1 4
<GG4 5
EducationModelGG5 C
>GGC D
(GGD E
educationEntityGGE T
)GGT U
;GGU V
returnII 
returnEventII 
;II 
}JJ 	
publicLL 
asyncLL 
TaskLL 
<LL 
ListLL 
<LL 
GenericNameModelLL /
>LL/ 0
>LL0 1&
GetAllEducationLevelsAsyncLL2 L
(LLL M
)LLM N
{MM 	
ListNN 
<NN 
EducationLevelNN 
>NN  
educationLevelsNN! 0
=NN1 2

unitOfWorkNN3 =
.NN= >
EducationLevelNN> L
.NNL M
GetAllNNM S
(NNS T
)NNT U
.NNU V
ToListNNV \
(NN\ ]
)NN] ^
;NN^ _
ListOO 
<OO 
GenericNameModelOO !
>OO! "
returnEventOO# .
=OO/ 0
awaitOO1 6
TaskOO7 ;
.OO; <
RunOO< ?
(OO? @
(OO@ A
)OOA B
=>OOC E
_mapperOOF M
.OOM N
MapOON Q
<OOQ R
ListOOR V
<OOV W
GenericNameModelOOW g
>OOg h
>OOh i
(OOi j
educationLevelsOOj y
)OOy z
)OOz {
;OO{ |
returnQQ 
returnEventQQ 
;QQ 
}RR 	
publicTT 
asyncTT 
TaskTT 
<TT 
GenericNameModelTT *
>TT* +"
AddEducationLevelAsyncTT, B
(TTB C
stringTTC I
educationLevelNameTTJ \
)TT\ ]
{UU 	
ifVV 
(VV 
educationLevelNameVV "
==VV# %
nullVV& *
)VV* +
{WW 
returnXX 
nullXX 
;XX 
}YY 
EducationLevel[[ 
educationLevel[[ )
=[[* +
new[[, /
EducationLevel[[0 >
([[> ?
)[[? @
{\\ 
Name]] 
=]] 
educationLevelName]] )
}^^ 
;^^ 
EducationLevel`` 
educationEntity`` *
=``+ ,
await``- 2

unitOfWork``3 =
.``= >
EducationLevel``> L
.``L M
Create``M S
(``S T
educationLevel``T b
)``b c
;``c d
GenericNameModelaa 
returnEventaa (
=aa) *
_mapperaa+ 2
.aa2 3
Mapaa3 6
<aa6 7
GenericNameModelaa7 G
>aaG H
(aaH I
educationEntityaaI X
)aaX Y
;aaY Z
returncc 
returnEventcc 
;cc 
}dd 	
}ee 
}ff �#
oE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\FileManagementService.cs
	namespace		 	
GenealogyTree		
 
.		 
Business		  
.		  !
Services		! )
{

 
public 

class !
FileManagementService &
:' ("
IFileManagementService) ?
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
string 
_fileDirectoryPath  2
;2 3
public !
FileManagementService $
($ %
IMapper% ,
mapper- 3
,3 4
IConfiguration5 C
configurationD Q
)Q R
{ 	
_mapper 
= 
mapper 
; 
string %
relativeFileDirectoryPath ,
=- .
configuration/ <
.< =

GetSection= G
(G H
$strH X
)X Y
.Y Z
ValueZ _
;_ `
_fileDirectoryPath 
=  
Path! %
.% &
Combine& -
(- .
	Directory. 7
.7 8
GetCurrentDirectory8 K
(K L
)L M
,M N%
relativeFileDirectoryPathO h
)h i
;i j
	Directory 
. 
CreateDirectory %
(% &
_fileDirectoryPath& 8
)8 9
;9 :
} 	
public 
async 
Task 
< 
	ImageFile #
># $
GetFile% ,
(, -
Image- 2
fileName3 ;
); <
{ 	
if 
( 
fileName 
== 
null  
)  !
{ 
return 
null 
; 
}   
	ImageFile"" 
	imageFile"" 
=""  !
_mapper""" )
."") *
Map""* -
<""- .
	ImageFile"". 7
>""7 8
(""8 9
fileName""9 A
)""A B
;""B C
	imageFile## 
.## 
FileInBytes## !
=##" #
await##$ )
File##* .
.##. /
ReadAllBytesAsync##/ @
(##@ A
Path##A E
.##E F
Combine##F M
(##M N
_fileDirectoryPath##N `
,##` a
fileName##b j
.##j k
FileName##k s
)##s t
)##t u
;##u v
return%% 
	imageFile%% 
;%% 
}&& 	
public(( 
async(( 
Task(( 
SaveFileAsync(( '
(((' (
	ImageFile((( 1
file((2 6
)((6 7
{)) 	
string** 
fullPath** 
=** 
Path** "
.**" #
Combine**# *
(*** +
_fileDirectoryPath**+ =
,**= >
file**? C
.**C D
FileName**D L
)**L M
;**M N
using,, 
(,, 

FileStream,, 

fileStream,, (
=,,) *
File,,+ /
.,,/ 0
Create,,0 6
(,,6 7
fullPath,,7 ?
),,? @
),,@ A
{-- 

fileStream.. 
... 
Seek.. 
(..  
$num..  !
,..! "

SeekOrigin..# -
...- .
Begin... 3
)..3 4
;..4 5
await// 
file// 
.// 
Stream// !
.//! "
CopyToAsync//" -
(//- .

fileStream//. 8
)//8 9
;//9 :
}00 
}11 	
public33 
bool33 

DeleteFile33 
(33 
string33 %
fileName33& .
)33. /
{44 	
string55 
path55 
=55 
Path55 
.55 
Combine55 &
(55& '
_fileDirectoryPath55' 9
,559 :
fileName55; C
)55C D
;55D E
if77 
(77 
File77 
.77 
Exists77 
(77 
path77  
)77  !
)77! "
{88 
File99 
.99 
Delete99 
(99 
path99  
)99  !
;99! "
return:: 
true:: 
;:: 
};; 
return== 
false== 
;== 
}>> 	
}?? 
}@@ �
fE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\ImageService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Services! )
{		 
public

 

class

 
ImageService

 
:

 
BaseService

  +
,

+ ,
IImageService

- :
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly "
IFileManagementService /"
_fileManagementService0 F
;F G
public 
ImageService 
( 
IUnitOfWork '

unitOfWork( 2
,2 3
IMapper4 ;
mapper< B
,B C"
IFileManagementServiceD Z!
fileManagementService[ p
)p q
:r s
baset x
(x y

unitOfWork	y �
)
� �
{ 	
_mapper 
= 
mapper 
; "
_fileManagementService "
=# $!
fileManagementService% :
;: ;
} 	
public 
async 
Task 
< 
Image 
>  
GetImageAsync! .
(. /
int/ 2
?2 3
imageId4 ;
); <
{ 	
if 
( 
imageId 
!= 
null 
)  
{ 
Image 
image 
= 
await #
this$ (
.( )

unitOfWork) 3
.3 4
Image4 9
.9 :
FindById: B
(B C
imageIdC J
)J K
;K L
return 
image 
; 
} 
return 
null 
; 
} 	
public   
async   
Task   
<   
Image   
>    
AddImageAsync  ! .
(  . /
	ImageFile  / 8
file  9 =
)  = >
{!! 	
await"" "
_fileManagementService"" (
.""( )
SaveFileAsync"") 6
(""6 7
file""7 ;
)""; <
;""< =
Image## 
image## 
=## 
_mapper## !
.##! "
Map##" %
<##% &
Image##& +
>##+ ,
(##, -
file##- 1
)##1 2
;##2 3
Image$$ 
imageEntity$$ 
=$$ 
await$$  %

unitOfWork$$& 0
.$$0 1
Image$$1 6
.$$6 7
Create$$7 =
($$= >
image$$> C
)$$C D
;$$D E
return&& 
imageEntity&& 
;&& 
}'' 	
public)) 
async)) 
Task)) 
<)) 
bool)) 
>)) 
DeleteImageAsync))  0
())0 1
int))1 4
imageId))5 <
)))< =
{** 	
Image++ 
imageEntity++ 
=++ 
await++  %

unitOfWork++& 0
.++0 1
Image++1 6
.++6 7
Delete++7 =
(++= >
imageId++> E
)++E F
;++F G
bool,, 

wasDeleted,, 
=,, "
_fileManagementService,, 4
.,,4 5

DeleteFile,,5 ?
(,,? @
imageEntity,,@ K
.,,K L
FileName,,L T
),,T U
;,,U V
return.. 

wasDeleted.. 
;.. 
}// 	
}00 
}11 �
iE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\LocationService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Services! )
{		 
public

 

class

 
LocationService

  
:

! "
BaseService

# .
,

. /
ILocationService

0 @
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
public 
LocationService 
( 
IUnitOfWork *

unitOfWork+ 5
,5 6
IMapper7 >
mapper? E
)E F
:G H
baseI M
(M N

unitOfWorkN X
)X Y
{ 	
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
LocationModel '
>' (
GetLocationAsync) 9
(9 :
int: =

locationId> H
)H I
{ 	
Location 
location 
= 
await  %

unitOfWork& 0
.0 1
Location1 9
.9 :
FindById: B
(B C

locationIdC M
)M N
;N O
LocationModel 
returnEvent %
=& '
_mapper( /
./ 0
Map0 3
<3 4
LocationModel4 A
>A B
(B C
locationC K
)K L
;L M
return 
returnEvent 
; 
} 	
public 
async 
Task 
< 
LocationModel '
>' (
UpdateLocation) 7
(7 8
LocationModel8 E
locationF N
)N O
{ 	
if 
( 
location 
== 
null  
)  !
{ 
return 
null 
; 
} 
Location!! 
locationEntity!! #
=!!$ %
_mapper!!& -
.!!- .
Map!!. 1
<!!1 2
Location!!2 :
>!!: ;
(!!; <
location!!< D
)!!D E
;!!E F
locationEntity"" 
="" 
await"" "

unitOfWork""# -
.""- .
Location"". 6
.""6 7
Update""7 =
(""= >
locationEntity""> L
)""L M
;""M N
LocationModel## 
returnEvent## %
=##& '
_mapper##( /
.##/ 0
Map##0 3
<##3 4
LocationModel##4 A
>##A B
(##B C
locationEntity##C Q
)##Q R
;##R S
return%% 
returnEvent%% 
;%% 
}&& 	
}'' 
}(( �U
iE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\MarriageService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Services! )
{ 
public 

class 
MarriageService  
:! "
BaseService# .
,. /
IMarriageService0 @
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly "
IFileManagementService /"
_fileManagementService0 F
;F G
public 
MarriageService 
( 
IUnitOfWork *

unitOfWork+ 5
,5 6
IMapper7 >
mapper? E
,E F"
IFileManagementServiceG ]!
fileManagementService^ s
)s t
:u v
basew {
({ |

unitOfWork	| �
)
� �
{ 	
_mapper 
= 
mapper 
; "
_fileManagementService "
=# $!
fileManagementService% :
;: ;
} 	
public 
async 
Task 
< 
List 
< 
MarriedPersonModel 1
>1 2
>2 3$
GetAllMarriagesForPerson4 L
(L M
intM P
personIdQ Y
)Y Z
{ 	
List 
< 
Marriage 
> 
	marriages $
=% &

unitOfWork' 1
.1 2
Marriage2 :
.: ;
Filter; A
(A B
xB C
=>D F
xG H
.H I
SecondPersonIdI W
==X Z
personId[ c
)c d
.d e
Includee l
(l m
mm n
=>o q
mr s
.s t
FirstPersont 
)	 �
.
� �
ToList
� �
(
� �
)
� �
;
� �
	marriages 
. 
AddRange 
( 

unitOfWork )
.) *
Marriage* 2
.2 3
Filter3 9
(9 :
x: ;
=>< >
x? @
.@ A
FirstPersonIdA N
==O Q
personIdR Z
)Z [
.[ \
Include\ c
(c d
md e
=>f h
mi j
.j k
SecondPersonk w
)w x
.x y
ToListy 
(	 �
)
� �
)
� �
;
� �
List 
< 
MarriedPersonModel #
># $
returnEvent% 0
=1 2
new3 6
List7 ;
<; <
MarriedPersonModel< N
>N O
(O P
)P Q
;Q R
foreach 
( 
var 
marriage !
in" $
	marriages% .
). /
{   
MarriedPersonModel!! "
returnMarriage!!# 1
=!!2 3
_mapper!!4 ;
.!!; <
Map!!< ?
<!!? @
MarriedPersonModel!!@ R
>!!R S
(!!S T
marriage!!T \
)!!\ ]
;!!] ^
returnMarriage"" 
."" 
PersonMarriedTo"" .
."". /
	ImageFile""/ 8
=""9 :
await""; @"
_fileManagementService""A W
.""W X
GetFile""X _
(""_ `
marriage""` h
.""h i
FirstPerson""i t
!=""u w
null""x |
?""} ~
marriage	"" �
.
""� �
FirstPerson
""� �
.
""� �
Image
""� �
:
""� �
marriage
""� �
.
""� �
SecondPerson
""� �
.
""� �
Image
""� �
)
""� �
;
""� �
returnEvent## 
.## 
Add## 
(##  
returnMarriage##  .
)##. /
;##/ 0
}$$ 
return&& 
returnEvent&& 
;&& 
}'' 	
public)) 
async)) 
Task)) 
<))  
MarriageDetailsModel)) .
>)). /
GetMarriageAsync))0 @
())@ A
int))A D

marriageId))E O
)))O P
{** 	
Marriage++ 
marriage++ 
=++ 
await++  %

unitOfWork++& 0
.++0 1
Marriage++1 9
.++9 :
FindById++: B
(++B C

marriageId++C M
)++M N
;++N O
marriage,, 
.,, 
FirstPerson,,  
=,,! "
await,,# (

unitOfWork,,) 3
.,,3 4
Person,,4 :
.,,: ;
FindById,,; C
(,,C D
marriage,,D L
.,,L M
FirstPersonId,,M Z
),,Z [
;,,[ \
marriage-- 
.-- 
SecondPerson-- !
=--" #
await--$ )

unitOfWork--* 4
.--4 5
Person--5 ;
.--; <
FindById--< D
(--D E
marriage--E M
.--M N
SecondPersonId--N \
)--\ ]
;--] ^ 
MarriageDetailsModel//  
returnEvent//! ,
=//- .
_mapper/// 6
.//6 7
Map//7 :
<//: ; 
MarriageDetailsModel//; O
>//O P
(//P Q
marriage//Q Y
)//Y Z
;//Z [
returnEvent00 
.00 
FirstPerson00 #
.00# $
	ImageFile00$ -
=00. /
await000 5"
_fileManagementService006 L
.00L M
GetFile00M T
(00T U
marriage00U ]
.00] ^
FirstPerson00^ i
.00i j
Image00j o
)00o p
;00p q
returnEvent11 
.11 
PersonMarriedTo11 '
.11' (
	ImageFile11( 1
=112 3
await114 9"
_fileManagementService11: P
.11P Q
GetFile11Q X
(11X Y
marriage11Y a
.11a b
SecondPerson11b n
.11n o
Image11o t
)11t u
;11u v
return33 
returnEvent33 
;33 
}44 	
public66 
async66 
Task66 
<66  
MarriageDetailsModel66 .
>66. /
AddMarriageAsync660 @
(66@ A%
MarriageCreateUpdateModel66A Z
marriage66[ c
)66c d
{77 	
if88 
(88 
marriage88 
==88 
null88  
)88  !
{99 
return:: 
null:: 
;:: 
};; 
Marriage== 
marriageEntity== #
===$ %
_mapper==& -
.==- .
Map==. 1
<==1 2
Marriage==2 :
>==: ;
(==; <
marriage==< D
)==D E
;==E F
marriageEntity>> 
.>> 
	CreatedOn>> $
=>>% &
DateTime>>' /
.>>/ 0
UtcNow>>0 6
;>>6 7
Marriage?? 
marriageCreated?? $
=??% &
await??' ,

unitOfWork??- 7
.??7 8
Marriage??8 @
.??@ A
Create??A G
(??G H
marriageEntity??H V
)??V W
;??W X 
MarriageDetailsModel@@  
returnEvent@@! ,
=@@- .
_mapper@@/ 6
.@@6 7
Map@@7 :
<@@: ; 
MarriageDetailsModel@@; O
>@@O P
(@@P Q
marriageCreated@@Q `
)@@` a
;@@a b
returnBB 
returnEventBB 
;BB 
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE  
MarriageDetailsModelEE .
>EE. /
UpdateMarriageAsyncEE0 C
(EEC D%
MarriageCreateUpdateModelEED ]
marriageEE^ f
)EEf g
{FF 	
ifGG 
(GG 
marriageGG 
==GG 
nullGG  
)GG  !
{HH 
returnII 
nullII 
;II 
}JJ 
MarriageLL 
marriageInDbLL !
=LL" #
awaitLL$ )

unitOfWorkLL* 4
.LL4 5
MarriageLL5 =
.LL= >
FindByIdLL> F
(LLF G
marriageLLG O
.LLO P
IdLLP R
)LLR S
;LLS T
ifNN 
(NN 
marriageInDbNN 
==NN 
defaultNN  '
(NN' (
MarriageNN( 0
)NN0 1
)NN1 2
{OO 
returnPP 
nullPP 
;PP 
}QQ 
marriageInDbSS 
.SS 
FirstPersonIdSS &
=SS' (
marriageSS) 1
.SS1 2
FirstPersonIdSS2 ?
;SS? @
marriageInDbTT 
.TT 
SecondPersonIdTT '
=TT( )
marriageTT* 2
.TT2 3
SecondPersonIdTT3 A
;TTA B
marriageInDbUU 
.UU 
	StartDateUU "
=UU# $
marriageUU% -
.UU- .
	StartDateUU. 7
;UU7 8
marriageInDbVV 
.VV 
EndDateVV  
=VV! "
marriageVV# +
.VV+ ,
EndDateVV, 3
;VV3 4
marriageInDbWW 
.WW 

ModifiedOnWW #
=WW$ %
DateTimeWW& .
.WW. /
UtcNowWW/ 5
;WW5 6
MarriageYY 
marriageUpdatedYY $
=YY% &
awaitYY' ,

unitOfWorkYY- 7
.YY7 8
MarriageYY8 @
.YY@ A
UpdateYYA G
(YYG H
marriageInDbYYH T
)YYT U
;YYU V 
MarriageDetailsModelZZ  
returnEventZZ! ,
=ZZ- .
_mapperZZ/ 6
.ZZ6 7
MapZZ7 :
<ZZ: ; 
MarriageDetailsModelZZ; O
>ZZO P
(ZZP Q
marriageUpdatedZZQ `
)ZZ` a
;ZZa b
return\\ 
returnEvent\\ 
;\\ 
}]] 	
public__ 
async__ 
Task__ 
<__  
MarriageDetailsModel__ .
>__. /
DeleteMarriageAsync__0 C
(__C D
int__D G

marriageId__H R
)__R S
{`` 	
Marriageaa 
marriageEntityaa #
=aa$ %
awaitaa& +

unitOfWorkaa, 6
.aa6 7
Marriageaa7 ?
.aa? @
Deleteaa@ F
(aaF G

marriageIdaaG Q
)aaQ R
;aaR S 
MarriageDetailsModelbb  
returnEventbb! ,
=bb- .
_mapperbb/ 6
.bb6 7
Mapbb7 :
<bb: ; 
MarriageDetailsModelbb; O
>bbO P
(bbP Q
marriageEntitybbQ _
)bb_ `
;bb` a
returndd 
returnEventdd 
;dd 
}ee 	
}ff 
}gg �
lE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\NationalityService.cs
	namespace

 	
GenealogyTree


 
.

 
Business

  
.

  !
Services

! )
{ 
public 

class 
NationalityService #
:$ %
BaseService& 1
,1 2
INationalityService3 F
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
public 
NationalityService !
(! "
IUnitOfWork" -

unitOfWork. 8
,8 9
IMapper: A
mapperB H
)H I
:J K
baseL P
(P Q

unitOfWorkQ [
)[ \
{ 	
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
List 
< 
GenericNameModel /
>/ 0
>0 1$
GetAllNationalitiesAsync2 J
(J K
)K L
{ 	
List 
< 
Nationality 
> 
nationalities +
=, -

unitOfWork. 8
.8 9
Nationality9 D
.D E
GetAllE K
(K L
)L M
.M N
ToListN T
(T U
)U V
;V W
List 
< 
GenericNameModel !
>! "
returnEvent# .
=/ 0
await1 6
Task7 ;
.; <
Run< ?
(? @
(@ A
)A B
=>C E
_mapperF M
.M N
MapN Q
<Q R
ListR V
<V W
GenericNameModelW g
>g h
>h i
(i j
nationalitiesj w
)w x
)x y
;y z
return 
returnEvent 
; 
} 	
public 
async 
Task 
< 
GenericNameModel *
>* +
AddNationalityAsync, ?
(? @
string@ F
nationalityNameG V
)V W
{ 	
if 
( 
nationalityName 
==  "
null# '
)' (
{ 
return   
null   
;   
}!! 
Nationality## 
nationality## #
=##$ %
new##& )
Nationality##* 5
(##5 6
)##6 7
{$$ 
Name%% 
=%% 
nationalityName%% &
}&& 
;&& 
Nationality(( 
nationalityEntity(( )
=((* +
await((, 1

unitOfWork((2 <
.((< =
Nationality((= H
.((H I
Create((I O
(((O P
nationality((P [
)(([ \
;((\ ]
GenericNameModel)) 
returnEvent)) (
=))) *
_mapper))+ 2
.))2 3
Map))3 6
<))6 7
GenericNameModel))7 G
>))G H
())H I
nationalityEntity))I Z
)))Z [
;))[ \
return++ 
returnEvent++ 
;++ 
},, 	
}-- 
}.. �)
kE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\OccupationService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Services! )
{ 
public 

class 
OccupationService "
:# $
BaseService% 0
,0 1
IOccupationService2 D
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
public 
OccupationService  
(  !
IUnitOfWork! ,

unitOfWork- 7
,7 8
IMapper9 @
mapperA G
)G H
:I J
baseK O
(O P

unitOfWorkP Z
)Z [
{ 	
_mapper 
= 
mapper 
; 
} 	
public 
List 
< 
OccupationModel #
># $$
GetAllOccupationsForUser% =
(= >
Guid> B
userIdC I
)I J
{ 	
List 
< 

Occupation 
> 
occupations (
=) *

unitOfWork+ 5
.5 6

Occupation6 @
.@ A
FilterA G
(G H
xH I
=>J L
xM N
.N O
UserIdO U
==V X
userIdY _
)_ `
.` a
ToLista g
(g h
)h i
;i j
List 
< 
OccupationModel  
>  !
returnEvent" -
=. /
_mapper0 7
.7 8
Map8 ;
<; <
List< @
<@ A
OccupationModelA P
>P Q
>Q R
(R S
occupationsS ^
)^ _
;_ `
return 
returnEvent 
; 
} 	
public 
async 
Task 
< 
OccupationModel )
>) *
AddOccupationAsync+ =
(= >
OccupationModel> M

occupationN X
)X Y
{ 	
if 
( 

occupation 
== 
null "
)" #
{   
return!! 
null!! 
;!! 
}"" 

Occupation$$ 
occupationEntity$$ '
=$$( )
_mapper$$* 1
.$$1 2
Map$$2 5
<$$5 6

Occupation$$6 @
>$$@ A
($$A B

occupation$$B L
)$$L M
;$$M N

Occupation%% 
occupationCreated%% (
=%%) *
await%%+ 0

unitOfWork%%1 ;
.%%; <

Occupation%%< F
.%%F G
Create%%G M
(%%M N
occupationEntity%%N ^
)%%^ _
;%%_ `
OccupationModel&& 
returnEvent&& '
=&&( )
_mapper&&* 1
.&&1 2
Map&&2 5
<&&5 6
OccupationModel&&6 E
>&&E F
(&&F G
occupationCreated&&G X
)&&X Y
;&&Y Z
return(( 
returnEvent(( 
;(( 
})) 	
public++ 
async++ 
Task++ 
<++ 
OccupationModel++ )
>++) *!
UpdateOccupationAsync+++ @
(++@ A
OccupationModel++A P

occupation++Q [
)++[ \
{,, 	
if-- 
(-- 

occupation-- 
==-- 
null-- "
)--" #
{.. 
return// 
null// 
;// 
}00 

Occupation22 
occupationEntity22 '
=22( )
_mapper22* 1
.221 2
Map222 5
<225 6

Occupation226 @
>22@ A
(22A B

occupation22B L
)22L M
;22M N

Occupation33 
occupationUpdated33 (
=33) *
await33+ 0

unitOfWork331 ;
.33; <

Occupation33< F
.33F G
Update33G M
(33M N
occupationEntity33N ^
)33^ _
;33_ `
OccupationModel44 
returnEvent44 '
=44( )
_mapper44* 1
.441 2
Map442 5
<445 6
OccupationModel446 E
>44E F
(44F G
occupationUpdated44G X
)44X Y
;44Y Z
return66 
returnEvent66 
;66 
}77 	
public99 
async99 
Task99 
<99 
OccupationModel99 )
>99) *!
DeleteOccupationAsync99+ @
(99@ A
int99A D
occupationId99E Q
)99Q R
{:: 	

Occupation;; 
occupationEntity;; '
=;;( )
await;;* /

unitOfWork;;0 :
.;;: ;

Occupation;;; E
.;;E F
Delete;;F L
(;;L M
occupationId;;M Y
);;Y Z
;;;Z [
OccupationModel<< 
returnEvent<< '
=<<( )
_mapper<<* 1
.<<1 2
Map<<2 5
<<<5 6
OccupationModel<<6 E
><<E F
(<<F G
occupationEntity<<G W
)<<W X
;<<X Y
return>> 
returnEvent>> 
;>> 
}?? 	
}@@ 
}AA �
lE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\ParentChildService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Services! )
{ 
public 

class 
ParentChildService #
:$ %
BaseService& 1
,1 2
IParentChildService3 F
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly "
IFileManagementService /"
_fileManagementService0 F
;F G
private 
readonly 
IMarriageService )
_marriageService* :
;: ;
public 
ParentChildService !
(! "
IUnitOfWork" -

unitOfWork. 8
,8 9
IMapper: A
mapperB H
,H I"
IFileManagementServiceJ `!
fileManagementServicea v
,v w
IMarriageService	x �
marriageService
� �
)
� �
:
� �
base
� �
(
� �

unitOfWork
� �
)
� �
{ 	
_mapper 
= 
mapper 
; "
_fileManagementService "
=# $!
fileManagementService% :
;: ;
_marriageService 
= 
marriageService .
;. /
} 	
public 
async 
Task 
< 
List 
< 
ParentChildModel /
>/ 0
>0 1"
GetAllParentsForPerson2 H
(H I
intI L
childIdM T
)T U
{ 	
List 
< 
ParentChild 
> 
parentChildren ,
=- .
await/ 4
Task5 9
.9 :
Run: =
(= >
(> ?
)? @
=>A C

unitOfWorkD N
.N O
ParentChildO Z
.Z [
Filter[ a
(a b
xb c
=>d f
xg h
.h i
ChildIdi p
==q s
childIdt {
){ |
.| }
Include	} �
(
� �
pc
� �
=>
� �
pc
� �
.
� �
Parent
� �
)
� �
.
� �
ToList
� �
(
� �
)
� �
)
� �
;
� �
List 
< 
ParentModel 
> 
parentRelatives -
=. /
_mapper0 7
.7 8
Map8 ;
<; <
List< @
<@ A
ParentModelA L
>L M
>M N
(N O
parentChildrenO ]
)] ^
;^ _
List   
<   
ParentChildModel   !
>  ! "
parents  # *
=  + ,
_mapper  - 4
.  4 5
Map  5 8
<  8 9
List  9 =
<  = >
ParentChildModel  > N
>  N O
>  O P
(  P Q
parentRelatives  Q `
)  ` a
;  a b
return"" 
parents"" 
;"" 
}## 	
public%% 
async%% 
Task%% 
<%% 
List%% 
<%% 
ParentChildModel%% /
>%%/ 0
>%%0 1#
GetAllChildrenForPerson%%2 I
(%%I J
int%%J M
parentId%%N V
)%%V W
{&& 	
List'' 
<'' 
ParentChild'' 
>'' 
parentChildren'' ,
=''- .
await''/ 4
Task''5 9
.''9 :
Run'': =
(''= >
(''> ?
)''? @
=>''A C

unitOfWork''D N
.''N O
ParentChild''O Z
.''Z [
Filter''[ a
(''a b
x''b c
=>''d f
x''g h
.''h i
ParentId''i q
==''r t
parentId''u }
)''} ~
.''~ 
Include	'' �
(
''� �
pc
''� �
=>
''� �
pc
''� �
.
''� �
Child
''� �
)
''� �
.
''� �
ToList
''� �
(
''� �
)
''� �
)
''� �
;
''� �
List(( 
<(( 

ChildModel(( 
>(( 
childRelatives(( +
=((, -
_mapper((. 5
.((5 6
Map((6 9
<((9 :
List((: >
<((> ?

ChildModel((? I
>((I J
>((J K
(((K L
parentChildren((L Z
)((Z [
;(([ \
List)) 
<)) 
ParentChildModel)) !
>))! "
children))# +
=)), -
_mapper)). 5
.))5 6
Map))6 9
<))9 :
List)): >
<))> ?
ParentChildModel))? O
>))O P
>))P Q
())Q R
childRelatives))R `
)))` a
;))a b
return++ 
children++ 
;++ 
},, 	
public.. 
async.. 
Task.. 
<.. 
List.. 
<.. 
ParentChildModel.. /
>../ 0
>..0 1
GetAllAncestors..2 A
(..A B
int..B E
personId..F N
)..N O
{// 	
List00 
<00 
ParentChildModel00 !
>00! "
foundParents00# /
=000 1
await002 7"
GetAllParentsForPerson008 N
(00N O
personId00O W
)00W X
;00X Y
List11 
<11 
ParentChildModel11 !
>11! "
	ancestors11# ,
=11- .
new11/ 2
List113 7
<117 8
ParentChildModel118 H
>11H I
(11I J
)11J K
;11K L
while33 
(33 
foundParents33 
.33  
Any33  #
(33# $
)33$ %
)33% &
{44 
	ancestors55 
.55 
AddRange55 "
(55" #
foundParents55# /
)55/ 0
;550 1
List66 
<66 
ParentChildModel66 %
>66% &
searchParents66' 4
=665 6
new667 :
List66; ?
<66? @
ParentChildModel66@ P
>66P Q
(66Q R
)66R S
;66S T
searchParents77 
.77 
AddRange77 &
(77& '
foundParents77' 3
)773 4
;774 5
foundParents88 
.88 
Clear88 "
(88" #
)88# $
;88$ %
foreach:: 
(:: 
ParentChildModel:: )
parent::* 0
in::1 3
searchParents::4 A
)::A B
{;; 
foundParents<<  
.<<  !
AddRange<<! )
(<<) *
await<<* /"
GetAllParentsForPerson<<0 F
(<<F G
parent<<G M
.<<M N
PersonId<<N V
)<<V W
)<<W X
;<<X Y
}== 
}>> 
return@@ 
	ancestors@@ 
;@@ 
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
ListCC 
<CC 
ParentChildModelCC /
>CC/ 0
>CC0 1
GetAllDescendantsCC2 C
(CCC D
intCCD G
personIdCCH P
)CCP Q
{DD 	
ListEE 
<EE 
ParentChildModelEE !
>EE! "
foundChildrenEE# 0
=EE1 2
awaitEE3 8#
GetAllChildrenForPersonEE9 P
(EEP Q
personIdEEQ Y
)EEY Z
;EEZ [
ListFF 
<FF 
ParentChildModelFF !
>FF! "
descendantsFF# .
=FF/ 0
newFF1 4
ListFF5 9
<FF9 :
ParentChildModelFF: J
>FFJ K
(FFK L
)FFL M
;FFM N
whileHH 
(HH 
foundChildrenHH  
.HH  !
AnyHH! $
(HH$ %
)HH% &
)HH& '
{II 
descendantsJJ 
.JJ 
AddRangeJJ $
(JJ$ %
foundChildrenJJ% 2
)JJ2 3
;JJ3 4
ListKK 
<KK 
ParentChildModelKK %
>KK% &
searchChildrenKK' 5
=KK6 7
newKK8 ;
ListKK< @
<KK@ A
ParentChildModelKKA Q
>KKQ R
(KKR S
)KKS T
;KKT U
searchChildrenLL 
.LL 
AddRangeLL '
(LL' (
foundChildrenLL( 5
)LL5 6
;LL6 7
foundChildrenMM 
.MM 
ClearMM #
(MM# $
)MM$ %
;MM% &
foreachOO 
(OO 
ParentChildModelOO )
childOO* /
inOO0 2
searchChildrenOO3 A
)OOA B
{PP 
foundChildrenQQ !
.QQ! "
AddRangeQQ" *
(QQ* +
awaitQQ+ 0#
GetAllChildrenForPersonQQ1 H
(QQH I
childQQI N
.QQN O
PersonIdQQO W
)QQW X
)QQX Y
;QQY Z
}RR 
}SS 
returnUU 
descendantsUU 
;UU 
}VV 	
publicXX 
asyncXX 
TaskXX 
<XX 
ListXX 
<XX 
ParentChildModelXX /
>XX/ 0
>XX0 1
GetAllRelatedPeopleXX2 E
(XXE F
intXXF I
personIdXXJ R
)XXR S
{YY 	
ListZZ 
<ZZ 
ParentChildModelZZ !
>ZZ! "
foundRelativesZZ# 1
=ZZ2 3
newZZ4 7
ListZZ8 <
<ZZ< =
ParentChildModelZZ= M
>ZZM N
(ZZN O
)ZZO P
;ZZP Q
foundRelatives[[ 
.[[ 
AddRange[[ #
([[# $
await[[$ )"
GetAllParentsForPerson[[* @
([[@ A
personId[[A I
)[[I J
)[[J K
;[[K L
foundRelatives\\ 
.\\ 
AddRange\\ #
(\\# $
await\\$ )#
GetAllChildrenForPerson\\* A
(\\A B
personId\\B J
)\\J K
)\\K L
;\\L M
List]] 
<]] 
ParentChildModel]] !
>]]! "
relatedPeople]]# 0
=]]1 2
new]]3 6
List]]7 ;
<]]; <
ParentChildModel]]< L
>]]L M
(]]M N
)]]N O
;]]O P
while__ 
(__ 
foundRelatives__ !
.__! "
Any__" %
(__% &
)__& '
)__' (
{`` 
relatedPeopleaa 
.aa 
AddRangeaa &
(aa& '
foundRelativesaa' 5
)aa5 6
;aa6 7
Listbb 
<bb 
ParentChildModelbb %
>bb% &
searchRelativesbb' 6
=bb7 8
newbb9 <
Listbb= A
<bbA B
ParentChildModelbbB R
>bbR S
(bbS T
)bbT U
;bbU V
searchRelativescc 
.cc  
AddRangecc  (
(cc( )
foundRelativescc) 7
)cc7 8
;cc8 9
foundRelativesdd 
.dd 
Cleardd $
(dd$ %
)dd% &
;dd& '
foreachff 
(ff 
intff 

relativeIdff '
inff( *
searchRelativesff+ :
.ff: ;
Selectff; A
(ffA B
relativeffB J
=>ffK M
relativeffN V
.ffV W
PersonIdffW _
)ff_ `
)ff` a
{gg 
foundRelativeshh "
.hh" #
AddRangehh# +
(hh+ ,
awaithh, 1"
GetAllParentsForPersonhh2 H
(hhH I

relativeIdhhI S
)hhS T
)hhT U
;hhU V
foundRelativesii "
.ii" #
AddRangeii# +
(ii+ ,
awaitii, 1#
GetAllChildrenForPersonii2 I
(iiI J

relativeIdiiJ T
)iiT U
)iiU V
;iiV W
}jj 
foundRelativesll 
=ll  
foundRelativesll! /
.ll/ 0
GroupByll0 7
(ll7 8
relativell8 @
=>llA C
relativellD L
.llL M
PersonIdllM U
)llU V
.llV W
SelectllW ]
(ll] ^
relativell^ f
=>llg i
relativellj r
.llr s
Firstlls x
(llx y
)lly z
)llz {
.ll{ |
ToList	ll| �
(
ll� �
)
ll� �
;
ll� �
foundRelativesmm 
.mm 
	RemoveAllmm (
(mm( )
relativemm) 1
=>mm2 4
relatedPeoplemm5 B
.mmB C
ExistsmmC I
(mmI J
personmmJ P
=>mmQ S
personmmT Z
.mmZ [
PersonIdmm[ c
==mmd f
relativemmg o
.mmo p
PersonIdmmp x
)mmx y
)mmy z
;mmz {
}nn 
returnpp 
relatedPeoplepp  
;pp  !
}qq 	
publicss 
asyncss 
Taskss 
<ss 
Listss 
<ss 
ParentChildModelss /
>ss/ 0
>ss0 1!
GetRelatedByAncestorsss2 G
(ssG H
intssH K
personIdssL T
)ssT U
{tt 	
Listuu 
<uu 
ParentChildModeluu !
>uu! "
allAncestorsuu# /
=uu0 1
awaituu2 7
GetAllAncestorsuu8 G
(uuG H
personIduuH P
)uuP Q
;uuQ R
Listvv 
<vv 
ParentChildModelvv !
>vv! "
relatedByAncestorsvv# 5
=vv6 7
newvv8 ;
Listvv< @
<vv@ A
ParentChildModelvvA Q
>vvQ R
(vvR S
)vvS T
;vvT U
relatedByAncestorsww 
.ww 
AddRangeww '
(ww' (
allAncestorsww( 4
)ww4 5
;ww5 6
foreachyy 
(yy 
varyy 
ancestoryy !
inyy" $
allAncestorsyy% 1
)yy1 2
{zz 
relatedByAncestors{{ "
.{{" #
AddRange{{# +
({{+ ,
await{{, 1
GetAllDescendants{{2 C
({{C D
ancestor{{D L
.{{L M
PersonId{{M U
){{U V
){{V W
;{{W X
}|| 
relatedByAncestors~~ 
.~~ 
AddRange~~ '
(~~' (
await~~( -
GetAllDescendants~~. ?
(~~? @
personId~~@ H
)~~H I
)~~I J
;~~J K
relatedByAncestors 
=  
relatedByAncestors! 3
.3 4
GroupBy4 ;
(; <
relative< D
=>E G
relativeH P
.P Q
PersonIdQ Y
)Y Z
.Z [
Select[ a
(a b
relativeb j
=>k m
relativen v
.v w
Firstw |
(| }
)} ~
)~ 
.	 �
ToList
� �
(
� �
)
� �
;
� �
return
��  
relatedByAncestors
�� %
;
��% &
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
ParentChildModel
�� /
>
��/ 0
>
��0 1%
GetRelatedByDescendants
��2 I
(
��I J
int
��J M
personId
��N V
)
��V W
{
�� 	
List
�� 
<
�� 
ParentChildModel
�� !
>
��! "
allDescendants
��# 1
=
��2 3
await
��4 9
GetAllDescendants
��: K
(
��K L
personId
��L T
)
��T U
;
��U V
List
�� 
<
�� 
ParentChildModel
�� !
>
��! ""
relatedByDescendants
��# 7
=
��8 9
new
��: =
List
��> B
<
��B C
ParentChildModel
��C S
>
��S T
(
��T U
)
��U V
;
��V W"
relatedByDescendants
��  
.
��  !
AddRange
��! )
(
��) *
allDescendants
��* 8
)
��8 9
;
��9 :
foreach
�� 
(
�� 
var
�� 

descendant
�� #
in
��$ &
allDescendants
��' 5
)
��5 6
{
�� "
relatedByDescendants
�� $
.
��$ %
AddRange
��% -
(
��- .
await
��. 3
GetAllAncestors
��4 C
(
��C D

descendant
��D N
.
��N O
PersonId
��O W
)
��W X
)
��X Y
;
��Y Z
}
�� "
relatedByDescendants
��  
.
��  !
AddRange
��! )
(
��) *
await
��* /
GetAllAncestors
��0 ?
(
��? @
personId
��@ H
)
��H I
)
��I J
;
��J K"
relatedByDescendants
��  
=
��! ""
relatedByDescendants
��# 7
.
��7 8
GroupBy
��8 ?
(
��? @
relative
��@ H
=>
��I K
relative
��L T
.
��T U
PersonId
��U ]
)
��] ^
.
��^ _
Select
��_ e
(
��e f
relative
��f n
=>
��o q
relative
��r z
.
��z {
First��{ �
(��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
return
�� "
relatedByDescendants
�� '
;
��' (
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
GenericPersonModel
�� 1
>
��1 2
>
��2 3 
GetChildrenOptions
��4 F
(
��F G
int
��G J
personId
��K S
)
��S T
{
�� 	
List
�� 
<
��  
GenericPersonModel
�� #
>
��# $%
notRelatedByDescendants
��% <
=
��= >
await
��? D(
GetNotRelatedByDescendants
��E _
(
��_ `
personId
��` h
)
��h i
;
��i j
List
�� 
<
��  
GenericPersonModel
�� #
>
��# $#
notRelatedByAncestors
��% :
=
��; <
await
��= B&
GetNotRelatedByAncestors
��C [
(
��[ \
personId
��\ d
)
��d e
;
��e f
List
�� 
<
��  
GenericPersonModel
�� #
>
��# $

notRelated
��% /
=
��0 1%
notRelatedByDescendants
��2 I
.
��I J
Where
��J O
(
��O P

notRelated
��P Z
=>
��[ ]#
notRelatedByAncestors
��^ s
.
��s t
Any
��t w
(
��w x
x
��x y
=>
��z |
x
��} ~
.
��~ 
PersonId�� �
==��� �

notRelated��� �
.��� �
PersonId��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
List
�� 
<
�� 
int
�� 
>
�� !
peopleWithoutParent
�� )
=
��* +
await
��, 1$
GetPeopleWithoutParent
��2 H
(
��H I
personId
��I Q
)
��Q R
;
��R S
List
�� 
<
�� 
int
�� 
>
�� 
spouces
�� 
=
�� 
(
��  !
await
��! &
_marriageService
��' 7
.
��7 8&
GetAllMarriagesForPerson
��8 P
(
��P Q
personId
��Q Y
)
��Y Z
)
��Z [
.
��[ \
Select
��\ b
(
��b c
(
��c d
marriage
��d l
)
��l m
=>
��n p
marriage
��q y
.
��y z
PersonMarriedTo��z �
.��� �
PersonId��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
return
�� 

notRelated
�� 
.
�� 
Where
�� #
(
��# $
(
��$ %
person
��% +
)
��+ ,
=>
��- /!
peopleWithoutParent
��( ;
.
��; <
Exists
��< B
(
��B C
(
��C D
personId
��D L
)
��L M
=>
��N P
person
��Q W
.
��W X
PersonId
��X `
==
��a c
personId
��d l
)
��l m
&&
��n p
!
��( )
spouces
��) 0
.
��0 1
Exists
��1 7
(
��7 8
(
��8 9
spouceId
��9 A
)
��A B
=>
��C E
person
��F L
.
��L M
PersonId
��M U
==
��V X
spouceId
��Y a
)
��a b
)
��b c
.
��c d
ToList
��d j
(
��j k
)
��k l
;
��l m
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
GenericPersonModel
�� 1
>
��1 2
>
��2 3$
GetParentSpouceOptions
��4 J
(
��J K
int
��K N
personId
��O W
)
��W X
{
�� 	
List
�� 
<
��  
GenericPersonModel
�� #
>
��# $#
notRelatedByAncestors
��% :
=
��; <
await
��= B&
GetNotRelatedByAncestors
��C [
(
��[ \
personId
��\ d
)
��d e
;
��e f
List
�� 
<
�� 
int
�� 
>
�� 
spouces
�� 
=
�� 
(
��  !
await
��! &
_marriageService
��' 7
.
��7 8&
GetAllMarriagesForPerson
��8 P
(
��P Q
personId
��Q Y
)
��Y Z
)
��Z [
.
��[ \
Where
��\ a
(
��a b
marriage
��b j
=>
��k m
marriage
��n v
.
��v w
MarriageEnded��w �
==��� �
null��� �
)��� �
.
��$ %
Select
��% +
(
��+ ,
(
��, -
marriage
��- 5
)
��5 6
=>
��7 9
marriage
��: B
.
��B C
PersonMarriedTo
��C R
.
��R S
PersonId
��S [
)
��[ \
.
��\ ]
ToList
��] c
(
��c d
)
��d e
;
��e f
return
�� #
notRelatedByAncestors
�� (
.
��( )
Where
��) .
(
��. /
(
��/ 0
person
��0 6
)
��6 7
=>
��8 :
!
��; <
spouces
��< C
.
��C D
Exists
��D J
(
��J K
(
��K L
spouceId
��L T
)
��T U
=>
��V X
person
��Y _
.
��_ `
PersonId
��` h
==
��i k
spouceId
��l t
)
��t u
)
��u v
.
��v w
ToList
��w }
(
��} ~
)
��~ 
;�� �
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
GenericPersonModel
�� 1
>
��1 2
>
��2 3&
GetNotRelatedByAncestors
��4 L
(
��L M
int
��M P
personId
��Q Y
)
��Y Z
{
�� 	
List
�� 
<
�� 
int
�� 
>
�� #
bloodRelatedPeopleIds
�� +
=
��, -
(
��. /
await
��/ 4#
GetRelatedByAncestors
��5 J
(
��J K
personId
��K S
)
��S T
)
��T U
.
��U V
Select
��V \
(
��\ ]
(
��] ^ 
bloodRelatedPerson
��^ p
)
��p q
=>
��r t!
bloodRelatedPerson��u �
.��� �
PersonId��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
return
�� 
await
�� 
GetExcludedPeople
�� *
(
��* +#
bloodRelatedPeopleIds
��+ @
,
��@ A
personId
��B J
)
��J K
;
��K L
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
GenericPersonModel
�� 1
>
��1 2
>
��2 3(
GetNotRelatedByDescendants
��4 N
(
��N O
int
��O R
personId
��S [
)
��[ \
{
�� 	
List
�� 
<
�� 
int
�� 
>
�� %
relatedByDescendantsIds
�� -
=
��. /
(
��0 1
await
��1 6%
GetRelatedByDescendants
��7 N
(
��N O
personId
��O W
)
��W X
)
��X Y
.
��Y Z
Select
��Z `
(
��` a
(
��a b
relatedPerson
��b o
)
��o p
=>
��q s
relatedPerson��t �
.��� �
PersonId��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
return
�� 
await
�� 
GetExcludedPeople
�� *
(
��* +%
relatedByDescendantsIds
��+ B
,
��B C
personId
��D L
)
��L M
;
��M N
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
int
��  #
>
��# $
>
��$ %$
GetPeopleWithoutParent
��& <
(
��< =
int
��= @
personId
��A I
)
��I J
{
�� 	
Person
�� 
personToCheck
��  
=
��! "
await
��# (

unitOfWork
��) 3
.
��3 4
Person
��4 :
.
��: ;
FindById
��; C
(
��C D
personId
��D L
)
��L M
;
��M N
List
�� 
<
�� 
int
�� 
>
�� #
childrenWithoutParent
�� +
=
��, -

unitOfWork
��. 8
.
��8 9
Person
��9 ?
.
��? @
Filter
��@ F
(
��F G
(
��G H
person
��H N
)
��N O
=>
��P R
!
��S T
person
��T Z
.
��Z [
Parents
��[ b
.
��b c
Any
��c f
(
��f g
(
��g h
parent
��h n
)
��n o
=>
��p r
parent
��s y
.
��y z
Parent��z �
.��� �
Gender��� �
==��� �
personToCheck��� �
.��� �
Gender��� �
)��� �
)��� �
.��� �
Include��� �
(��� �
p��� �
=>��� �
p��� �
.��� �
Parents��� �
)��� �
.��� �
Select��� �
(��� �
(��� �
person��� �
)��� �
=>��� �
person��� �
.��� �
Id��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
return
�� #
childrenWithoutParent
�� (
;
��( )
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��   
GenericPersonModel
��  2
>
��2 3
>
��3 4
GetExcludedPeople
��5 F
(
��F G
List
��G K
<
��K L
int
��L O
>
��O P
includedPeopleIds
��Q b
,
��b c
int
��d g
personId
��h p
)
��p q
{
�� 	
Person
�� 
person
�� 
=
�� 
await
�� !

unitOfWork
��" ,
.
��, -
Person
��- 3
.
��3 4
FindById
��4 <
(
��< =
personId
��= E
)
��E F
;
��F G
List
�� 
<
�� 
Person
�� 
>
�� 
peopleInTree
�� %
=
��& '

unitOfWork
��( 2
.
��2 3
Person
��3 9
.
��9 :
Filter
��: @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
TreeId
��H N
==
��O Q
person
��R X
.
��X Y
TreeId
��Y _
)
��_ `
.
��` a
ToList
��a g
(
��g h
)
��h i
;
��i j
List
�� 
<
�� 
Person
�� 
>
�� 
excludedPeople
�� '
=
��( )
peopleInTree
��* 6
.
��6 7
Where
��7 <
(
��< =
person
��= C
=>
��D F
!
��G H
includedPeopleIds
��H Y
.
��Y Z
Exists
��Z `
(
��` a
includedPersonId
��a q
=>
��r t
includedPersonId��u �
==��� �
person��� �
.��� �
Id��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
excludedPeople
�� 
.
�� 
	RemoveAll
�� $
(
��$ %
relative
��% -
=>
��. 0
person
��1 7
.
��7 8
Id
��8 :
==
��; =
relative
��> F
.
��F G
Id
��G I
)
��I J
;
��J K
return
�� 
await
�� %
MapToGenericPersonModel
�� 0
(
��0 1
excludedPeople
��1 ?
)
��? @
;
��@ A
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��   
GenericPersonModel
��  2
>
��2 3
>
��3 4%
MapToGenericPersonModel
��5 L
(
��L M
List
��M Q
<
��Q R
Person
��R X
>
��X Y
people
��Z `
)
��` a
{
�� 	
List
�� 
<
��  
GenericPersonModel
�� #
>
��# $
returnEvent
��% 0
=
��1 2
new
��3 6
List
��7 ;
<
��; < 
GenericPersonModel
��< N
>
��N O
(
��O P
)
��P Q
;
��Q R
foreach
�� 
(
�� 
var
�� 
person
�� 
in
��  "
people
��# )
)
��) *
{
��  
GenericPersonModel
�� "
returnPerson
��# /
=
��0 1
_mapper
��2 9
.
��9 :
Map
��: =
<
��= > 
GenericPersonModel
��> P
>
��P Q
(
��Q R
person
��R X
)
��X Y
;
��Y Z
returnPerson
�� 
.
�� 
	ImageFile
�� &
=
��' (
await
��) .$
_fileManagementService
��/ E
.
��E F
GetFile
��F M
(
��M N
person
��N T
.
��T U
Image
��U Z
)
��Z [
;
��[ \
returnEvent
�� 
.
�� 
Add
�� 
(
��  
returnPerson
��  ,
)
��, -
;
��- .
}
�� 
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� %
ParentChildDetailsModel
�� 1
>
��1 2!
GetParentChildAsync
��3 F
(
��F G
int
��G J
parentChildId
��K X
)
��X Y
{
�� 	
ParentChild
�� 
parentChild
�� #
=
��$ %
await
��& +

unitOfWork
��, 6
.
��6 7
ParentChild
��7 B
.
��B C
FindById
��C K
(
��K L
parentChildId
��L Y
)
��Y Z
;
��Z [%
ParentChildDetailsModel
�� #
returnEvent
��$ /
=
��0 1
_mapper
��2 9
.
��9 :
Map
��: =
<
��= >%
ParentChildDetailsModel
��> U
>
��U V
(
��V W
parentChild
��W b
)
��b c
;
��c d
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� %
ParentChildDetailsModel
�� 1
>
��1 2!
AddParentChildAsync
��3 F
(
��F G*
ParentChildCreateUpdateModel
��G c
parentChild
��d o
)
��o p
{
�� 	
if
�� 
(
�� 
parentChild
�� 
==
�� 
null
�� #
)
��# $
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
ParentChild
�� 
parentChildEntity
�� )
=
��* +
_mapper
��, 3
.
��3 4
Map
��4 7
<
��7 8
ParentChild
��8 C
>
��C D
(
��D E
parentChild
��E P
)
��P Q
;
��Q R
parentChildEntity
�� 
.
�� 
	CreatedOn
�� '
=
��( )
DateTime
��* 2
.
��2 3
UtcNow
��3 9
;
��9 :
parentChildEntity
�� 
=
�� 
await
��  %

unitOfWork
��& 0
.
��0 1
ParentChild
��1 <
.
��< =
Create
��= C
(
��C D
parentChildEntity
��D U
)
��U V
;
��V W%
ParentChildDetailsModel
�� #
returnEvent
��$ /
=
��0 1
_mapper
��2 9
.
��9 :
Map
��: =
<
��= >%
ParentChildDetailsModel
��> U
>
��U V
(
��V W
parentChildEntity
��W h
)
��h i
;
��i j
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� %
ParentChildDetailsModel
�� 1
>
��1 2$
UpdateParentChildAsync
��3 I
(
��I J*
ParentChildCreateUpdateModel
��J f
parentChild
��g r
)
��r s
{
�� 	
if
�� 
(
�� 
parentChild
�� 
==
�� 
null
�� #
)
��# $
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
ParentChild
�� 
parentChildInDb
�� '
=
��( )
await
��* /

unitOfWork
��0 :
.
��: ;
ParentChild
��; F
.
��F G
FindById
��G O
(
��O P
parentChild
��P [
.
��[ \

RelativeId
��\ f
)
��f g
;
��g h
if
�� 
(
�� 
parentChildInDb
�� 
==
��  "
null
��# '
)
��' (
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
parentChildInDb
�� 
.
�� 
ChildId
�� #
=
��$ %
parentChild
��& 1
.
��1 2
ChildId
��2 9
;
��9 :
parentChildInDb
�� 
.
�� 
ParentId
�� $
=
��% &
parentChild
��' 2
.
��2 3
ParentId
��3 ;
;
��; <
parentChildInDb
�� 
.
�� 
BloodRelatives
�� *
=
��+ ,
parentChild
��- 8
.
��8 9
BloodRelatives
��9 G
;
��G H
parentChildInDb
�� 
.
�� 

ModifiedOn
�� &
=
��' (
DateTime
��) 1
.
��1 2
UtcNow
��2 8
;
��8 9
ParentChild
�� 
parentChildEntity
�� )
=
��* +
await
��, 1

unitOfWork
��2 <
.
��< =
ParentChild
��= H
.
��H I
Update
��I O
(
��O P
parentChildInDb
��P _
)
��_ `
;
��` a%
ParentChildDetailsModel
�� #
returnEvent
��$ /
=
��0 1
_mapper
��2 9
.
��9 :
Map
��: =
<
��= >%
ParentChildDetailsModel
��> U
>
��U V
(
��V W
parentChildEntity
��W h
)
��h i
;
��i j
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� %
ParentChildDetailsModel
�� 1
>
��1 2$
DeleteParentChildAsync
��3 I
(
��I J
int
��J M
parentChildId
��N [
)
��[ \
{
�� 	
ParentChild
�� 
educationEntity
�� '
=
��( )
await
��* /

unitOfWork
��0 :
.
��: ;
ParentChild
��; F
.
��F G
Delete
��G M
(
��M N
parentChildId
��N [
)
��[ \
;
��\ ]%
ParentChildDetailsModel
�� #
returnEvent
��$ /
=
��0 1
_mapper
��2 9
.
��9 :
Map
��: =
<
��= >%
ParentChildDetailsModel
��> U
>
��U V
(
��V W
educationEntity
��W f
)
��f g
;
��g h
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
}
�� 
}�� Ξ
gE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\PersonService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Services! )
{ 
public 

class 
PersonService 
:  
BaseService! ,
,, -
IPersonService. <
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IImageService &
_imageService' 4
;4 5
private 
readonly "
IFileManagementService /"
_fileManagementService0 F
;F G
private 
readonly 
IParentChildService ,
_parentChildService- @
;@ A
private 
readonly 
IMarriageService )
_marriageService* :
;: ;
public 
PersonService 
( 
IUnitOfWork (

unitOfWork) 3
,3 4
IMapper5 <
mapper= C
,C D
IImageServiceE R
imageServiceS _
,_ `"
IFileManagementServicea w"
fileManagementService	x �
,
� �!
IParentChildService
� � 
parentChildService
� �
,
� �
IMarriageService
� �
marriageService
� �
)
� �
:
� �
base
� �
(
� �

unitOfWork
� �
)
� �
{ 	
_mapper 
= 
mapper 
; 
_imageService 
= 
imageService (
;( )"
_fileManagementService "
=# $!
fileManagementService% :
;: ;
_parentChildService 
=  !
parentChildService" 4
;4 5
_marriageService 
= 
marriageService .
;. /
} 	
public!! 
async!! 
Task!! 
<!! 
PersonDetailsModel!! ,
>!!, -
GetPersonAsync!!. <
(!!< =
int!!= @
personId!!A I
)!!I J
{"" 	
Person## 
person## 
=## 
await## !

unitOfWork##" ,
.##, -
Person##- 3
.##3 4
FindById##4 <
(##< =
personId##= E
)##E F
;##F G
PersonDetailsModel$$ 
personEntity$$ +
=$$, -
_mapper$$. 5
.$$5 6
Map$$6 9
<$$9 :
PersonDetailsModel$$: L
>$$L M
($$M N
person$$N T
)$$T U
;$$U V
personEntity%% 
.%% 
	Marriages%% "
=%%# $
await%%% *
_marriageService%%+ ;
.%%; <$
GetAllMarriagesForPerson%%< T
(%%T U
personId%%U ]
)%%] ^
;%%^ _
personEntity'' 
.'' 
Children'' !
=''" #
await''$ )
_parentChildService''* =
.''= >#
GetAllChildrenForPerson''> U
(''U V
personId''V ^
)''^ _
;''_ `
foreach)) 
()) 
var)) 
child)) 
in)) !
personEntity))" .
.)). /
Children))/ 7
)))7 8
{** 
child++ 
.++ 
	ImageFile++ 
=++  !
await++" '"
_fileManagementService++( >
.++> ?
GetFile++? F
(++F G
await++G L
_imageService++M Z
.++Z [
GetImageAsync++[ h
(++h i
child++i n
.++n o
ImageId++o v
)++v w
)++w x
;++x y
},, 
personEntity.. 
... 
Parents..  
=..! "
await..# (
_parentChildService..) <
...< ="
GetAllParentsForPerson..= S
(..S T
personId..T \
)..\ ]
;..] ^
foreach00 
(00 
var00 
parent00 
in00  "
personEntity00# /
.00/ 0
Parents000 7
)007 8
{11 
parent22 
.22 
	ImageFile22  
=22! "
await22# ("
_fileManagementService22) ?
.22? @
GetFile22@ G
(22G H
await22H M
_imageService22N [
.22[ \
GetImageAsync22\ i
(22i j
parent22j p
.22p q
ImageId22q x
)22x y
)22y z
;22z {
}33 
personEntity55 
.55 
	ImageFile55 "
=55# $
await55% *"
_fileManagementService55+ A
.55A B
GetFile55B I
(55I J
person55J P
.55P Q
Image55Q V
)55V W
;55W X
if77 
(77 
person77 
.77 
RelativeForPerson77 (
!=77) +
null77, 0
)770 1
{88 
personEntity99 
.99 
UserId99 #
=99$ %
person99& ,
.99, -
RelativeForPerson99- >
.99> ?
RelativeUserId99? M
;99M N
}:: 
else;; 
{<< 
User== 
user== 
=== 

unitOfWork== &
.==& '
User==' +
.==+ ,
Filter==, 2
(==2 3
u==3 4
=>==5 7
u==8 9
.==9 :
PersonId==: B
====C E
person==F L
.==L M
Id==M O
)==O P
.==P Q
FirstOrDefault==Q _
(==_ `
)==` a
;==a b
if?? 
(?? 
user?? 
!=?? 
default?? #
(??# $
User??$ (
)??( )
)??) *
{@@ 
personEntityAA  
.AA  !
UserIdAA! '
=AA( )
userAA* .
.AA. /
IdAA/ 1
;AA1 2
}BB 
}CC 
returnEE 
personEntityEE 
;EE  
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH 
ListHH 
<HH 
GenericPersonModelHH 1
>HH1 2
>HH2 3
GetPeopleListInTreeHH4 G
(HHG H
GuidHHH L
treeIdHHM S
)HHS T
{II 	
ListJJ 
<JJ 
PersonJJ 
>JJ 

poepleListJJ #
=JJ$ %

unitOfWorkJJ& 0
.JJ0 1
PersonJJ1 7
.JJ7 8
FilterJJ8 >
(JJ> ?
pJJ? @
=>JJA C
pJJD E
.JJE F
TreeIdJJF L
==JJM O
treeIdJJP V
)JJV W
.KK 
IncludeKK 
(KK 
pKK 
=>KK 
pKK 
.KK  
RelativeForPersonKK  1
)KK1 2
.KK2 3
ToListKK3 9
(KK9 :
)KK: ;
;KK; <
ListLL 
<LL 
GenericPersonModelLL #
>LL# $
returnPeopleListLL% 5
=LL6 7
newLL8 ;
ListLL< @
<LL@ A
GenericPersonModelLLA S
>LLS T
(LLT U
)LLU V
;LLV W
UserMM 
userMM 
=MM 

unitOfWorkMM "
.MM" #
UserMM# '
.MM' (
FilterMM( .
(MM. /
uMM/ 0
=>MM1 3
uMM4 5
.MM5 6
PersonMM6 <
.MM< =
TreeIdMM= C
==MMD F
treeIdMMG M
)MMM N
.MMN O
FirstOrDefaultMMO ]
(MM] ^
)MM^ _
;MM_ `
foreachOO 
(OO 
varOO 
personOO 
inOO  "

poepleListOO# -
)OO- .
{PP 
GenericPersonModelQQ "
returnPersonQQ# /
=QQ0 1
_mapperQQ2 9
.QQ9 :
MapQQ: =
<QQ= >
GenericPersonModelQQ> P
>QQP Q
(QQQ R
personQQR X
)QQX Y
;QQY Z
returnPersonRR 
.RR 
	ImageFileRR &
=RR' (
awaitRR) ."
_fileManagementServiceRR/ E
.RRE F
GetFileRRF M
(RRM N
personRRN T
.RRT U
ImageRRU Z
)RRZ [
;RR[ \
ifTT 
(TT 
personTT 
.TT 
RelativeForPersonTT ,
!=TT- /
nullTT0 4
)TT4 5
{UU 
returnPersonVV  
.VV  !
UserIdVV! '
=VV( )
personVV* 0
.VV0 1
RelativeForPersonVV1 B
.VVB C
RelativeUserIdVVC Q
;VVQ R
}WW 
ifYY 
(YY 
userYY 
!=YY 
nullYY  
&&YY! #
personYY$ *
.YY* +
IdYY+ -
==YY. 0
userYY1 5
.YY5 6
PersonIdYY6 >
)YY> ?
{ZZ 
returnPerson[[  
.[[  !
UserId[[! '
=[[( )
user[[* .
.[[. /
Id[[/ 1
;[[1 2
}\\ 
returnPeopleList^^  
.^^  !
Add^^! $
(^^$ %
returnPerson^^% 1
)^^1 2
;^^2 3
}__ 
returnaa 
returnPeopleListaa #
;aa# $
}bb 	
publicdd 
asyncdd 
Taskdd 
<dd 
Listdd 
<dd 
PersonTreeInfoModeldd 2
>dd2 3
>dd3 4#
GetPeopleTreeDataInTreedd5 L
(ddL M
GuidddM Q
treeIdddR X
)ddX Y
{ee 	
Listff 
<ff 
Personff 
>ff 

poepleListff #
=ff$ %

unitOfWorkff& 0
.ff0 1
Personff1 7
.ff7 8
Filterff8 >
(ff> ?
pff? @
=>ffA C
pffD E
.ffE F
TreeIdffF L
==ffM O
treeIdffP V
)ffV W
.gg 
Includegg 
(gg 
pgg 
=>gg 
pgg 
.gg  
Parentsgg  '
)gg' (
.hh 
ThenIncludehh 
(hh 
phh 
=>hh !
phh" #
.hh# $
Parenthh$ *
)hh* +
.ii 
Includeii 
(ii 
pii 
=>ii 
pii 
.ii   
FirstPersonMarriagesii  4
)ii4 5
.jj 
Includejj 
(jj 
pjj 
=>jj 
pjj 
.jj  !
SecondPersonMarriagesjj  5
)jj5 6
.kk 
Includekk 
(kk 
pkk 
=>kk 
pkk 
.kk  
RelativeForPersonkk  1
)kk1 2
.kk2 3
ToListkk3 9
(kk9 :
)kk: ;
;kk; <
Listmm 
<mm 
PersonTreeInfoModelmm $
>mm$ % 
returnPeopleTreeDatamm& :
=mm; <
newmm= @
ListmmA E
<mmE F
PersonTreeInfoModelmmF Y
>mmY Z
(mmZ [
)mm[ \
;mm\ ]
Usernn 
usernn 
=nn 

unitOfWorknn "
.nn" #
Usernn# '
.nn' (
Filternn( .
(nn. /
unn/ 0
=>nn1 3
unn4 5
.nn5 6
Personnn6 <
.nn< =
TreeIdnn= C
==nnD F
treeIdnnG M
)nnM N
.nnN O
FirstOrDefaultnnO ]
(nn] ^
)nn^ _
;nn_ `
foreachpp 
(pp 
varpp 
personpp 
inpp  "

poepleListpp# -
)pp- .
{qq 
PersonTreeInfoModelrr #
returnPersonrr$ 0
=rr1 2
MapPersonInforr3 @
(rr@ A
personrrA G
)rrG H
;rrH I
returnPersonss 
.ss 
	ImageFiless &
=ss' (
awaitss) ."
_fileManagementServicess/ E
.ssE F
GetFilessF M
(ssM N
personssN T
.ssT U
ImagessU Z
)ssZ [
;ss[ \
iftt 
(tt 
persontt 
.tt 
RelativeForPersontt ,
!=tt- /
nulltt0 4
)tt4 5
{uu 
returnPersonvv  
.vv  !
UserIdvv! '
=vv( )
personvv* 0
.vv0 1
RelativeForPersonvv1 B
.vvB C
RelativeUserIdvvC Q
;vvQ R
}ww 
ifyy 
(yy 
useryy 
!=yy 
nullyy  
&&yy! #
personyy$ *
.yy* +
Idyy+ -
==yy. 0
useryy1 5
.yy5 6
PersonIdyy6 >
)yy> ?
{zz 
returnPerson{{  
.{{  !
UserId{{! '
={{( )
user{{* .
.{{. /
Id{{/ 1
;{{1 2
}||  
returnPeopleTreeData~~ $
.~~$ %
Add~~% (
(~~( )
returnPerson~~) 5
)~~5 6
;~~6 7
} "
returnPeopleTreeData
��  
=
��! "%
AddPartnersToPeopleList
��# :
(
��: ;"
returnPeopleTreeData
��; O
)
��O P
;
��P Q
return
�� "
returnPeopleTreeData
�� '
;
��' (
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
EventInTreeModel
�� /
>
��/ 0
>
��0 1
GetEventsInTree
��2 A
(
��A B
Guid
��B F
treeId
��G M
)
��M N
{
�� 	
List
�� 
<
�� 
Person
�� 
>
�� 

poepleList
�� #
=
��$ %

unitOfWork
��& 0
.
��0 1
Person
��1 7
.
��7 8
Filter
��8 >
(
��> ?
p
��? @
=>
��A C
p
��D E
.
��E F
TreeId
��F L
==
��M O
treeId
��P V
&&
��W Y
p
��Z [
.
��[ \
	DeathDate
��\ e
==
��f h
null
��i m
)
��m n
.
��n o
ToList
��o u
(
��u v
)
��v w
;
��w x
List
�� 
<
�� 
EventInTreeModel
�� !
>
��! "
returnEventsList
��# 3
=
��4 5
new
��6 9
List
��: >
<
��> ?
EventInTreeModel
��? O
>
��O P
(
��P Q
)
��Q R
;
��R S
foreach
�� 
(
�� 
var
�� 
person
�� 
in
��  "

poepleList
��# -
)
��- .
{
�� 
if
�� 
(
�� 
person
�� 
.
�� 
	BirthDate
�� $
.
��$ %
HasValue
��% -
)
��- .
{
�� 
returnEventsList
�� $
.
��$ %
Add
��% (
(
��( )
new
��) ,
EventInTreeModel
��- =
(
��= >
)
��> ?
{
�� 
Date
�� 
=
�� 
(
��  
DateTime
��  (
)
��( )
person
��) /
.
��/ 0
	BirthDate
��0 9
,
��9 :
	EventType
�� !
=
��" #
$str
��$ .
,
��. /
AffectedPeople
�� &
=
��' (
await
��) .,
MapAffectedPersonBirthdayEvent
��/ M
(
��M N
person
��N T
)
��T U
}
�� 
)
�� 
;
�� 
}
�� 
}
�� 
List
�� 
<
�� 
Marriage
�� 
>
�� 
	marriages
�� $
=
��% &

unitOfWork
��' 1
.
��1 2
Marriage
��2 :
.
��: ;
Filter
��; A
(
��A B
x
��B C
=>
��D F
x
��G H
.
��H I
FirstPerson
��I T
.
��T U
TreeId
��U [
==
��\ ^
treeId
��_ e
&&
��f h
x
��i j
.
��j k
SecondPerson
��k w
.
��w x
TreeId
��x ~
==�� �
treeId��� �
&&��� �
x��� �
.��� �
EndDate��� �
==��� �
null��� �
)��� �
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
FirstPerson
��  +
)
��+ ,
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
SecondPerson
��  ,
)
��, -
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
foreach
�� 
(
�� 
var
�� 
marriage
�� !
in
��" $
	marriages
��% .
)
��. /
{
�� "
MarriageDetailsModel
�� $
returnMarriage
��% 3
=
��4 5
_mapper
��6 =
.
��= >
Map
��> A
<
��A B"
MarriageDetailsModel
��B V
>
��V W
(
��W X
marriage
��X `
)
��` a
;
��a b
returnMarriage
�� 
.
�� 
PersonMarriedTo
�� .
.
��. /
	ImageFile
��/ 8
=
��9 :
await
��; @$
_fileManagementService
��A W
.
��W X
GetFile
��X _
(
��_ `
marriage
��` h
.
��h i
FirstPerson
��i t
!=
��u w
null
��x |
?
��} ~
marriage�� �
.��� �
FirstPerson��� �
.��� �
Image��� �
:��� �
marriage��� �
.��� �
SecondPerson��� �
.��� �
Image��� �
)��� �
;��� �
returnEventsList
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
EventInTreeModel
��) 9
(
��9 :
)
��: ;
{
�� 
Date
�� 
=
�� 
marriage
�� #
.
��# $
	StartDate
��$ -
,
��- .
	EventType
�� 
=
�� 
$str
��  *
,
��* +
AffectedPeople
�� "
=
��# $
await
��% *1
#MapAffectedMarriageAnniversaryEvent
��+ N
(
��N O
marriage
��O W
)
��W X
}
�� 
)
�� 
;
�� 
}
�� 
return
�� 
returnEventsList
�� #
;
��# $
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
GenericPersonModel
�� 1
>
��1 2
>
��2 3&
GetPeopleWithoutRelative
��4 L
(
��L M
Guid
��M Q
treeId
��R X
)
��X Y
{
�� 	
List
�� 
<
�� 
Person
�� 
>
�� 

poepleList
�� #
=
��$ %

unitOfWork
��& 0
.
��0 1
Person
��1 7
.
��7 8
Filter
��8 >
(
��> ?
p
��? @
=>
��A C
p
��D E
.
��E F
TreeId
��F L
==
��M O
treeId
��P V
&&
��W Y
p
��Z [
.
��[ \
RelativeForPerson
��\ m
==
��n p
null
��q u
)
��u v
.
��v w
Include
��w ~
(
��~ 
p�� �
=>��� �
p��� �
.��� �!
RelativeForPerson��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
List
�� 
<
��  
GenericPersonModel
�� #
>
��# $
returnPeopleList
��% 5
=
��6 7
new
��8 ;
List
��< @
<
��@ A 
GenericPersonModel
��A S
>
��S T
(
��T U
)
��U V
;
��V W
User
�� 
user
�� 
=
�� 

unitOfWork
�� "
.
��" #
User
��# '
.
��' (
Filter
��( .
(
��. /
u
��/ 0
=>
��1 3
u
��4 5
.
��5 6
Person
��6 <
.
��< =
TreeId
��= C
==
��D F
treeId
��G M
)
��M N
.
��N O
FirstOrDefault
��O ]
(
��] ^
)
��^ _
;
��_ `
foreach
�� 
(
�� 
var
�� 
person
�� 
in
��  "

poepleList
��# -
)
��- .
{
�� 
if
�� 
(
�� 
user
�� 
!=
�� 
null
��  
&&
��! #
person
��$ *
.
��* +
Id
��+ -
!=
��. 0
user
��1 5
.
��5 6
PersonId
��6 >
)
��> ?
{
��  
GenericPersonModel
�� &
returnPerson
��' 3
=
��4 5
_mapper
��6 =
.
��= >
Map
��> A
<
��A B 
GenericPersonModel
��B T
>
��T U
(
��U V
person
��V \
)
��\ ]
;
��] ^
returnPerson
��  
.
��  !
	ImageFile
��! *
=
��+ ,
await
��- 2$
_fileManagementService
��3 I
.
��I J
GetFile
��J Q
(
��Q R
person
��R X
.
��X Y
Image
��Y ^
)
��^ _
;
��_ `
returnPeopleList
�� $
.
��$ %
Add
��% (
(
��( )
returnPerson
��) 5
)
��5 6
;
��6 7
}
�� 
}
�� 
return
�� 
returnPeopleList
�� #
;
��# $
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
PersonBaseModel
��  /
>
��/ 0
>
��0 11
#MapAffectedMarriageAnniversaryEvent
��2 U
(
��U V
Marriage
��V ^
marriage
��_ g
)
��g h
{
�� 	
List
�� 
<
�� 
PersonBaseModel
��  
>
��  !

peopleList
��" ,
=
��- .
new
��/ 2
List
��3 7
<
��7 8
PersonBaseModel
��8 G
>
��G H
(
��H I
)
��I J
;
��J K

peopleList
�� 
.
�� 
Add
�� 
(
�� 
await
��  "
MapToPersonBaseModel
��! 5
(
��5 6
marriage
��6 >
.
��> ?
FirstPerson
��? J
)
��J K
)
��K L
;
��L M

peopleList
�� 
.
�� 
Add
�� 
(
�� 
await
��  "
MapToPersonBaseModel
��! 5
(
��5 6
marriage
��6 >
.
��> ?
SecondPerson
��? K
)
��K L
)
��L M
;
��M N
return
�� 

peopleList
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
PersonBaseModel
��  /
>
��/ 0
>
��0 1,
MapAffectedPersonBirthdayEvent
��2 P
(
��P Q
Person
��Q W
person
��X ^
)
��^ _
{
�� 	
List
�� 
<
�� 
PersonBaseModel
��  
>
��  !

peopleList
��" ,
=
��- .
new
��/ 2
List
��3 7
<
��7 8
PersonBaseModel
��8 G
>
��G H
(
��H I
)
��I J
;
��J K

peopleList
�� 
.
�� 
Add
�� 
(
�� 
await
��  "
MapToPersonBaseModel
��! 5
(
��5 6
person
��6 <
)
��< =
)
��= >
;
��> ?
return
�� 

peopleList
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
PersonBaseModel
�� *
>
��* +"
MapToPersonBaseModel
��, @
(
��@ A
Person
��A G
person
��H N
)
��N O
{
�� 	
return
�� 
new
�� 
PersonBaseModel
�� &
(
��& '
)
��' (
{
�� 
	FirstName
�� 
=
�� 
person
�� "
.
��" #
	FirstName
��# ,
,
��, -
LastName
�� 
=
�� 
person
�� !
.
��! "
LastName
��" *
,
��* +
PersonId
�� 
=
�� 
person
�� !
.
��! "
Id
��" $
,
��$ %
	ImageFile
�� 
=
�� 
person
�� "
.
��" #
ImageId
��# *
!=
��+ -
null
��. 2
?
��3 4
await
��5 :$
_fileManagementService
��; Q
.
��Q R
GetFile
��R Y
(
��Y Z
await
��Z _
_imageService
��` m
.
��m n
GetImageAsync
��n {
(
��{ |
person��| �
.��� �
ImageId��� �
)��� �
)��� �
:��� �
null��� �
}
�� 
;
�� 
}
�� 	
private
�� !
PersonTreeInfoModel
�� #
MapPersonInfo
��$ 1
(
��1 2
Person
��2 8
person
��9 ?
)
��? @
{
�� 	!
PersonTreeInfoModel
�� 
returnPerson
��  ,
=
��- .
_mapper
��/ 6
.
��6 7
Map
��7 :
<
��: ;!
PersonTreeInfoModel
��; N
>
��N O
(
��O P
person
��P V
)
��V W
;
��W X
foreach
�� 
(
�� 
var
�� 
parent
�� 
in
��  "
person
��# )
.
��) *
Parents
��* 1
)
��1 2
{
�� 
if
�� 
(
�� 
parent
�� 
.
�� 
Parent
�� !
.
��! "
Gender
��" (
==
��) +
$char
��, /
)
��/ 0
{
�� 
returnPerson
��  
.
��  !
FatherId
��! )
=
��* +
parent
��, 2
.
��2 3
ParentId
��3 ;
;
��; <
}
�� 
if
�� 
(
�� 
parent
�� 
.
�� 
Parent
�� !
.
��! "
Gender
��" (
==
��) +
$char
��, /
)
��/ 0
{
�� 
returnPerson
��  
.
��  !
MotherId
��! )
=
��* +
parent
��, 2
.
��2 3
ParentId
��3 ;
;
��; <
}
�� 
}
�� 
returnPerson
�� 
.
�� 
PartnersIds
�� $
=
��% &
new
��' *
List
��+ /
<
��/ 0
int
��0 3
>
��3 4
(
��4 5
)
��5 6
;
��6 7
foreach
�� 
(
�� 
var
�� 
marriage
�� !
in
��" $
person
��% +
.
��+ ,"
FirstPersonMarriages
��, @
)
��@ A
{
�� 
returnPerson
�� 
.
�� 
PartnersIds
�� (
.
��( )
Add
��) ,
(
��, -
marriage
��- 5
.
��5 6
SecondPersonId
��6 D
)
��D E
;
��E F
}
�� 
foreach
�� 
(
�� 
var
�� 
marriage
�� !
in
��" $
person
��% +
.
��+ ,#
SecondPersonMarriages
��, A
)
��A B
{
�� 
returnPerson
�� 
.
�� 
PartnersIds
�� (
.
��( )
Add
��) ,
(
��, -
marriage
��- 5
.
��5 6
FirstPersonId
��6 C
)
��C D
;
��D E
}
�� 
return
�� 
returnPerson
�� 
;
��  
}
�� 	
private
�� 
static
�� 
List
�� 
<
�� !
PersonTreeInfoModel
�� /
>
��/ 0%
AddPartnersToPeopleList
��1 H
(
��H I
List
��I M
<
��M N!
PersonTreeInfoModel
��N a
>
��a b

peopleList
��c m
)
��m n
{
�� 	
List
�� 
<
�� !
PersonTreeInfoModel
�� $
>
��$ %
updatedList
��& 1
=
��2 3
new
��4 7
List
��8 <
<
��< =!
PersonTreeInfoModel
��= P
>
��P Q
(
��Q R
)
��R S
;
��S T
foreach
�� 
(
�� 
var
�� 
person
�� 
in
��  "

peopleList
��# -
)
��- .
{
�� 
if
�� 
(
�� 
updatedList
�� 
.
��  
	FindIndex
��  )
(
��) *
x
��* +
=>
��, .
x
��/ 0
.
��0 1
PersonId
��1 9
==
��: <
person
��= C
.
��C D
PersonId
��D L
)
��L M
==
��N P
-
��Q R
$num
��R S
)
��S T
{
�� 
updatedList
�� 
.
��  
Add
��  #
(
��# $
person
��$ *
)
��* +
;
��+ ,
}
�� 
if
�� 
(
�� 
person
�� 
.
�� 
FatherId
�� #
!=
��$ &
$num
��' (
&&
��) +
person
��, 2
.
��2 3
MotherId
��3 ;
!=
��< >
$num
��? @
)
��@ A
{
�� 
UpdateMother
��  
(
��  !
ref
��! $
updatedList
��% 0
,
��0 1
ref
��2 5

peopleList
��6 @
,
��@ A
person
��B H
)
��H I
;
��I J
UpdateFather
��  
(
��  !
ref
��! $
updatedList
��% 0
,
��0 1
ref
��2 5

peopleList
��6 @
,
��@ A
person
��B H
)
��H I
;
��I J
}
�� 
}
�� 
return
�� 
updatedList
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
void
�� 
UpdateMother
�� (
(
��( )
ref
��) ,
List
��- 1
<
��1 2!
PersonTreeInfoModel
��2 E
>
��E F
updatedList
��G R
,
��R S
ref
��T W
List
��X \
<
��\ ]!
PersonTreeInfoModel
��] p
>
��p q

peopleList
��r |
,
��| }"
PersonTreeInfoModel��~ �
person��� �
)��� �
{
�� 	!
PersonTreeInfoModel
�� 
mother
��  &
=
��' (
updatedList
��) 4
.
��4 5
Find
��5 9
(
��9 :
x
��: ;
=>
��< >
x
��? @
.
��@ A
PersonId
��A I
==
��J L
person
��M S
.
��S T
MotherId
��T \
)
��\ ]
;
��] ^
if
�� 
(
�� 
mother
�� 
!=
�� 
default
�� !
(
��! "!
PersonTreeInfoModel
��" 5
)
��5 6
)
��6 7
{
�� 
updatedList
�� 
.
�� 
Remove
�� "
(
��" #
mother
��# )
)
��) *
;
��* +
}
�� 
else
�� 
{
�� 
mother
�� 
=
�� 

peopleList
�� #
.
��# $
Find
��$ (
(
��( )
x
��) *
=>
��+ -
x
��. /
.
��/ 0
PersonId
��0 8
==
��9 ;
person
��< B
.
��B C
MotherId
��C K
)
��K L
;
��L M
}
�� 
if
�� 
(
�� 
mother
�� 
.
�� 
PartnersIds
�� "
.
��" #
FirstOrDefault
��# 1
(
��1 2
id
��2 4
=>
��5 7
id
��8 :
==
��; =
person
��> D
.
��D E
FatherId
��E M
)
��M N
==
��O Q
$num
��R S
)
��S T
{
�� 
mother
�� 
.
�� 
PartnersIds
�� "
.
��" #
Add
��# &
(
��& '
person
��' -
.
��- .
FatherId
��. 6
)
��6 7
;
��7 8
}
�� 
updatedList
�� 
.
�� 
Add
�� 
(
�� 
mother
�� "
)
��" #
;
��# $
}
�� 	
private
�� 
static
�� 
void
�� 
UpdateFather
�� (
(
��( )
ref
��) ,
List
��- 1
<
��1 2!
PersonTreeInfoModel
��2 E
>
��E F
updatedList
��G R
,
��R S
ref
��T W
List
��X \
<
��\ ]!
PersonTreeInfoModel
��] p
>
��p q

peopleList
��r |
,
��| }"
PersonTreeInfoModel��~ �
person��� �
)��� �
{
�� 	!
PersonTreeInfoModel
�� 
father
��  &
=
��' (
updatedList
��) 4
.
��4 5
Find
��5 9
(
��9 :
x
��: ;
=>
��< >
x
��? @
.
��@ A
PersonId
��A I
==
��J L
person
��M S
.
��S T
FatherId
��T \
)
��\ ]
;
��] ^
if
�� 
(
�� 
father
�� 
!=
�� 
default
�� !
(
��! "!
PersonTreeInfoModel
��" 5
)
��5 6
)
��6 7
{
�� 
updatedList
�� 
.
�� 
Remove
�� "
(
��" #
father
��# )
)
��) *
;
��* +
}
�� 
else
�� 
{
�� 
father
�� 
=
�� 

peopleList
�� #
.
��# $
Find
��$ (
(
��( )
x
��) *
=>
��+ -
x
��. /
.
��/ 0
PersonId
��0 8
==
��9 ;
person
��< B
.
��B C
FatherId
��C K
)
��K L
;
��L M
}
�� 
if
�� 
(
�� 
father
�� 
.
�� 
PartnersIds
�� "
.
��" #
FirstOrDefault
��# 1
(
��1 2
id
��2 4
=>
��5 7
id
��8 :
==
��; =
person
��> D
.
��D E
MotherId
��E M
)
��M N
==
��O Q
default
��R Y
(
��Y Z
int
��Z ]
)
��] ^
)
��^ _
{
�� 
father
�� 
.
�� 
PartnersIds
�� "
.
��" #
Add
��# &
(
��& '
person
��' -
.
��- .
MotherId
��. 6
)
��6 7
;
��7 8
}
�� 
updatedList
�� 
.
�� 
Add
�� 
(
�� 
father
�� "
)
��" #
;
��# $
}
�� 	
public
�� 
async
�� 
Task
�� 
<
��  
PersonDetailsModel
�� ,
>
��, -
AddPersonAsync
��. <
(
��< =%
PersonCreateUpdateModel
��= T
person
��U [
)
��[ \
{
�� 	
if
�� 
(
�� 
person
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
Person
�� 
personEntity
�� 
=
��  !
await
��" '
addLocations
��( 4
(
��4 5
person
��5 ;
)
��; <
;
��< =
personEntity
�� 
=
�� $
removeAttachedEntities
�� 1
(
��1 2
personEntity
��2 >
)
��> ?
;
��? @
personEntity
�� 
.
�� 
	CreatedOn
�� "
=
��# $
DateTime
��% -
.
��- .
UtcNow
��. 4
;
��4 5
personEntity
�� 
=
�� 
await
��  

unitOfWork
��! +
.
��+ ,
Person
��, 2
.
��2 3
Create
��3 9
(
��9 :
personEntity
��: F
)
��F G
;
��G H 
PersonDetailsModel
�� 
returnEvent
�� *
=
��+ ,
_mapper
��- 4
.
��4 5
Map
��5 8
<
��8 9 
PersonDetailsModel
��9 K
>
��K L
(
��L M
personEntity
��M Y
)
��Y Z
;
��Z [
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
Person
�� $
removeAttachedEntities
�� 4
(
��4 5
Person
��5 ;
personEntity
��< H
)
��H I
{
�� 	
personEntity
�� 
.
�� 
Nationality
�� $
=
��% &
null
��' +
;
��+ ,
personEntity
�� 
.
�� 
Religion
�� !
=
��" #
null
��$ (
;
��( )
personEntity
�� 
.
�� 

BirthPlace
�� #
=
��$ %
null
��& *
;
��* +
personEntity
�� 
.
�� 
LivingPlace
�� $
=
��% &
null
��' +
;
��+ ,
personEntity
�� 
.
�� 
RelativeForPerson
�� *
=
��+ ,
null
��- 1
;
��1 2
return
�� 
personEntity
�� 
;
��  
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
Person
�� !
>
��! "
addLocations
��# /
(
��/ 0%
PersonCreateUpdateModel
��0 G
person
��H N
)
��N O
{
�� 	
Person
�� 
personEntity
�� 
=
��  !
_mapper
��" )
.
��) *
Map
��* -
<
��- .
Person
��. 4
>
��4 5
(
��5 6
person
��6 <
)
��< =
;
��= >
if
�� 
(
�� 
personEntity
�� 
.
�� 
LivingPlace
�� (
==
��) +
null
��, 0
)
��0 1
{
�� 
personEntity
�� 
.
�� 
LivingPlace
�� (
=
��) *
new
��+ .
Location
��/ 7
(
��7 8
)
��8 9
;
��9 :
}
�� 
personEntity
�� 
.
�� 
LivingPlaceId
�� &
=
��' (
(
��) *
await
��* /

unitOfWork
��0 :
.
��: ;
Location
��; C
.
��C D
Create
��D J
(
��J K
personEntity
��K W
.
��W X
LivingPlace
��X c
)
��c d
)
��d e
.
��e f
Id
��f h
;
��h i
if
�� 
(
�� 
personEntity
�� 
.
�� 

BirthPlace
�� '
==
��( *
null
��+ /
)
��/ 0
{
�� 
personEntity
�� 
.
�� 

BirthPlace
�� '
=
��( )
new
��* -
Location
��. 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
personEntity
�� 
.
�� 
BirthPlaceId
�� %
=
��& '
(
��( )
await
��) .

unitOfWork
��/ 9
.
��9 :
Location
��: B
.
��B C
Create
��C I
(
��I J
personEntity
��J V
.
��V W

BirthPlace
��W a
)
��a b
)
��b c
.
��c d
Id
��d f
;
��f g
return
�� 
personEntity
�� 
;
��  
}
�� 	
public
�� 
async
�� 
Task
�� 
<
��  
PersonDetailsModel
�� ,
>
��, -
UpdatePersonAsync
��. ?
(
��? @%
PersonCreateUpdateModel
��@ W
person
��X ^
)
��^ _
{
�� 	
if
�� 
(
�� 
person
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
Person
�� 

personInDb
�� 
=
�� 
await
��  %

unitOfWork
��& 0
.
��0 1
Person
��1 7
.
��7 8
FindById
��8 @
(
��@ A
person
��A G
.
��G H
PersonId
��H P
)
��P Q
;
��Q R
if
�� 
(
�� 

personInDb
�� 
==
�� 
null
�� "
)
��" #
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 

personInDb
�� 
.
�� 
	FirstName
��  
=
��! "
person
��# )
.
��) *
	FirstName
��* 3
;
��3 4

personInDb
�� 
.
�� 
LastName
�� 
=
��  !
person
��" (
.
��( )
LastName
��) 1
;
��1 2

personInDb
�� 
.
�� 
Gender
�� 
=
�� 
person
��  &
.
��& '
Gender
��' -
[
��- .
$num
��. /
]
��/ 0
;
��0 1

personInDb
�� 
.
�� 
	BirthDate
��  
=
��! "
person
��# )
.
��) *
	BirthDate
��* 3
;
��3 4

personInDb
�� 
.
�� 
	DeathDate
��  
=
��! "
person
��# )
.
��) *
	DeathDate
��* 3
;
��3 4

personInDb
�� 
.
�� 

ModifiedOn
�� !
=
��" #
DateTime
��$ ,
.
��, -
UtcNow
��- 3
;
��3 4

personInDb
�� 
.
�� 
NationalityId
�� $
=
��% &
person
��' -
.
��- .
Nationality
��. 9
.
��9 :
Id
��: <
;
��< =

personInDb
�� 
.
�� 

ReligionId
�� !
=
��" #
person
��$ *
.
��* +
Religion
��+ 3
.
��3 4
Id
��4 6
;
��6 7
if
�� 
(
�� 
person
�� 
.
�� 
LivingPlace
�� "
!=
��# %
null
��& *
)
��* +
{
�� 

personInDb
�� 
.
�� 
LivingPlace
�� &
.
��& '
State
��' ,
=
��- .
person
��/ 5
.
��5 6
LivingPlace
��6 A
.
��A B
State
��B G
;
��G H

personInDb
�� 
.
�� 
LivingPlace
�� &
.
��& '
Country
��' .
=
��/ 0
person
��1 7
.
��7 8
LivingPlace
��8 C
.
��C D
Country
��D K
;
��K L

personInDb
�� 
.
�� 
LivingPlace
�� &
.
��& '
City
��' +
=
��, -
person
��. 4
.
��4 5
LivingPlace
��5 @
.
��@ A
City
��A E
;
��E F
}
�� 
if
�� 
(
�� 
person
�� 
.
�� 

BirthPlace
�� !
!=
��" $
null
��% )
)
��) *
{
�� 

personInDb
�� 
.
�� 

BirthPlace
�� %
.
��% &
State
��& +
=
��, -
person
��. 4
.
��4 5

BirthPlace
��5 ?
.
��? @
State
��@ E
;
��E F

personInDb
�� 
.
�� 

BirthPlace
�� %
.
��% &
Country
��& -
=
��. /
person
��0 6
.
��6 7

BirthPlace
��7 A
.
��A B
Country
��B I
;
��I J

personInDb
�� 
.
�� 

BirthPlace
�� %
.
��% &
City
��& *
=
��+ ,
person
��- 3
.
��3 4

BirthPlace
��4 >
.
��> ?
City
��? C
;
��C D
}
�� 
await
�� 
updateLocations
�� !
(
��! "

personInDb
��" ,
)
��, -
;
��- .
Person
�� 
personEntity
�� 
=
��  !
await
��" '

unitOfWork
��( 2
.
��2 3
Person
��3 9
.
��9 :
Update
��: @
(
��@ A

personInDb
��A K
)
��K L
;
��L M 
PersonDetailsModel
�� 
returnEvent
�� *
=
��+ ,
_mapper
��- 4
.
��4 5
Map
��5 8
<
��8 9 
PersonDetailsModel
��9 K
>
��K L
(
��L M
personEntity
��M Y
)
��Y Z
;
��Z [
returnEvent
�� 
.
�� 
	ImageFile
�� !
=
��" #
await
��$ )$
_fileManagementService
��* @
.
��@ A
GetFile
��A H
(
��H I
personEntity
��I U
.
��U V
Image
��V [
)
��[ \
;
��\ ]
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
updateLocations
�� *
(
��* +
Person
��+ 1
person
��2 8
)
��8 9
{
�� 	
if
�� 
(
�� 
person
�� 
.
�� 
LivingPlace
�� "
!=
��# %
null
��& *
&&
��+ -
person
��. 4
.
��4 5
LivingPlace
��5 @
.
��@ A
Id
��A C
!=
��D F
$num
��G H
)
��H I
{
�� 
await
�� 

unitOfWork
��  
.
��  !
Location
��! )
.
��) *
Update
��* 0
(
��0 1
person
��1 7
.
��7 8
LivingPlace
��8 C
)
��C D
;
��D E
}
�� 
if
�� 
(
�� 
person
�� 
.
�� 

BirthPlace
�� !
!=
��" $
null
��% )
&&
��* ,
person
��- 3
.
��3 4

BirthPlace
��4 >
.
��> ?
Id
��? A
!=
��B D
$num
��E F
)
��F G
{
�� 
await
�� 

unitOfWork
��  
.
��  !
Location
��! )
.
��) *
Update
��* 0
(
��0 1
person
��1 7
.
��7 8

BirthPlace
��8 B
)
��B C
;
��C D
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
	ImageFile
�� #
>
��# $ 
UpdatePictureAsync
��% 7
(
��7 8
int
��8 ;
personId
��< D
,
��D E
int
��F I
imageId
��J Q
)
��Q R
{
�� 	
Person
�� 
person
�� 
=
�� 
await
�� !

unitOfWork
��" ,
.
��, -
Person
��- 3
.
��3 4
FindById
��4 <
(
��< =
personId
��= E
)
��E F
;
��F G
int
�� 

oldImageId
�� 
=
�� 
(
�� 
person
�� $
.
��$ %
ImageId
��% ,
==
��- /
null
��0 4
)
��4 5
?
��6 7
$num
��8 9
:
��: ;
(
��< =
int
��= @
)
��@ A
person
��A G
.
��G H
ImageId
��H O
;
��O P
person
�� 
.
�� 
ImageId
�� 
=
�� 
imageId
�� $
;
��$ %
Person
�� 
personEntity
�� 
=
��  !
await
��" '

unitOfWork
��( 2
.
��2 3
Person
��3 9
.
��9 :
Update
��: @
(
��@ A
person
��A G
)
��G H
;
��H I
if
�� 
(
�� 

oldImageId
�� 
!=
�� 
$num
�� 
)
��  
{
�� 
await
�� "
checkImageUsageAsync
�� *
(
��* +

oldImageId
��+ 5
)
��5 6
;
��6 7
}
�� 
return
�� 
await
�� $
_fileManagementService
�� /
.
��/ 0
GetFile
��0 7
(
��7 8
personEntity
��8 D
.
��D E
Image
��E J
)
��J K
;
��K L
}
�� 	
public
�� 
async
�� 
Task
�� 
<
��  
PersonDetailsModel
�� ,
>
��, -
DeletePersonAsync
��. ?
(
��? @
int
��@ C
personId
��D L
)
��L M
{
�� 	
List
�� 
<
�� 
int
�� 
>
�� 
parentChildIds
�� $
=
��% &

unitOfWork
��' 1
.
��1 2
ParentChild
��2 =
.
��= >
Filter
��> D
(
��D E
parentChild
��E P
=>
��Q S
parentChild
��T _
.
��_ `
ParentId
��` h
==
��i k
personId
��l t
||
��u w
parentChild��x �
.��� �
ChildId��� �
==��� �
personId��� �
)��� �
.��� �
Select��� �
(��� �
parentChild��� �
=>��� �
parentChild��� �
.��� �
Id��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
foreach
�� 
(
�� 
var
�� 
parentChildId
�� &
in
��' )
parentChildIds
��* 8
)
��8 9
{
�� 
await
�� 

unitOfWork
��  
.
��  !
ParentChild
��! ,
.
��, -
Delete
��- 3
(
��3 4
parentChildId
��4 A
)
��A B
;
��B C
}
�� 
List
�� 
<
�� 
int
�� 
>
�� 
marriageIds
�� !
=
��" #

unitOfWork
��$ .
.
��. /
Marriage
��/ 7
.
��7 8
Filter
��8 >
(
��> ?
marriage
��? G
=>
��H J
marriage
��K S
.
��S T
FirstPersonId
��T a
==
��b d
personId
��e m
||
��n p
marriage
��q y
.
��y z
SecondPersonId��z �
==��� �
personId��� �
)��� �
.��� �
Select��� �
(��� �
marriage��� �
=>��� �
marriage��� �
.��� �
Id��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
foreach
�� 
(
�� 
var
�� 

marriageId
�� #
in
��$ &
marriageIds
��' 2
)
��2 3
{
�� 
await
�� 

unitOfWork
��  
.
��  !
Marriage
��! )
.
��) *
Delete
��* 0
(
��0 1

marriageId
��1 ;
)
��; <
;
��< =
}
�� 
Person
�� 
personEntity
�� 
=
��  !
await
��" '

unitOfWork
��( 2
.
��2 3
Person
��3 9
.
��9 :
Delete
��: @
(
��@ A
personId
��A I
)
��I J
;
��J K
int
�� 

oldImageId
�� 
=
�� 
(
�� 
personEntity
�� *
.
��* +
ImageId
��+ 2
==
��3 5
null
��6 :
)
��: ;
?
��< =
$num
��> ?
:
��@ A
(
��B C
int
��C F
)
��F G
personEntity
��G S
.
��S T
ImageId
��T [
;
��[ \
if
�� 
(
�� 

oldImageId
�� 
!=
�� 
$num
�� 
)
��  
{
�� 
await
�� "
checkImageUsageAsync
�� *
(
��* +

oldImageId
��+ 5
)
��5 6
;
��6 7
}
�� 
return
�� 
_mapper
�� 
.
�� 
Map
�� 
<
��  
PersonDetailsModel
�� 1
>
��1 2
(
��2 3
personEntity
��3 ?
)
��? @
;
��@ A
}
�� 	
private
�� 
async
�� 
Task
�� "
checkImageUsageAsync
�� /
(
��/ 0
int
��0 3
imageId
��4 ;
)
��; <
{
�� 	
Image
�� 
image
�� 
=
�� 
await
�� 
_imageService
��  -
.
��- .
GetImageAsync
��. ;
(
��; <
imageId
��< C
)
��C D
;
��D E
if
�� 
(
�� 
!
�� 
image
�� 
.
�� 
People
�� 
.
�� 
Any
�� !
(
��! "
)
��" #
)
��# $
{
�� 
await
�� 
_imageService
�� #
.
��# $
DeleteImageAsync
��$ 4
(
��4 5
imageId
��5 <
)
��< =
;
��= >
}
�� 
}
�� 	
}
�� 
}�� �t
iE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\RelativeService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Services! )
{ 
public 

class 
RelativeService  
:! "
BaseService# .
,. /
IRelativeService0 @
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly "
IFileManagementService /"
_fileManagementService0 F
;F G
public 
RelativeService 
( 
IUnitOfWork *

unitOfWork+ 5
,5 6
IMapper7 >
mapper? E
,E F"
IFileManagementServiceG ]!
fileManagementService^ s
)s t
:u v
basew {
({ |

unitOfWork	| �
)
� �
{ 	
_mapper 
= 
mapper 
; "
_fileManagementService "
=# $!
fileManagementService% :
;: ;
} 	
public 
async 
Task 
< 
List 
< 
RelativeModel ,
>, -
>- ."
GetAllRelativesForUser/ E
(E F
GuidF J
userIdK Q
)Q R
{ 	
List 
< 
Relative 
> 
	relatives $
=% &

unitOfWork' 1
.1 2
	Relatives2 ;
.; <
Filter< B
(B C
xC D
=>E G
xH I
.I J
PrimaryUserIdJ W
==X Z
userId[ a
)a b
.b c
Includec j
(j k
rk l
=>m o
rp q
.q r
RelativeUserr ~
)~ 
.	 �
ThenInclude
� �
(
� �
u
� �
=>
� �
u
� �
.
� �
Person
� �
)
� �
.
� �
ToList
� �
(
� �
)
� �
;
� �
List 
< 
RelativeModel 
> 
returnEvent  +
=, -
new. 1
List2 6
<6 7
RelativeModel7 D
>D E
(E F
)F G
;G H
foreach   
(   
var   
relative   !
in  " $
	relatives  % .
)  . /
{!! 
RelativeModel"" 
personToReturn"" ,
=""- .
_mapper""/ 6
.""6 7
Map""7 :
<"": ;
RelativeModel""; H
>""H I
(""I J
relative""J R
)""R S
;""S T
personToReturn## 
.## 
RelativeUser## +
.##+ ,
	ImageFile##, 5
=##6 7
await##8 ="
_fileManagementService##> T
.##T U
GetFile##U \
(##\ ]
relative##] e
.##e f
RelativeUser##f r
.##r s
Person##s y
.##y z
Image##z 
)	## �
;
##� �
returnEvent$$ 
.$$ 
Add$$ 
($$  
personToReturn$$  .
)$$. /
;$$/ 0
}%% 
return'' 
returnEvent'' 
;'' 
}(( 	
public** 
async** 
Task** 
<** 
RelativeModel** '
>**' (
GetRelative**) 4
(**4 5
int**5 8

relativeId**9 C
)**C D
{++ 	
Relative,, 
relative,, 
=,, 
await,,  %

unitOfWork,,& 0
.,,0 1
	Relatives,,1 :
.,,: ;
FindById,,; C
(,,C D

relativeId,,D N
),,N O
;,,O P
RelativeModel-- 
returnEvent-- %
=--& '
_mapper--( /
.--/ 0
Map--0 3
<--3 4
RelativeModel--4 A
>--A B
(--B C
relative--C K
)--K L
;--L M
return// 
returnEvent// 
;// 
}00 	
public11 
async11 
Task11 
<11 
RelativeState11 '
>11' (
CheckRelative11) 6
(116 7
Guid117 ;
userId11< B
,11B C
Guid11D H

relativeId11I S
)11S T
{22 	
bool33 
isAlreadyRelative33 "
=33# $
await33% *
Task33+ /
.33/ 0
Run330 3
(333 4
(334 5
)335 6
=>337 9

unitOfWork33: D
.33D E
	Relatives33E N
.33N O
Filter33O U
(33U V
r33V W
=>33X Z
(33[ \
r33\ ]
.33] ^
PrimaryUserId33^ k
==33l n
userId33o u
&&33v x
r33y z
.33z {
RelativeUserId	33{ �
==
33� �

relativeId
33� �
)
33� �
)
33� �
.
33� �
Any
33� �
(
33� �
)
33� �
)
33� �
;
33� �
if55 
(55 
isAlreadyRelative55 !
)55! "
{66 
return77 
RelativeState77 $
.77$ %
Related77% ,
;77, -
}88 
bool:: 
requestAlreadySent:: #
=::$ %
await::& +
Task::, 0
.::0 1
Run::1 4
(::4 5
(::5 6
)::6 7
=>::8 :

unitOfWork::; E
.::E F
Requests::F N
.::N O
Filter::O U
(::U V
r::V W
=>::X Z
(::[ \
r::\ ]
.::] ^
SenderId::^ f
==::g i
userId::j p
&&::q s
r::t u
.::u v

ReceiverId	::v �
==
::� �

relativeId
::� �
)
::� �
||
::� �
(
::� �
r
::� �
.
::� �
SenderId
::� �
==
::� �

relativeId
::� �
&&
::� �
r
::� �
.
::� �

ReceiverId
::� �
==
::� �
userId
::� �
)
::� �
)
::� �
.
::� �
Any
::� �
(
::� �
)
::� �
)
::� �
;
::� �
if<< 
(<< 
requestAlreadySent<< "
)<<" #
{== 
return>> 
RelativeState>> $
.>>$ %
	Requested>>% .
;>>. /
}?? 
returnAA 
RelativeStateAA  
.AA  !
	UnrelatedAA! *
;AA* +
}BB 	
publicDD 
asyncDD 
TaskDD 
<DD 
RelativeModelDD '
>DD' (
MarkChangesDD) 4
(DD4 5
intDD5 8

relativeIdDD9 C
)DDC D
{EE 	
RelativeFF 
relativeToUpdateFF %
=FF& '
awaitFF( -

unitOfWorkFF. 8
.FF8 9
	RelativesFF9 B
.FFB C
FindByIdFFC K
(FFK L

relativeIdFFL V
)FFV W
;FFW X
relativeToUpdateGG 
.GG 
LastSyncCheckGG *
=GG+ ,
DateTimeGG- 5
.GG5 6
NowGG6 9
;GG9 :
RelativeHH 
relativeEntityHH #
=HH$ %
awaitHH& +

unitOfWorkHH, 6
.HH6 7
	RelativesHH7 @
.HH@ A
UpdateHHA G
(HHG H
relativeToUpdateHHH X
)HHX Y
;HHY Z
RelativeModelII 
returnEventII %
=II& '
_mapperII( /
.II/ 0
MapII0 3
<II3 4
RelativeModelII4 A
>IIA B
(IIB C
relativeEntityIIC Q
)IIQ R
;IIR S
returnKK 
returnEventKK 
;KK 
}LL 	
publicOO 
asyncOO 
TaskOO 
<OO 
RelativeModelOO '
>OO' (
AddRelativeUserOO) 8
(OO8 9
UsersToLinkModelOO9 I
usersToLinkOOJ U
)OOU V
{PP 	
RelativeQQ 
senderRelativeQQ #
=QQ$ %
newQQ& )
RelativeQQ* 2
(QQ2 3
)QQ3 4
{RR 
PrimaryUserIdSS 
=SS 
usersToLinkSS  +
.SS+ ,
PrimaryUserIdSS, 9
,SS9 :
RelativeUserIdTT 
=TT  
usersToLinkTT! ,
.TT, -
LinkedUserIdTT- 9
,TT9 :)
RelativePersonInPrimaryTreeIdUU -
=UU. /
usersToLinkUU0 ;
.UU; <'
LinkedPersonInPrimaryTreeIdUU< W
,UUW X
LastSyncCheckVV 
=VV 
DateTimeVV  (
.VV( )
UtcNowVV) /
}WW 
;WW 
RelativeXX !
createdSenderRelativeXX *
=XX+ ,
awaitXX- 2

unitOfWorkXX3 =
.XX= >
	RelativesXX> G
.XXG H
CreateXXH N
(XXN O
senderRelativeXXO ]
)XX] ^
;XX^ _
RelativeModelYY 
returnEventYY %
=YY& '
_mapperYY( /
.YY/ 0
MapYY0 3
<YY3 4
RelativeModelYY4 A
>YYA B
(YYB C!
createdSenderRelativeYYC X
)YYX Y
;YYY Z
if[[ 
([[ 
usersToLink[[ 
.[[ )
PrimaryPersonInRelativeTreeId[[ 9
!=[[: <
$num[[= >
)[[> ?
{\\ 
Relative]] 
receiverRelative]] )
=]]* +
new]], /
Relative]]0 8
(]]8 9
)]]9 :
{^^ 
PrimaryUserId__ !
=__" #
usersToLink__$ /
.__/ 0
LinkedUserId__0 <
,__< =
RelativeUserId`` "
=``# $
usersToLink``% 0
.``0 1
PrimaryUserId``1 >
,``> ?)
RelativePersonInPrimaryTreeIdaa 1
=aa2 3
usersToLinkaa4 ?
.aa? @)
PrimaryPersonInRelativeTreeIdaa@ ]
,aa] ^
LastSyncCheckbb !
=bb" #
DateTimebb$ ,
.bb, -
UtcNowbb- 3
}cc 
;cc 
Relativedd #
createdReceiverRelativedd 0
=dd1 2
awaitdd3 8

unitOfWorkdd9 C
.ddC D
	RelativesddD M
.ddM N
CreateddN T
(ddT U
receiverRelativeddU e
)dde f
;ddf g
returnEventee 
=ee 
_mapperee %
.ee% &
Mapee& )
<ee) *
RelativeModelee* 7
>ee7 8
(ee8 9#
createdReceiverRelativeee9 P
)eeP Q
;eeQ R
}ff 
returnhh 
returnEventhh 
;hh 
}ii 	
publickk 
asynckk 
Taskkk 
<kk 
RelativeModelkk '
>kk' (
DeleteRelativekk) 7
(kk7 8
intkk8 ;

relativeIdkk< F
)kkF G
{ll 	
Relativemm 
relativeEntitymm #
=mm$ %
awaitmm& +

unitOfWorkmm, 6
.mm6 7
	Relativesmm7 @
.mm@ A
DeletemmA G
(mmG H

relativeIdmmH R
)mmR S
;mmS T
RelativeModelnn 
returnEventnn %
=nn& '
_mappernn( /
.nn/ 0
Mapnn0 3
<nn3 4
RelativeModelnn4 A
>nnA B
(nnB C
relativeEntitynnC Q
)nnQ R
;nnR S
returnpp 
returnEventpp 
;pp 
}qq 	
publicss 
asyncss 
Taskss 
<ss 
Listss 
<ss 
UserPositionModelss 0
>ss0 1
>ss1 2 
GetRelativesPositionss3 G
(ssG H
GuidssH L
userIdssM S
)ssS T
{tt 	
Listuu 
<uu 
Useruu 
>uu 
relativeUsersuu $
=uu% &

unitOfWorkuu' 1
.uu1 2
	Relativesuu2 ;
.uu; <
Filteruu< B
(uuB C
relativeuuC K
=>uuL N
relativeuuO W
.uuW X
PrimaryUserIduuX e
==uuf h
userIduui o
)uuo p
.vv4 5
Includevv5 <
(vv< =
rvv= >
=>vv? A
rvvB C
.vvC D
RelativeUservvD P
)vvP Q
.ww8 9
ThenIncludeww9 D
(wwD E
ruwwE G
=>wwH J
ruwwK M
.wwM N
PositionwwN V
)wwV W
.xx4 5
Includexx5 <
(xx< =
rxx= >
=>xx? A
rxxB C
.xxC D
RelativeUserxxD P
)xxP Q
.yy8 9
ThenIncludeyy9 D
(yyD E
ruyyE G
=>yyH J
ruyyK M
.yyM N
PersonyyN T
)yyT U
.zz4 5
Wherezz5 :
(zz: ;
relativezz; C
=>zzD F
relativezzG O
.zzO P
RelativeUserzzP \
.zz\ ]
ShareLocationzz] j
&&zzk m
relativezzn v
.zzv w
RelativeUser	zzw �
.
zz� �
Position
zz� �
.
zz� �
	UpdatedOn
zz� �
!=
zz� �
null
zz� �
)
zz� �
.{{4 5
Select{{5 ;
({{; <
relative{{< D
=>{{E G
relative{{H P
.{{P Q
RelativeUser{{Q ]
){{] ^
.{{^ _
ToList{{_ e
({{e f
){{f g
;{{g h
List}} 
<}} 
UserPositionModel}} "
>}}" #
returnEvent}}$ /
=}}0 1
new}}2 5
List}}6 :
<}}: ;
UserPositionModel}}; L
>}}L M
(}}M N
)}}N O
;}}O P
foreach~~ 
(~~ 
var~~ 
relative~~ !
in~~" $
relativeUsers~~% 2
)~~2 3
{ 
UserPositionModel
�� !"
userPositionToReturn
��" 6
=
��7 8
_mapper
��9 @
.
��@ A
Map
��A D
<
��D E
UserPositionModel
��E V
>
��V W
(
��W X
relative
��X `
)
��` a
;
��a b"
userPositionToReturn
�� $
.
��$ %
	ImageFile
��% .
=
��/ 0
await
��1 6$
_fileManagementService
��7 M
.
��M N
GetFile
��N U
(
��U V
relative
��V ^
.
��^ _
Person
��_ e
.
��e f
Image
��f k
)
��k l
;
��l m
returnEvent
�� 
.
�� 
Add
�� 
(
��  "
userPositionToReturn
��  4
)
��4 5
;
��5 6
}
�� 
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
}
�� 
}�� �
iE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\ReligionService.cs
	namespace

 	
GenealogyTree


 
.

 
Business

  
.

  !
Services

! )
{ 
public 

class 
ReligionService  
:! "
BaseService# .
,. /
IReligionService0 @
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
public 
ReligionService 
( 
IUnitOfWork *
repositoryWrapper+ <
,< =
IMapper> E
mapperF L
)L M
:N O
baseP T
(T U
repositoryWrapperU f
)f g
{ 	
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
List 
< 
GenericNameModel /
>/ 0
>0 1 
GetAllReligionsAsync2 F
(F G
)G H
{ 	
List 
< 
Religion 
> 
	religions $
=% &
await' ,
Task- 1
.1 2
Run2 5
(5 6
(6 7
)7 8
=>9 ;

unitOfWork< F
.F G
ReligionG O
.O P
GetAllP V
(V W
)W X
.X Y
OrderByY `
(` a
xa b
=>c e
xf g
.g h
Nameh l
)l m
.m n
ToListn t
(t u
)u v
)v w
;w x
List 
< 
GenericNameModel !
>! "
returnEvent# .
=/ 0
_mapper1 8
.8 9
Map9 <
<< =
List= A
<A B
GenericNameModelB R
>R S
>S T
(T U
	religionsU ^
)^ _
;_ `
return 
returnEvent 
; 
} 	
public 
async 
Task 
< 
GenericNameModel *
>* +
AddReligionAsync, <
(< =
string= C
religionNameD P
)P Q
{ 	
if 
( 
religionName 
== 
null  $
)$ %
{ 
return   
null   
;   
}!! 
Religion## 
religion## 
=## 
new##  #
Religion##$ ,
(##, -
)##- .
{$$ 
Name%% 
=%% 
religionName%% #
}&& 
;&& 
Religion(( 
religionEntity(( #
=(($ %
await((& +

unitOfWork((, 6
.((6 7
Religion((7 ?
.((? @
Create((@ F
(((F G
religion((G O
)((O P
;((P Q
GenericNameModel)) 
returnEvent)) (
=))) *
_mapper))+ 2
.))2 3
Map))3 6
<))6 7
GenericNameModel))7 G
>))G H
())H I
religionEntity))I W
)))W X
;))X Y
return++ 
returnEvent++ 
;++ 
},, 	
}-- 
}.. ��
hE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\RequestService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Services! )
{ 
public 

class 
RequestService 
:  !
BaseService" -
,- .
IRequestService/ >
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly "
IFileManagementService /"
_fileManagementService0 F
;F G
private 
readonly 
IRelativeService )
_relativeService* :
;: ;
public 
RequestService 
( 
IUnitOfWork )

unitOfWork* 4
,4 5
IMapper6 =
mapper> D
,D E"
IFileManagementServiceF \!
fileManagementService] r
,r s
IRelativeService	t �
relativeService
� �
)
� �
:
� �
base
� �
(
� �

unitOfWork
� �
)
� �
{ 	
_mapper 
= 
mapper 
; "
_fileManagementService "
=# $!
fileManagementService% :
;: ;
_relativeService 
= 
relativeService .
;. /
} 	
public 
async 
Task 
< 
List 
< 
RequestDetailsModel 2
>2 3
>3 4
GetRequestsSent5 D
(D E
GuidE I
senderIdJ R
)R S
{ 	
List 
< 
Request 
> 
requests "
=# $

unitOfWork% /
./ 0
Requests0 8
.8 9
Filter9 ?
(? @
x@ A
=>B D
xE F
.F G
SenderIdG O
==P R
senderIdS [
&&\ ^
!_ `
x` a
.a b
ReceiverRespondedb s
)s t
.  0 1
Include  1 8
(  8 9
x  9 :
=>  ; =
x  > ?
.  ? @
Receiver  @ H
)  H I
.  I J
ThenInclude  J U
(  U V
r  V W
=>  X Z
r  [ \
.  \ ]
Person  ] c
)  c d
.  d e
ThenInclude  e p
(  p q
p  q r
=>  s u
p  v w
.  w x
Image  x }
)  } ~
.!!0 1
Include!!1 8
(!!8 9
x!!9 :
=>!!; =
x!!> ?
.!!? @
Sender!!@ F
)!!F G
.!!G H
ThenInclude!!H S
(!!S T
r!!T U
=>!!V X
r!!Y Z
.!!Z [
Person!![ a
)!!a b
.!!b c
ThenInclude!!c n
(!!n o
p!!o p
=>!!q s
p!!t u
.!!u v
Image!!v {
)!!{ |
.""0 1
Include""1 8
(""8 9
x""9 :
=>""; =
x""> ?
.""? @)
ReceiverReferenceInSenderTree""@ ]
)""] ^
.""^ _
ThenInclude""_ j
(""j k
p""k l
=>""m o
p""p q
.""q r
Image""r w
)""w x
.##0 1
ToList##1 7
(##7 8
)##8 9
;##9 :
return%% 
await%% 
MapRequestDetails%% *
(%%* +
requests%%+ 3
)%%3 4
;%%4 5
}&& 	
private(( 
async(( 
Task(( 
<(( 
List(( 
<((  
RequestDetailsModel((  3
>((3 4
>((4 5
MapRequestDetails((6 G
(((G H
List((H L
<((L M
Request((M T
>((T U
requests((V ^
)((^ _
{)) 	
List** 
<** 
RequestDetailsModel** $
>**$ %
returnEvent**& 1
=**2 3
new**4 7
List**8 <
<**< =
RequestDetailsModel**= P
>**P Q
(**Q R
)**R S
;**S T
foreach,, 
(,, 
var,, 
request,,  
in,,! #
requests,,$ ,
),,, -
{-- 
RequestDetailsModel.. #
returnRequest..$ 1
=..2 3
new..4 7
RequestDetailsModel..8 K
(..K L
)..L M
{// 
Id00 
=00 
request00  
.00  !
Id00! #
,00# $
ReceiverUser11  
=11! "
_mapper11# *
.11* +
Map11+ .
<11. /
GenericPersonModel11/ A
>11A B
(11B C
request11C J
.11J K
Receiver11K S
)11S T
,11T U

SenderUser22 
=22  
_mapper22! (
.22( )
Map22) ,
<22, -
GenericPersonModel22- ?
>22? @
(22@ A
request22A H
.22H I
Sender22I O
)22O P
,22P Q+
ReceiverReferenceInSenderTreeId33 3
=334 5
request336 =
.33= >+
ReceiverReferenceInSenderTreeId33> ]
}44 
;44 
returnRequest66 
.66 
ReceiverUser66 *
.66* +
	ImageFile66+ 4
=665 6
await667 <"
_fileManagementService66= S
.66S T
GetFile66T [
(66[ \
request66\ c
.66c d
Receiver66d l
.66l m
Person66m s
.66s t
Image66t y
)66y z
;66z {
returnRequest77 
.77 

SenderUser77 (
.77( )
	ImageFile77) 2
=773 4
await775 :"
_fileManagementService77; Q
.77Q R
GetFile77R Y
(77Y Z
request77Z a
.77a b
Sender77b h
.77h i
Person77i o
.77o p
Image77p u
)77u v
;77v w
returnEvent88 
.88 
Add88 
(88  
returnRequest88  -
)88- .
;88. /
}99 
return;; 
returnEvent;; 
;;; 
}<< 	
private>> 
async>> 
Task>> 
<>> 
List>> 
<>>   
RequestResponseModel>>  4
>>>4 5
>>>5 6
MapRequestResponse>>7 I
(>>I J
List>>J N
<>>N O
Request>>O V
>>>V W
requests>>X `
)>>` a
{?? 	
List@@ 
<@@  
RequestResponseModel@@ %
>@@% &
returnEvent@@' 2
=@@3 4
new@@5 8
List@@9 =
<@@= > 
RequestResponseModel@@> R
>@@R S
(@@S T
)@@T U
;@@U V
foreachBB 
(BB 
varBB 
requestBB  
inBB! #
requestsBB$ ,
)BB, -
{CC  
RequestResponseModelDD $
returnRequestDD% 2
=DD3 4
newDD5 8 
RequestResponseModelDD9 M
(DDM N
)DDN O
{EE 
IdFF 
=FF 
requestFF  
.FF  !
IdFF! #
,FF# $
ReceiverUserGG  
=GG! "
_mapperGG# *
.GG* +
MapGG+ .
<GG. /
GenericPersonModelGG/ A
>GGA B
(GGB C
requestGGC J
.GGJ K
ReceiverGGK S
)GGS T
,GGT U
ResponseHH 
=HH 
requestHH &
.HH& '
ResponseHH' /
}II 
;II 
returnRequestKK 
.KK 
ReceiverUserKK *
.KK* +
	ImageFileKK+ 4
=KK5 6
awaitKK7 <"
_fileManagementServiceKK= S
.KKS T
GetFileKKT [
(KK[ \
requestKK\ c
.KKc d
ReceiverKKd l
.KKl m
PersonKKm s
.KKs t
ImageKKt y
)KKy z
;KKz {
returnEventLL 
.LL 
AddLL 
(LL  
returnRequestLL  -
)LL- .
;LL. /
}MM 
returnOO 
returnEventOO 
;OO 
}PP 	
publicRR 
asyncRR 
TaskRR 
<RR 
ListRR 
<RR 
RequestDetailsModelRR 2
>RR2 3
>RR3 4
GetRequestsReceivedRR5 H
(RRH I
GuidRRI M

receiverIdRRN X
)RRX Y
{SS 	
ListTT 
<TT 
RequestTT 
>TT 
requestsTT "
=TT# $

unitOfWorkTT% /
.TT/ 0
RequestsTT0 8
.TT8 9
FilterTT9 ?
(TT? @
xTT@ A
=>TTB D
xTTE F
.TTF G

ReceiverIdTTG Q
==TTR T

receiverIdTTU _
&&TT` b
!TTc d
xTTd e
.TTe f
ReceiverRespondedTTf w
)TTw x
.UU0 1
IncludeUU1 8
(UU8 9
xUU9 :
=>UU; =
xUU> ?
.UU? @
ReceiverUU@ H
)UUH I
.UUI J
ThenIncludeUUJ U
(UUU V
rUUV W
=>UUX Z
rUU[ \
.UU\ ]
PersonUU] c
)UUc d
.UUd e
ThenIncludeUUe p
(UUp q
pUUq r
=>UUs u
pUUv w
.UUw x
ImageUUx }
)UU} ~
.VV0 1
IncludeVV1 8
(VV8 9
xVV9 :
=>VV; =
xVV> ?
.VV? @
SenderVV@ F
)VVF G
.VVG H
ThenIncludeVVH S
(VVS T
rVVT U
=>VVV X
rVVY Z
.VVZ [
PersonVV[ a
)VVa b
.VVb c
ThenIncludeVVc n
(VVn o
pVVo p
=>VVq s
pVVt u
.VVu v
ImageVVv {
)VV{ |
.WW0 1
IncludeWW1 8
(WW8 9
xWW9 :
=>WW; =
xWW> ?
.WW? @)
ReceiverReferenceInSenderTreeWW@ ]
)WW] ^
.WW^ _
ThenIncludeWW_ j
(WWj k
pWWk l
=>WWm o
pWWp q
.WWq r
ImageWWr w
)WWw x
.WWx y
ToListWWy 
(	WW �
)
WW� �
;
WW� �
returnYY 
awaitYY 
MapRequestDetailsYY *
(YY* +
requestsYY+ 3
)YY3 4
;YY4 5
}ZZ 	
public\\ 
async\\ 
Task\\ 
<\\ 
List\\ 
<\\  
RequestResponseModel\\ 3
>\\3 4
>\\4 5 
GetRequestsResponded\\6 J
(\\J K
Guid\\K O
senderId\\P X
)\\X Y
{]] 	
List^^ 
<^^ 
Request^^ 
>^^ 
requests^^ "
=^^# $

unitOfWork^^% /
.^^/ 0
Requests^^0 8
.^^8 9
Filter^^9 ?
(^^? @
x^^@ A
=>^^B D
x^^E F
.^^F G
SenderId^^G O
==^^P R
senderId^^S [
&&^^\ ^
x^^_ `
.^^` a
ReceiverResponded^^a r
)^^r s
.__0 1
Include__1 8
(__8 9
x__9 :
=>__; =
x__> ?
.__? @
Receiver__@ H
)__H I
.__I J
ThenInclude__J U
(__U V
r__V W
=>__X Z
r__[ \
.__\ ]
Person__] c
)__c d
.__d e
ThenInclude__e p
(__p q
p__q r
=>__s u
p__v w
.__w x
Image__x }
)__} ~
.__~ 
ToList	__ �
(
__� �
)
__� �
;
__� �
returnaa 
awaitaa 
MapRequestResponseaa +
(aa+ ,
requestsaa, 4
)aa4 5
;aa5 6
}bb 	
publicdd 
asyncdd 
Taskdd 
<dd $
RequestCreateUpdateModeldd 2
>dd2 3

AddRequestdd4 >
(dd> ?$
RequestCreateUpdateModeldd? W
requestddX _
)dd_ `
{ee 	
ifff 
(ff 
requestff 
==ff 
nullff 
)ff  
{gg 
returnhh 
nullhh 
;hh 
}ii 
Requestkk 
requestEntitykk !
=kk" #
_mapperkk$ +
.kk+ ,
Mapkk, /
<kk/ 0
Requestkk0 7
>kk7 8
(kk8 9
requestkk9 @
)kk@ A
;kkA B
requestEntityll 
.ll )
ReceiverReferenceInSenderTreell 7
=ll8 9
nullll: >
;ll> ?
Requestmm 
createdRequestmm "
=mm# $
awaitmm% *

unitOfWorkmm+ 5
.mm5 6
Requestsmm6 >
.mm> ?
Createmm? E
(mmE F
requestEntitymmF S
)mmS T
;mmT U$
RequestCreateUpdateModelnn $
returnEventnn% 0
=nn1 2
_mappernn3 :
.nn: ;
Mapnn; >
<nn> ?$
RequestCreateUpdateModelnn? W
>nnW X
(nnX Y
createdRequestnnY g
)nng h
;nnh i
returnpp 
returnEventpp 
;pp 
}qq 	
publicss 
asyncss 
Taskss 
<ss 
UsersToLinkModelss *
>ss* +
RespondToRequestss, <
(ss< =
intss= @
	requestIdssA J
,ssJ K 
RequestResponseModelssL `
respondedRequestssa q
)ssq r
{tt 	
Requestuu 
requestuu 
=uu 
awaituu #

unitOfWorkuu$ .
.uu. /
Requestsuu/ 7
.uu7 8
FindByIduu8 @
(uu@ A
	requestIduuA J
)uuJ K
;uuK L
ifww 
(ww 
requestww 
==ww 
nullww 
)ww  
{xx 
returnyy 
nullyy 
;yy 
}zz 
request|| 
.|| 
ReceiverResponded|| %
=||& '
true||( ,
;||, -
request}} 
.}} 
Response}} 
=}} 
respondedRequest}} /
.}}/ 0
Response}}0 8
;}}8 9
Relative 
alreadyRelated #
=$ %

unitOfWork& 0
.0 1
	Relatives1 :
.: ;
Filter; A
(A B
xB C
=>D F
xG H
.H I
PrimaryUserIdI V
==W Y
requestZ a
.a b

ReceiverIdb l
&&m o
xp q
.q r
RelativeUserId	r �
==
� �
request
� �
.
� �
SenderId
� �
)
� �
.
� �
FirstOrDefault
� �
(
� �
)
� �
;
� �
if
�� 
(
�� 
respondedRequest
��  
.
��  !-
SenderReferenceInReceiverTreeId
��! @
!=
��A C
$num
��D E
&&
��F H
alreadyRelated
��I W
!=
��X Z
default
��[ b
(
��b c
Relative
��c k
)
��k l
)
��l m
{
�� 
request
�� 
.
�� -
ReceiverReferenceInSenderTreeId
�� 7
=
��8 9
respondedRequest
��: J
.
��J K-
SenderReferenceInReceiverTreeId
��K j
;
��j k
}
�� 
Request
�� 
updatedRequest
�� "
=
��# $
await
��% *

unitOfWork
��+ 5
.
��5 6
Requests
��6 >
.
��> ?
Update
��? E
(
��E F
request
��F M
)
��M N
;
��N O
UsersToLinkModel
�� 
firstRelative
�� *
=
��+ ,
new
��- 0
UsersToLinkModel
��1 A
(
��A B
)
��B C
{
�� 
PrimaryUserId
�� 
=
�� 
updatedRequest
��  .
.
��. /
SenderId
��/ 7
,
��7 8
LinkedUserId
�� 
=
�� 
updatedRequest
�� -
.
��- .

ReceiverId
��. 8
,
��8 9+
PrimaryPersonInRelativeTreeId
�� -
=
��. /
respondedRequest
��0 @
.
��@ A-
SenderReferenceInReceiverTreeId
��A `
,
��` a)
LinkedPersonInPrimaryTreeId
�� +
=
��, -
updatedRequest
��. <
.
��< =-
ReceiverReferenceInSenderTreeId
��= \
}
�� 
;
�� 
if
�� 
(
�� 
respondedRequest
��  
.
��  !
Response
��! )
)
��) *
{
�� 
await
�� 
_relativeService
�� &
.
��& '
AddRelativeUser
��' 6
(
��6 7
firstRelative
��7 D
)
��D E
;
��E F
}
�� 
return
�� 
firstRelative
��  
;
��  !
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� !
RequestDetailsModel
�� -
>
��- .
DeleteRequest
��/ <
(
��< =
int
��= @
	requestId
��A J
)
��J K
{
�� 	
Request
�� 
request
�� 
=
�� 
await
�� #

unitOfWork
��$ .
.
��. /
Requests
��/ 7
.
��7 8
Delete
��8 >
(
��> ?
	requestId
��? H
)
��H I
;
��I J!
RequestDetailsModel
�� 
returnEvent
��  +
=
��, -
_mapper
��. 5
.
��5 6
Map
��6 9
<
��9 :!
RequestDetailsModel
��: M
>
��M N
(
��N O
request
��O V
)
��V W
;
��W X
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
eE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Services\UserService.cs
	namespace 	
GenealogyTree
 
. 
Business  
.  !
Services! )
{ 
public 

class 
UserService 
: 
BaseService *
,* +
IUserService, 8
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly "
IFileManagementService /"
_fileManagementService0 F
;F G
private 
readonly 
IRequestService (
_requestService) 8
;8 9
private 
readonly 
IPersonService '
_personService( 6
;6 7
public 
UserService 
( 
IUnitOfWork &

unitOfWork' 1
,1 2
IMapper3 :
mapper; A
,A B"
IFileManagementServiceC Y!
fileManagementServiceZ o
,o p
IRequestService	q �
requestService
� �
,
� �
IPersonService
� �
personService
� �
)
� �
:
� �
base
� �
(
� �

unitOfWork
� �
)
� �
{ 	
_mapper 
= 
mapper 
; "
_fileManagementService "
=# $!
fileManagementService% :
;: ;
_requestService 
= 
requestService ,
;, -
_personService 
= 
personService *
;* +
}   	
public"" 
async"" 
Task"" 
<"" 

UsersFound"" $
>""$ %
	FindUsers""& /
(""/ 0 
InfiniteScrollFilter""0 D
filter""E K
)""K L
{## 	
if$$ 
($$ 
filter$$ 
.$$ 
Name$$ 
==$$ 
null$$ #
)$$# $
{%% 
filter&& 
.&& 
Name&& 
=&& 
$str&&  
;&&  !
}'' 
List)) 
<)) 
string)) 
>)) 
names)) 
=))  
filter))! '
.))' (
Name))( ,
.)), -
Split))- 2
())2 3
$str))3 6
)))6 7
.))7 8
ToList))8 >
())> ?
)))? @
;))@ A
IEnumerable** 
<** 
User** 
>** 
filteredUsers** +
=**, -

unitOfWork**. 8
.**8 9
User**9 =
.**= >
GetAll**> D
(**D E
)**E F
.++ 
Include++ 
(++ 
user++ 
=>++  
user++! %
.++% &
Person++& ,
)++, -
.,, 
ThenInclude,, 
(,, 
person,, #
=>,,$ &
person,,' -
.,,- .
Image,,. 3
),,3 4
.,,4 5
ToList,,5 ;
(,,; <
),,< =
;,,= >
filteredUsers-- 
=-- 
filteredUsers-- )
.--) *
Where--* /
(--/ 0
(--0 1
user--1 5
)--5 6
=>--7 9
names--: ?
.--? @
All--@ C
(--C D
name--D H
=>--I K
user--L P
.--P Q
Person--Q W
.--W X
	FirstName--X a
.--a b
Contains--b j
(--j k
name--k o
)--o p
||--q s
user--t x
.--x y
Person--y 
.	-- �
LastName
--� �
.
--� �
Contains
--� �
(
--� �
name
--� �
)
--� �
)
--� �
)
--� �
.
--� �
ToList
--� �
(
--� �
)
--� �
;
--� �

UsersFound00 

usersFound00 !
=00" #
new00$ '

UsersFound00( 2
(002 3
)003 4
;004 5
List11 
<11 
User11 
>11 

foundUsers11 !
=11" #
filteredUsers11$ 1
.111 2
Skip112 6
(116 7
filter117 =
.11= >
Skip11> B
)11B C
.11C D
Take11D H
(11H I
filter11I O
.11O P
Take11P T
)11T U
.11U V
ToList11V \
(11\ ]
)11] ^
;11^ _

usersFound22 
.22 

totalUsers22 !
=22" #
filteredUsers22$ 1
.221 2
Count222 7
(227 8
)228 9
;229 :

usersFound33 
.33 
skippedUsers33 #
=33$ %
filter33& ,
.33, -
Skip33- 1
;331 2

usersFound44 
.44 

takenUsers44 !
=44" #
filter44$ *
.44* +
Take44+ /
;44/ 0

usersFound55 
.55 
areLast55 
=55  

usersFound55! +
.55+ ,

totalUsers55, 6
<=557 9
filter55: @
.55@ A
Skip55A E
+55F G
filter55H N
.55N O
Take55O S
;55S T
foreach77 
(77 
var77 
user77 
in77  

foundUsers77! +
)77+ ,
{88 
GenericPersonModel99 "
personToReturn99# 1
=992 3
_mapper994 ;
.99; <
Map99< ?
<99? @
GenericPersonModel99@ R
>99R S
(99S T
user99T X
)99X Y
;99Y Z
personToReturn:: 
.:: 
	ImageFile:: (
=::) *
await::+ 0"
_fileManagementService::1 G
.::G H
GetFile::H O
(::O P
user::P T
.::T U
Person::U [
.::[ \
Image::\ a
)::a b
;::b c

usersFound;; 
.;; 
users;;  
.;;  !
Add;;! $
(;;$ %
personToReturn;;% 3
);;3 4
;;;4 5
}<< 
return>> 

usersFound>> 
;>> 
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
UserDetailsModelAA *
>AA* +
GetUserByIdAsyncAA, <
(AA< =
GuidAA= A
userIdAAB H
)AAH I
{BB 	
UserCC 
userCC 
=CC 

unitOfWorkCC "
.CC" #
UserCC# '
.CC' (
FilterCC( .
(CC. /
userCC/ 3
=>CC4 6
userCC7 ;
.CC; <
IdCC< >
==CC? A
userIdCCB H
)CCH I
.DD 
IncludeDD $
(DD$ %
uDD% &
=>DD' )
uDD* +
.DD+ ,
PersonDD, 2
)DD2 3
.EE 
IncludeEE $
(EE$ %
uEE% &
=>EE' )
uEE* +
.EE+ ,
PersonEE, 2
.EE2 3
NationalityEE3 >
)EE> ?
.FF 
IncludeFF $
(FF$ %
uFF% &
=>FF' )
uFF* +
.FF+ ,
PersonFF, 2
.FF2 3
ReligionFF3 ;
)FF; <
.GG 
IncludeGG $
(GG$ %
uGG% &
=>GG' )
uGG* +
.GG+ ,
PersonGG, 2
.GG2 3
LivingPlaceGG3 >
)GG> ?
.HH 
IncludeHH $
(HH$ %
uHH% &
=>HH' )
uHH* +
.HH+ ,
PersonHH, 2
.HH2 3

BirthPlaceHH3 =
)HH= >
.II 
IncludeII $
(II$ %
uII% &
=>II' )
uII* +
.II+ ,
PersonII, 2
.II2 3
ImageII3 8
)II8 9
.JJ 
IncludeJJ $
(JJ$ %
uJJ% &
=>JJ' )
uJJ* +
.JJ+ ,

EducationsJJ, 6
)JJ6 7
.KK 
ThenIncludeKK (
(KK( )
eKK) *
=>KK+ -
eKK. /
.KK/ 0
EducationLevelKK0 >
)KK> ?
.LL 
IncludeLL $
(LL$ %
uLL% &
=>LL' )
uLL* +
.LL+ ,
OccupationsLL, 7
)LL7 8
.MM 
FirstOrDefaultMM +
(MM+ ,
)MM, -
;MM- .
UserDetailsModelOO 
returnEventOO (
=OO) *
_mapperOO+ 2
.OO2 3
MapOO3 6
<OO6 7
UserDetailsModelOO7 G
>OOG H
(OOH I
userOOI M
)OOM N
;OON O
ifQQ 
(QQ 
userQQ 
!=QQ 
nullQQ 
&&QQ 
!QQ  !
userQQ! %
.QQ% &
SharePersonalInfoQQ& 7
)QQ7 8
{RR 
returnEventSS 
.SS 
EmailSS !
=SS" #
nullSS$ (
;SS( )
returnEventTT 
.TT 
PhoneNumberTT '
=TT( )
nullTT* .
;TT. /
returnEventUU 
.UU 
	ImageFileUU %
=UU& '
awaitUU( -"
_fileManagementServiceUU. D
.UUD E
GetFileUUE L
(UUL M
userUUM Q
.UUQ R
PersonUUR X
.UUX Y
ImageUUY ^
)UU^ _
;UU_ `
}VV 
returnXX 
returnEventXX 
;XX 
}YY 	
public[[ 
async[[ 
Task[[ 
<[[ 
UserDetailsModel[[ *
>[[* +
GetUser[[, 3
([[3 4
string[[4 :
username[[; C
)[[C D
{\\ 	
User]] 
user]] 
=]] 

unitOfWork]] "
.]]" #
User]]# '
.]]' (
Filter]]( .
(]]. /
x]]/ 0
=>]]1 3
x]]4 5
.]]5 6
Username]]6 >
==]]? A
username]]B J
)]]J K
.^^ 
Include^^ $
(^^$ %
u^^% &
=>^^' )
u^^* +
.^^+ ,
Person^^, 2
)^^2 3
.__ 
Include__ $
(__$ %
u__% &
=>__' )
u__* +
.__+ ,
Person__, 2
.__2 3
Nationality__3 >
)__> ?
.`` 
Include`` $
(``$ %
u``% &
=>``' )
u``* +
.``+ ,
Person``, 2
.``2 3
Religion``3 ;
)``; <
.aa 
Includeaa $
(aa$ %
uaa% &
=>aa' )
uaa* +
.aa+ ,
Personaa, 2
.aa2 3
LivingPlaceaa3 >
)aa> ?
.bb 
Includebb $
(bb$ %
ubb% &
=>bb' )
ubb* +
.bb+ ,
Personbb, 2
.bb2 3

BirthPlacebb3 =
)bb= >
.cc 
Includecc $
(cc$ %
ucc% &
=>cc' )
ucc* +
.cc+ ,
Personcc, 2
.cc2 3
Imagecc3 8
)cc8 9
.dd 
Includedd $
(dd$ %
udd% &
=>dd' )
udd* +
.dd+ ,

Educationsdd, 6
)dd6 7
.ee 
ThenIncludeee (
(ee( )
eee) *
=>ee+ -
eee. /
.ee/ 0
EducationLevelee0 >
)ee> ?
.ff 
Includeff $
(ff$ %
uff% &
=>ff' )
uff* +
.ff+ ,
Occupationsff, 7
)ff7 8
.ff8 9
FirstOrDefaultff9 G
(ffG H
)ffH I
;ffI J
UserDetailsModelhh 

userEntityhh '
=hh( )
_mapperhh* 1
.hh1 2
Maphh2 5
<hh5 6
UserDetailsModelhh6 F
>hhF G
(hhG H
userhhH L
)hhL M
;hhM N
ifii 
(ii 
userii 
!=ii 
nullii 
)ii 
{jj 

userEntitykk 
.kk 
	ImageFilekk $
=kk% &
awaitkk' ,"
_fileManagementServicekk- C
.kkC D
GetFilekkD K
(kkK L
userkkL P
.kkP Q
PersonkkQ W
.kkW X
ImagekkX ]
)kk] ^
;kk^ _
}ll 
returnnn 

userEntitynn 
;nn 
}oo 	
publicpp 
asyncpp 
Taskpp 
<pp 
GenericPersonModelpp ,
>pp, -
GetTreeRootpp. 9
(pp9 :
Guidpp: >
treeIdpp? E
)ppE F
{qq 	
Userrr 
userrr 
=rr 
awaitrr 
Taskrr "
.rr" #
Runrr# &
(rr& '
(rr' (
)rr( )
=>rr* ,

unitOfWorkrr- 7
.rr7 8
Userrr8 <
.rr< =
Filterrr= C
(rrC D
xrrD E
=>rrF H
xrrI J
.rrJ K
PersonrrK Q
.rrQ R
TreeIdrrR X
==rrY [
treeIdrr\ b
)rrb c
.ss 
Includess  
(ss  !
uss! "
=>ss# %
uss& '
.ss' (
Personss( .
)ss. /
.tt 
FirstOrDefaulttt '
(tt' (
)tt( )
)tt) *
;tt* +
GenericPersonModelvv 

userEntityvv )
=vv* +
_mappervv, 3
.vv3 4
Mapvv4 7
<vv7 8
GenericPersonModelvv8 J
>vvJ K
(vvK L
uservvL P
)vvP Q
;vvQ R
returnxx 

userEntityxx 
;xx 
}yy 	
public{{ 
async{{ 
Task{{ 
<{{ 
int{{ 
>{{ !
GetNotificationsCount{{ 4
({{4 5
Guid{{5 9
userId{{: @
){{@ A
{|| 	
User}} 
user}} 
=}} 
await}} 
Task}} "
.}}" #
Run}}# &
(}}& '
(}}' (
)}}( )
=>}}* ,

unitOfWork}}- 7
.}}7 8
User}}8 <
.}}< =
Filter}}= C
(}}C D
u}}D E
=>}}F H
u}}I J
.}}J K
Id}}K M
==}}N P
userId}}Q W
)}}W X
.~~( )
Include~~) 0
(~~0 1
u~~1 2
=>~~3 5
u~~6 7
.~~7 8
Person~~8 >
)~~> ?
.( )
Include) 0
(0 1
u1 2
=>3 5
u6 7
.7 8
ReceivedRequests8 H
)H I
.
��( )
Include
��) 0
(
��0 1
u
��1 2
=>
��3 5
u
��6 7
.
��7 8
SentRequests
��8 D
)
��D E
.
��( )
Include
��) 0
(
��0 1
u
��1 2
=>
��3 5
u
��6 7
.
��7 8
UserRelatives
��8 E
)
��E F
.
��( )
FirstOrDefault
��) 7
(
��7 8
)
��8 9
)
��9 :
;
��: ;
if
�� 
(
�� 
user
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
$num
�� 
;
�� 
}
�� 
int
��  
totalNotifications
�� "
=
��# $
$num
��% &
;
��& ' 
totalNotifications
�� 
+=
�� !
user
��" &
.
��& '
ReceivedRequests
��' 7
.
��7 8
Count
��8 =
(
��= >
x
��> ?
=>
��@ B
!
��C D
x
��D E
.
��E F
ReceiverResponded
��F W
)
��W X
;
��X Y 
totalNotifications
�� 
+=
�� !
user
��" &
.
��& '
SentRequests
��' 3
.
��3 4
Count
��4 9
(
��9 :
x
��: ;
=>
��< >
x
��? @
.
��@ A
ReceiverResponded
��A R
)
��R S
;
��S T
if
�� 
(
�� 
user
�� 
.
�� 
NotifyBirthdays
�� $
)
��$ %
{
��  
totalNotifications
�� "
+=
��# %

unitOfWork
��& 0
.
��0 1
Person
��1 7
.
��7 8
Filter
��8 >
(
��> ?
p
��? @
=>
��A C
p
��D E
.
��E F
TreeId
��F L
==
��M O
user
��P T
.
��T U
Person
��U [
.
��[ \
TreeId
��\ b
&&
��c e
p
��f g
.
��g h
	BirthDate
��h q
.
��q r
HasValue
��r z
&&
��{ }
p
��~ 
.�� �
	BirthDate��� �
.��� �
Value��� �
.��� �
	DayOfYear��� �
==��� �
DateTime��� �
.��� �
Now��� �
.��� �
	DayOfYear��� �
)��� �
.��� �
Count��� �
(��� �
)��� �
;��� � 
totalNotifications
�� "
+=
��# %

unitOfWork
��& 0
.
��0 1
Marriage
��1 9
.
��9 :
Filter
��: @
(
��@ A
m
��A B
=>
��C E
m
��F G
.
��G H
FirstPerson
��H S
.
��S T
TreeId
��T Z
==
��[ ]
user
��^ b
.
��b c
Person
��c i
.
��i j
TreeId
��j p
&&
��q s
m
��t u
.
��u v
	StartDate
��v 
.�� �
	DayOfYear��� �
==��� �
DateTime��� �
.��� �
Now��� �
.��� �
	DayOfYear��� �
)��� �
.��� �
Count��� �
(��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
user
�� 
.
�� 
NotifyUpdates
�� "
)
��" #
{
�� 
foreach
�� 
(
�� 
var
�� 
relative
�� %
in
��& (
user
��) -
.
��- .
UserRelatives
��. ;
)
��; <
{
��  
totalNotifications
�� &
+=
��' )

unitOfWork
��* 4
.
��4 5
Person
��5 ;
.
��; <
Filter
��< B
(
��B C
person
��C I
=>
��J L
person
��M S
.
��S T
TreeId
��T Z
==
��[ ]
relative
��^ f
.
��f g
RelativeUser
��g s
.
��s t
Person
��t z
.
��z {
TreeId��{ �
&&��� �
relative��� �
.��� �
LastSyncCheck��� �
.��� �
	CompareTo��� �
(��� �
person��� �
.��� �
	CreatedOn��� �
)��� �
<��� �
$num��� �
)��� �
.��� �
Count��� �
(��� �
)��� �
;��� � 
totalNotifications
�� &
+=
��' )

unitOfWork
��* 4
.
��4 5
Person
��5 ;
.
��; <
Filter
��< B
(
��B C
person
��C I
=>
��J L
person
��M S
.
��S T
TreeId
��T Z
==
��[ ]
relative
��^ f
.
��f g
RelativeUser
��g s
.
��s t
Person
��t z
.
��z {
TreeId��{ �
&&��� �
person��� �
.��� �

ModifiedOn��� �
.��� �
HasValue��� �
&&��� �
relative��� �
.��� �
LastSyncCheck��� �
.��� �
	CompareTo��� �
(��� �
person��� �
.��� �

ModifiedOn��� �
.��� �
Value��� �
)��� �
<��� �
$num��� �
)��� �
.��� �
Count��� �
(��� �
)��� �
;��� � 
totalNotifications
�� &
+=
��' )

unitOfWork
��* 4
.
��4 5
Marriage
��5 =
.
��= >
Filter
��> D
(
��D E
marriage
��E M
=>
��N P
marriage
��Q Y
.
��Y Z
FirstPerson
��Z e
.
��e f
TreeId
��f l
==
��m o
relative
��p x
.
��x y
RelativeUser��y �
.��� �
Person��� �
.��� �
TreeId��� �
&&��� �
relative��� �
.��� �
LastSyncCheck��� �
.��� �
	CompareTo��� �
(��� �
marriage��� �
.��� �
	CreatedOn��� �
)��� �
<��� �
$num��� �
)��� �
.��� �
Count��� �
(��� �
)��� �
;��� � 
totalNotifications
�� &
+=
��' )

unitOfWork
��* 4
.
��4 5
Marriage
��5 =
.
��= >
Filter
��> D
(
��D E
marriage
��E M
=>
��N P
marriage
��Q Y
.
��Y Z
FirstPerson
��Z e
.
��e f
TreeId
��f l
==
��m o
relative
��p x
.
��x y
RelativeUser��y �
.��� �
Person��� �
.��� �
TreeId��� �
&&��� �
marriage��� �
.��� �

ModifiedOn��� �
.��� �
HasValue��� �
&&��� �
relative��� �
.��� �
LastSyncCheck��� �
.��� �
	CompareTo��� �
(��� �
marriage��� �
.��� �

ModifiedOn��� �
.��� �
Value��� �
)��� �
<��� �
$num��� �
)��� �
.��� �
Count��� �
(��� �
)��� �
;��� � 
totalNotifications
�� &
+=
��' )

unitOfWork
��* 4
.
��4 5
ParentChild
��5 @
.
��@ A
Filter
��A G
(
��G H
parentChild
��H S
=>
��T V
parentChild
��W b
.
��b c
Parent
��c i
.
��i j
TreeId
��j p
==
��q s
relative
��t |
.
��| }
RelativeUser��} �
.��� �
Person��� �
.��� �
TreeId��� �
&&��� �
relative��� �
.��� �
LastSyncCheck��� �
.��� �
	CompareTo��� �
(��� �
parentChild��� �
.��� �
	CreatedOn��� �
)��� �
<��� �
$num��� �
)��� �
.��� �
Count��� �
(��� �
)��� �
;��� �
}
�� 
}
�� 
return
��  
totalNotifications
�� %
;
��% &
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� !
NotificationsBundle
�� -
>
��- .
GetNotifications
��/ ?
(
��? @
Guid
��@ D
userId
��E K
)
��K L
{
�� 	
User
�� 
user
�� 
=
�� 

unitOfWork
�� "
.
��" #
User
��# '
.
��' (
Filter
��( .
(
��. /
user
��/ 3
=>
��4 6
user
��7 ;
.
��; <
Id
��< >
==
��? A
userId
��B H
)
��H I
.
��I J
Include
��J Q
(
��Q R
u
��R S
=>
��T V
u
��W X
.
��X Y
UserRelatives
��Y f
)
��f g
.
��g h
ThenInclude
��h s
(
��s t
r
��t u
=>
��v x
r
��y z
.
��z {
RelativeUser��{ �
)��� �
.��� �
ThenInclude��� �
(��� �
ru��� �
=>��� �
ru��� �
.��� �
Person��� �
)��� �
.��� �
FirstOrDefault��� �
(��� �
)��� �
;��� �!
NotificationsBundle
�� 
notifications
��  -
=
��. /
new
��0 3!
NotificationsBundle
��4 G
(
��G H
)
��H I
;
��I J
notifications
�� 
.
�� 
RequestsReceived
�� *
=
��+ ,
await
��- 2
_requestService
��3 B
.
��B C!
GetRequestsReceived
��C V
(
��V W
userId
��W ]
)
��] ^
;
��^ _
notifications
�� 
.
�� 
RequestsResponded
�� +
=
��, -
await
��. 3
_requestService
��4 C
.
��C D"
GetRequestsResponded
��D X
(
��X Y
userId
��Y _
)
��_ `
;
��` a
if
�� 
(
�� 
user
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
notifications
�� $
;
��$ %
}
�� 
if
�� 
(
�� 
user
�� 
.
�� 
NotifyBirthdays
�� $
)
��$ %
{
�� 
List
�� 
<
�� 
EventInTreeModel
�� %
>
��% &
eventsInTree
��' 3
=
��4 5
(
��6 7
await
��7 <
_personService
��= K
.
��K L
GetEventsInTree
��L [
(
��[ \
user
��\ `
.
��` a
Person
��a g
.
��g h
TreeId
��h n
)
��n o
)
��o p
;
��p q
notifications
�� 
.
�� 
EventsToday
�� )
=
��* +
eventsInTree
��, 8
.
��8 9
FindAll
��9 @
(
��@ A
e
��A B
=>
��C E
e
��F G
.
��G H
Date
��H L
.
��L M
Day
��M P
==
��Q S
DateTime
��T \
.
��\ ]
Today
��] b
.
��b c
Day
��c f
&&
��g i
e
��j k
.
��k l
Date
��l p
.
��p q
Month
��q v
==
��w y
DateTime��z �
.��� �
Today��� �
.��� �
Month��� �
)��� �
;��� �
}
�� 
else
�� 
{
�� 
notifications
�� 
.
�� 
EventsToday
�� )
=
��* +
new
��, /
List
��0 4
<
��4 5
EventInTreeModel
��5 E
>
��E F
(
��F G
)
��G H
;
��H I
}
�� 
notifications
�� 
.
�� 
RelativeUpdates
�� )
=
��* +
new
��, /
List
��0 4
<
��4 5
RelativeUpdates
��5 D
>
��D E
(
��E F
)
��F G
;
��G H
if
�� 
(
�� 
user
�� 
.
�� 
NotifyUpdates
�� "
)
��" #
{
�� 
foreach
�� 
(
�� 
var
�� 
relative
�� %
in
��& (
user
��) -
.
��- .
UserRelatives
��. ;
)
��; <
{
�� 
RelativeUpdates
�� #
relativeUpdates
��$ 3
=
��4 5
new
��6 9
RelativeUpdates
��: I
(
��I J
)
��J K
;
��K L
relativeUpdates
�� #
.
��# $
Updates
��$ +
.
��+ ,
AddRange
��, 4
(
��4 5

unitOfWork
��5 ?
.
��? @
Person
��@ F
.
��F G
Filter
��G M
(
��M N
person
��N T
=>
��U W
person
��X ^
.
��^ _
TreeId
��_ e
==
��f h
relative
��i q
.
��q r
RelativeUser
��r ~
.
��~ 
Person�� �
.��� �
TreeId��� �
&&��� �
relative��� �
.��� �
LastSyncCheck��� �
.��� �
	CompareTo��� �
(��� �
person��� �
.��� �
	CreatedOn��� �
)��� �
<��� �
$num��� �
)��� �
.
�� 
Select
�� 
(
��  
person
��  &
=>
��' )
new
��* -
UpdateInfoModel
��. =
(
��= >
)
��> ?
{
�� 
ReferenceId
�� '
=
��( )
person
��* 0
.
��0 1
Id
��1 3
,
��3 4

UpdateType
�� &
=
��' (

UpdateType
��) 3
.
��3 4
PersonCreated
��4 A
,
��A B!
AffectedPeopleNames
�� /
=
��0 1$
GetAffectedPersonNames
��2 H
(
��H I
person
��I O
,
��O P
null
��Q U
)
��U V
}
�� 
)
�� 
.
�� 
ToList
�� !
(
��! "
)
��" #
)
��# $
;
��$ %
relativeUpdates
�� #
.
��# $
Updates
��$ +
.
��+ ,
AddRange
��, 4
(
��4 5

unitOfWork
��5 ?
.
��? @
Person
��@ F
.
��F G
Filter
��G M
(
��M N
person
��N T
=>
��U W
person
��X ^
.
��^ _
TreeId
��_ e
==
��f h
relative
��i q
.
��q r
RelativeUser
��r ~
.
��~ 
Person�� �
.��� �
TreeId��� �
&&��� �
person��� �
.��� �

ModifiedOn��� �
.��� �
HasValue��� �
&&��� �
relative��� �
.��� �
LastSyncCheck��� �
.��� �
	CompareTo��� �
(��� �
person��� �
.��� �

ModifiedOn��� �
.��� �
Value��� �
)��� �
<��� �
$num��� �
)��� �
.
�� 
Select
�� 
(
��  
person
��  &
=>
��' )
new
��* -
UpdateInfoModel
��. =
(
��= >
)
��> ?
{
�� 
ReferenceId
�� '
=
��( )
person
��* 0
.
��0 1
Id
��1 3
,
��3 4

UpdateType
�� &
=
��' (

UpdateType
��) 3
.
��3 4
PersonModified
��4 B
,
��B C!
AffectedPeopleNames
�� /
=
��0 1$
GetAffectedPersonNames
��2 H
(
��H I
person
��I O
,
��O P
null
��Q U
)
��U V
}
�� 
)
�� 
.
�� 
ToList
�� !
(
��! "
)
��" #
)
��# $
;
��$ %
relativeUpdates
�� #
.
��# $
Updates
��$ +
.
��+ ,
AddRange
��, 4
(
��4 5

unitOfWork
��5 ?
.
��? @
Marriage
��@ H
.
��H I
Filter
��I O
(
��O P
marriage
��P X
=>
��Y [
marriage
��\ d
.
��d e
FirstPerson
��e p
.
��p q
TreeId
��q w
==
��x z
relative��{ �
.��� �
RelativeUser��� �
.��� �
Person��� �
.��� �
TreeId��� �
&&��� �
relative��� �
.��� �
LastSyncCheck��� �
.��� �
	CompareTo��� �
(��� �
marriage��� �
.��� �
	CreatedOn��� �
)��� �
<��� �
$num��� �
)��� �
.
�� 
Select
�� 
(
��  
marriage
��  (
=>
��) +
new
��, /
UpdateInfoModel
��0 ?
(
��? @
)
��@ A
{
�� 
ReferenceId
�� '
=
��( )
marriage
��* 2
.
��2 3
FirstPersonId
��3 @
,
��@ A

UpdateType
�� &
=
��' (

UpdateType
��) 3
.
��3 4
MarriageCreated
��4 C
,
��C D!
AffectedPeopleNames
�� /
=
��0 1$
GetAffectedPersonNames
��2 H
(
��H I
marriage
��I Q
.
��Q R
FirstPerson
��R ]
,
��] ^
marriage
��_ g
.
��g h
SecondPerson
��h t
)
��t u
}
�� 
)
�� 
.
�� 
ToList
�� !
(
��! "
)
��" #
)
��# $
;
��$ %
relativeUpdates
�� #
.
��# $
Updates
��$ +
.
��+ ,
AddRange
��, 4
(
��4 5

unitOfWork
��5 ?
.
��? @
Marriage
��@ H
.
��H I
Filter
��I O
(
��O P
marriage
��P X
=>
��Y [
marriage
��\ d
.
��d e
FirstPerson
��e p
.
��p q
TreeId
��q w
==
��x z
relative��{ �
.��� �
RelativeUser��� �
.��� �
Person��� �
.��� �
TreeId��� �
&&��� �
marriage��� �
.��� �

ModifiedOn��� �
.��� �
HasValue��� �
&&��� �
relative��� �
.��� �
LastSyncCheck��� �
.��� �
	CompareTo��� �
(��� �
marriage��� �
.��� �

ModifiedOn��� �
.��� �
Value��� �
)��� �
<��� �
$num��� �
)��� �
.
�� 
Select
�� 
(
��  
marriage
��  (
=>
��) +
new
��, /
UpdateInfoModel
��0 ?
(
��? @
)
��@ A
{
�� 
ReferenceId
�� '
=
��( )
marriage
��* 2
.
��2 3
FirstPersonId
��3 @
,
��@ A

UpdateType
�� &
=
��' (

UpdateType
��) 3
.
��3 4
MarriageModified
��4 D
,
��D E!
AffectedPeopleNames
�� /
=
��0 1$
GetAffectedPersonNames
��2 H
(
��H I
marriage
��I Q
.
��Q R
FirstPerson
��R ]
,
��] ^
marriage
��_ g
.
��g h
SecondPerson
��h t
)
��t u
}
�� 
)
�� 
.
�� 
ToList
�� !
(
��! "
)
��" #
)
��# $
;
��$ %
relativeUpdates
�� #
.
��# $
Updates
��$ +
.
��+ ,
AddRange
��, 4
(
��4 5

unitOfWork
��5 ?
.
��? @
ParentChild
��@ K
.
��K L
Filter
��L R
(
��R S
parentChild
��S ^
=>
��_ a
parentChild
��b m
.
��m n
Parent
��n t
.
��t u
TreeId
��u {
==
��| ~
relative�� �
.��� �
RelativeUser��� �
.��� �
Person��� �
.��� �
TreeId��� �
&&��� �
relative��� �
.��� �
LastSyncCheck��� �
.��� �
	CompareTo��� �
(��� �
parentChild��� �
.��� �
	CreatedOn��� �
)��� �
<��� �
$num��� �
)��� �
.
�� 
Select
�� 
(
��  
parentChild
��  +
=>
��, .
new
��/ 2
UpdateInfoModel
��3 B
(
��B C
)
��C D
{
�� 
ReferenceId
�� '
=
��( )
parentChild
��* 5
.
��5 6
ParentId
��6 >
,
��> ?

UpdateType
�� &
=
��' (

UpdateType
��) 3
.
��3 4
ParentChildAdded
��4 D
,
��D E!
AffectedPeopleNames
�� /
=
��0 1$
GetAffectedPersonNames
��2 H
(
��H I
parentChild
��I T
.
��T U
Parent
��U [
,
��[ \
parentChild
��] h
.
��h i
Child
��i n
)
��n o
}
�� 
)
�� 
.
�� 
ToList
�� !
(
��! "
)
��" #
)
��# $
;
��$ %
if
�� 
(
�� 
relativeUpdates
�� '
.
��' (
Updates
��( /
.
��/ 0
Any
��0 3
(
��3 4
)
��4 5
)
��5 6
{
�� 
relativeUpdates
�� '
.
��' (

RelativeId
��( 2
=
��3 4
relative
��5 =
.
��= >
Id
��> @
;
��@ A
relativeUpdates
�� '
.
��' (
Relative
��( 0
=
��1 2
_mapper
��3 :
.
��: ;
Map
��; >
<
��> ? 
GenericPersonModel
��? Q
>
��Q R
(
��R S
relative
��S [
.
��[ \
RelativeUser
��\ h
)
��h i
;
��i j
relativeUpdates
�� '
.
��' (
Relative
��( 0
.
��0 1
	ImageFile
��1 :
=
��; <
await
��= B$
_fileManagementService
��C Y
.
��Y Z
GetFile
��Z a
(
��a b
relative
��b j
.
��j k
RelativeUser
��k w
.
��w x
Person
��x ~
.
��~ 
Image�� �
)��� �
;��� �
notifications
�� %
.
��% &
RelativeUpdates
��& 5
.
��5 6
Add
��6 9
(
��9 :
relativeUpdates
��: I
)
��I J
;
��J K
}
�� 
}
�� 
}
�� 
return
�� 
notifications
��  
;
��  !
}
�� 	
private
�� 
static
�� 
List
�� 
<
�� 
string
�� "
>
��" #$
GetAffectedPersonNames
��$ :
(
��: ;
Person
��; A
firstPerson
��B M
,
��M N
Person
��O U
secondPerson
��V b
)
��b c
{
�� 	
List
�� 
<
�� 
string
�� 
>
�� 
affectedNames
�� &
=
��' (
new
��) ,
List
��- 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
)
��: ;
;
��; <
affectedNames
�� 
.
�� 
Add
�� 
(
�� 
firstPerson
�� )
.
��) *
	FirstName
��* 3
+
��4 5
$str
��6 9
+
��: ;
firstPerson
��< G
.
��G H
LastName
��H P
)
��P Q
;
��Q R
if
�� 
(
�� 
secondPerson
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
affectedNames
�� 
.
�� 
Add
�� !
(
��! "
secondPerson
��" .
.
��. /
	FirstName
��/ 8
+
��9 :
$str
��; >
+
��? @
secondPerson
��A M
.
��M N
LastName
��N V
)
��V W
;
��W X
}
�� 
return
�� 
affectedNames
��  
;
��  !
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
UserDetailsModel
�� *
>
��* +

UpdateUser
��, 6
(
��6 7
Guid
��7 ;
userId
��< B
,
��B C
UserUpdateModel
��D S
user
��T X
)
��X Y
{
�� 	
User
�� 
userToUpdate
�� 
=
�� 
await
��  %

unitOfWork
��& 0
.
��0 1
User
��1 5
.
��5 6
FindById
��6 >
(
��> ?
userId
��? E
)
��E F
;
��F G
if
�� 
(
�� 
userToUpdate
�� 
==
�� 
null
��  $
||
��% '
user
��( ,
==
��- /
null
��0 4
)
��4 5
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
userToUpdate
�� 
.
�� 
About
�� 
=
��  
user
��! %
.
��% &
About
��& +
;
��+ ,
userToUpdate
�� 
.
�� 
Email
�� 
=
��  
user
��! %
.
��% &
Email
��& +
;
��+ ,
userToUpdate
�� 
.
�� 
PhoneNumber
�� $
=
��% &
user
��' +
.
��+ ,
PhoneNumber
��, 7
;
��7 8
User
�� 

userEntity
�� 
=
�� 
await
�� #

unitOfWork
��$ .
.
��. /
User
��/ 3
.
��3 4
Update
��4 :
(
��: ;
userToUpdate
��; G
)
��G H
;
��H I
UserDetailsModel
�� 
returnEvent
�� (
=
��) *
_mapper
��+ 2
.
��2 3
Map
��3 6
<
��6 7
UserDetailsModel
��7 G
>
��G H
(
��H I

userEntity
��I S
)
��S T
;
��T U
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� $
CheckUsernameAvailable
��  6
(
��6 7
string
��7 =
username
��> F
)
��F G
{
�� 	
User
�� 
user
�� 
=
�� 
await
�� 
Task
�� "
.
��" #
Run
��# &
(
��& '
(
��' (
)
��( )
=>
��* ,

unitOfWork
��- 7
.
��7 8
User
��8 <
.
��< =
Filter
��= C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K
Username
��K S
==
��T V
username
��W _
)
��_ `
.
��` a
FirstOrDefault
��a o
(
��o p
)
��p q
)
��q r
;
��r s
return
�� 
user
�� 
==
�� 
default
�� "
(
��" #
User
��# '
)
��' (
;
��( )
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� !
CheckEmailAvailable
��  3
(
��3 4
string
��4 :
email
��; @
)
��@ A
{
�� 	
User
�� 
user
�� 
=
�� 
await
�� 
Task
�� "
.
��" #
Run
��# &
(
��& '
(
��' (
)
��( )
=>
��* ,

unitOfWork
��- 7
.
��7 8
User
��8 <
.
��< =
Filter
��= C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K
Email
��K P
==
��Q S
email
��T Y
)
��Y Z
.
��Z [
FirstOrDefault
��[ i
(
��i j
)
��j k
)
��k l
;
��l m
return
�� 
user
�� 
==
�� 
default
�� "
(
��" #
User
��# '
)
��' (
;
��( )
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
UserSettingsModel
�� +
>
��+ ,
GetUserSettings
��- <
(
��< =
Guid
��= A
userId
��B H
)
��H I
{
�� 	
User
�� 
user
�� 
=
�� 
await
�� 

unitOfWork
�� (
.
��( )
User
��) -
.
��- .
FindById
��. 6
(
��6 7
userId
��7 =
)
��= >
;
��> ?
return
�� 
_mapper
�� 
.
�� 
Map
�� 
<
�� 
UserSettingsModel
�� 0
>
��0 1
(
��1 2
user
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
UserSettingsModel
�� +
>
��+ , 
UpdateUserSettings
��- ?
(
��? @
Guid
��@ D
userId
��E K
,
��K L
UserSettingsModel
��M ^
userSettings
��_ k
)
��k l
{
�� 	
User
�� 
userToUpdate
�� 
=
�� 
await
��  %

unitOfWork
��& 0
.
��0 1
User
��1 5
.
��5 6
FindById
��6 >
(
��> ?
userId
��? E
)
��E F
;
��F G
if
�� 
(
�� 
userToUpdate
�� 
==
�� 
null
��  $
||
��% '
userSettings
��( 4
==
��5 7
null
��8 <
)
��< =
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
userToUpdate
�� 
.
�� 
NotifyUpdates
�� &
=
��' (
userSettings
��) 5
.
��5 6
NotifyUpdates
��6 C
;
��C D
userToUpdate
�� 
.
�� 
NotifyBirthdays
�� (
=
��) *
userSettings
��+ 7
.
��7 8
NotifyBirthdays
��8 G
;
��G H
userToUpdate
�� 
.
�� 
SharePersonalInfo
�� *
=
��+ ,
userSettings
��- 9
.
��9 :
SharePersonalInfo
��: K
;
��K L
userToUpdate
�� 
.
�� 
ShareLocation
�� &
=
��' (
userSettings
��) 5
.
��5 6
ShareLocation
��6 C
;
��C D
User
�� 

userEntity
�� 
=
�� 
await
�� #

unitOfWork
��$ .
.
��. /
User
��/ 3
.
��3 4
Update
��4 :
(
��: ;
userToUpdate
��; G
)
��G H
;
��H I
UserSettingsModel
�� 
returnEvent
�� )
=
��* +
_mapper
��, 3
.
��3 4
Map
��4 7
<
��7 8
UserSettingsModel
��8 I
>
��I J
(
��J K

userEntity
��K U
)
��U V
;
��V W
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
PositionModel
�� '
>
��' ( 
UpdateUserPosition
��) ;
(
��; <
Guid
��< @
userId
��A G
,
��G H
PositionModel
��I V
position
��W _
)
��_ `
{
�� 	
Position
�� 
positionInDb
�� !
=
��" #
(
��$ %
await
��% *

unitOfWork
��+ 5
.
��5 6
User
��6 :
.
��: ;
FindById
��; C
(
��C D
userId
��D J
)
��J K
)
��K L
.
��L M
Position
��M U
;
��U V
if
�� 
(
�� 
positionInDb
�� 
==
�� 
null
��  $
||
��% '
position
��( 0
==
��1 3
null
��4 8
)
��8 9
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
positionInDb
�� 
.
�� 
	UpdatedOn
�� "
=
��# $
DateTime
��% -
.
��- .
Now
��. 1
;
��1 2
positionInDb
�� 
.
�� 
Latitude
�� !
=
��" #
position
��$ ,
.
��, -
Latitude
��- 5
;
��5 6
positionInDb
�� 
.
�� 
	Longitude
�� "
=
��# $
position
��% -
.
��- .
	Longitude
��. 7
;
��7 8
Position
�� 
positionEntity
�� #
=
��$ %
await
��& +

unitOfWork
��, 6
.
��6 7
Position
��7 ?
.
��? @
Update
��@ F
(
��F G
positionInDb
��G S
)
��S T
;
��T U
PositionModel
�� 
returnEvent
�� %
=
��& '
_mapper
��( /
.
��/ 0
Map
��0 3
<
��3 4
PositionModel
��4 A
>
��A B
(
��B C
positionEntity
��C Q
)
��Q R
;
��R S
return
�� 
returnEvent
�� 
;
�� 
}
�� 	
}
�� 
}�� 