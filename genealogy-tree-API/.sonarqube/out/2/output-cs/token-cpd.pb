ÍN
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
public 
AuthService 
( 
IUnitOfWork &

unitOfWork' 1
,1 2
IMapper3 :
mapper; A
)A B
:C D
baseE I
(I J

unitOfWorkJ T
)T U
{ 	
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
LoginResponseModel ,
>, -
Login. 3
(3 4

LoginModel4 >
	userLogin? H
)H I
{ 	
User 
user 
= 

unitOfWork "
." #
User# '
.' (
Filter( .
(. /
x/ 0
=>1 3
x4 5
.5 6
Username6 >
==? A
	userLoginB K
.K L
UsernameL T
)T U
.U V
IncludeV ]
(] ^
u^ _
=>` b
uc d
.d e
Persone k
)k l
.l m
FirstOrDefaultm {
({ |
)| }
;} ~
if 
( 
user 
!= 
null 
&& 
Hash  $
.$ %
ValidateHash% 1
(1 2
	userLogin2 ;
.; <
Password< D
,D E
userF J
.J K
PasswordSaltK W
,W X
userY ]
.] ^
PasswordHash^ j
)j k
)k l
{ 
LoginResponseModel "
loginResponseModel# 5
=6 7
_mapper8 ?
.? @
Map@ C
<C D
LoginResponseModelD V
>V W
(W X
userX \
)\ ]
;] ^
loginResponseModel "
." #
Token# (
=) *
await+ 0
Task1 5
.5 6
Run6 9
(9 :
(: ;
); <
=>= ?
TokenService@ L
.L M
GenerateTokenM Z
(Z [
user[ _
,_ `
	UserRolesa j
.j k
Userk o
)o p
)p q
;q r
return 
loginResponseModel )
;) *
} 
return 
null 
; 
} 	
public!! 
async!! 
Task!! 
<!! 
UserDetailsModel!! *
>!!* +
Register!!, 4
(!!4 5
RegisterModel!!5 B
userRegister!!C O
)!!O P
{"" 	
if## 
(## 

unitOfWork## 
.## 
User## 
.##  
Filter##  &
(##& '
x##' (
=>##) +
x##, -
.##- .
Username##. 6
==##7 9
userRegister##: F
.##F G
Username##G O
)##O P
.##P Q
FirstOrDefault##Q _
(##_ `
)##` a
!=##b d
default##e l
(##l m
User##m q
)##q r
)##r s
{$$ 
return%% 
null%% 
;%% 
}&& 
if'' 
('' 

unitOfWork'' 
.'' 
User'' 
.''  
Filter''  &
(''& '
x''' (
=>'') +
x'', -
.''- .
Email''. 3
==''4 6
userRegister''7 C
.''C D
Email''D I
)''I J
.''J K
FirstOrDefault''K Y
(''Y Z
)''Z [
!=''\ ^
default''_ f
(''f g
User''g k
)''k l
)''l m
{(( 
return)) 
null)) 
;)) 
}** 
Tree,, 
userTree,, 
=,, 
new,, 
Tree,,  $
(,,$ %
),,% &
{-- 

LastUpdate.. 
=.. 
DateTime.. %
...% &
UtcNow..& ,
}// 
;// 
userTree00 
=00 
await00 

unitOfWork00 '
.00' (
Tree00( ,
.00, -
Create00- 3
(003 4
userTree004 <
)00< =
;00= >
Person22 
person22 
=22 
_mapper22 #
.22# $
Map22$ '
<22' (
Person22( .
>22. /
(22/ 0
userRegister220 <
)22< =
;22= >
person33 
.33 
TreeId33 
=33 
userTree33 $
.33$ %
Id33% '
;33' (
person44 
.44 
LivingPlace44 
=44  
new44! $
Location44% -
(44- .
)44. /
;44/ 0
person55 
.55 

BirthPlace55 
=55 
new55  #
Location55$ ,
(55, -
)55- .
;55. /
Person66 
personCreated66  
=66! "
await66# (

unitOfWork66) 3
.663 4
Person664 :
.66: ;
Create66; A
(66A B
person66B H
)66H I
;66I J
Position77 
newPosition77  
=77! "
new77# &
Position77' /
(77/ 0
)770 1
;771 2
Position88 
position88 
=88 
await88  %

unitOfWork88& 0
.880 1
Position881 9
.889 :
Create88: @
(88@ A
newPosition88A L
)88L M
;88M N
User:: 
user:: 
=:: 
_mapper:: 
.::  
Map::  #
<::# $
User::$ (
>::( )
(::) *
userRegister::* 6
)::6 7
;::7 8
user;; 
.;; 
Id;; 
=;; 
Guid;; 
.;; 
NewGuid;; "
(;;" #
);;# $
;;;$ %
user<< 
.<< 
PersonId<< 
=<< 
personCreated<< )
.<<) *
Id<<* ,
;<<, -
user== 
.== 

PositionId== 
=== 
position== &
.==& '
Id==' )
;==) *
user>> 
.>> 
PasswordSalt>> 
=>> 
Salt>>  $
.>>$ %
Create>>% +
(>>+ ,
)>>, -
;>>- .
user?? 
.?? 
PasswordHash?? 
=?? 
Hash??  $
.??$ %

CreateHash??% /
(??/ 0
userRegister??0 <
.??< =
Password??= E
,??E F
user??G K
.??K L
PasswordSalt??L X
)??X Y
;??Y Z
User@@ 
createdUser@@ 
=@@ 
await@@ $

unitOfWork@@% /
.@@/ 0
User@@0 4
.@@4 5
Create@@5 ;
(@@; <
user@@< @
)@@@ A
;@@A B
UserDetailsModelAA 
returnEventAA (
=AA) *
_mapperAA+ 2
.AA2 3
MapAA3 6
<AA6 7
UserDetailsModelAA7 G
>AAG H
(AAH I
createdUserAAI T
)AAT U
;AAU V
returnCC 
returnEventCC 
;CC 
}DD 	
publicFF 
asyncFF 
TaskFF 
<FF 
UserDetailsModelFF *
>FF* +
UpdatePasswordFF, :
(FF: ;
UpdatePasswordModelFF; N
updatePasswordFFO ]
)FF] ^
{GG 	
UserHH 
userHH 
=HH 

unitOfWorkHH "
.HH" #
UserHH# '
.HH' (
FilterHH( .
(HH. /
xHH/ 0
=>HH1 3
xHH4 5
.HH5 6
UsernameHH6 >
==HH? A
updatePasswordHHB P
.HHP Q
UsernameHHQ Y
)HHY Z
.HHZ [
FirstOrDefaultHH[ i
(HHi j
)HHj k
;HHk l
ifII 
(II 
userII 
!=II 
defaultII 
(II  
UserII  $
)II$ %
&&II& (
HashII) -
.II- .
ValidateHashII. :
(II: ;
updatePasswordII; I
.III J
CurrentPasswordIIJ Y
,IIY Z
userII[ _
.II_ `
PasswordSaltII` l
,IIl m
userIIn r
.IIr s
PasswordHashIIs 
)	II Ä
)
IIÄ Å
{JJ 
userKK 
.KK 
PasswordSaltKK !
=KK" #
SaltKK$ (
.KK( )
CreateKK) /
(KK/ 0
)KK0 1
;KK1 2
userLL 
.LL 
PasswordHashLL !
=LL" #
HashLL$ (
.LL( )

CreateHashLL) 3
(LL3 4
updatePasswordLL4 B
.LLB C
NewPasswordLLC N
,LLN O
userLLP T
.LLT U
PasswordSaltLLU a
)LLa b
;LLb c
awaitMM 

unitOfWorkMM  
.MM  !
UserMM! %
.MM% &
UpdateMM& ,
(MM, -
userMM- 1
)MM1 2
;MM2 3
UserDetailsModelNN  
returnEventNN! ,
=NN- .
_mapperNN/ 6
.NN6 7
MapNN7 :
<NN: ;
UserDetailsModelNN; K
>NNK L
(NNL M
userNNM Q
)NNQ R
;NNR S
returnOO 
returnEventOO "
;OO" #
}PP 
elseQQ 
{RR 
returnSS 
nullSS 
;SS 
}TT 
}UU 	
}VV 
}WW ¯
ZE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Auth\Hash.cs
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
class 
Hash 
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
} £	
ZE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Business\Auth\Salt.cs
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
class 
Salt 
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
} º3
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
}OO ¬
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
} ∑
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
} º
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
$str	& ú
;
ú ù
const		 
string		 
SupportNoteRo		 "
=		# $
$str			% ∏
;
		∏ π
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
}&& ÎE
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
public 
IConfiguration 
_configuration ,
{- .
get/ 2
;2 3
}4 5
public 
EmailService 
( 
IUnitOfWork '

unitOfWork( 2
,2 3
IOptions4 <
<< =
	SmtpModel= F
>F G
smtpH L
,L M
IConfigurationN \
configuration] j
)j k
:l m
basen r
(r s

unitOfWorks }
)} ~
{ 	
_smtp 
= 
smtp 
. 
Value 
; 
_configuration 
= 
configuration *
;* +
} 	
public 
async 
Task 
SendSupportTicket +
(+ ,
SupportTicket, 9
supportTicket: G
)G H
{ 	
MailMessage 
mailMessage #
=$ %!
GetDefaultMailMessage& ;
(; <
)< =
;= >
mailMessage 
. 
Subject 
=  !
$str" %
+& '
supportTicket( 5
.5 6
Type6 :
+; <
$str= A
+B C
supportTicketD Q
.Q R
LanguageR Z
.Z [
ToUpper[ b
(b c
)c d
+e f
$strg k
+l m
supportTicketn {
.{ |
Subject	| É
;
É Ñ
string 
path 
= 
	Directory #
.# $
GetCurrentDirectory$ 7
(7 8
)8 9
+: ;
_configuration< J
[J K
$strK \
]\ ]
;] ^
mailMessage   
.   
Body   
=   %
GetSupportTicketEmailBody   8
(  8 9
supportTicket  9 F
,  F G
path  H L
)  L M
;  M N
mailMessage!! 
.!! 
To!! 
.!! 
Add!! 
(!! 
_smtp!! $
.!!$ %
From!!% )
)!!) *
;!!* +
if"" 
("" 
IsValidEmail"" 
("" 
supportTicket"" *
.""* +
EmailContact""+ 7
)""7 8
)""8 9
{## 
mailMessage$$ 
.$$ 
CC$$ 
.$$ 
Add$$ "
($$" #
supportTicket$$# 0
.$$0 1
EmailContact$$1 =
)$$= >
;$$> ?
}%% 
await&& 
Task&& 
.&& 
Run&& 
(&& 
(&& 
)&& 
=>&&  
	SendEmail&&! *
(&&* +
mailMessage&&+ 6
)&&6 7
)&&7 8
;&&8 9
}'' 	
private)) 

SmtpClient)) 
GetSMTPClient)) (
())( )
)))) *
{** 	
NetworkCredential++ 
networkCredential++ /
=++0 1
new++2 5
NetworkCredential++6 G
(++G H
_smtp++H M
.++M N
From++N R
,++R S
_smtp++T Y
.++Y Z
Password++Z b
)++b c
;++c d

SmtpClient,, 
client,, 
=,, 
new,,  #

SmtpClient,,$ .
{-- 
Host.. 
=.. 
_smtp.. 
... 
Host.. !
,..! "
Port// 
=// 
_smtp// 
.// 
Port// !
,//! "
	EnableSsl00 
=00 
true00  
,00  !!
UseDefaultCredentials11 %
=11& '
_smtp11( -
.11- .!
UseDefaultCredentials11. C
,11C D
Credentials22 
=22 
networkCredential22 /
}33 
;33 
return44 
client44 
;44 
}55 	
private77 
void77 
	SendEmail77 
(77 
MailMessage77 *
mailMessage77+ 6
)776 7
{88 	
try99 
{:: 
GetSMTPClient;; 
(;; 
);; 
.;;  
Send;;  $
(;;$ %
mailMessage;;% 0
);;0 1
;;;1 2
}<< 
catch== 
{>> 
Console?? 
.?? 
	WriteLine?? !
(??! "
$str??" H
)??H I
;??I J
}@@ 
}AA 	
privateCC 
MailMessageCC !
GetDefaultMailMessageCC 1
(CC1 2
)CC2 3
{DD 	
MailMessageEE 
messageEE 
=EE  !
newEE" %
MailMessageEE& 1
{FF 
FromGG 
=GG 
newGG 
MailAddressGG &
(GG& '
_smtpGG' ,
.GG, -
FromGG- 1
)GG1 2
,GG2 3

IsBodyHtmlHH 
=HH 
_smtpHH "
.HH" #

IsBodyHtmlHH# -
,HH- .
}II 
;II 
returnJJ 
messageJJ 
;JJ 
}KK 	
privateMM 
staticMM 
boolMM 
IsValidEmailMM (
(MM( )
stringMM) /
emailaddressMM0 <
)MM< =
{NN 	
tryOO 
{PP 
returnQQ 
MailAddressQQ "
.QQ" #
	TryCreateQQ# ,
(QQ, -
emailaddressQQ- 9
,QQ9 :
outQQ; >
MailAddressQQ? J
_QQK L
)QQL M
;QQM N
}RR 
catchSS 
(SS 
FormatExceptionSS "
)SS" #
{TT 
returnUU 
falseUU 
;UU 
}VV 
}WW 	
privateYY 
staticYY 
stringYY %
GetSupportTicketEmailBodyYY 7
(YY7 8
SupportTicketYY8 E
supportTicketYYF S
,YYS T
stringYYU [
pathYY\ `
)YY` a
{ZZ 	
StreamReader[[ 
reader[[ 
=[[  !
File[[" &
.[[& '
OpenText[[' /
([[/ 0
path[[0 4
)[[4 5
;[[5 6
string\\ 
body\\ 
=\\ 
reader\\  
.\\  !
	ReadToEnd\\! *
(\\* +
)\\+ ,
;\\, -
PropertyInfo]] 
[]] 
]]] 
st]] 
=]] 
supportTicket]]  -
.]]- .
GetType]]. 5
(]]5 6
)]]6 7
.]]7 8
GetProperties]]8 E
(]]E F
)]]F G
;]]G H
foreach^^ 
(^^ 
PropertyInfo^^ !
f^^" #
in^^$ &
st^^' )
)^^) *
{__ 
body`` 
=`` 
body`` 
.`` 
Replace`` #
(``# $
$str``$ '
+``( )
f``* +
.``+ ,
Name``, 0
+``1 2
$str``3 6
,``6 7
f``8 9
.``9 :
GetValue``: B
(``B C
supportTicket``C P
)``P Q
.``Q R
ToString``R Z
(``Z [
)``[ \
)``\ ]
;``] ^
}aa 
EmailDescriptioncc 
emailDescriptioncc -
=cc. /
EmailLanguageHelpercc0 C
.ccC D
GetEmailDescriptionccD W
(ccW X
supportTicketccX e
.cce f
Languageccf n
)ccn o
;cco p
PropertyInfodd 
[dd 
]dd 
eddd 
=dd 
emailDescriptiondd  0
.dd0 1
GetTypedd1 8
(dd8 9
)dd9 :
.dd: ;
GetPropertiesdd; H
(ddH I
)ddI J
;ddJ K
foreachee 
(ee 
PropertyInfoee !
fee" #
inee$ &
edee' )
)ee) *
{ff 
bodygg 
=gg 
bodygg 
.gg 
Replacegg #
(gg# $
$strgg$ '
+gg( )
fgg* +
.gg+ ,
Namegg, 0
+gg1 2
$strgg3 6
,gg6 7
fgg8 9
.gg9 :
GetValuegg: B
(ggB C
emailDescriptionggC S
)ggS T
.ggT U
ToStringggU ]
(gg] ^
)gg^ _
)gg_ `
;gg` a
}hh 
returnii 
bodyii 
;ii 
}jj 	
}kk 
}ll Ï
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
}		 æ

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
} ÄÕ
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
	CreateMap   
<   
	Education   
,    
EducationModel  ! /
>  / 0
(  0 1
)  1 2
.!! 

ReverseMap!! 
(!! 
)!! 
;!! 
	CreateMap## 
<## 
EducationLevel## $
,##$ %
GenericNameModel##& 6
>##6 7
(##7 8
)##8 9
.$$ 

ReverseMap$$ 
($$ 
)$$ 
;$$ 
	CreateMap&& 
<&& 
Image&& 
,&& 
	ImageFile&& &
>&&& '
(&&' (
)&&( )
.'' 
	ForMember'' 
('' 
x'' 
=>'' 
x''  !
.''! "
Name''" &
,''& '
y''( )
=>''* ,
y''- .
.''. /
MapFrom''/ 6
(''6 7
z''7 8
=>''9 ;
Guid''< @
.''@ A
Parse''A F
(''F G
Path''G K
.''K L'
GetFileNameWithoutExtension''L g
(''g h
z''h i
.''i j
FileName''j r
)''r s
)''s t
)''t u
)''u v
;''v w
	CreateMap(( 
<(( 
	ImageFile(( 
,((  
Image((! &
>((& '
(((' (
)((( )
;(() *
	CreateMap** 
<** 
Location** 
,** 
LocationModel**  -
>**- .
(**. /
)**/ 0
.++ 

ReverseMap++ 
(++ 
)++ 
;++ 
	CreateMap-- 
<-- 
Marriage-- 
,-- 
MarriedPersonModel--  2
>--2 3
(--3 4
)--4 5
... 
	ForMember.. 
(.. 
x.. 
=>.. 
x..  !
...! "
MarriageStarted.." 1
,..1 2
y..3 4
=>..5 7
y..8 9
...9 :
MapFrom..: A
(..A B
z..B C
=>..D F
z..G H
...H I
	StartDate..I R
)..R S
)..S T
.// 
	ForMember// 
(// 
x// 
=>// 
x//  !
.//! "
MarriageEnded//" /
,/// 0
y//1 2
=>//3 5
y//6 7
.//7 8
MapFrom//8 ?
(//? @
z//@ A
=>//B D
z//E F
.//F G
EndDate//G N
)//N O
)//O P
.00 
	ForMember00 
(00 
x00 
=>00 
x00  !
.00! "
PersonMarriedTo00" 1
,001 2
y003 4
=>005 7
y008 9
.009 :
MapFrom00: A
(00A B
z00B C
=>00D F
DefineMapping00G T
(00T U
z00U V
.00V W
FirstPerson00W b
,00b c
z00d e
.00e f
SecondPerson00f r
)00r s
)00s t
)00t u
;00u v
	CreateMap22 
<22 
Marriage22 
,22  
MarriageDetailsModel22  4
>224 5
(225 6
)226 7
.33 
	ForMember33 
(33 
x33 
=>33 
x33  !
.33! "
MarriageStarted33" 1
,331 2
y333 4
=>335 7
y338 9
.339 :
MapFrom33: A
(33A B
z33B C
=>33D F
z33G H
.33H I
	StartDate33I R
)33R S
)33S T
.44 
	ForMember44 
(44 
x44 
=>44 
x44  !
.44! "
MarriageEnded44" /
,44/ 0
y441 2
=>443 5
y446 7
.447 8
MapFrom448 ?
(44? @
z44@ A
=>44B D
z44E F
.44F G
EndDate44G N
)44N O
)44O P
.55 
	ForMember55 
(55 
x55 
=>55 
x55  !
.55! "
PersonMarriedTo55" 1
,551 2
y553 4
=>555 7
y558 9
.559 :
MapFrom55: A
(55A B
z55B C
=>55D F
z55G H
.55H I
SecondPerson55I U
)55U V
)55V W
.66 

ReverseMap66 
(66 
)66 
;66 
	CreateMap77 
<77 
Marriage77 
,77 %
MarriageCreateUpdateModel77  9
>779 :
(77: ;
)77; <
.88 

ReverseMap88 
(88 
)88 
;88 
	CreateMap:: 
<:: 
Nationality:: !
,::! "
GenericNameModel::# 3
>::3 4
(::4 5
)::5 6
.;; 

ReverseMap;; 
(;; 
);; 
;;; 
	CreateMap== 
<== 

Occupation==  
,==  !
OccupationModel==" 1
>==1 2
(==2 3
)==3 4
.>> 

ReverseMap>> 
(>> 
)>> 
;>> 
	CreateMap@@ 
<@@ 
ParentChild@@ !
,@@! "
ParentModel@@# .
>@@. /
(@@/ 0
)@@0 1
.AA 
	ForMemberAA 
(AA 
xAA 
=>AA 
xAA  !
.AA! "
ParentChildIdAA" /
,AA/ 0
yAA1 2
=>AA3 5
yAA6 7
.AA7 8
MapFromAA8 ?
(AA? @
zAA@ A
=>AAB D
zAAE F
.AAF G
IdAAG I
)AAI J
)AAJ K
.BB 
	ForMemberBB 
(BB 
xBB 
=>BB 
xBB  !
.BB! "
TreeIdBB" (
,BB( )
yBB* +
=>BB, .
yBB/ 0
.BB0 1
MapFromBB1 8
(BB8 9
zBB9 :
=>BB; =
zBB> ?
.BB? @
ParentBB@ F
.BBF G
TreeIdBBG M
)BBM N
)BBN O
.CC 
	ForMemberCC 
(CC 
xCC 
=>CC 
xCC  !
.CC! "
PersonIdCC" *
,CC* +
yCC, -
=>CC. 0
yCC1 2
.CC2 3
MapFromCC3 :
(CC: ;
zCC; <
=>CC= ?
zCC@ A
.CCA B
ParentCCB H
.CCH I
IdCCI K
)CCK L
)CCL M
.DD 
	ForMemberDD 
(DD 
xDD 
=>DD 
xDD  !
.DD! "
	FirstNameDD" +
,DD+ ,
yDD- .
=>DD/ 1
yDD2 3
.DD3 4
MapFromDD4 ;
(DD; <
zDD< =
=>DD> @
zDDA B
.DDB C
ParentDDC I
.DDI J
	FirstNameDDJ S
)DDS T
)DDT U
.EE 
	ForMemberEE 
(EE 
xEE 
=>EE 
xEE  !
.EE! "
LastNameEE" *
,EE* +
yEE, -
=>EE. 0
yEE1 2
.EE2 3
MapFromEE3 :
(EE: ;
zEE; <
=>EE= ?
zEE@ A
.EEA B
ParentEEB H
.EEH I
LastNameEEI Q
)EEQ R
)EER S
.FF 
	ForMemberFF 
(FF 
xFF 
=>FF 
xFF  !
.FF! "
GenderFF" (
,FF( )
yFF* +
=>FF, .
yFF/ 0
.FF0 1
MapFromFF1 8
(FF8 9
zFF9 :
=>FF; =
zFF> ?
.FF? @
ParentFF@ F
.FFF G
GenderFFG M
.FFM N
ToStringFFN V
(FFV W
)FFW X
)FFX Y
)FFY Z
.GG 
	ForMemberGG 
(GG 
xGG 
=>GG 
xGG  !
.GG! "
ImageIdGG" )
,GG) *
yGG+ ,
=>GG- /
yGG0 1
.GG1 2
MapFromGG2 9
(GG9 :
zGG: ;
=>GG< >
zGG? @
.GG@ A
ParentGGA G
.GGG H
ImageIdGGH O
)GGO P
)GGP Q
.HH 
	ForMemberHH 
(HH 
xHH 
=>HH 
xHH  !
.HH! "
	BirthDateHH" +
,HH+ ,
yHH- .
=>HH/ 1
yHH2 3
.HH3 4
MapFromHH4 ;
(HH; <
zHH< =
=>HH> @
zHHA B
.HHB C
ParentHHC I
.HHI J
	BirthDateHHJ S
)HHS T
)HHT U
.II 
	ForMemberII 
(II 
xII 
=>II 
xII  !
.II! "
	DeathDateII" +
,II+ ,
yII- .
=>II/ 1
yII2 3
.II3 4
MapFromII4 ;
(II; <
zII< =
=>II> @
zIIA B
.IIB C
ParentIIC I
.III J
	DeathDateIIJ S
)IIS T
)IIT U
.JJ 

ReverseMapJJ 
(JJ 
)JJ 
;JJ 
	CreateMapKK 
<KK 
ParentModelKK !
,KK! "
ParentChildModelKK# 3
>KK3 4
(KK4 5
)KK5 6
.LL 

ReverseMapLL 
(LL 
)LL 
;LL 
	CreateMapNN 
<NN 
ParentChildNN !
,NN! "

ChildModelNN# -
>NN- .
(NN. /
)NN/ 0
.OO 
	ForMemberOO 
(OO 
xOO 
=>OO 
xOO  !
.OO! "
ParentChildIdOO" /
,OO/ 0
yOO1 2
=>OO3 5
yOO6 7
.OO7 8
MapFromOO8 ?
(OO? @
zOO@ A
=>OOB D
zOOE F
.OOF G
IdOOG I
)OOI J
)OOJ K
.PP 
	ForMemberPP 
(PP 
xPP 
=>PP 
xPP  !
.PP! "
TreeIdPP" (
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
.PP? @
ChildPP@ E
.PPE F
TreeIdPPF L
)PPL M
)PPM N
.QQ 
	ForMemberQQ 
(QQ 
xQQ 
=>QQ 
xQQ  !
.QQ! "
PersonIdQQ" *
,QQ* +
yQQ, -
=>QQ. 0
yQQ1 2
.QQ2 3
MapFromQQ3 :
(QQ: ;
zQQ; <
=>QQ= ?
zQQ@ A
.QQA B
ChildQQB G
.QQG H
IdQQH J
)QQJ K
)QQK L
.RR 
	ForMemberRR 
(RR 
xRR 
=>RR 
xRR  !
.RR! "
	FirstNameRR" +
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
.RRB C
ChildRRC H
.RRH I
	FirstNameRRI R
)RRR S
)RRS T
.SS 
	ForMemberSS 
(SS 
xSS 
=>SS 
xSS  !
.SS! "
LastNameSS" *
,SS* +
ySS, -
=>SS. 0
ySS1 2
.SS2 3
MapFromSS3 :
(SS: ;
zSS; <
=>SS= ?
zSS@ A
.SSA B
ChildSSB G
.SSG H
LastNameSSH P
)SSP Q
)SSQ R
.TT 
	ForMemberTT 
(TT 
xTT 
=>TT 
xTT  !
.TT! "
GenderTT" (
,TT( )
yTT* +
=>TT, .
yTT/ 0
.TT0 1
MapFromTT1 8
(TT8 9
zTT9 :
=>TT; =
zTT> ?
.TT? @
ChildTT@ E
.TTE F
GenderTTF L
.TTL M
ToStringTTM U
(TTU V
)TTV W
)TTW X
)TTX Y
.UU 
	ForMemberUU 
(UU 
xUU 
=>UU 
xUU  !
.UU! "
ImageIdUU" )
,UU) *
yUU+ ,
=>UU- /
yUU0 1
.UU1 2
MapFromUU2 9
(UU9 :
zUU: ;
=>UU< >
zUU? @
.UU@ A
ChildUUA F
.UUF G
ImageIdUUG N
)UUN O
)UUO P
.VV 
	ForMemberVV 
(VV 
xVV 
=>VV 
xVV  !
.VV! "
	BirthDateVV" +
,VV+ ,
yVV- .
=>VV/ 1
yVV2 3
.VV3 4
MapFromVV4 ;
(VV; <
zVV< =
=>VV> @
zVVA B
.VVB C
ChildVVC H
.VVH I
	BirthDateVVI R
)VVR S
)VVS T
.WW 
	ForMemberWW 
(WW 
xWW 
=>WW 
xWW  !
.WW! "
	DeathDateWW" +
,WW+ ,
yWW- .
=>WW/ 1
yWW2 3
.WW3 4
MapFromWW4 ;
(WW; <
zWW< =
=>WW> @
zWWA B
.WWB C
ChildWWC H
.WWH I
	DeathDateWWI R
)WWR S
)WWS T
.XX 

ReverseMapXX 
(XX 
)XX 
;XX 
	CreateMapYY 
<YY 

ChildModelYY  
,YY  !
ParentChildModelYY" 2
>YY2 3
(YY3 4
)YY4 5
.ZZ 

ReverseMapZZ 
(ZZ 
)ZZ 
;ZZ 
	CreateMap\\ 
<\\ 
ParentChild\\ !
,\\! "#
ParentChildDetailsModel\\# :
>\\: ;
(\\; <
)\\< =
.]] 
	ForMember]] 
(]] 
x]] 
=>]] 
x]]  !
.]]! "

RelativeId]]" ,
,]], -
y]]. /
=>]]0 2
y]]3 4
.]]4 5
MapFrom]]5 <
(]]< =
z]]= >
=>]]? A
z]]B C
.]]C D
Id]]D F
)]]F G
)]]G H
.^^ 

ReverseMap^^ 
(^^ 
)^^ 
;^^ 
	CreateMap__ 
<__ 
ParentChild__ !
,__! "(
ParentChildCreateUpdateModel__# ?
>__? @
(__@ A
)__A B
.`` 
	ForMember`` 
(`` 
x`` 
=>`` 
x``  !
.``! "

RelativeId``" ,
,``, -
y``. /
=>``0 2
y``3 4
.``4 5
MapFrom``5 <
(``< =
z``= >
=>``? A
z``B C
.``C D
Id``D F
)``F G
)``G H
.aa 

ReverseMapaa 
(aa 
)aa 
;aa 
	CreateMapcc 
<cc 
Personcc 
,cc 
GenericPersonModelcc 0
>cc0 1
(cc1 2
)cc2 3
.dd 
	ForMemberdd 
(dd 
xdd 
=>dd 
xdd  !
.dd! "
PersonIddd" *
,dd* +
ydd, -
=>dd. 0
ydd1 2
.dd2 3
MapFromdd3 :
(dd: ;
zdd; <
=>dd= ?
zdd@ A
.ddA B
IdddB D
)ddD E
)ddE F
.ee 
	ForMemberee 
(ee 
xee 
=>ee 
xee  !
.ee! "
UserIdee" (
,ee( )
yee* +
=>ee, .
{ff 
ygg 
.gg 
PreConditiongg "
(gg" #
srcgg# &
=>gg' )
(gg* +
srcgg+ .
.gg. /
RelativeForPersongg/ @
!=ggA C
nullggD H
)ggH I
)ggI J
;ggJ K
yhh 
.hh 
MapFromhh 
(hh 
zhh 
=>hh  "
zhh# $
.hh$ %
RelativeForPersonhh% 6
.hh6 7
RelativeUserIdhh7 E
)hhE F
;hhF G
}ii 
)ii 
.jj 

ReverseMapjj 
(jj 
)jj 
;jj 
	CreateMapll 
<ll 
Personll 
,ll 
PersonTreeInfoModelll 1
>ll1 2
(ll2 3
)ll3 4
.mm 
	ForMembermm 
(mm 
xmm 
=>mm 
xmm  !
.mm! "
PersonIdmm" *
,mm* +
ymm, -
=>mm. 0
ymm1 2
.mm2 3
MapFrommm3 :
(mm: ;
zmm; <
=>mm= ?
zmm@ A
.mmA B
IdmmB D
)mmD E
)mmE F
.nn 
	ForMembernn 
(nn 
xnn 
=>nn 
xnn  !
.nn! "
UserIdnn" (
,nn( )
ynn* +
=>nn, .
{oo 
ypp 
.pp 
PreConditionpp "
(pp" #
srcpp# &
=>pp' )
(pp* +
srcpp+ .
.pp. /
RelativeForPersonpp/ @
!=ppA C
nullppD H
)ppH I
)ppI J
;ppJ K
yqq 
.qq 
MapFromqq 
(qq 
zqq 
=>qq  "
zqq# $
.qq$ %
RelativeForPersonqq% 6
.qq6 7
RelativeUserIdqq7 E
)qqE F
;qqF G
}rr 
)rr 
.ss 

ReverseMapss 
(ss 
)ss 
;ss 
	CreateMapuu 
<uu 
Personuu 
,uu 
PersonDetailsModeluu 0
>uu0 1
(uu1 2
)uu2 3
.vv 
	ForMembervv 
(vv 
xvv 
=>vv 
xvv  !
.vv! "
PersonIdvv" *
,vv* +
yvv, -
=>vv. 0
yvv1 2
.vv2 3
MapFromvv3 :
(vv: ;
zvv; <
=>vv= ?
zvv@ A
.vvA B
IdvvB D
)vvD E
)vvE F
.ww 
	ForMemberww 
(ww 
xww 
=>ww 
xww  !
.ww! "
Genderww" (
,ww( )
yww* +
=>ww, .
yww/ 0
.ww0 1
MapFromww1 8
(ww8 9
zww9 :
=>ww; =
zww> ?
.ww? @
Genderww@ F
==wwG I
$charwwJ M
?wwN O
$strwwP S
:wwT U
$strwwV Y
)wwY Z
)wwZ [
.xx 
	ForMemberxx 
(xx 
xxx 
=>xx 
xxx  !
.xx! "
UserIdxx" (
,xx( )
yxx* +
=>xx, .
{yy 
yzz 
.zz 
PreConditionzz "
(zz" #
srczz# &
=>zz' )
(zz* +
srczz+ .
.zz. /
RelativeForPersonzz/ @
!=zzA C
nullzzD H
)zzH I
)zzI J
;zzJ K
y{{ 
.{{ 
MapFrom{{ 
({{ 
z{{ 
=>{{  "
z{{# $
.{{$ %
RelativeForPerson{{% 6
.{{6 7
RelativeUserId{{7 E
){{E F
;{{F G
}|| 
)|| 
;}} 
	CreateMap~~ 
<~~ 
Person~~ 
,~~ #
PersonCreateUpdateModel~~ 5
>~~5 6
(~~6 7
)~~7 8
. 
	ForMember 
( 
x 
=> 
x  !
.! "
PersonId" *
,* +
y, -
=>. 0
y1 2
.2 3
MapFrom3 :
(: ;
z; <
=>= ?
z@ A
.A B
IdB D
)D E
)E F
.
ÄÄ 
	ForMember
ÄÄ 
(
ÄÄ 
x
ÄÄ 
=>
ÄÄ 
x
ÄÄ  !
.
ÄÄ! "
UserId
ÄÄ" (
,
ÄÄ( )
y
ÄÄ* +
=>
ÄÄ, .
{
ÅÅ 
y
ÇÇ 
.
ÇÇ 
PreCondition
ÇÇ "
(
ÇÇ" #
src
ÇÇ# &
=>
ÇÇ' )
(
ÇÇ* +
src
ÇÇ+ .
.
ÇÇ. /
RelativeForPerson
ÇÇ/ @
!=
ÇÇA C
null
ÇÇD H
)
ÇÇH I
)
ÇÇI J
;
ÇÇJ K
y
ÉÉ 
.
ÉÉ 
MapFrom
ÉÉ 
(
ÉÉ 
z
ÉÉ 
=>
ÉÉ  "
z
ÉÉ# $
.
ÉÉ$ %
RelativeForPerson
ÉÉ% 6
.
ÉÉ6 7
RelativeUserId
ÉÉ7 E
)
ÉÉE F
;
ÉÉF G
}
ÑÑ 
)
ÑÑ 
.
ÑÑ 

ReverseMap
ÑÑ 
(
ÑÑ 
)
ÑÑ 
;
ÑÑ  
	CreateMap
ÜÜ 
<
ÜÜ 
Religion
ÜÜ 
,
ÜÜ 
GenericNameModel
ÜÜ  0
>
ÜÜ0 1
(
ÜÜ1 2
)
ÜÜ2 3
.
áá 

ReverseMap
áá 
(
áá 
)
áá 
;
áá 
	CreateMap
ââ 
<
ââ 
Relative
ââ 
,
ââ 
RelativeModel
ââ  -
>
ââ- .
(
ââ. /
)
ââ/ 0
.
ää 
	ForMember
ää 
(
ää 
x
ää 
=>
ää 
x
ää  !
.
ää! "$
RelativePersonInTreeId
ää" 8
,
ää8 9
y
ää: ;
=>
ää< >
y
ää? @
.
ää@ A
MapFrom
ääA H
(
ääH I
z
ääI J
=>
ääK M
z
ääN O
.
ääO P+
RelativePersonInPrimaryTreeId
ääP m
)
ääm n
)
ään o
.
ãã 

ReverseMap
ãã 
(
ãã 
)
ãã 
;
ãã 
	CreateMap
åå 
<
åå 
Relative
åå 
,
åå 
UsersToLinkModel
åå  0
>
åå0 1
(
åå1 2
)
åå2 3
.
çç 

ReverseMap
çç 
(
çç 
)
çç 
;
çç 
	CreateMap
èè 
<
èè 
Request
èè 
,
èè !
RequestDetailsModel
èè 2
>
èè2 3
(
èè3 4
)
èè4 5
.
êê 
	ForMember
êê 
(
êê 
x
êê 
=>
êê 
x
êê  !
.
êê! "
ReceiverUser
êê" .
,
êê. /
y
êê0 1
=>
êê2 4
y
êê5 6
.
êê6 7
MapFrom
êê7 >
(
êê> ?
z
êê? @
=>
êêA C
z
êêD E
.
êêE F
Receiver
êêF N
)
êêN O
)
êêO P
.
ëë 
	ForMember
ëë 
(
ëë 
x
ëë 
=>
ëë 
x
ëë  !
.
ëë! "

SenderUser
ëë" ,
,
ëë, -
y
ëë. /
=>
ëë0 2
y
ëë3 4
.
ëë4 5
MapFrom
ëë5 <
(
ëë< =
z
ëë= >
=>
ëë? A
z
ëëB C
.
ëëC D
Sender
ëëD J
)
ëëJ K
)
ëëK L
.
íí 

ReverseMap
íí 
(
íí 
)
íí 
;
íí 
	CreateMap
ìì 
<
ìì 
Request
ìì 
,
ìì &
RequestCreateUpdateModel
ìì 7
>
ìì7 8
(
ìì8 9
)
ìì9 :
.
îî 
	ForMember
îî 
(
îî 
x
îî 
=>
îî 
x
îî  !
.
îî! "
ReceiverUser
îî" .
,
îî. /
y
îî0 1
=>
îî2 4
y
îî5 6
.
îî6 7
MapFrom
îî7 >
(
îî> ?
z
îî? @
=>
îîA C
z
îîD E
.
îîE F
Receiver
îîF N
)
îîN O
)
îîO P
.
ïï 
	ForMember
ïï 
(
ïï 
x
ïï 
=>
ïï 
x
ïï  !
.
ïï! "
SenderUserId
ïï" .
,
ïï. /
y
ïï0 1
=>
ïï2 4
y
ïï5 6
.
ïï6 7
MapFrom
ïï7 >
(
ïï> ?
z
ïï? @
=>
ïïA C
z
ïïD E
.
ïïE F
SenderId
ïïF N
)
ïïN O
)
ïïO P
;
ïïP Q
	CreateMap
óó 
<
óó &
RequestCreateUpdateModel
óó .
,
óó. /
Request
óó0 7
>
óó7 8
(
óó8 9
)
óó9 :
.
òò 
	ForMember
òò 
(
òò 
x
òò 
=>
òò 
x
òò  !
.
òò! "

ReceiverId
òò" ,
,
òò, -
y
òò. /
=>
òò0 2
y
òò3 4
.
òò4 5
MapFrom
òò5 <
(
òò< =
z
òò= >
=>
òò? A
z
òòB C
.
òòC D
ReceiverUser
òòD P
.
òòP Q
UserId
òòQ W
)
òòW X
)
òòX Y
.
ôô 
	ForMember
ôô 
(
ôô 
x
ôô 
=>
ôô 
x
ôô  !
.
ôô! "
SenderId
ôô" *
,
ôô* +
y
ôô, -
=>
ôô. 0
y
ôô1 2
.
ôô2 3
MapFrom
ôô3 :
(
ôô: ;
z
ôô; <
=>
ôô= ?
z
ôô@ A
.
ôôA B
SenderUserId
ôôB N
)
ôôN O
)
ôôO P
;
ôôP Q
	CreateMap
õõ 
<
õõ 
Request
õõ 
,
õõ "
RequestResponseModel
õõ 3
>
õõ3 4
(
õõ4 5
)
õõ5 6
.
úú 
	ForMember
úú 
(
úú 
x
úú 
=>
úú 
x
úú  !
.
úú! "
ReceiverUser
úú" .
,
úú. /
y
úú0 1
=>
úú2 4
y
úú5 6
.
úú6 7
MapFrom
úú7 >
(
úú> ?
z
úú? @
=>
úúA C
z
úúD E
.
úúE F
Receiver
úúF N
)
úúN O
)
úúO P
;
úúP Q
	CreateMap
ûû 
<
ûû 
User
ûû 
,
ûû 
UserSettingsModel
ûû -
>
ûû- .
(
ûû. /
)
ûû/ 0
.
üü 

ReverseMap
üü 
(
üü 
)
üü 
;
üü 
	CreateMap
†† 
<
†† 
User
†† 
,
†† 
UserDetailsModel
†† ,
>
††, -
(
††- .
)
††. /
.
°° 
	ForMember
°° 
(
°° 
x
°° 
=>
°° 
x
°°  !
.
°°! "
	FirstName
°°" +
,
°°+ ,
y
°°- .
=>
°°/ 1
y
°°2 3
.
°°3 4
MapFrom
°°4 ;
(
°°; <
z
°°< =
=>
°°> @
z
°°A B
.
°°B C
Person
°°C I
.
°°I J
	FirstName
°°J S
)
°°S T
)
°°T U
.
¢¢ 
	ForMember
¢¢ 
(
¢¢ 
x
¢¢ 
=>
¢¢ 
x
¢¢  !
.
¢¢! "
LastName
¢¢" *
,
¢¢* +
y
¢¢, -
=>
¢¢. 0
y
¢¢1 2
.
¢¢2 3
MapFrom
¢¢3 :
(
¢¢: ;
z
¢¢; <
=>
¢¢= ?
z
¢¢@ A
.
¢¢A B
Person
¢¢B H
.
¢¢H I
LastName
¢¢I Q
)
¢¢Q R
)
¢¢R S
.
££ 
	ForMember
££ 
(
££ 
x
££ 
=>
££ 
x
££  !
.
££! "
	BirthDate
££" +
,
££+ ,
y
££- .
=>
££/ 1
y
££2 3
.
££3 4
MapFrom
££4 ;
(
££; <
z
££< =
=>
££> @
z
££A B
.
££B C
Person
££C I
.
££I J
	BirthDate
££J S
)
££S T
)
££T U
.
§§ 
	ForMember
§§ 
(
§§ 
x
§§ 
=>
§§ 
x
§§  !
.
§§! "
Gender
§§" (
,
§§( )
y
§§* +
=>
§§, .
y
§§/ 0
.
§§0 1
MapFrom
§§1 8
(
§§8 9
z
§§9 :
=>
§§; =
z
§§> ?
.
§§? @
Person
§§@ F
.
§§F G
Gender
§§G M
)
§§M N
)
§§N O
.
•• 
	ForMember
•• 
(
•• 
x
•• 
=>
•• 
x
••  !
.
••! "
Nationality
••" -
,
••- .
y
••/ 0
=>
••1 3
y
••4 5
.
••5 6
MapFrom
••6 =
(
••= >
z
••> ?
=>
••@ B
z
••C D
.
••D E
Person
••E K
.
••K L
Nationality
••L W
)
••W X
)
••X Y
.
¶¶ 
	ForMember
¶¶ 
(
¶¶ 
x
¶¶ 
=>
¶¶ 
x
¶¶  !
.
¶¶! "
Religion
¶¶" *
,
¶¶* +
y
¶¶, -
=>
¶¶. 0
y
¶¶1 2
.
¶¶2 3
MapFrom
¶¶3 :
(
¶¶: ;
z
¶¶; <
=>
¶¶= ?
z
¶¶@ A
.
¶¶A B
Person
¶¶B H
.
¶¶H I
Religion
¶¶I Q
)
¶¶Q R
)
¶¶R S
.
ßß 
	ForMember
ßß 
(
ßß 
x
ßß 
=>
ßß 
x
ßß  !
.
ßß! "

BirthPlace
ßß" ,
,
ßß, -
y
ßß. /
=>
ßß0 2
y
ßß3 4
.
ßß4 5
MapFrom
ßß5 <
(
ßß< =
z
ßß= >
=>
ßß? A
z
ßßB C
.
ßßC D
Person
ßßD J
.
ßßJ K

BirthPlace
ßßK U
)
ßßU V
)
ßßV W
.
®® 
	ForMember
®® 
(
®® 
x
®® 
=>
®® 
x
®®  !
.
®®! "
LivingPlace
®®" -
,
®®- .
y
®®/ 0
=>
®®1 3
y
®®4 5
.
®®5 6
MapFrom
®®6 =
(
®®= >
z
®®> ?
=>
®®@ B
z
®®C D
.
®®D E
Person
®®E K
.
®®K L
LivingPlace
®®L W
)
®®W X
)
®®X Y
.
©© 
	ForMember
©© 
(
©© 
x
©© 
=>
©© 
x
©©  !
.
©©! "
Parents
©©" )
,
©©) *
y
©©+ ,
=>
©©- /
y
©©0 1
.
©©1 2
MapFrom
©©2 9
(
©©9 :
z
©©: ;
=>
©©< >
z
©©? @
.
©©@ A
Person
©©A G
.
©©G H
Parents
©©H O
.
©©O P
ToList
©©P V
(
©©V W
)
©©W X
)
©©X Y
)
©©Y Z
.
™™ 
	ForMember
™™ 
(
™™ 
x
™™ 
=>
™™ 
x
™™  !
.
™™! "
Children
™™" *
,
™™* +
y
™™, -
=>
™™. 0
y
™™1 2
.
™™2 3
MapFrom
™™3 :
(
™™: ;
z
™™; <
=>
™™= ?
z
™™@ A
.
™™A B
Person
™™B H
.
™™H I
Children
™™I Q
.
™™Q R
ToList
™™R X
(
™™X Y
)
™™Y Z
)
™™Z [
)
™™[ \
.
´´ 
	ForMember
´´ 
(
´´ 
x
´´ 
=>
´´ 
x
´´  !
.
´´! "
UserId
´´" (
,
´´( )
y
´´* +
=>
´´, .
y
´´/ 0
.
´´0 1
MapFrom
´´1 8
(
´´8 9
z
´´9 :
=>
´´; =
z
´´> ?
.
´´? @
Id
´´@ B
)
´´B C
)
´´C D
.
¨¨ 
	ForMember
¨¨ 
(
¨¨ 
x
¨¨ 
=>
¨¨ 
x
¨¨  !
.
¨¨! "
TreeId
¨¨" (
,
¨¨( )
y
¨¨* +
=>
¨¨, .
y
¨¨/ 0
.
¨¨0 1
MapFrom
¨¨1 8
(
¨¨8 9
z
¨¨9 :
=>
¨¨; =
z
¨¨> ?
.
¨¨? @
Person
¨¨@ F
.
¨¨F G
TreeId
¨¨G M
)
¨¨M N
)
¨¨N O
.
≠≠ 
	ForMember
≠≠ 
(
≠≠ 
x
≠≠ 
=>
≠≠ 
x
≠≠  !
.
≠≠! "
PersonId
≠≠" *
,
≠≠* +
y
≠≠, -
=>
≠≠. 0
y
≠≠1 2
.
≠≠2 3
MapFrom
≠≠3 :
(
≠≠: ;
z
≠≠; <
=>
≠≠= ?
z
≠≠@ A
.
≠≠A B
Person
≠≠B H
.
≠≠H I
Id
≠≠I K
)
≠≠K L
)
≠≠L M
.
ÆÆ 

ReverseMap
ÆÆ 
(
ÆÆ 
)
ÆÆ 
;
ÆÆ 
	CreateMap
∞∞ 
<
∞∞ 
User
∞∞ 
,
∞∞  
GenericPersonModel
∞∞ .
>
∞∞. /
(
∞∞/ 0
)
∞∞0 1
.
±± 
	ForMember
±± 
(
±± 
x
±± 
=>
±± 
x
±±  !
.
±±! "
UserId
±±" (
,
±±( )
y
±±* +
=>
±±, .
y
±±/ 0
.
±±0 1
MapFrom
±±1 8
(
±±8 9
z
±±9 :
=>
±±; =
z
±±> ?
.
±±? @
Id
±±@ B
)
±±B C
)
±±C D
.
≤≤ 
	ForMember
≤≤ 
(
≤≤ 
x
≤≤ 
=>
≤≤ 
x
≤≤  !
.
≤≤! "
PersonId
≤≤" *
,
≤≤* +
y
≤≤, -
=>
≤≤. 0
y
≤≤1 2
.
≤≤2 3
MapFrom
≤≤3 :
(
≤≤: ;
z
≤≤; <
=>
≤≤= ?
z
≤≤@ A
.
≤≤A B
Person
≤≤B H
.
≤≤H I
Id
≤≤I K
)
≤≤K L
)
≤≤L M
.
≥≥ 
	ForMember
≥≥ 
(
≥≥ 
x
≥≥ 
=>
≥≥ 
x
≥≥  !
.
≥≥! "
TreeId
≥≥" (
,
≥≥( )
y
≥≥* +
=>
≥≥, .
y
≥≥/ 0
.
≥≥0 1
MapFrom
≥≥1 8
(
≥≥8 9
z
≥≥9 :
=>
≥≥; =
z
≥≥> ?
.
≥≥? @
Person
≥≥@ F
.
≥≥F G
TreeId
≥≥G M
)
≥≥M N
)
≥≥N O
.
¥¥ 
	ForMember
¥¥ 
(
¥¥ 
x
¥¥ 
=>
¥¥ 
x
¥¥  !
.
¥¥! "
	FirstName
¥¥" +
,
¥¥+ ,
y
¥¥- .
=>
¥¥/ 1
y
¥¥2 3
.
¥¥3 4
MapFrom
¥¥4 ;
(
¥¥; <
z
¥¥< =
=>
¥¥> @
z
¥¥A B
.
¥¥B C
Person
¥¥C I
.
¥¥I J
	FirstName
¥¥J S
)
¥¥S T
)
¥¥T U
.
µµ 
	ForMember
µµ 
(
µµ 
x
µµ 
=>
µµ 
x
µµ  !
.
µµ! "
LastName
µµ" *
,
µµ* +
y
µµ, -
=>
µµ. 0
y
µµ1 2
.
µµ2 3
MapFrom
µµ3 :
(
µµ: ;
z
µµ; <
=>
µµ= ?
z
µµ@ A
.
µµA B
Person
µµB H
.
µµH I
LastName
µµI Q
)
µµQ R
)
µµR S
.
∂∂ 
	ForMember
∂∂ 
(
∂∂ 
x
∂∂ 
=>
∂∂ 
x
∂∂  !
.
∂∂! "
	BirthDate
∂∂" +
,
∂∂+ ,
y
∂∂- .
=>
∂∂/ 1
y
∂∂2 3
.
∂∂3 4
MapFrom
∂∂4 ;
(
∂∂; <
z
∂∂< =
=>
∂∂> @
z
∂∂A B
.
∂∂B C
Person
∂∂C I
.
∂∂I J
	BirthDate
∂∂J S
)
∂∂S T
)
∂∂T U
.
∑∑ 
	ForMember
∑∑ 
(
∑∑ 
x
∑∑ 
=>
∑∑ 
x
∑∑  !
.
∑∑! "
Gender
∑∑" (
,
∑∑( )
y
∑∑* +
=>
∑∑, .
y
∑∑/ 0
.
∑∑0 1
MapFrom
∑∑1 8
(
∑∑8 9
z
∑∑9 :
=>
∑∑; =
z
∑∑> ?
.
∑∑? @
Person
∑∑@ F
.
∑∑F G
Gender
∑∑G M
.
∑∑M N
ToString
∑∑N V
(
∑∑V W
)
∑∑W X
)
∑∑X Y
)
∑∑Y Z
.
∏∏ 
	ForMember
∏∏ 
(
∏∏ 
x
∏∏ 
=>
∏∏ 
x
∏∏  !
.
∏∏! "
	BirthDate
∏∏" +
,
∏∏+ ,
y
∏∏- .
=>
∏∏/ 1
y
∏∏2 3
.
∏∏3 4
MapFrom
∏∏4 ;
(
∏∏; <
z
∏∏< =
=>
∏∏> @
z
∏∏A B
.
∏∏B C
Person
∏∏C I
.
∏∏I J
	BirthDate
∏∏J S
)
∏∏S T
)
∏∏T U
.
ππ 
	ForMember
ππ 
(
ππ 
x
ππ 
=>
ππ 
x
ππ  !
.
ππ! "
ImageId
ππ" )
,
ππ) *
y
ππ+ ,
=>
ππ- /
y
ππ0 1
.
ππ1 2
MapFrom
ππ2 9
(
ππ9 :
z
ππ: ;
=>
ππ< >
z
ππ? @
.
ππ@ A
Person
ππA G
.
ππG H
ImageId
ππH O
)
ππO P
)
ππP Q
.
∫∫ 

ReverseMap
∫∫ 
(
∫∫ 
)
∫∫ 
;
∫∫ 
	CreateMap
ºº 
<
ºº 
User
ºº 
,
ºº 
UserUpdateModel
ºº +
>
ºº+ ,
(
ºº, -
)
ºº- .
.
ΩΩ 

ReverseMap
ΩΩ 
(
ΩΩ 
)
ΩΩ 
;
ΩΩ 
	CreateMap
øø 
<
øø 
User
øø 
,
øø 
UserPositionModel
øø -
>
øø- .
(
øø. /
)
øø/ 0
.
¿¿ 
	ForMember
¿¿ 
(
¿¿ 
x
¿¿ 
=>
¿¿ 
x
¿¿  !
.
¿¿! "
UserId
¿¿" (
,
¿¿( )
y
¿¿* +
=>
¿¿, .
y
¿¿/ 0
.
¿¿0 1
MapFrom
¿¿1 8
(
¿¿8 9
z
¿¿9 :
=>
¿¿; =
z
¿¿> ?
.
¿¿? @
Id
¿¿@ B
)
¿¿B C
)
¿¿C D
.
¡¡ 
	ForMember
¡¡ 
(
¡¡ 
x
¡¡ 
=>
¡¡ 
x
¡¡  !
.
¡¡! "
	FirstName
¡¡" +
,
¡¡+ ,
y
¡¡- .
=>
¡¡/ 1
y
¡¡2 3
.
¡¡3 4
MapFrom
¡¡4 ;
(
¡¡; <
z
¡¡< =
=>
¡¡> @
z
¡¡A B
.
¡¡B C
Person
¡¡C I
.
¡¡I J
	FirstName
¡¡J S
)
¡¡S T
)
¡¡T U
.
¬¬ 
	ForMember
¬¬ 
(
¬¬ 
x
¬¬ 
=>
¬¬ 
x
¬¬  !
.
¬¬! "
LastName
¬¬" *
,
¬¬* +
y
¬¬, -
=>
¬¬. 0
y
¬¬1 2
.
¬¬2 3
MapFrom
¬¬3 :
(
¬¬: ;
z
¬¬; <
=>
¬¬= ?
z
¬¬@ A
.
¬¬A B
Person
¬¬B H
.
¬¬H I
LastName
¬¬I Q
)
¬¬Q R
)
¬¬R S
.
√√ 
	ForMember
√√ 
(
√√ 
x
√√ 
=>
√√ 
x
√√  !
.
√√! "
Latitude
√√" *
,
√√* +
y
√√, -
=>
√√. 0
y
√√1 2
.
√√2 3
MapFrom
√√3 :
(
√√: ;
z
√√; <
=>
√√= ?
z
√√@ A
.
√√A B
Position
√√B J
.
√√J K
Latitude
√√K S
)
√√S T
)
√√T U
.
ƒƒ 
	ForMember
ƒƒ 
(
ƒƒ 
x
ƒƒ 
=>
ƒƒ 
x
ƒƒ  !
.
ƒƒ! "
	Longitude
ƒƒ" +
,
ƒƒ+ ,
y
ƒƒ- .
=>
ƒƒ/ 1
y
ƒƒ2 3
.
ƒƒ3 4
MapFrom
ƒƒ4 ;
(
ƒƒ; <
z
ƒƒ< =
=>
ƒƒ> @
z
ƒƒA B
.
ƒƒB C
Position
ƒƒC K
.
ƒƒK L
	Longitude
ƒƒL U
)
ƒƒU V
)
ƒƒV W
.
≈≈ 
	ForMember
≈≈ 
(
≈≈ 
x
≈≈ 
=>
≈≈ 
x
≈≈  !
.
≈≈! "
	UpdatedOn
≈≈" +
,
≈≈+ ,
y
≈≈- .
=>
≈≈/ 1
y
≈≈2 3
.
≈≈3 4
MapFrom
≈≈4 ;
(
≈≈; <
z
≈≈< =
=>
≈≈> @
z
≈≈A B
.
≈≈B C
Position
≈≈C K
.
≈≈K L
	UpdatedOn
≈≈L U
)
≈≈U V
)
≈≈V W
;
≈≈W X
	CreateMap
«« 
<
«« 
User
«« 
,
«« 
RegisterModel
«« )
>
««) *
(
««* +
)
««+ ,
.
»» 

ReverseMap
»» 
(
»» 
)
»» 
;
»» 
	CreateMap
   
<
   
RegisterModel
   #
,
  # $
Person
  % +
>
  + ,
(
  , -
)
  - .
.
ÀÀ 
	ForMember
ÀÀ 
(
ÀÀ 
x
ÀÀ 
=>
ÀÀ 
x
ÀÀ  !
.
ÀÀ! "
Gender
ÀÀ" (
,
ÀÀ( )
y
ÀÀ* +
=>
ÀÀ, .
y
ÀÀ/ 0
.
ÀÀ0 1
MapFrom
ÀÀ1 8
(
ÀÀ8 9
z
ÀÀ9 :
=>
ÀÀ; =
z
ÀÀ> ?
.
ÀÀ? @
Gender
ÀÀ@ F
==
ÀÀG I
$str
ÀÀJ M
?
ÀÀN O
$char
ÀÀP S
:
ÀÀT U
$char
ÀÀV Y
)
ÀÀY Z
)
ÀÀZ [
;
ÀÀ[ \
	CreateMap
ÕÕ 
<
ÕÕ 
User
ÕÕ 
,
ÕÕ  
LoginResponseModel
ÕÕ .
>
ÕÕ. /
(
ÕÕ/ 0
)
ÕÕ0 1
.
ŒŒ 
	ForMember
ŒŒ 
(
ŒŒ 
x
ŒŒ 
=>
ŒŒ 
x
ŒŒ  !
.
ŒŒ! "
TreeId
ŒŒ" (
,
ŒŒ( )
y
ŒŒ* +
=>
ŒŒ, .
y
ŒŒ/ 0
.
ŒŒ0 1
MapFrom
ŒŒ1 8
(
ŒŒ8 9
z
ŒŒ9 :
=>
ŒŒ; =
z
ŒŒ> ?
.
ŒŒ? @
Person
ŒŒ@ F
.
ŒŒF G
TreeId
ŒŒG M
)
ŒŒM N
)
ŒŒN O
.
œœ 
	ForMember
œœ 
(
œœ 
x
œœ 
=>
œœ 
x
œœ  !
.
œœ! "
PersonId
œœ" *
,
œœ* +
y
œœ, -
=>
œœ. 0
y
œœ1 2
.
œœ2 3
MapFrom
œœ3 :
(
œœ: ;
z
œœ; <
=>
œœ= ?
z
œœ@ A
.
œœA B
Person
œœB H
.
œœH I
Id
œœI K
)
œœK L
)
œœL M
;
œœM N
	CreateMap
—— 
<
—— 
Position
—— 
,
—— 
PositionModel
——  -
>
——- .
(
——. /
)
——/ 0
;
——0 1
}
““ 	
private
‘‘ 
static
‘‘ 
T
‘‘ 
DefineMapping
‘‘ &
<
‘‘& '
T
‘‘' (
>
‘‘( )
(
‘‘) *
T
‘‘* +
first
‘‘, 1
,
‘‘1 2
T
‘‘3 4
second
‘‘5 ;
)
‘‘; <
{
’’ 	
if
÷÷ 
(
÷÷ 
first
÷÷ 
!=
÷÷ 
null
÷÷ 
)
÷÷ 
{
◊◊ 
return
ÿÿ 
first
ÿÿ 
;
ÿÿ 
}
ŸŸ 
if
€€ 
(
€€ 
second
€€ 
!=
€€ 
null
€€ 
)
€€ 
{
‹‹ 
return
›› 
second
›› 
;
›› 
}
ﬁﬁ 
return
‡‡ 
default
‡‡ 
(
‡‡ 
T
‡‡ 
)
‡‡ 
;
‡‡ 
}
·· 	
}
‚‚ 
}„„ ®
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
} ›E
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
public 
EducationService 
(  
IUnitOfWork  +

unitOfWork, 6
,6 7
IMapper8 ?
mapper@ F
)F G
:H I
baseJ N
(N O

unitOfWorkO Y
)Y Z
{ 	
_mapper 
= 
mapper 
; 
} 	
public 
List 
< 
EducationModel "
>" ##
GetAllEducationsForUser$ ;
(; <
Guid< @
userIdA G
)G H
{ 	
List 
< 
	Education 
> 

educations &
=' (

unitOfWork) 3
.3 4
	Education4 =
.= >
Filter> D
(D E
xE F
=>G I
xJ K
.K L
UserIdL R
==S U
userIdV \
)\ ]
.] ^
Include^ e
(e f
ef g
=>h j
ek l
.l m
EducationLevelm {
){ |
.| }
ToList	} É
(
É Ñ
)
Ñ Ö
;
Ö Ü
List 
< 
EducationModel 
>  
returnEvent! ,
=- .
_mapper/ 6
.6 7
Map7 :
<: ;
List; ?
<? @
EducationModel@ N
>N O
>O P
(P Q

educationsQ [
)[ \
;\ ]
return 
returnEvent 
; 
} 	
public 
async 
Task 
< 
EducationModel (
>( )
GetEducationAsync* ;
(; <
int< ?
educationId@ K
)K L
{ 	
	Education   
	education   
=    !
await  " '

unitOfWork  ( 2
.  2 3
	Education  3 <
.  < =
FindById  = E
(  E F
educationId  F Q
)  Q R
;  R S
EducationModel!! 
returnEvent!! &
=!!' (
_mapper!!) 0
.!!0 1
Map!!1 4
<!!4 5
EducationModel!!5 C
>!!C D
(!!D E
	education!!E N
)!!N O
;!!O P
return"" 
returnEvent"" 
;"" 
}## 	
public%% 
async%% 
Task%% 
<%% 
EducationModel%% (
>%%( )
AddEducationAsync%%* ;
(%%; <
EducationModel%%< J
	education%%K T
)%%T U
{&& 	
if'' 
('' 
	education'' 
=='' 
null'' !
)''! "
{(( 
return)) 
null)) 
;)) 
}** 
	Education++ 
educationEntity++ %
=++& '
_mapper++( /
.++/ 0
Map++0 3
<++3 4
	Education++4 =
>++= >
(++> ?
	education++? H
)++H I
;++I J
educationEntity,, 
.,, 
EducationLevel,, *
=,,+ ,
null,,- 1
;,,1 2
educationEntity-- 
=-- 
await-- #

unitOfWork--$ .
.--. /
	Education--/ 8
.--8 9
Create--9 ?
(--? @
educationEntity--@ O
)--O P
;--P Q
EducationModel.. 
returnEvent.. &
=..' (
_mapper..) 0
...0 1
Map..1 4
<..4 5
EducationModel..5 C
>..C D
(..D E
educationEntity..E T
)..T U
;..U V
return// 
returnEvent// 
;// 
}00 	
public11 
async11 
Task11 
<11 
EducationModel11 (
>11( ) 
UpdateEducationAsync11* >
(11> ?
EducationModel11? M
	education11N W
)11W X
{22 	
if33 
(33 
	education33 
==33 
null33 !
)33! "
{44 
return55 
null55 
;55 
}66 
	Education77 
educationEntity77 %
=77& '
_mapper77( /
.77/ 0
Map770 3
<773 4
	Education774 =
>77= >
(77> ?
	education77? H
)77H I
;77I J
educationEntity88 
.88 
EducationLevel88 *
=88+ ,
null88- 1
;881 2
educationEntity99 
=99 
await99 #

unitOfWork99$ .
.99. /
	Education99/ 8
.998 9
Update999 ?
(99? @
educationEntity99@ O
)99O P
;99P Q
EducationModel:: 
returnEvent:: &
=::' (
_mapper::) 0
.::0 1
Map::1 4
<::4 5
EducationModel::5 C
>::C D
(::D E
educationEntity::E T
)::T U
;::U V
return;; 
returnEvent;; 
;;; 
}<< 	
public>> 
async>> 
Task>> 
<>> 
EducationModel>> (
>>>( ) 
DeleteEducationAsync>>* >
(>>> ?
int>>? B
educationId>>C N
)>>N O
{?? 	
	Education@@ 
educationEntity@@ %
=@@& '
await@@( -

unitOfWork@@. 8
.@@8 9
	Education@@9 B
.@@B C
Delete@@C I
(@@I J
educationId@@J U
)@@U V
;@@V W
EducationModelAA 
returnEventAA &
=AA' (
_mapperAA) 0
.AA0 1
MapAA1 4
<AA4 5
EducationModelAA5 C
>AAC D
(AAD E
educationEntityAAE T
)AAT U
;AAU V
returnBB 
returnEventBB 
;BB 
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
ListEE 
<EE 
GenericNameModelEE /
>EE/ 0
>EE0 1&
GetAllEducationLevelsAsyncEE2 L
(EEL M
)EEM N
{FF 	
ListGG 
<GG 
EducationLevelGG 
>GG  
educationLevelsGG! 0
=GG1 2

unitOfWorkGG3 =
.GG= >
EducationLevelGG> L
.GGL M
GetAllGGM S
(GGS T
)GGT U
.GGU V
ToListGGV \
(GG\ ]
)GG] ^
;GG^ _
ListHH 
<HH 
GenericNameModelHH !
>HH! "
returnEventHH# .
=HH/ 0
awaitHH1 6
TaskHH7 ;
.HH; <
RunHH< ?
(HH? @
(HH@ A
)HHA B
=>HHC E
_mapperHHF M
.HHM N
MapHHN Q
<HHQ R
ListHHR V
<HHV W
GenericNameModelHHW g
>HHg h
>HHh i
(HHi j
educationLevelsHHj y
)HHy z
)HHz {
;HH{ |
returnII 
returnEventII 
;II 
}JJ 	
publicLL 
asyncLL 
TaskLL 
<LL 
GenericNameModelLL *
>LL* +"
AddEducationLevelAsyncLL, B
(LLB C
stringLLC I
educationLevelNameLLJ \
)LL\ ]
{MM 	
ifNN 
(NN 
educationLevelNameNN "
==NN# %
nullNN& *
)NN* +
{OO 
returnPP 
nullPP 
;PP 
}QQ 
EducationLevelRR 
educationLevelRR )
=RR* +
newRR, /
EducationLevelRR0 >
(RR> ?
)RR? @
{SS 
NameTT 
=TT 
educationLevelNameTT )
}UU 
;UU 
EducationLevelVV 
educationEntityVV *
=VV+ ,
awaitVV- 2

unitOfWorkVV3 =
.VV= >
EducationLevelVV> L
.VVL M
CreateVVM S
(VVS T
educationLevelVVT b
)VVb c
;VVc d
GenericNameModelWW 
returnEventWW (
=WW) *
_mapperWW+ 2
.WW2 3
MapWW3 6
<WW6 7
GenericNameModelWW7 G
>WWG H
(WWH I
educationEntityWWI X
)WWX Y
;WWY Z
returnXX 
returnEventXX 
;XX 
}YY 	
}ZZ 
}[[ œ#
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
private 
readonly 
string 
_fileDirectoryPath  2
;2 3
public !
FileManagementService $
($ %
IMapper% ,
mapper- 3
,3 4
IConfiguration5 C
configurationD Q
)Q R
{ 	
_mapper 
= 
mapper 
; 
string %
relativeFileDirectoryPath ,
=- .
configuration/ <
.< =

GetSection= G
(G H
$strH X
)X Y
.Y Z
ValueZ _
;_ `
_fileDirectoryPath 
=  
Path! %
.% &
Combine& -
(- .
	Directory. 7
.7 8
GetCurrentDirectory8 K
(K L
)L M
,M N%
relativeFileDirectoryPathO h
)h i
;i j
	Directory 
. 
CreateDirectory %
(% &
_fileDirectoryPath& 8
)8 9
;9 :
} 	
public 
async 
Task 
< 
	ImageFile #
># $
GetFile% ,
(, -
Image- 2
fileName3 ;
); <
{ 	
if 
( 
fileName 
== 
null  
)  !
{ 
return 
null 
; 
} 
	ImageFile 
	imageFile 
=  !
_mapper" )
.) *
Map* -
<- .
	ImageFile. 7
>7 8
(8 9
fileName9 A
)A B
;B C
	imageFile 
. 
FileInBytes !
=" #
await$ )
File* .
.. /
ReadAllBytesAsync/ @
(@ A
PathA E
.E F
CombineF M
(M N
_fileDirectoryPathN `
,` a
fileNameb j
.j k
FileNamek s
)s t
)t u
;u v
return 
	imageFile 
; 
}   	
public"" 
async"" 
Task"" 
SaveFileAsync"" '
(""' (
	ImageFile""( 1
file""2 6
)""6 7
{## 	
string$$ 
fullPath$$ 
=$$ 
Path$$ "
.$$" #
Combine$$# *
($$* +
_fileDirectoryPath$$+ =
,$$= >
file$$? C
.$$C D
FileName$$D L
)$$L M
;$$M N
using&& 
(&& 

FileStream&& 

fileStream&& (
=&&) *
File&&+ /
.&&/ 0
Create&&0 6
(&&6 7
fullPath&&7 ?
)&&? @
)&&@ A
{'' 

fileStream(( 
.(( 
Seek(( 
(((  
$num((  !
,((! "

SeekOrigin((# -
.((- .
Begin((. 3
)((3 4
;((4 5
await)) 
file)) 
.)) 
Stream)) !
.))! "
CopyToAsync))" -
())- .

fileStream)). 8
)))8 9
;))9 :
}** 
}++ 	
public-- 
bool-- 

DeleteFile-- 
(-- 
string-- %
fileName--& .
)--. /
{.. 	
string// 
path// 
=// 
Path// 
.// 
Combine// &
(//& '
_fileDirectoryPath//' 9
,//9 :
fileName//; C
)//C D
;//D E
if00 
(00 
File00 
.00 
Exists00 
(00 
path00  
)00  !
)00! "
{11 
File22 
.22 
Delete22 
(22 
path22  
)22  !
;22! "
return33 
true33 
;33 
}44 
return55 
false55 
;55 
}66 	
}77 
}88 ª
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
public 
ImageService 
( 
IUnitOfWork '

unitOfWork( 2
,2 3
IMapper4 ;
mapper< B
,B C"
IFileManagementServiceD Z!
fileManagementService[ p
)p q
:r s
baset x
(x y

unitOfWork	y É
)
É Ñ
{ 	
_mapper 
= 
mapper 
; "
_fileManagementService "
=# $!
fileManagementService% :
;: ;
} 	
public 
async 
Task 
< 
Image 
>  
GetImageAsync! .
(. /
int/ 2
?2 3
imageId4 ;
); <
{ 	
if 
( 
imageId 
!= 
null 
)  
{ 
Image 
image 
= 
await #
this$ (
.( )

unitOfWork) 3
.3 4
Image4 9
.9 :
FindById: B
(B C
imageIdC J
)J K
;K L
return 
image 
; 
} 
return 
null 
; 
} 	
public 
async 
Task 
< 
Image 
>  
AddImageAsync! .
(. /
	ImageFile/ 8
file9 =
)= >
{ 	
await   "
_fileManagementService   (
.  ( )
SaveFileAsync  ) 6
(  6 7
file  7 ;
)  ; <
;  < =
Image!! 
image!! 
=!! 
_mapper!! !
.!!! "
Map!!" %
<!!% &
Image!!& +
>!!+ ,
(!!, -
file!!- 1
)!!1 2
;!!2 3
Image"" 
imageEntity"" 
="" 
await""  %

unitOfWork""& 0
.""0 1
Image""1 6
.""6 7
Create""7 =
(""= >
image""> C
)""C D
;""D E
return## 
imageEntity## 
;## 
}$$ 	
public&& 
async&& 
Task&& 
<&& 
bool&& 
>&& 
DeleteImageAsync&&  0
(&&0 1
int&&1 4
imageId&&5 <
)&&< =
{'' 	
Image(( 
imageEntity(( 
=(( 
await((  %

unitOfWork((& 0
.((0 1
Image((1 6
.((6 7
Delete((7 =
(((= >
imageId((> E
)((E F
;((F G
bool)) 

wasDeleted)) 
=)) "
_fileManagementService)) 4
.))4 5

DeleteFile))5 ?
())? @
imageEntity))@ K
.))K L
FileName))L T
)))T U
;))U V
return** 

wasDeleted** 
;** 
}++ 	
},, 
}-- Ê
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
return 
returnEvent 
; 
} 	
public 
async 
Task 
< 
LocationModel '
>' (
UpdateLocation) 7
(7 8
LocationModel8 E
locationF N
)N O
{ 	
if 
( 
location 
== 
null  
)  !
{ 
return 
null 
; 
} 
Location 
locationEntity #
=$ %
_mapper& -
.- .
Map. 1
<1 2
Location2 :
>: ;
(; <
location< D
)D E
;E F
locationEntity   
=   
await   "

unitOfWork  # -
.  - .
Location  . 6
.  6 7
Update  7 =
(  = >
locationEntity  > L
)  L M
;  M N
LocationModel!! 
returnEvent!! %
=!!& '
_mapper!!( /
.!!/ 0
Map!!0 3
<!!3 4
LocationModel!!4 A
>!!A B
(!!B C
locationEntity!!C Q
)!!Q R
;!!R S
return"" 
returnEvent"" 
;"" 
}## 	
}$$ 
}%% »`
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
public 
MarriageService 
( 
IUnitOfWork *

unitOfWork+ 5
,5 6
IMapper7 >
mapper? E
,E F"
IFileManagementServiceG ]!
fileManagementService^ s
)s t
:u v
basew {
({ |

unitOfWork	| Ü
)
Ü á
{ 	
_mapper 
= 
mapper 
; "
_fileManagementService "
=# $!
fileManagementService% :
;: ;
} 	
public 
async 
Task 
< 
List 
< 
MarriedPersonModel 1
>1 2
>2 3$
GetAllMarriagesForPerson4 L
(L M
intM P
personIdQ Y
)Y Z
{ 	
List 
< 
Marriage 
> 
	marriages $
=% &

unitOfWork' 1
.1 2
Marriage2 :
.: ;
Filter; A
(A B
xB C
=>D F
xG H
.H I
SecondPersonIdI W
==X Z
personId[ c
)c d
.d e
Includee l
(l m
mm n
=>o q
mr s
.s t
FirstPersont 
)	 Ä
.
Ä Å
ToList
Å á
(
á à
)
à â
;
â ä
	marriages 
. 
AddRange 
( 

unitOfWork )
.) *
Marriage* 2
.2 3
Filter3 9
(9 :
x: ;
=>< >
x? @
.@ A
FirstPersonIdA N
==O Q
personIdR Z
)Z [
.[ \
Include\ c
(c d
md e
=>f h
mi j
.j k
SecondPersonk w
)w x
.x y
ToListy 
(	 Ä
)
Ä Å
)
Å Ç
;
Ç É
List 
< 
MarriedPersonModel #
># $
returnEvent% 0
=1 2
new3 6
List7 ;
<; <
MarriedPersonModel< N
>N O
(O P
)P Q
;Q R
foreach 
( 
var 
marriage !
in" $
	marriages% .
). /
{ 
MarriedPersonModel "
returnMarriage# 1
=2 3
_mapper4 ;
.; <
Map< ?
<? @
MarriedPersonModel@ R
>R S
(S T
marriageT \
)\ ]
;] ^
returnMarriage   
.   
PersonMarriedTo   .
.  . /
	ImageFile  / 8
=  9 :
await  ; @"
_fileManagementService  A W
.  W X
GetFile  X _
(  _ `
marriage  ` h
.  h i
FirstPerson  i t
!=  u w
null  x |
?  } ~
marriage	   á
.
  á à
FirstPerson
  à ì
.
  ì î
Image
  î ô
:
  ö õ
marriage
  ú §
.
  § •
SecondPerson
  • ±
.
  ± ≤
Image
  ≤ ∑
)
  ∑ ∏
;
  ∏ π
returnEvent!! 
.!! 
Add!! 
(!!  
returnMarriage!!  .
)!!. /
;!!/ 0
}"" 
return## 
returnEvent## 
;## 
}$$ 	
public&& 
async&& 
Task&& 
<&& 
MarriedPersonModel&& ,
>&&, -'
GetCurrentMarriageForPerson&&. I
(&&I J
int&&J M
personId&&N V
)&&V W
{'' 	
Marriage(( 
marriage(( 
=(( 

unitOfWork((  *
.((* +
Marriage((+ 3
.((3 4
Filter((4 :
(((: ;
x((; <
=>((= ?
(((@ A
x((A B
.((B C
FirstPersonId((C P
==((Q S
personId((T \
||((] _
x((` a
.((a b
SecondPersonId((b p
==((q s
personId((t |
)((| }
&&	((~ Ä
x
((Å Ç
.
((Ç É
EndDate
((É ä
==
((ã ç
default
((é ï
(
((ï ñ
DateTime
((ñ û
)
((û ü
)
((ü †
.
((† °
FirstOrDefault
((° Ø
(
((Ø ∞
)
((∞ ±
;
((± ≤ 
MarriageDetailsModel))  
returnEvent))! ,
=))- .
await))/ 4
Task))5 9
.))9 :
Run)): =
())= >
())> ?
)))? @
=>))A C
_mapper))D K
.))K L
Map))L O
<))O P 
MarriageDetailsModel))P d
>))d e
())e f
marriage))f n
)))n o
)))o p
;))p q
return** 
returnEvent** 
;** 
}++ 	
public-- 
async-- 
Task-- 
<--  
MarriageDetailsModel-- .
>--. /
GetMarriageAsync--0 @
(--@ A
int--A D

marriageId--E O
)--O P
{.. 	
Marriage// 
marriage// 
=// 
await//  %

unitOfWork//& 0
.//0 1
Marriage//1 9
.//9 :
FindById//: B
(//B C

marriageId//C M
)//M N
;//N O
marriage00 
.00 
FirstPerson00  
=00! "
await00# (

unitOfWork00) 3
.003 4
Person004 :
.00: ;
FindById00; C
(00C D
marriage00D L
.00L M
FirstPersonId00M Z
)00Z [
;00[ \
marriage11 
.11 
SecondPerson11 !
=11" #
await11$ )

unitOfWork11* 4
.114 5
Person115 ;
.11; <
FindById11< D
(11D E
marriage11E M
.11M N
SecondPersonId11N \
)11\ ]
;11] ^ 
MarriageDetailsModel22  
returnEvent22! ,
=22- .
_mapper22/ 6
.226 7
Map227 :
<22: ; 
MarriageDetailsModel22; O
>22O P
(22P Q
marriage22Q Y
)22Y Z
;22Z [
returnEvent33 
.33 
FirstPerson33 #
.33# $
	ImageFile33$ -
=33. /
await330 5"
_fileManagementService336 L
.33L M
GetFile33M T
(33T U
marriage33U ]
.33] ^
FirstPerson33^ i
.33i j
Image33j o
)33o p
;33p q
returnEvent44 
.44 
PersonMarriedTo44 '
.44' (
	ImageFile44( 1
=442 3
await444 9"
_fileManagementService44: P
.44P Q
GetFile44Q X
(44X Y
marriage44Y a
.44a b
SecondPerson44b n
.44n o
Image44o t
)44t u
;44u v
return66 
returnEvent66 
;66 
}77 	
public99 
async99 
Task99 
<99  
MarriageDetailsModel99 .
>99. /
AddMarriageAsync990 @
(99@ A%
MarriageCreateUpdateModel99A Z
marriage99[ c
)99c d
{:: 	
if;; 
(;; 
marriage;; 
==;; 
null;;  
);;  !
{<< 
return== 
null== 
;== 
}>> 
Marriage?? 
marriageEntity?? #
=??$ %
_mapper??& -
.??- .
Map??. 1
<??1 2
Marriage??2 :
>??: ;
(??; <
marriage??< D
)??D E
;??E F
marriageEntity@@ 
.@@ 
	CreatedOn@@ $
=@@% &
DateTime@@' /
.@@/ 0
UtcNow@@0 6
;@@6 7
MarriageAA 
marriageCreatedAA $
=AA% &
awaitAA' ,

unitOfWorkAA- 7
.AA7 8
MarriageAA8 @
.AA@ A
CreateAAA G
(AAG H
marriageEntityAAH V
)AAV W
;AAW X 
MarriageDetailsModelBB  
returnEventBB! ,
=BB- .
_mapperBB/ 6
.BB6 7
MapBB7 :
<BB: ; 
MarriageDetailsModelBB; O
>BBO P
(BBP Q
marriageCreatedBBQ `
)BB` a
;BBa b
returnCC 
returnEventCC 
;CC 
}DD 	
publicFF 
asyncFF 
TaskFF 
<FF  
MarriageDetailsModelFF .
>FF. /
UpdateMarriageAsyncFF0 C
(FFC D%
MarriageCreateUpdateModelFFD ]
marriageFF^ f
)FFf g
{GG 	
ifHH 
(HH 
marriageHH 
==HH 
nullHH  
)HH  !
{II 
returnJJ 
nullJJ 
;JJ 
}KK 
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
return[[ 
returnEvent[[ 
;[[ 
}\\ 	
public^^ 
async^^ 
Task^^ 
<^^  
MarriageDetailsModel^^ .
>^^. /
DeleteMarriageAsync^^0 C
(^^C D
int^^D G

marriageId^^H R
)^^R S
{__ 	
Marriage`` 
marriageEntity`` #
=``$ %
await``& +

unitOfWork``, 6
.``6 7
Marriage``7 ?
.``? @
Delete``@ F
(``F G

marriageId``G Q
)``Q R
;``R S 
MarriageDetailsModelaa  
returnEventaa! ,
=aa- .
_mapperaa/ 6
.aa6 7
Mapaa7 :
<aa: ; 
MarriageDetailsModelaa; O
>aaO P
(aaP Q
marriageEntityaaQ _
)aa_ `
;aa` a
returnbb 
returnEventbb 
;bb 
}cc 	
}dd 
}ee ä
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
return 
returnEvent 
; 
} 	
public 
async 
Task 
< 
GenericNameModel *
>* +
AddNationalityAsync, ?
(? @
string@ F
nationalityNameG V
)V W
{ 	
if 
( 
nationalityName 
==  "
null# '
)' (
{ 
return 
null 
; 
}   
Nationality!! 
nationality!! #
=!!$ %
new!!& )
Nationality!!* 5
(!!5 6
)!!6 7
{"" 
Name## 
=## 
nationalityName## &
}$$ 
;$$ 
Nationality%% 
nationalityEntity%% )
=%%* +
await%%, 1

unitOfWork%%2 <
.%%< =
Nationality%%= H
.%%H I
Create%%I O
(%%O P
nationality%%P [
)%%[ \
;%%\ ]
GenericNameModel&& 
returnEvent&& (
=&&) *
_mapper&&+ 2
.&&2 3
Map&&3 6
<&&6 7
GenericNameModel&&7 G
>&&G H
(&&H I
nationalityEntity&&I Z
)&&Z [
;&&[ \
return'' 
returnEvent'' 
;'' 
}(( 	
})) 
}** ≥0
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
return 
returnEvent 
; 
} 	
public 
async 
Task 
< 
OccupationModel )
>) *
GetOccupationAsync+ =
(= >
int> A
occupationIdB N
)N O
{ 	

Occupation 
occupationEntity '
=( )
await* /

unitOfWork0 :
.: ;

Occupation; E
.E F
FindByIdF N
(N O
occupationIdO [
)[ \
;\ ]
OccupationModel 
returnEvent '
=( )
_mapper* 1
.1 2
Map2 5
<5 6
OccupationModel6 E
>E F
(F G
occupationEntityG W
)W X
;X Y
return   
returnEvent   
;   
}!! 	
public"" 
async"" 
Task"" 
<"" 
OccupationModel"" )
>"") *
AddOccupationAsync""+ =
(""= >
OccupationModel""> M

occupation""N X
)""X Y
{## 	
if$$ 
($$ 

occupation$$ 
==$$ 
null$$ "
)$$" #
{%% 
return&& 
null&& 
;&& 
}'' 

Occupation(( 
occupationEntity(( '
=((( )
_mapper((* 1
.((1 2
Map((2 5
<((5 6

Occupation((6 @
>((@ A
(((A B

occupation((B L
)((L M
;((M N

Occupation)) 
occupationCreated)) (
=))) *
await))+ 0

unitOfWork))1 ;
.)); <

Occupation))< F
.))F G
Create))G M
())M N
occupationEntity))N ^
)))^ _
;))_ `
OccupationModel** 
returnEvent** '
=**( )
_mapper*** 1
.**1 2
Map**2 5
<**5 6
OccupationModel**6 E
>**E F
(**F G
occupationCreated**G X
)**X Y
;**Y Z
return++ 
returnEvent++ 
;++ 
},, 	
public-- 
async-- 
Task-- 
<-- 
OccupationModel-- )
>--) *!
UpdateOccupationAsync--+ @
(--@ A
OccupationModel--A P

occupation--Q [
)--[ \
{.. 	
if// 
(// 

occupation// 
==// 
null// "
)//" #
{00 
return11 
null11 
;11 
}22 

Occupation33 
occupationEntity33 '
=33( )
_mapper33* 1
.331 2
Map332 5
<335 6

Occupation336 @
>33@ A
(33A B

occupation33B L
)33L M
;33M N

Occupation44 
occupationUpdated44 (
=44) *
await44+ 0

unitOfWork441 ;
.44; <

Occupation44< F
.44F G
Update44G M
(44M N
occupationEntity44N ^
)44^ _
;44_ `
OccupationModel55 
returnEvent55 '
=55( )
_mapper55* 1
.551 2
Map552 5
<555 6
OccupationModel556 E
>55E F
(55F G
occupationUpdated55G X
)55X Y
;55Y Z
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
return== 
returnEvent== 
;== 
}>> 	
}?? 
}@@ ‚∏
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
public 
ParentChildService !
(! "
IUnitOfWork" -

unitOfWork. 8
,8 9
IMapper: A
mapperB H
,H I"
IFileManagementServiceJ `!
fileManagementServicea v
,v w
IMarriageService	x à
marriageService
â ò
)
ò ô
:
ö õ
base
ú †
(
† °

unitOfWork
° ´
)
´ ¨
{ 	
_mapper 
= 
mapper 
; "
_fileManagementService "
=# $!
fileManagementService% :
;: ;
_marriageService 
= 
marriageService .
;. /
} 	
public 
async 
Task 
< 
List 
< 
ParentChildModel /
>/ 0
>0 1"
GetAllParentsForPerson2 H
(H I
intI L
childIdM T
)T U
{ 	
List 
< 
ParentChild 
> 
parentChildren ,
=- .
await/ 4
Task5 9
.9 :
Run: =
(= >
(> ?
)? @
=>A C

unitOfWorkD N
.N O
ParentChildO Z
.Z [
Filter[ a
(a b
xb c
=>d f
xg h
.h i
ChildIdi p
==q s
childIdt {
){ |
.| }
Include	} Ñ
(
Ñ Ö
pc
Ö á
=>
à ä
pc
ã ç
.
ç é
Parent
é î
)
î ï
.
ï ñ
ToList
ñ ú
(
ú ù
)
ù û
)
û ü
;
ü †
List 
< 
ParentModel 
> 
parentRelatives -
=. /
_mapper0 7
.7 8
Map8 ;
<; <
List< @
<@ A
ParentModelA L
>L M
>M N
(N O
parentChildrenO ]
)] ^
;^ _
List 
< 
ParentChildModel !
>! "
parents# *
=+ ,
_mapper- 4
.4 5
Map5 8
<8 9
List9 =
<= >
ParentChildModel> N
>N O
>O P
(P Q
parentRelativesQ `
)` a
;a b
return   
parents   
;   
}!! 	
public## 
async## 
Task## 
<## 
List## 
<## 
ParentChildModel## /
>##/ 0
>##0 1#
GetAllChildrenForPerson##2 I
(##I J
int##J M
parentId##N V
)##V W
{$$ 	
List%% 
<%% 
ParentChild%% 
>%% 
parentChildren%% ,
=%%- .
await%%/ 4
Task%%5 9
.%%9 :
Run%%: =
(%%= >
(%%> ?
)%%? @
=>%%A C

unitOfWork%%D N
.%%N O
ParentChild%%O Z
.%%Z [
Filter%%[ a
(%%a b
x%%b c
=>%%d f
x%%g h
.%%h i
ParentId%%i q
==%%r t
parentId%%u }
)%%} ~
.%%~ 
Include	%% Ü
(
%%Ü á
pc
%%á â
=>
%%ä å
pc
%%ç è
.
%%è ê
Child
%%ê ï
)
%%ï ñ
.
%%ñ ó
ToList
%%ó ù
(
%%ù û
)
%%û ü
)
%%ü †
;
%%† °
List&& 
<&& 

ChildModel&& 
>&& 
childRelatives&& +
=&&, -
_mapper&&. 5
.&&5 6
Map&&6 9
<&&9 :
List&&: >
<&&> ?

ChildModel&&? I
>&&I J
>&&J K
(&&K L
parentChildren&&L Z
)&&Z [
;&&[ \
List'' 
<'' 
ParentChildModel'' !
>''! "
children''# +
='', -
_mapper''. 5
.''5 6
Map''6 9
<''9 :
List'': >
<''> ?
ParentChildModel''? O
>''O P
>''P Q
(''Q R
childRelatives''R `
)''` a
;''a b
return(( 
children(( 
;(( 
})) 	
public++ 
async++ 
Task++ 
<++ 
List++ 
<++ 
ParentChildModel++ /
>++/ 0
>++0 1
GetAllAncestors++2 A
(++A B
int++B E
personId++F N
)++N O
{,, 	
List-- 
<-- 
ParentChildModel-- !
>--! "
foundParents--# /
=--0 1
await--2 7"
GetAllParentsForPerson--8 N
(--N O
personId--O W
)--W X
;--X Y
List.. 
<.. 
ParentChildModel.. !
>..! "
	ancestors..# ,
=..- .
new../ 2
List..3 7
<..7 8
ParentChildModel..8 H
>..H I
(..I J
)..J K
;..K L
while// 
(// 
foundParents// 
.//  
Any//  #
(//# $
)//$ %
)//% &
{00 
	ancestors11 
.11 
AddRange11 "
(11" #
foundParents11# /
)11/ 0
;110 1
List22 
<22 
ParentChildModel22 %
>22% &
searchParents22' 4
=225 6
new227 :
List22; ?
<22? @
ParentChildModel22@ P
>22P Q
(22Q R
)22R S
;22S T
searchParents33 
.33 
AddRange33 &
(33& '
foundParents33' 3
)333 4
;334 5
foundParents44 
.44 
Clear44 "
(44" #
)44# $
;44$ %
foreach55 
(55 
ParentChildModel55 )
parent55* 0
in551 3
searchParents554 A
)55A B
{66 
foundParents77  
.77  !
AddRange77! )
(77) *
await77* /"
GetAllParentsForPerson770 F
(77F G
parent77G M
.77M N
PersonId77N V
)77V W
)77W X
;77X Y
}88 
}99 
return:: 
	ancestors:: 
;:: 
};; 	
public== 
async== 
Task== 
<== 
List== 
<== 
ParentChildModel== /
>==/ 0
>==0 1
GetAllDescendants==2 C
(==C D
int==D G
personId==H P
)==P Q
{>> 	
List?? 
<?? 
ParentChildModel?? !
>??! "
foundChildren??# 0
=??1 2
await??3 8#
GetAllChildrenForPerson??9 P
(??P Q
personId??Q Y
)??Y Z
;??Z [
List@@ 
<@@ 
ParentChildModel@@ !
>@@! "
descendants@@# .
=@@/ 0
new@@1 4
List@@5 9
<@@9 :
ParentChildModel@@: J
>@@J K
(@@K L
)@@L M
;@@M N
whileAA 
(AA 
foundChildrenAA  
.AA  !
AnyAA! $
(AA$ %
)AA% &
)AA& '
{BB 
descendantsCC 
.CC 
AddRangeCC $
(CC$ %
foundChildrenCC% 2
)CC2 3
;CC3 4
ListDD 
<DD 
ParentChildModelDD %
>DD% &
searchChildrenDD' 5
=DD6 7
newDD8 ;
ListDD< @
<DD@ A
ParentChildModelDDA Q
>DDQ R
(DDR S
)DDS T
;DDT U
searchChildrenEE 
.EE 
AddRangeEE '
(EE' (
foundChildrenEE( 5
)EE5 6
;EE6 7
foundChildrenFF 
.FF 
ClearFF #
(FF# $
)FF$ %
;FF% &
foreachGG 
(GG 
ParentChildModelGG )
childGG* /
inGG0 2
searchChildrenGG3 A
)GGA B
{HH 
foundChildrenII !
.II! "
AddRangeII" *
(II* +
awaitII+ 0#
GetAllChildrenForPersonII1 H
(IIH I
childIII N
.IIN O
PersonIdIIO W
)IIW X
)IIX Y
;IIY Z
}JJ 
}KK 
returnLL 
descendantsLL 
;LL 
}MM 	
publicOO 
asyncOO 
TaskOO 
<OO 
ListOO 
<OO 
ParentChildModelOO /
>OO/ 0
>OO0 1
GetAllRelatedPeopleOO2 E
(OOE F
intOOF I
personIdOOJ R
)OOR S
{PP 	
ListQQ 
<QQ 
ParentChildModelQQ !
>QQ! "
foundRelativesQQ# 1
=QQ2 3
newQQ4 7
ListQQ8 <
<QQ< =
ParentChildModelQQ= M
>QQM N
(QQN O
)QQO P
;QQP Q
foundRelativesRR 
.RR 
AddRangeRR #
(RR# $
awaitRR$ )"
GetAllParentsForPersonRR* @
(RR@ A
personIdRRA I
)RRI J
)RRJ K
;RRK L
foundRelativesSS 
.SS 
AddRangeSS #
(SS# $
awaitSS$ )#
GetAllChildrenForPersonSS* A
(SSA B
personIdSSB J
)SSJ K
)SSK L
;SSL M
ListTT 
<TT 
ParentChildModelTT !
>TT! "
relatedPeopleTT# 0
=TT1 2
newTT3 6
ListTT7 ;
<TT; <
ParentChildModelTT< L
>TTL M
(TTM N
)TTN O
;TTO P
whileUU 
(UU 
foundRelativesUU !
.UU! "
AnyUU" %
(UU% &
)UU& '
)UU' (
{VV 
relatedPeopleWW 
.WW 
AddRangeWW &
(WW& '
foundRelativesWW' 5
)WW5 6
;WW6 7
ListXX 
<XX 
ParentChildModelXX %
>XX% &
searchRelativesXX' 6
=XX7 8
newXX9 <
ListXX= A
<XXA B
ParentChildModelXXB R
>XXR S
(XXS T
)XXT U
;XXU V
searchRelativesYY 
.YY  
AddRangeYY  (
(YY( )
foundRelativesYY) 7
)YY7 8
;YY8 9
foundRelativesZZ 
.ZZ 
ClearZZ $
(ZZ$ %
)ZZ% &
;ZZ& '
foreach[[ 
([[ 
int[[ 

relativeId[[ '
in[[( *
searchRelatives[[+ :
.[[: ;
Select[[; A
([[A B
relative[[B J
=>[[K M
relative[[N V
.[[V W
PersonId[[W _
)[[_ `
)[[` a
{\\ 
foundRelatives]] "
.]]" #
AddRange]]# +
(]]+ ,
await]], 1"
GetAllParentsForPerson]]2 H
(]]H I

relativeId]]I S
)]]S T
)]]T U
;]]U V
foundRelatives^^ "
.^^" #
AddRange^^# +
(^^+ ,
await^^, 1#
GetAllChildrenForPerson^^2 I
(^^I J

relativeId^^J T
)^^T U
)^^U V
;^^V W
}__ 
foundRelatives`` 
=``  
foundRelatives``! /
.``/ 0
GroupBy``0 7
(``7 8
relative``8 @
=>``A C
relative``D L
.``L M
PersonId``M U
)``U V
.``V W
Select``W ]
(``] ^
relative``^ f
=>``g i
relative``j r
.``r s
First``s x
(``x y
)``y z
)``z {
.``{ |
ToList	``| Ç
(
``Ç É
)
``É Ñ
;
``Ñ Ö
foundRelativesaa 
.aa 
	RemoveAllaa (
(aa( )
relativeaa) 1
=>aa2 4
relatedPeopleaa5 B
.aaB C
ExistsaaC I
(aaI J
personaaJ P
=>aaQ S
personaaT Z
.aaZ [
PersonIdaa[ c
==aad f
relativeaag o
.aao p
PersonIdaap x
)aax y
)aay z
;aaz {
}bb 
returncc 
relatedPeoplecc  
;cc  !
}dd 	
publicff 
asyncff 
Taskff 
<ff 
Listff 
<ff 
ParentChildModelff /
>ff/ 0
>ff0 1!
GetRelatedByAncestorsff2 G
(ffG H
intffH K
personIdffL T
)ffT U
{gg 	
Listhh 
<hh 
ParentChildModelhh !
>hh! "
allAncestorshh# /
=hh0 1
awaithh2 7
GetAllAncestorshh8 G
(hhG H
personIdhhH P
)hhP Q
;hhQ R
Listii 
<ii 
ParentChildModelii !
>ii! "
relatedByAncestorsii# 5
=ii6 7
newii8 ;
Listii< @
<ii@ A
ParentChildModeliiA Q
>iiQ R
(iiR S
)iiS T
;iiT U
relatedByAncestorsjj 
.jj 
AddRangejj '
(jj' (
allAncestorsjj( 4
)jj4 5
;jj5 6
foreachkk 
(kk 
varkk 
ancestorkk !
inkk" $
allAncestorskk% 1
)kk1 2
{ll 
relatedByAncestorsmm "
.mm" #
AddRangemm# +
(mm+ ,
awaitmm, 1
GetAllDescendantsmm2 C
(mmC D
ancestormmD L
.mmL M
PersonIdmmM U
)mmU V
)mmV W
;mmW X
}nn 
relatedByAncestorsoo 
.oo 
AddRangeoo '
(oo' (
awaitoo( -
GetAllDescendantsoo. ?
(oo? @
personIdoo@ H
)ooH I
)ooI J
;ooJ K
relatedByAncestorspp 
=pp  
relatedByAncestorspp! 3
.pp3 4
GroupBypp4 ;
(pp; <
relativepp< D
=>ppE G
relativeppH P
.ppP Q
PersonIdppQ Y
)ppY Z
.ppZ [
Selectpp[ a
(ppa b
relativeppb j
=>ppk m
relativeppn v
.ppv w
Firstppw |
(pp| }
)pp} ~
)pp~ 
.	pp Ä
ToList
ppÄ Ü
(
ppÜ á
)
ppá à
;
ppà â
returnqq 
relatedByAncestorsqq %
;qq% &
}rr 	
publictt 
asynctt 
Tasktt 
<tt 
Listtt 
<tt 
ParentChildModeltt /
>tt/ 0
>tt0 1#
GetRelatedByDescendantstt2 I
(ttI J
intttJ M
personIdttN V
)ttV W
{uu 	
Listvv 
<vv 
ParentChildModelvv !
>vv! "
allDescendantsvv# 1
=vv2 3
awaitvv4 9
GetAllDescendantsvv: K
(vvK L
personIdvvL T
)vvT U
;vvU V
Listww 
<ww 
ParentChildModelww !
>ww! " 
relatedByDescendantsww# 7
=ww8 9
newww: =
Listww> B
<wwB C
ParentChildModelwwC S
>wwS T
(wwT U
)wwU V
;wwV W 
relatedByDescendantsxx  
.xx  !
AddRangexx! )
(xx) *
allDescendantsxx* 8
)xx8 9
;xx9 :
foreachyy 
(yy 
varyy 

descendantyy #
inyy$ &
allDescendantsyy' 5
)yy5 6
{zz  
relatedByDescendants{{ $
.{{$ %
AddRange{{% -
({{- .
await{{. 3
GetAllAncestors{{4 C
({{C D

descendant{{D N
.{{N O
PersonId{{O W
){{W X
){{X Y
;{{Y Z
}||  
relatedByDescendants}}  
.}}  !
AddRange}}! )
(}}) *
await}}* /
GetAllAncestors}}0 ?
(}}? @
personId}}@ H
)}}H I
)}}I J
;}}J K 
relatedByDescendants~~  
=~~! " 
relatedByDescendants~~# 7
.~~7 8
GroupBy~~8 ?
(~~? @
relative~~@ H
=>~~I K
relative~~L T
.~~T U
PersonId~~U ]
)~~] ^
.~~^ _
Select~~_ e
(~~e f
relative~~f n
=>~~o q
relative~~r z
.~~z {
First	~~{ Ä
(
~~Ä Å
)
~~Å Ç
)
~~Ç É
.
~~É Ñ
ToList
~~Ñ ä
(
~~ä ã
)
~~ã å
;
~~å ç
return  
relatedByDescendants '
;' (
}
ÄÄ 	
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
<
ÇÇ 
List
ÇÇ 
<
ÇÇ  
GenericPersonModel
ÇÇ 1
>
ÇÇ1 2
>
ÇÇ2 3 
GetChildrenOptions
ÇÇ4 F
(
ÇÇF G
int
ÇÇG J
personId
ÇÇK S
)
ÇÇS T
{
ÉÉ 	
List
ÑÑ 
<
ÑÑ  
GenericPersonModel
ÑÑ #
>
ÑÑ# $%
notRelatedByDescendants
ÑÑ% <
=
ÑÑ= >
await
ÑÑ? D(
GetNotRelatedByDescendants
ÑÑE _
(
ÑÑ_ `
personId
ÑÑ` h
)
ÑÑh i
;
ÑÑi j
List
ÖÖ 
<
ÖÖ  
GenericPersonModel
ÖÖ #
>
ÖÖ# $#
notRelatedByAncestors
ÖÖ% :
=
ÖÖ; <
await
ÖÖ= B&
GetNotRelatedByAncestors
ÖÖC [
(
ÖÖ[ \
personId
ÖÖ\ d
)
ÖÖd e
;
ÖÖe f
List
ÜÜ 
<
ÜÜ  
GenericPersonModel
ÜÜ #
>
ÜÜ# $

notRelated
ÜÜ% /
=
ÜÜ0 1%
notRelatedByDescendants
ÜÜ2 I
.
ÜÜI J
Where
ÜÜJ O
(
ÜÜO P

notRelated
ÜÜP Z
=>
ÜÜ[ ]#
notRelatedByAncestors
ÜÜ^ s
.
ÜÜs t
Any
ÜÜt w
(
ÜÜw x
x
ÜÜx y
=>
ÜÜz |
x
ÜÜ} ~
.
ÜÜ~ 
PersonIdÜÜ á
==ÜÜà ä

notRelatedÜÜã ï
.ÜÜï ñ
PersonIdÜÜñ û
)ÜÜû ü
)ÜÜü †
.ÜÜ† °
ToListÜÜ° ß
(ÜÜß ®
)ÜÜ® ©
;ÜÜ© ™
List
àà 
<
àà 
int
àà 
>
àà !
peopleWithoutParent
àà )
=
àà* +
await
àà, 1$
GetPeopleWithoutParent
àà2 H
(
ààH I
personId
ààI Q
)
ààQ R
;
ààR S
List
ââ 
<
ââ 
int
ââ 
>
ââ 
spouces
ââ 
=
ââ 
(
ââ  !
await
ââ! &
_marriageService
ââ' 7
.
ââ7 8&
GetAllMarriagesForPerson
ââ8 P
(
ââP Q
personId
ââQ Y
)
ââY Z
)
ââZ [
.
ââ[ \
Select
ââ\ b
(
ââb c
(
ââc d
marriage
ââd l
)
ââl m
=>
âân p
marriage
ââq y
.
âây z
PersonMarriedToââz â
.âââ ä
PersonIdââä í
)ââí ì
.ââì î
ToListââî ö
(ââö õ
)ââõ ú
;ââú ù
return
ää 

notRelated
ää 
.
ää 
Where
ää #
(
ää# $
(
ää$ %
person
ää% +
)
ää+ ,
=>
ää- /!
peopleWithoutParent
ãã( ;
.
ãã; <
Exists
ãã< B
(
ããB C
(
ããC D
personId
ããD L
)
ããL M
=>
ããN P
person
ããQ W
.
ããW X
PersonId
ããX `
==
ããa c
personId
ããd l
)
ããl m
&&
ããn p
!
åå( )
spouces
åå) 0
.
åå0 1
Exists
åå1 7
(
åå7 8
(
åå8 9
spouceId
åå9 A
)
ååA B
=>
ååC E
person
ååF L
.
ååL M
PersonId
ååM U
==
ååV X
spouceId
ååY a
)
ååa b
)
ååb c
.
ååc d
ToList
ååd j
(
ååj k
)
ååk l
;
åål m
}
çç 	
public
èè 
async
èè 
Task
èè 
<
èè 
List
èè 
<
èè  
GenericPersonModel
èè 1
>
èè1 2
>
èè2 3$
GetParentSpouceOptions
èè4 J
(
èèJ K
int
èèK N
personId
èèO W
)
èèW X
{
êê 	
List
ëë 
<
ëë  
GenericPersonModel
ëë #
>
ëë# $#
notRelatedByAncestors
ëë% :
=
ëë; <
await
ëë= B&
GetNotRelatedByAncestors
ëëC [
(
ëë[ \
personId
ëë\ d
)
ëëd e
;
ëëe f
List
íí 
<
íí 
int
íí 
>
íí 
spouces
íí 
=
íí 
(
íí  !
await
íí! &
_marriageService
íí' 7
.
íí7 8&
GetAllMarriagesForPerson
íí8 P
(
ííP Q
personId
ííQ Y
)
ííY Z
)
ííZ [
.
íí[ \
Where
íí\ a
(
íía b
marriage
ííb j
=>
íík m
marriage
íín v
.
íív w
MarriageEndedííw Ñ
==ííÖ á
nullííà å
)ííå ç
.
ìì$ %
Select
ìì% +
(
ìì+ ,
(
ìì, -
marriage
ìì- 5
)
ìì5 6
=>
ìì7 9
marriage
ìì: B
.
ììB C
PersonMarriedTo
ììC R
.
ììR S
PersonId
ììS [
)
ìì[ \
.
ìì\ ]
ToList
ìì] c
(
ììc d
)
ììd e
;
ììe f
return
îî #
notRelatedByAncestors
îî (
.
îî( )
Where
îî) .
(
îî. /
(
îî/ 0
person
îî0 6
)
îî6 7
=>
îî8 :
!
îî; <
spouces
îî< C
.
îîC D
Exists
îîD J
(
îîJ K
(
îîK L
spouceId
îîL T
)
îîT U
=>
îîV X
person
îîY _
.
îî_ `
PersonId
îî` h
==
îîi k
spouceId
îîl t
)
îît u
)
îîu v
.
îîv w
ToList
îîw }
(
îî} ~
)
îî~ 
;îî Ä
}
ïï 	
public
óó 
async
óó 
Task
óó 
<
óó 
List
óó 
<
óó  
GenericPersonModel
óó 1
>
óó1 2
>
óó2 3 
GetUnrelatedPeople
óó4 F
(
óóF G
int
óóG J
personId
óóK S
)
óóS T
{
òò 	
List
ôô 
<
ôô 
int
ôô 
>
ôô 
relatedPeopleIds
ôô &
=
ôô' (
(
ôô) *
await
ôô* /!
GetAllRelatedPeople
ôô0 C
(
ôôC D
personId
ôôD L
)
ôôL M
)
ôôM N
.
ôôN O
Select
ôôO U
(
ôôU V
(
ôôV W
relative
ôôW _
)
ôô_ `
=>
ôôa c
relative
ôôd l
.
ôôl m
PersonId
ôôm u
)
ôôu v
.
ôôv w
ToList
ôôw }
(
ôô} ~
)
ôô~ 
;ôô Ä
List
öö 
<
öö 
int
öö 
>
öö 
marriedPeopleIds
öö &
=
öö' (
(
öö) *
await
öö* /
_marriageService
öö0 @
.
öö@ A&
GetAllMarriagesForPerson
ööA Y
(
ööY Z
personId
ööZ b
)
ööb c
)
ööc d
.
ööd e
Select
ööe k
(
öök l
(
ööl m
marriage
ööm u
)
ööu v
=>
ööw y
marriageööz Ç
.ööÇ É
PersonMarriedToööÉ í
.ööí ì
PersonIdööì õ
)ööõ ú
.ööú ù
ToListööù £
(öö£ §
)öö§ •
;öö• ¶
foreach
õõ 
(
õõ 
var
õõ 
marriedPersonId
õõ (
in
õõ) +
marriedPeopleIds
õõ, <
)
õõ< =
{
úú 
List
ùù 
<
ùù 
int
ùù 
>
ùù '
relatedToMarriedPersonIds
ùù 3
=
ùù4 5
(
ùù6 7
await
ùù7 <!
GetAllRelatedPeople
ùù= P
(
ùùP Q
marriedPersonId
ùùQ `
)
ùù` a
)
ùùa b
.
ùùb c
Select
ùùc i
(
ùùi j
(
ùùj k
person
ùùk q
)
ùùq r
=>
ùùs u
person
ùùv |
.
ùù| }
PersonIdùù} Ö
)ùùÖ Ü
.ùùÜ á
ToListùùá ç
(ùùç é
)ùùé è
;ùùè ê
relatedPeopleIds
ûû  
.
ûû  !
AddRange
ûû! )
(
ûû) *'
relatedToMarriedPersonIds
ûû* C
)
ûûC D
;
ûûD E
}
üü 
relatedPeopleIds
†† 
.
†† 
AddRange
†† %
(
††% &
marriedPeopleIds
††& 6
)
††6 7
;
††7 8
return
°° 
await
°° 
GetExcludedPeople
°° *
(
°°* +
relatedPeopleIds
°°+ ;
,
°°; <
personId
°°= E
)
°°E F
;
°°F G
}
¢¢ 	
public
§§ 
async
§§ 
Task
§§ 
<
§§ 
List
§§ 
<
§§  
GenericPersonModel
§§ 1
>
§§1 2
>
§§2 3&
GetNotRelatedByAncestors
§§4 L
(
§§L M
int
§§M P
personId
§§Q Y
)
§§Y Z
{
•• 	
List
¶¶ 
<
¶¶ 
int
¶¶ 
>
¶¶ #
bloodRelatedPeopleIds
¶¶ +
=
¶¶, -
(
¶¶. /
await
¶¶/ 4#
GetRelatedByAncestors
¶¶5 J
(
¶¶J K
personId
¶¶K S
)
¶¶S T
)
¶¶T U
.
¶¶U V
Select
¶¶V \
(
¶¶\ ]
(
¶¶] ^ 
bloodRelatedPerson
¶¶^ p
)
¶¶p q
=>
¶¶r t!
bloodRelatedPerson¶¶u á
.¶¶á à
PersonId¶¶à ê
)¶¶ê ë
.¶¶ë í
ToList¶¶í ò
(¶¶ò ô
)¶¶ô ö
;¶¶ö õ
return
ßß 
await
ßß 
GetExcludedPeople
ßß *
(
ßß* +#
bloodRelatedPeopleIds
ßß+ @
,
ßß@ A
personId
ßßB J
)
ßßJ K
;
ßßK L
}
®® 	
public
™™ 
async
™™ 
Task
™™ 
<
™™ 
List
™™ 
<
™™  
GenericPersonModel
™™ 1
>
™™1 2
>
™™2 3(
GetNotRelatedByDescendants
™™4 N
(
™™N O
int
™™O R
personId
™™S [
)
™™[ \
{
´´ 	
List
¨¨ 
<
¨¨ 
int
¨¨ 
>
¨¨ %
relatedByDescendantsIds
¨¨ -
=
¨¨. /
(
¨¨0 1
await
¨¨1 6%
GetRelatedByDescendants
¨¨7 N
(
¨¨N O
personId
¨¨O W
)
¨¨W X
)
¨¨X Y
.
¨¨Y Z
Select
¨¨Z `
(
¨¨` a
(
¨¨a b
relatedPerson
¨¨b o
)
¨¨o p
=>
¨¨q s
relatedPerson¨¨t Å
.¨¨Å Ç
PersonId¨¨Ç ä
)¨¨ä ã
.¨¨ã å
ToList¨¨å í
(¨¨í ì
)¨¨ì î
;¨¨î ï
return
≠≠ 
await
≠≠ 
GetExcludedPeople
≠≠ *
(
≠≠* +%
relatedByDescendantsIds
≠≠+ B
,
≠≠B C
personId
≠≠D L
)
≠≠L M
;
≠≠M N
}
ÆÆ 	
private
∞∞ 
async
∞∞ 
Task
∞∞ 
<
∞∞ 
List
∞∞ 
<
∞∞  
int
∞∞  #
>
∞∞# $
>
∞∞$ %$
GetPeopleWithoutParent
∞∞& <
(
∞∞< =
int
∞∞= @
personId
∞∞A I
)
∞∞I J
{
±± 	
Person
≤≤ 
personToCheck
≤≤  
=
≤≤! "
await
≤≤# (

unitOfWork
≤≤) 3
.
≤≤3 4
Person
≤≤4 :
.
≤≤: ;
FindById
≤≤; C
(
≤≤C D
personId
≤≤D L
)
≤≤L M
;
≤≤M N
List
≥≥ 
<
≥≥ 
int
≥≥ 
>
≥≥ #
childrenWithoutParent
≥≥ +
=
≥≥, -

unitOfWork
≥≥. 8
.
≥≥8 9
Person
≥≥9 ?
.
≥≥? @
Filter
≥≥@ F
(
≥≥F G
(
≥≥G H
person
≥≥H N
)
≥≥N O
=>
≥≥P R
!
≥≥S T
person
≥≥T Z
.
≥≥Z [
Parents
≥≥[ b
.
≥≥b c
Any
≥≥c f
(
≥≥f g
(
≥≥g h
parent
≥≥h n
)
≥≥n o
=>
≥≥p r
parent
≥≥s y
.
≥≥y z
Parent≥≥z Ä
.≥≥Ä Å
Gender≥≥Å á
==≥≥à ä
personToCheck≥≥ã ò
.≥≥ò ô
Gender≥≥ô ü
)≥≥ü †
)≥≥† °
.≥≥° ¢
Include≥≥¢ ©
(≥≥© ™
p≥≥™ ´
=>≥≥¨ Æ
p≥≥Ø ∞
.≥≥∞ ±
Parents≥≥± ∏
)≥≥∏ π
.≥≥π ∫
Select≥≥∫ ¿
(≥≥¿ ¡
(≥≥¡ ¬
person≥≥¬ »
)≥≥» …
=>≥≥  Ã
person≥≥Õ ”
.≥≥” ‘
Id≥≥‘ ÷
)≥≥÷ ◊
.≥≥◊ ÿ
ToList≥≥ÿ ﬁ
(≥≥ﬁ ﬂ
)≥≥ﬂ ‡
;≥≥‡ ·
return
¥¥ #
childrenWithoutParent
¥¥ (
;
¥¥( )
}
µµ 	
private
∑∑ 
async
∑∑ 
Task
∑∑ 
<
∑∑ 
List
∑∑ 
<
∑∑   
GenericPersonModel
∑∑  2
>
∑∑2 3
>
∑∑3 4
GetExcludedPeople
∑∑5 F
(
∑∑F G
List
∑∑G K
<
∑∑K L
int
∑∑L O
>
∑∑O P
includedPeopleIds
∑∑Q b
,
∑∑b c
int
∑∑d g
personId
∑∑h p
)
∑∑p q
{
∏∏ 	
Person
ππ 
person
ππ 
=
ππ 
await
ππ !

unitOfWork
ππ" ,
.
ππ, -
Person
ππ- 3
.
ππ3 4
FindById
ππ4 <
(
ππ< =
personId
ππ= E
)
ππE F
;
ππF G
List
∫∫ 
<
∫∫ 
Person
∫∫ 
>
∫∫ 
peopleInTree
∫∫ %
=
∫∫& '

unitOfWork
∫∫( 2
.
∫∫2 3
Person
∫∫3 9
.
∫∫9 :
Filter
∫∫: @
(
∫∫@ A
x
∫∫A B
=>
∫∫C E
x
∫∫F G
.
∫∫G H
TreeId
∫∫H N
==
∫∫O Q
person
∫∫R X
.
∫∫X Y
TreeId
∫∫Y _
)
∫∫_ `
.
∫∫` a
ToList
∫∫a g
(
∫∫g h
)
∫∫h i
;
∫∫i j
List
ªª 
<
ªª 
Person
ªª 
>
ªª 
excludedPeople
ªª '
=
ªª( )
peopleInTree
ªª* 6
.
ªª6 7
Where
ªª7 <
(
ªª< =
person
ªª= C
=>
ªªD F
!
ªªG H
includedPeopleIds
ªªH Y
.
ªªY Z
Exists
ªªZ `
(
ªª` a
includedPersonId
ªªa q
=>
ªªr t
includedPersonIdªªu Ö
==ªªÜ à
personªªâ è
.ªªè ê
Idªªê í
)ªªí ì
)ªªì î
.ªªî ï
ToListªªï õ
(ªªõ ú
)ªªú ù
;ªªù û
excludedPeople
ºº 
.
ºº 
	RemoveAll
ºº $
(
ºº$ %
relative
ºº% -
=>
ºº. 0
person
ºº1 7
.
ºº7 8
Id
ºº8 :
==
ºº; =
relative
ºº> F
.
ººF G
Id
ººG I
)
ººI J
;
ººJ K
return
ΩΩ 
await
ΩΩ %
MapToGenericPersonModel
ΩΩ 0
(
ΩΩ0 1
excludedPeople
ΩΩ1 ?
)
ΩΩ? @
;
ΩΩ@ A
}
ææ 	
private
¿¿ 
async
¿¿ 
Task
¿¿ 
<
¿¿ 
List
¿¿ 
<
¿¿   
GenericPersonModel
¿¿  2
>
¿¿2 3
>
¿¿3 4%
MapToGenericPersonModel
¿¿5 L
(
¿¿L M
List
¿¿M Q
<
¿¿Q R
Person
¿¿R X
>
¿¿X Y
people
¿¿Z `
)
¿¿` a
{
¡¡ 	
List
¬¬ 
<
¬¬  
GenericPersonModel
¬¬ #
>
¬¬# $
returnEvent
¬¬% 0
=
¬¬1 2
new
¬¬3 6
List
¬¬7 ;
<
¬¬; < 
GenericPersonModel
¬¬< N
>
¬¬N O
(
¬¬O P
)
¬¬P Q
;
¬¬Q R
foreach
√√ 
(
√√ 
var
√√ 
person
√√ 
in
√√  "
people
√√# )
)
√√) *
{
ƒƒ  
GenericPersonModel
≈≈ "
returnPerson
≈≈# /
=
≈≈0 1
_mapper
≈≈2 9
.
≈≈9 :
Map
≈≈: =
<
≈≈= > 
GenericPersonModel
≈≈> P
>
≈≈P Q
(
≈≈Q R
person
≈≈R X
)
≈≈X Y
;
≈≈Y Z
returnPerson
∆∆ 
.
∆∆ 
	ImageFile
∆∆ &
=
∆∆' (
await
∆∆) .$
_fileManagementService
∆∆/ E
.
∆∆E F
GetFile
∆∆F M
(
∆∆M N
person
∆∆N T
.
∆∆T U
Image
∆∆U Z
)
∆∆Z [
;
∆∆[ \
returnEvent
«« 
.
«« 
Add
«« 
(
««  
returnPerson
««  ,
)
««, -
;
««- .
}
»» 
return
…… 
returnEvent
…… 
;
…… 
}
   	
public
ÃÃ 
async
ÃÃ 
Task
ÃÃ 
<
ÃÃ %
ParentChildDetailsModel
ÃÃ 1
>
ÃÃ1 2!
GetParentChildAsync
ÃÃ3 F
(
ÃÃF G
int
ÃÃG J
parentChildId
ÃÃK X
)
ÃÃX Y
{
ÕÕ 	
ParentChild
ŒŒ 
parentChild
ŒŒ #
=
ŒŒ$ %
await
ŒŒ& +

unitOfWork
ŒŒ, 6
.
ŒŒ6 7
ParentChild
ŒŒ7 B
.
ŒŒB C
FindById
ŒŒC K
(
ŒŒK L
parentChildId
ŒŒL Y
)
ŒŒY Z
;
ŒŒZ [%
ParentChildDetailsModel
œœ #
returnEvent
œœ$ /
=
œœ0 1
_mapper
œœ2 9
.
œœ9 :
Map
œœ: =
<
œœ= >%
ParentChildDetailsModel
œœ> U
>
œœU V
(
œœV W
parentChild
œœW b
)
œœb c
;
œœc d
return
–– 
returnEvent
–– 
;
–– 
}
—— 	
public
”” 
async
”” 
Task
”” 
<
”” %
ParentChildDetailsModel
”” 1
>
””1 2!
AddParentChildAsync
””3 F
(
””F G*
ParentChildCreateUpdateModel
””G c
parentChild
””d o
)
””o p
{
‘‘ 	
if
’’ 
(
’’ 
parentChild
’’ 
==
’’ 
null
’’ #
)
’’# $
{
÷÷ 
return
◊◊ 
null
◊◊ 
;
◊◊ 
}
ÿÿ 
ParentChild
ŸŸ 
parentChildEntity
ŸŸ )
=
ŸŸ* +
_mapper
ŸŸ, 3
.
ŸŸ3 4
Map
ŸŸ4 7
<
ŸŸ7 8
ParentChild
ŸŸ8 C
>
ŸŸC D
(
ŸŸD E
parentChild
ŸŸE P
)
ŸŸP Q
;
ŸŸQ R
parentChildEntity
⁄⁄ 
.
⁄⁄ 
	CreatedOn
⁄⁄ '
=
⁄⁄( )
DateTime
⁄⁄* 2
.
⁄⁄2 3
UtcNow
⁄⁄3 9
;
⁄⁄9 :
parentChildEntity
€€ 
=
€€ 
await
€€  %

unitOfWork
€€& 0
.
€€0 1
ParentChild
€€1 <
.
€€< =
Create
€€= C
(
€€C D
parentChildEntity
€€D U
)
€€U V
;
€€V W%
ParentChildDetailsModel
‹‹ #
returnEvent
‹‹$ /
=
‹‹0 1
_mapper
‹‹2 9
.
‹‹9 :
Map
‹‹: =
<
‹‹= >%
ParentChildDetailsModel
‹‹> U
>
‹‹U V
(
‹‹V W
parentChildEntity
‹‹W h
)
‹‹h i
;
‹‹i j
return
›› 
returnEvent
›› 
;
›› 
}
ﬁﬁ 	
public
‡‡ 
async
‡‡ 
Task
‡‡ 
<
‡‡ %
ParentChildDetailsModel
‡‡ 1
>
‡‡1 2$
UpdateParentChildAsync
‡‡3 I
(
‡‡I J*
ParentChildCreateUpdateModel
‡‡J f
parentChild
‡‡g r
)
‡‡r s
{
·· 	
if
‚‚ 
(
‚‚ 
parentChild
‚‚ 
==
‚‚ 
null
‚‚ #
)
‚‚# $
{
„„ 
return
‰‰ 
null
‰‰ 
;
‰‰ 
}
ÂÂ 
ParentChild
ÁÁ 
parentChildInDb
ÁÁ '
=
ÁÁ( )
await
ÁÁ* /

unitOfWork
ÁÁ0 :
.
ÁÁ: ;
ParentChild
ÁÁ; F
.
ÁÁF G
FindById
ÁÁG O
(
ÁÁO P
parentChild
ÁÁP [
.
ÁÁ[ \

RelativeId
ÁÁ\ f
)
ÁÁf g
;
ÁÁg h
if
ÈÈ 
(
ÈÈ 
parentChildInDb
ÈÈ 
==
ÈÈ  "
null
ÈÈ# '
)
ÈÈ' (
{
ÍÍ 
return
ÎÎ 
null
ÎÎ 
;
ÎÎ 
}
ÏÏ 
parentChildInDb
ÓÓ 
.
ÓÓ 
ChildId
ÓÓ #
=
ÓÓ$ %
parentChild
ÓÓ& 1
.
ÓÓ1 2
ChildId
ÓÓ2 9
;
ÓÓ9 :
parentChildInDb
ÔÔ 
.
ÔÔ 
ParentId
ÔÔ $
=
ÔÔ% &
parentChild
ÔÔ' 2
.
ÔÔ2 3
ParentId
ÔÔ3 ;
;
ÔÔ; <
parentChildInDb
 
.
 
BloodRelatives
 *
=
+ ,
parentChild
- 8
.
8 9
BloodRelatives
9 G
;
G H
parentChildInDb
ÒÒ 
.
ÒÒ 

ModifiedOn
ÒÒ &
=
ÒÒ' (
DateTime
ÒÒ) 1
.
ÒÒ1 2
UtcNow
ÒÒ2 8
;
ÒÒ8 9
ParentChild
ÛÛ 
parentChildEntity
ÛÛ )
=
ÛÛ* +
await
ÛÛ, 1

unitOfWork
ÛÛ2 <
.
ÛÛ< =
ParentChild
ÛÛ= H
.
ÛÛH I
Update
ÛÛI O
(
ÛÛO P
parentChildInDb
ÛÛP _
)
ÛÛ_ `
;
ÛÛ` a%
ParentChildDetailsModel
ÙÙ #
returnEvent
ÙÙ$ /
=
ÙÙ0 1
_mapper
ÙÙ2 9
.
ÙÙ9 :
Map
ÙÙ: =
<
ÙÙ= >%
ParentChildDetailsModel
ÙÙ> U
>
ÙÙU V
(
ÙÙV W
parentChildEntity
ÙÙW h
)
ÙÙh i
;
ÙÙi j
return
ıı 
returnEvent
ıı 
;
ıı 
}
ˆˆ 	
public
¯¯ 
async
¯¯ 
Task
¯¯ 
<
¯¯ %
ParentChildDetailsModel
¯¯ 1
>
¯¯1 2$
DeleteParentChildAsync
¯¯3 I
(
¯¯I J
int
¯¯J M
parentChildId
¯¯N [
)
¯¯[ \
{
˘˘ 	
ParentChild
˙˙ 
educationEntity
˙˙ '
=
˙˙( )
await
˙˙* /

unitOfWork
˙˙0 :
.
˙˙: ;
ParentChild
˙˙; F
.
˙˙F G
Delete
˙˙G M
(
˙˙M N
parentChildId
˙˙N [
)
˙˙[ \
;
˙˙\ ]%
ParentChildDetailsModel
˚˚ #
returnEvent
˚˚$ /
=
˚˚0 1
_mapper
˚˚2 9
.
˚˚9 :
Map
˚˚: =
<
˚˚= >%
ParentChildDetailsModel
˚˚> U
>
˚˚U V
(
˚˚V W
educationEntity
˚˚W f
)
˚˚f g
;
˚˚g h
return
¸¸ 
returnEvent
¸¸ 
;
¸¸ 
}
˝˝ 	
}
˛˛ 
}ˇˇ ˙ú
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
public 
PersonService 
( 
IUnitOfWork (

unitOfWork) 3
,3 4
IMapper5 <
mapper= C
,C D
IImageServiceE R
imageServiceS _
,_ `"
IFileManagementServicea w"
fileManagementService	x ç
,
ç é!
IParentChildService
è ¢ 
parentChildService
£ µ
,
µ ∂
IMarriageService
∑ «
marriageService
» ◊
)
◊ ÿ
:
Ÿ ⁄
base
€ ﬂ
(
ﬂ ‡

unitOfWork
‡ Í
)
Í Î
{ 	
_mapper 
= 
mapper 
; 
_imageService 
= 
imageService (
;( )"
_fileManagementService "
=# $!
fileManagementService% :
;: ;
_parentChildService 
=  !
parentChildService" 4
;4 5
_marriageService 
= 
marriageService .
;. /
} 	
public   
async   
Task   
<   
PersonDetailsModel   ,
>  , -
GetPersonAsync  . <
(  < =
int  = @
personId  A I
)  I J
{!! 	
Person"" 
person"" 
="" 
await"" !

unitOfWork""" ,
."", -
Person""- 3
.""3 4
FindById""4 <
(""< =
personId""= E
)""E F
;""F G
PersonDetailsModel## 
personEntity## +
=##, -
_mapper##. 5
.##5 6
Map##6 9
<##9 :
PersonDetailsModel##: L
>##L M
(##M N
person##N T
)##T U
;##U V
personEntity$$ 
.$$ 
	Marriages$$ "
=$$# $
await$$% *
_marriageService$$+ ;
.$$; <$
GetAllMarriagesForPerson$$< T
($$T U
personId$$U ]
)$$] ^
;$$^ _
personEntity&& 
.&& 
Children&& !
=&&" #
await&&$ )
_parentChildService&&* =
.&&= >#
GetAllChildrenForPerson&&> U
(&&U V
personId&&V ^
)&&^ _
;&&_ `
foreach'' 
('' 
var'' 
child'' 
in'' !
personEntity''" .
.''. /
Children''/ 7
)''7 8
{(( 
child)) 
.)) 
	ImageFile)) 
=))  !
await))" '"
_fileManagementService))( >
.))> ?
GetFile))? F
())F G
await))G L
_imageService))M Z
.))Z [
GetImageAsync))[ h
())h i
child))i n
.))n o
ImageId))o v
)))v w
)))w x
;))x y
}** 
personEntity++ 
.++ 
Parents++  
=++! "
await++# (
_parentChildService++) <
.++< ="
GetAllParentsForPerson++= S
(++S T
personId++T \
)++\ ]
;++] ^
foreach-- 
(-- 
var-- 
parent-- 
in--  "
personEntity--# /
.--/ 0
Parents--0 7
)--7 8
{.. 
parent// 
.// 
	ImageFile//  
=//! "
await//# ("
_fileManagementService//) ?
.//? @
GetFile//@ G
(//G H
await//H M
_imageService//N [
.//[ \
GetImageAsync//\ i
(//i j
parent//j p
.//p q
ImageId//q x
)//x y
)//y z
;//z {
}00 
personEntity11 
.11 
	ImageFile11 "
=11# $
await11% *"
_fileManagementService11+ A
.11A B
GetFile11B I
(11I J
person11J P
.11P Q
Image11Q V
)11V W
;11W X
if22 
(22 
person22 
.22 
RelativeForPerson22 (
!=22) +
null22, 0
)220 1
{33 
personEntity44 
.44 
UserId44 #
=44$ %
person44& ,
.44, -
RelativeForPerson44- >
.44> ?
RelativeUserId44? M
;44M N
}55 
else66 
{77 
User88 
user88 
=88 

unitOfWork88 &
.88& '
User88' +
.88+ ,
Filter88, 2
(882 3
u883 4
=>885 7
u888 9
.889 :
PersonId88: B
==88C E
person88F L
.88L M
Id88M O
)88O P
.88P Q
FirstOrDefault88Q _
(88_ `
)88` a
;88a b
if99 
(99 
user99 
!=99 
default99 #
(99# $
User99$ (
)99( )
)99) *
{:: 
personEntity;;  
.;;  !
UserId;;! '
=;;( )
user;;* .
.;;. /
Id;;/ 1
;;;1 2
}<< 
}== 
return>> 
personEntity>> 
;>>  
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
ListAA 
<AA 
GenericPersonModelAA 1
>AA1 2
>AA2 3
GetPeopleListInTreeAA4 G
(AAG H
GuidAAH L
treeIdAAM S
)AAS T
{BB 	
ListCC 
<CC 
PersonCC 
>CC 

poepleListCC #
=CC$ %

unitOfWorkCC& 0
.CC0 1
PersonCC1 7
.CC7 8
FilterCC8 >
(CC> ?
pCC? @
=>CCA C
pCCD E
.CCE F
TreeIdCCF L
==CCM O
treeIdCCP V
)CCV W
.DD 
IncludeDD 
(DD 
pDD 
=>DD 
pDD 
.DD  
RelativeForPersonDD  1
)DD1 2
.DD2 3
ToListDD3 9
(DD9 :
)DD: ;
;DD; <
ListEE 
<EE 
GenericPersonModelEE #
>EE# $
returnPeopleListEE% 5
=EE6 7
newEE8 ;
ListEE< @
<EE@ A
GenericPersonModelEEA S
>EES T
(EET U
)EEU V
;EEV W
UserFF 
userFF 
=FF 

unitOfWorkFF "
.FF" #
UserFF# '
.FF' (
FilterFF( .
(FF. /
uFF/ 0
=>FF1 3
uFF4 5
.FF5 6
PersonFF6 <
.FF< =
TreeIdFF= C
==FFD F
treeIdFFG M
)FFM N
.FFN O
FirstOrDefaultFFO ]
(FF] ^
)FF^ _
;FF_ `
foreachGG 
(GG 
varGG 
personGG 
inGG  "

poepleListGG# -
)GG- .
{HH 
GenericPersonModelII "
returnPersonII# /
=II0 1
_mapperII2 9
.II9 :
MapII: =
<II= >
GenericPersonModelII> P
>IIP Q
(IIQ R
personIIR X
)IIX Y
;IIY Z
returnPersonJJ 
.JJ 
	ImageFileJJ &
=JJ' (
awaitJJ) ."
_fileManagementServiceJJ/ E
.JJE F
GetFileJJF M
(JJM N
personJJN T
.JJT U
ImageJJU Z
)JJZ [
;JJ[ \
ifKK 
(KK 
personKK 
.KK 
RelativeForPersonKK ,
!=KK- /
nullKK0 4
)KK4 5
{LL 
returnPersonMM  
.MM  !
UserIdMM! '
=MM( )
personMM* 0
.MM0 1
RelativeForPersonMM1 B
.MMB C
RelativeUserIdMMC Q
;MMQ R
}NN 
ifOO 
(OO 
userOO 
!=OO 
nullOO  
&&OO! #
personOO$ *
.OO* +
IdOO+ -
==OO. 0
userOO1 5
.OO5 6
PersonIdOO6 >
)OO> ?
{PP 
returnPersonQQ  
.QQ  !
UserIdQQ! '
=QQ( )
userQQ* .
.QQ. /
IdQQ/ 1
;QQ1 2
}RR 
returnPeopleListSS  
.SS  !
AddSS! $
(SS$ %
returnPersonSS% 1
)SS1 2
;SS2 3
}TT 
returnUU 
returnPeopleListUU #
;UU# $
}VV 	
publicXX 
asyncXX 
TaskXX 
<XX 
ListXX 
<XX 
PersonTreeInfoModelXX 2
>XX2 3
>XX3 4#
GetPeopleTreeDataInTreeXX5 L
(XXL M
GuidXXM Q
treeIdXXR X
)XXX Y
{YY 	
ListZZ 
<ZZ 
PersonZZ 
>ZZ 

poepleListZZ #
=ZZ$ %

unitOfWorkZZ& 0
.ZZ0 1
PersonZZ1 7
.ZZ7 8
FilterZZ8 >
(ZZ> ?
pZZ? @
=>ZZA C
pZZD E
.ZZE F
TreeIdZZF L
==ZZM O
treeIdZZP V
)ZZV W
.[[ 
Include[[ 
([[ 
p[[ 
=>[[ 
p[[ 
.[[  
Parents[[  '
)[[' (
.\\ 
ThenInclude\\ 
(\\ 
p\\ 
=>\\ !
p\\" #
.\\# $
Parent\\$ *
)\\* +
.]] 
Include]] 
(]] 
p]] 
=>]] 
p]] 
.]]   
FirstPersonMarriages]]  4
)]]4 5
.^^ 
Include^^ 
(^^ 
p^^ 
=>^^ 
p^^ 
.^^  !
SecondPersonMarriages^^  5
)^^5 6
.__ 
Include__ 
(__ 
p__ 
=>__ 
p__ 
.__  
RelativeForPerson__  1
)__1 2
.__2 3
ToList__3 9
(__9 :
)__: ;
;__; <
List`` 
<`` 
PersonTreeInfoModel`` $
>``$ % 
returnPeopleTreeData``& :
=``; <
new``= @
List``A E
<``E F
PersonTreeInfoModel``F Y
>``Y Z
(``Z [
)``[ \
;``\ ]
Useraa 
useraa 
=aa 

unitOfWorkaa "
.aa" #
Useraa# '
.aa' (
Filteraa( .
(aa. /
uaa/ 0
=>aa1 3
uaa4 5
.aa5 6
Personaa6 <
.aa< =
TreeIdaa= C
==aaD F
treeIdaaG M
)aaM N
.aaN O
FirstOrDefaultaaO ]
(aa] ^
)aa^ _
;aa_ `
foreachcc 
(cc 
varcc 
personcc 
incc  "

poepleListcc# -
)cc- .
{dd 
PersonTreeInfoModelee #
returnPersonee$ 0
=ee1 2
MapPersonInfoee3 @
(ee@ A
personeeA G
)eeG H
;eeH I
returnPersonff 
.ff 
	ImageFileff &
=ff' (
awaitff) ."
_fileManagementServiceff/ E
.ffE F
GetFileffF M
(ffM N
personffN T
.ffT U
ImageffU Z
)ffZ [
;ff[ \
ifgg 
(gg 
persongg 
.gg 
RelativeForPersongg ,
!=gg- /
nullgg0 4
)gg4 5
{hh 
returnPersonii  
.ii  !
UserIdii! '
=ii( )
personii* 0
.ii0 1
RelativeForPersonii1 B
.iiB C
RelativeUserIdiiC Q
;iiQ R
}jj 
ifkk 
(kk 
userkk 
!=kk 
nullkk  
&&kk! #
personkk$ *
.kk* +
Idkk+ -
==kk. 0
userkk1 5
.kk5 6
PersonIdkk6 >
)kk> ?
{ll 
returnPersonmm  
.mm  !
UserIdmm! '
=mm( )
usermm* .
.mm. /
Idmm/ 1
;mm1 2
}nn  
returnPeopleTreeDataoo $
.oo$ %
Addoo% (
(oo( )
returnPersonoo) 5
)oo5 6
;oo6 7
}pp  
returnPeopleTreeDataqq  
=qq! "#
AddPartnersToPeopleListqq# :
(qq: ; 
returnPeopleTreeDataqq; O
)qqO P
;qqP Q
returnrr  
returnPeopleTreeDatarr '
;rr' (
}ss 	
publicuu 
asyncuu 
Taskuu 
<uu 
Listuu 
<uu 
EventInTreeModeluu /
>uu/ 0
>uu0 1
GetEventsInTreeuu2 A
(uuA B
GuiduuB F
treeIduuG M
)uuM N
{vv 	
Listww 
<ww 
Personww 
>ww 

poepleListww #
=ww$ %

unitOfWorkww& 0
.ww0 1
Personww1 7
.ww7 8
Filterww8 >
(ww> ?
pww? @
=>wwA C
pwwD E
.wwE F
TreeIdwwF L
==wwM O
treeIdwwP V
&&wwW Y
pwwZ [
.ww[ \
	DeathDateww\ e
==wwf h
nullwwi m
)wwm n
.wwn o
ToListwwo u
(wwu v
)wwv w
;www x
Listxx 
<xx 
EventInTreeModelxx !
>xx! "
returnEventsListxx# 3
=xx4 5
newxx6 9
Listxx: >
<xx> ?
EventInTreeModelxx? O
>xxO P
(xxP Q
)xxQ R
;xxR S
foreachyy 
(yy 
varyy 
personyy 
inyy  "

poepleListyy# -
)yy- .
{zz 
if{{ 
({{ 
person{{ 
.{{ 
	BirthDate{{ $
.{{$ %
HasValue{{% -
){{- .
{|| 
returnEventsList}} $
.}}$ %
Add}}% (
(}}( )
new}}) ,
EventInTreeModel}}- =
(}}= >
)}}> ?
{~~ 
Date 
= 
(  
DateTime  (
)( )
person) /
./ 0
	BirthDate0 9
,9 :
	EventType
ÄÄ !
=
ÄÄ" #
$str
ÄÄ$ .
,
ÄÄ. /
AffectedPeople
ÅÅ &
=
ÅÅ' (
await
ÅÅ) .,
MapAffectedPersonBirthdayEvent
ÅÅ/ M
(
ÅÅM N
person
ÅÅN T
)
ÅÅT U
}
ÇÇ 
)
ÇÇ 
;
ÇÇ 
}
ÉÉ 
}
ÑÑ 
List
ÖÖ 
<
ÖÖ 
Marriage
ÖÖ 
>
ÖÖ 
	marriages
ÖÖ $
=
ÖÖ% &

unitOfWork
ÖÖ' 1
.
ÖÖ1 2
Marriage
ÖÖ2 :
.
ÖÖ: ;
Filter
ÖÖ; A
(
ÖÖA B
x
ÖÖB C
=>
ÖÖD F
x
ÖÖG H
.
ÖÖH I
FirstPerson
ÖÖI T
.
ÖÖT U
TreeId
ÖÖU [
==
ÖÖ\ ^
treeId
ÖÖ_ e
&&
ÖÖf h
x
ÖÖi j
.
ÖÖj k
SecondPerson
ÖÖk w
.
ÖÖw x
TreeId
ÖÖx ~
==ÖÖ Å
treeIdÖÖÇ à
&&ÖÖâ ã
xÖÖå ç
.ÖÖç é
EndDateÖÖé ï
==ÖÖñ ò
nullÖÖô ù
)ÖÖù û
.
ÜÜ 
Include
ÜÜ 
(
ÜÜ 
x
ÜÜ 
=>
ÜÜ 
x
ÜÜ 
.
ÜÜ  
FirstPerson
ÜÜ  +
)
ÜÜ+ ,
.
áá 
Include
áá 
(
áá 
x
áá 
=>
áá 
x
áá 
.
áá  
SecondPerson
áá  ,
)
áá, -
.
àà 
ToList
àà 
(
àà 
)
àà 
;
àà 
foreach
ââ 
(
ââ 
var
ââ 
marriage
ââ !
in
ââ" $
	marriages
ââ% .
)
ââ. /
{
ää "
MarriageDetailsModel
ãã $
returnMarriage
ãã% 3
=
ãã4 5
_mapper
ãã6 =
.
ãã= >
Map
ãã> A
<
ããA B"
MarriageDetailsModel
ããB V
>
ããV W
(
ããW X
marriage
ããX `
)
ãã` a
;
ããa b
returnMarriage
åå 
.
åå 
PersonMarriedTo
åå .
.
åå. /
	ImageFile
åå/ 8
=
åå9 :
await
åå; @$
_fileManagementService
ååA W
.
ååW X
GetFile
ååX _
(
åå_ `
marriage
åå` h
.
ååh i
FirstPerson
ååi t
!=
ååu w
null
ååx |
?
åå} ~
marriageåå á
.ååá à
FirstPersonååà ì
.ååì î
Imageååî ô
:ååö õ
marriageååú §
.åå§ •
SecondPersonåå• ±
.åå± ≤
Imageåå≤ ∑
)åå∑ ∏
;åå∏ π
returnEventsList
çç  
.
çç  !
Add
çç! $
(
çç$ %
new
çç% (
EventInTreeModel
çç) 9
(
çç9 :
)
çç: ;
{
éé 
Date
èè 
=
èè 
marriage
èè #
.
èè# $
	StartDate
èè$ -
,
èè- .
	EventType
êê 
=
êê 
$str
êê  *
,
êê* +
AffectedPeople
ëë "
=
ëë# $
await
ëë% *1
#MapAffectedMarriageAnniversaryEvent
ëë+ N
(
ëëN O
marriage
ëëO W
)
ëëW X
}
íí 
)
íí 
;
íí 
}
ìì 
return
îî 
returnEventsList
îî #
;
îî# $
}
ïï 	
public
óó 
async
óó 
Task
óó 
<
óó 
List
óó 
<
óó  
GenericPersonModel
óó 1
>
óó1 2
>
óó2 3&
GetPeopleWithoutRelative
óó4 L
(
óóL M
Guid
óóM Q
treeId
óóR X
)
óóX Y
{
òò 	
List
ôô 
<
ôô 
Person
ôô 
>
ôô 

poepleList
ôô #
=
ôô$ %

unitOfWork
ôô& 0
.
ôô0 1
Person
ôô1 7
.
ôô7 8
Filter
ôô8 >
(
ôô> ?
p
ôô? @
=>
ôôA C
p
ôôD E
.
ôôE F
TreeId
ôôF L
==
ôôM O
treeId
ôôP V
&&
ôôW Y
p
ôôZ [
.
ôô[ \
RelativeForPerson
ôô\ m
==
ôôn p
null
ôôq u
)
ôôu v
.
ôôv w
Include
ôôw ~
(
ôô~ 
pôô Ä
=>ôôÅ É
pôôÑ Ö
.ôôÖ Ü!
RelativeForPersonôôÜ ó
)ôôó ò
.ôôò ô
ToListôôô ü
(ôôü †
)ôô† °
;ôô° ¢
List
öö 
<
öö  
GenericPersonModel
öö #
>
öö# $
returnPeopleList
öö% 5
=
öö6 7
new
öö8 ;
List
öö< @
<
öö@ A 
GenericPersonModel
ööA S
>
ööS T
(
ööT U
)
ööU V
;
ööV W
User
õõ 
user
õõ 
=
õõ 

unitOfWork
õõ "
.
õõ" #
User
õõ# '
.
õõ' (
Filter
õõ( .
(
õõ. /
u
õõ/ 0
=>
õõ1 3
u
õõ4 5
.
õõ5 6
Person
õõ6 <
.
õõ< =
TreeId
õõ= C
==
õõD F
treeId
õõG M
)
õõM N
.
õõN O
FirstOrDefault
õõO ]
(
õõ] ^
)
õõ^ _
;
õõ_ `
foreach
úú 
(
úú 
var
úú 
person
úú 
in
úú  "

poepleList
úú# -
)
úú- .
{
ùù 
if
ûû 
(
ûû 
user
ûû 
!=
ûû 
null
ûû  
&&
ûû! #
person
ûû$ *
.
ûû* +
Id
ûû+ -
!=
ûû. 0
user
ûû1 5
.
ûû5 6
PersonId
ûû6 >
)
ûû> ?
{
üü  
GenericPersonModel
†† &
returnPerson
††' 3
=
††4 5
_mapper
††6 =
.
††= >
Map
††> A
<
††A B 
GenericPersonModel
††B T
>
††T U
(
††U V
person
††V \
)
††\ ]
;
††] ^
returnPerson
°°  
.
°°  !
	ImageFile
°°! *
=
°°+ ,
await
°°- 2$
_fileManagementService
°°3 I
.
°°I J
GetFile
°°J Q
(
°°Q R
person
°°R X
.
°°X Y
Image
°°Y ^
)
°°^ _
;
°°_ `
returnPeopleList
¢¢ $
.
¢¢$ %
Add
¢¢% (
(
¢¢( )
returnPerson
¢¢) 5
)
¢¢5 6
;
¢¢6 7
}
££ 
}
§§ 
return
•• 
returnPeopleList
•• #
;
••# $
}
¶¶ 	
private
®® 
async
®® 
Task
®® 
<
®® 
List
®® 
<
®®  
PersonBaseModel
®®  /
>
®®/ 0
>
®®0 11
#MapAffectedMarriageAnniversaryEvent
®®2 U
(
®®U V
Marriage
®®V ^
marriage
®®_ g
)
®®g h
{
©© 	
List
™™ 
<
™™ 
PersonBaseModel
™™  
>
™™  !

peopleList
™™" ,
=
™™- .
new
™™/ 2
List
™™3 7
<
™™7 8
PersonBaseModel
™™8 G
>
™™G H
(
™™H I
)
™™I J
;
™™J K

peopleList
´´ 
.
´´ 
Add
´´ 
(
´´ 
await
´´  "
MapToPersonBaseModel
´´! 5
(
´´5 6
marriage
´´6 >
.
´´> ?
FirstPerson
´´? J
)
´´J K
)
´´K L
;
´´L M

peopleList
¨¨ 
.
¨¨ 
Add
¨¨ 
(
¨¨ 
await
¨¨  "
MapToPersonBaseModel
¨¨! 5
(
¨¨5 6
marriage
¨¨6 >
.
¨¨> ?
SecondPerson
¨¨? K
)
¨¨K L
)
¨¨L M
;
¨¨M N
return
≠≠ 

peopleList
≠≠ 
;
≠≠ 
}
ÆÆ 	
private
∞∞ 
async
∞∞ 
Task
∞∞ 
<
∞∞ 
List
∞∞ 
<
∞∞  
PersonBaseModel
∞∞  /
>
∞∞/ 0
>
∞∞0 1,
MapAffectedPersonBirthdayEvent
∞∞2 P
(
∞∞P Q
Person
∞∞Q W
person
∞∞X ^
)
∞∞^ _
{
±± 	
List
≤≤ 
<
≤≤ 
PersonBaseModel
≤≤  
>
≤≤  !

peopleList
≤≤" ,
=
≤≤- .
new
≤≤/ 2
List
≤≤3 7
<
≤≤7 8
PersonBaseModel
≤≤8 G
>
≤≤G H
(
≤≤H I
)
≤≤I J
;
≤≤J K

peopleList
≥≥ 
.
≥≥ 
Add
≥≥ 
(
≥≥ 
await
≥≥  "
MapToPersonBaseModel
≥≥! 5
(
≥≥5 6
person
≥≥6 <
)
≥≥< =
)
≥≥= >
;
≥≥> ?
return
¥¥ 

peopleList
¥¥ 
;
¥¥ 
}
µµ 	
private
∑∑ 
async
∑∑ 
Task
∑∑ 
<
∑∑ 
PersonBaseModel
∑∑ *
>
∑∑* +"
MapToPersonBaseModel
∑∑, @
(
∑∑@ A
Person
∑∑A G
person
∑∑H N
)
∑∑N O
{
∏∏ 	
return
ππ 
new
ππ 
PersonBaseModel
ππ &
(
ππ& '
)
ππ' (
{
∫∫ 
	FirstName
ªª 
=
ªª 
person
ªª "
.
ªª" #
	FirstName
ªª# ,
,
ªª, -
LastName
ºº 
=
ºº 
person
ºº !
.
ºº! "
LastName
ºº" *
,
ºº* +
PersonId
ΩΩ 
=
ΩΩ 
person
ΩΩ !
.
ΩΩ! "
Id
ΩΩ" $
,
ΩΩ$ %
	ImageFile
ææ 
=
ææ 
person
ææ "
.
ææ" #
ImageId
ææ# *
!=
ææ+ -
null
ææ. 2
?
ææ3 4
await
ææ5 :$
_fileManagementService
ææ; Q
.
ææQ R
GetFile
ææR Y
(
ææY Z
await
ææZ _
_imageService
ææ` m
.
ææm n
GetImageAsync
ææn {
(
ææ{ |
personææ| Ç
.ææÇ É
ImageIdææÉ ä
)ææä ã
)ææã å
:ææç é
nullææè ì
}
øø 
;
øø 
}
¿¿ 	
private
√√ !
PersonTreeInfoModel
√√ #
MapPersonInfo
√√$ 1
(
√√1 2
Person
√√2 8
person
√√9 ?
)
√√? @
{
ƒƒ 	!
PersonTreeInfoModel
≈≈ 
returnPerson
≈≈  ,
=
≈≈- .
_mapper
≈≈/ 6
.
≈≈6 7
Map
≈≈7 :
<
≈≈: ;!
PersonTreeInfoModel
≈≈; N
>
≈≈N O
(
≈≈O P
person
≈≈P V
)
≈≈V W
;
≈≈W X
foreach
∆∆ 
(
∆∆ 
var
∆∆ 
parent
∆∆ 
in
∆∆  "
person
∆∆# )
.
∆∆) *
Parents
∆∆* 1
)
∆∆1 2
{
«« 
if
»» 
(
»» 
parent
»» 
.
»» 
Parent
»» !
.
»»! "
Gender
»»" (
==
»») +
$char
»», /
)
»»/ 0
{
…… 
returnPerson
    
.
    !
FatherId
  ! )
=
  * +
parent
  , 2
.
  2 3
ParentId
  3 ;
;
  ; <
}
ÀÀ 
if
ÃÃ 
(
ÃÃ 
parent
ÃÃ 
.
ÃÃ 
Parent
ÃÃ !
.
ÃÃ! "
Gender
ÃÃ" (
==
ÃÃ) +
$char
ÃÃ, /
)
ÃÃ/ 0
{
ÕÕ 
returnPerson
ŒŒ  
.
ŒŒ  !
MotherId
ŒŒ! )
=
ŒŒ* +
parent
ŒŒ, 2
.
ŒŒ2 3
ParentId
ŒŒ3 ;
;
ŒŒ; <
}
œœ 
}
–– 
returnPerson
—— 
.
—— 
PartnersIds
—— $
=
——% &
new
——' *
List
——+ /
<
——/ 0
int
——0 3
>
——3 4
(
——4 5
)
——5 6
;
——6 7
foreach
““ 
(
““ 
var
““ 
marriage
““ !
in
““" $
person
““% +
.
““+ ,"
FirstPersonMarriages
““, @
)
““@ A
{
”” 
returnPerson
‘‘ 
.
‘‘ 
PartnersIds
‘‘ (
.
‘‘( )
Add
‘‘) ,
(
‘‘, -
marriage
‘‘- 5
.
‘‘5 6
SecondPersonId
‘‘6 D
)
‘‘D E
;
‘‘E F
}
’’ 
foreach
÷÷ 
(
÷÷ 
var
÷÷ 
marriage
÷÷ !
in
÷÷" $
person
÷÷% +
.
÷÷+ ,#
SecondPersonMarriages
÷÷, A
)
÷÷A B
{
◊◊ 
returnPerson
ÿÿ 
.
ÿÿ 
PartnersIds
ÿÿ (
.
ÿÿ( )
Add
ÿÿ) ,
(
ÿÿ, -
marriage
ÿÿ- 5
.
ÿÿ5 6
FirstPersonId
ÿÿ6 C
)
ÿÿC D
;
ÿÿD E
}
ŸŸ 
return
⁄⁄ 
returnPerson
⁄⁄ 
;
⁄⁄  
}
€€ 	
private
›› 
static
›› 
List
›› 
<
›› !
PersonTreeInfoModel
›› /
>
››/ 0%
AddPartnersToPeopleList
››1 H
(
››H I
List
››I M
<
››M N!
PersonTreeInfoModel
››N a
>
››a b

peopleList
››c m
)
››m n
{
ﬁﬁ 	
List
ﬂﬂ 
<
ﬂﬂ !
PersonTreeInfoModel
ﬂﬂ $
>
ﬂﬂ$ %
updatedList
ﬂﬂ& 1
=
ﬂﬂ2 3
new
ﬂﬂ4 7
List
ﬂﬂ8 <
<
ﬂﬂ< =!
PersonTreeInfoModel
ﬂﬂ= P
>
ﬂﬂP Q
(
ﬂﬂQ R
)
ﬂﬂR S
;
ﬂﬂS T
foreach
·· 
(
·· 
var
·· 
person
·· 
in
··  "

peopleList
··# -
)
··- .
{
‚‚ 
if
„„ 
(
„„ 
updatedList
„„ 
.
„„  
	FindIndex
„„  )
(
„„) *
x
„„* +
=>
„„, .
x
„„/ 0
.
„„0 1
PersonId
„„1 9
==
„„: <
person
„„= C
.
„„C D
PersonId
„„D L
)
„„L M
==
„„N P
-
„„Q R
$num
„„R S
)
„„S T
{
‰‰ 
updatedList
ÂÂ 
.
ÂÂ  
Add
ÂÂ  #
(
ÂÂ# $
person
ÂÂ$ *
)
ÂÂ* +
;
ÂÂ+ ,
}
ÊÊ 
if
ËË 
(
ËË 
person
ËË 
.
ËË 
FatherId
ËË #
!=
ËË$ &
$num
ËË' (
&&
ËË) +
person
ËË, 2
.
ËË2 3
MotherId
ËË3 ;
!=
ËË< >
$num
ËË? @
)
ËË@ A
{
ÈÈ 
UpdateMother
ÍÍ  
(
ÍÍ  !
ref
ÍÍ! $
updatedList
ÍÍ% 0
,
ÍÍ0 1
ref
ÍÍ2 5

peopleList
ÍÍ6 @
,
ÍÍ@ A
person
ÍÍB H
)
ÍÍH I
;
ÍÍI J
UpdateFather
ÏÏ  
(
ÏÏ  !
ref
ÏÏ! $
updatedList
ÏÏ% 0
,
ÏÏ0 1
ref
ÏÏ2 5

peopleList
ÏÏ6 @
,
ÏÏ@ A
person
ÏÏB H
)
ÏÏH I
;
ÏÏI J
}
ÌÌ 
}
ÔÔ 
return
 
updatedList
 
;
 
}
ÒÒ 	
private
ÛÛ 
static
ÛÛ 
void
ÛÛ 
UpdateMother
ÛÛ (
(
ÛÛ( )
ref
ÛÛ) ,
List
ÛÛ- 1
<
ÛÛ1 2!
PersonTreeInfoModel
ÛÛ2 E
>
ÛÛE F
updatedList
ÛÛG R
,
ÛÛR S
ref
ÛÛT W
List
ÛÛX \
<
ÛÛ\ ]!
PersonTreeInfoModel
ÛÛ] p
>
ÛÛp q

peopleList
ÛÛr |
,
ÛÛ| }"
PersonTreeInfoModelÛÛ~ ë
personÛÛí ò
)ÛÛò ô
{
ÙÙ 	!
PersonTreeInfoModel
ıı 
mother
ıı  &
=
ıı' (
updatedList
ıı) 4
.
ıı4 5
Find
ıı5 9
(
ıı9 :
x
ıı: ;
=>
ıı< >
x
ıı? @
.
ıı@ A
PersonId
ııA I
==
ııJ L
person
ııM S
.
ııS T
MotherId
ııT \
)
ıı\ ]
;
ıı] ^
if
ˆˆ 
(
ˆˆ 
mother
ˆˆ 
!=
ˆˆ 
default
ˆˆ !
(
ˆˆ! "!
PersonTreeInfoModel
ˆˆ" 5
)
ˆˆ5 6
)
ˆˆ6 7
{
˜˜ 
updatedList
¯¯ 
.
¯¯ 
Remove
¯¯ "
(
¯¯" #
mother
¯¯# )
)
¯¯) *
;
¯¯* +
}
˘˘ 
else
˙˙ 
{
˚˚ 
mother
¸¸ 
=
¸¸ 

peopleList
¸¸ #
.
¸¸# $
Find
¸¸$ (
(
¸¸( )
x
¸¸) *
=>
¸¸+ -
x
¸¸. /
.
¸¸/ 0
PersonId
¸¸0 8
==
¸¸9 ;
person
¸¸< B
.
¸¸B C
MotherId
¸¸C K
)
¸¸K L
;
¸¸L M
}
˝˝ 
if
˛˛ 
(
˛˛ 
mother
˛˛ 
.
˛˛ 
PartnersIds
˛˛ "
.
˛˛" #
FirstOrDefault
˛˛# 1
(
˛˛1 2
id
˛˛2 4
=>
˛˛5 7
id
˛˛8 :
==
˛˛; =
person
˛˛> D
.
˛˛D E
FatherId
˛˛E M
)
˛˛M N
==
˛˛O Q
$num
˛˛R S
)
˛˛S T
{
ˇˇ 
mother
ÄÄ 
.
ÄÄ 
PartnersIds
ÄÄ "
.
ÄÄ" #
Add
ÄÄ# &
(
ÄÄ& '
person
ÄÄ' -
.
ÄÄ- .
FatherId
ÄÄ. 6
)
ÄÄ6 7
;
ÄÄ7 8
}
ÅÅ 
updatedList
ÇÇ 
.
ÇÇ 
Add
ÇÇ 
(
ÇÇ 
mother
ÇÇ "
)
ÇÇ" #
;
ÇÇ# $
}
ÉÉ 	
private
ÖÖ 
static
ÖÖ 
void
ÖÖ 
UpdateFather
ÖÖ (
(
ÖÖ( )
ref
ÖÖ) ,
List
ÖÖ- 1
<
ÖÖ1 2!
PersonTreeInfoModel
ÖÖ2 E
>
ÖÖE F
updatedList
ÖÖG R
,
ÖÖR S
ref
ÖÖT W
List
ÖÖX \
<
ÖÖ\ ]!
PersonTreeInfoModel
ÖÖ] p
>
ÖÖp q

peopleList
ÖÖr |
,
ÖÖ| }"
PersonTreeInfoModelÖÖ~ ë
personÖÖí ò
)ÖÖò ô
{
ÜÜ 	!
PersonTreeInfoModel
áá 
father
áá  &
=
áá' (
updatedList
áá) 4
.
áá4 5
Find
áá5 9
(
áá9 :
x
áá: ;
=>
áá< >
x
áá? @
.
áá@ A
PersonId
ááA I
==
ááJ L
person
ááM S
.
ááS T
FatherId
ááT \
)
áá\ ]
;
áá] ^
if
àà 
(
àà 
father
àà 
!=
àà 
default
àà !
(
àà! "!
PersonTreeInfoModel
àà" 5
)
àà5 6
)
àà6 7
{
ââ 
updatedList
ää 
.
ää 
Remove
ää "
(
ää" #
father
ää# )
)
ää) *
;
ää* +
}
ãã 
else
åå 
{
çç 
father
éé 
=
éé 

peopleList
éé #
.
éé# $
Find
éé$ (
(
éé( )
x
éé) *
=>
éé+ -
x
éé. /
.
éé/ 0
PersonId
éé0 8
==
éé9 ;
person
éé< B
.
ééB C
FatherId
ééC K
)
ééK L
;
ééL M
}
èè 
if
êê 
(
êê 
father
êê 
.
êê 
PartnersIds
êê "
.
êê" #
FirstOrDefault
êê# 1
(
êê1 2
id
êê2 4
=>
êê5 7
id
êê8 :
==
êê; =
person
êê> D
.
êêD E
MotherId
êêE M
)
êêM N
==
êêO Q
default
êêR Y
(
êêY Z
int
êêZ ]
)
êê] ^
)
êê^ _
{
ëë 
father
íí 
.
íí 
PartnersIds
íí "
.
íí" #
Add
íí# &
(
íí& '
person
íí' -
.
íí- .
MotherId
íí. 6
)
íí6 7
;
íí7 8
}
ìì 
updatedList
îî 
.
îî 
Add
îî 
(
îî 
father
îî "
)
îî" #
;
îî# $
}
ïï 	
public
óó 
async
óó 
Task
óó 
<
óó  
PersonDetailsModel
óó ,
>
óó, -
AddPersonAsync
óó. <
(
óó< =%
PersonCreateUpdateModel
óó= T
person
óóU [
)
óó[ \
{
òò 	
if
ôô 
(
ôô 
person
ôô 
==
ôô 
null
ôô 
)
ôô 
{
öö 
return
õõ 
null
õõ 
;
õõ 
}
úú 
Person
ùù 
personEntity
ùù 
=
ùù  !
await
ùù" '
addLocations
ùù( 4
(
ùù4 5
person
ùù5 ;
)
ùù; <
;
ùù< =
personEntity
ûû 
=
ûû $
removeAttachedEntities
ûû 1
(
ûû1 2
personEntity
ûû2 >
)
ûû> ?
;
ûû? @
personEntity
üü 
.
üü 
	CreatedOn
üü "
=
üü# $
DateTime
üü% -
.
üü- .
UtcNow
üü. 4
;
üü4 5
personEntity
†† 
=
†† 
await
††  

unitOfWork
††! +
.
††+ ,
Person
††, 2
.
††2 3
Create
††3 9
(
††9 :
personEntity
††: F
)
††F G
;
††G H 
PersonDetailsModel
°° 
returnEvent
°° *
=
°°+ ,
_mapper
°°- 4
.
°°4 5
Map
°°5 8
<
°°8 9 
PersonDetailsModel
°°9 K
>
°°K L
(
°°L M
personEntity
°°M Y
)
°°Y Z
;
°°Z [
return
¢¢ 
returnEvent
¢¢ 
;
¢¢ 
}
££ 	
private
•• 
static
•• 
Person
•• $
removeAttachedEntities
•• 4
(
••4 5
Person
••5 ;
personEntity
••< H
)
••H I
{
¶¶ 	
personEntity
ßß 
.
ßß 
Nationality
ßß $
=
ßß% &
null
ßß' +
;
ßß+ ,
personEntity
®® 
.
®® 
Religion
®® !
=
®®" #
null
®®$ (
;
®®( )
personEntity
©© 
.
©© 

BirthPlace
©© #
=
©©$ %
null
©©& *
;
©©* +
personEntity
™™ 
.
™™ 
LivingPlace
™™ $
=
™™% &
null
™™' +
;
™™+ ,
personEntity
´´ 
.
´´ 
RelativeForPerson
´´ *
=
´´+ ,
null
´´- 1
;
´´1 2
return
¨¨ 
personEntity
¨¨ 
;
¨¨  
}
≠≠ 	
private
ØØ 
async
ØØ 
Task
ØØ 
<
ØØ 
Person
ØØ !
>
ØØ! "
addLocations
ØØ# /
(
ØØ/ 0%
PersonCreateUpdateModel
ØØ0 G
person
ØØH N
)
ØØN O
{
∞∞ 	
Person
±± 
personEntity
±± 
=
±±  !
_mapper
±±" )
.
±±) *
Map
±±* -
<
±±- .
Person
±±. 4
>
±±4 5
(
±±5 6
person
±±6 <
)
±±< =
;
±±= >
if
≥≥ 
(
≥≥ 
personEntity
≥≥ 
.
≥≥ 
LivingPlace
≥≥ (
==
≥≥) +
null
≥≥, 0
)
≥≥0 1
{
¥¥ 
personEntity
µµ 
.
µµ 
LivingPlace
µµ (
=
µµ) *
new
µµ+ .
Location
µµ/ 7
(
µµ7 8
)
µµ8 9
;
µµ9 :
}
∂∂ 
personEntity
∑∑ 
.
∑∑ 
LivingPlaceId
∑∑ &
=
∑∑' (
(
∑∑) *
await
∑∑* /

unitOfWork
∑∑0 :
.
∑∑: ;
Location
∑∑; C
.
∑∑C D
Create
∑∑D J
(
∑∑J K
personEntity
∑∑K W
.
∑∑W X
LivingPlace
∑∑X c
)
∑∑c d
)
∑∑d e
.
∑∑e f
Id
∑∑f h
;
∑∑h i
if
ππ 
(
ππ 
personEntity
ππ 
.
ππ 

BirthPlace
ππ '
==
ππ( *
null
ππ+ /
)
ππ/ 0
{
∫∫ 
personEntity
ªª 
.
ªª 

BirthPlace
ªª '
=
ªª( )
new
ªª* -
Location
ªª. 6
(
ªª6 7
)
ªª7 8
;
ªª8 9
}
ºº 
personEntity
ΩΩ 
.
ΩΩ 
BirthPlaceId
ΩΩ %
=
ΩΩ& '
(
ΩΩ( )
await
ΩΩ) .

unitOfWork
ΩΩ/ 9
.
ΩΩ9 :
Location
ΩΩ: B
.
ΩΩB C
Create
ΩΩC I
(
ΩΩI J
personEntity
ΩΩJ V
.
ΩΩV W

BirthPlace
ΩΩW a
)
ΩΩa b
)
ΩΩb c
.
ΩΩc d
Id
ΩΩd f
;
ΩΩf g
return
ææ 
personEntity
ææ 
;
ææ  
}
øø 	
public
¡¡ 
async
¡¡ 
Task
¡¡ 
<
¡¡  
PersonDetailsModel
¡¡ ,
>
¡¡, -
UpdatePersonAsync
¡¡. ?
(
¡¡? @%
PersonCreateUpdateModel
¡¡@ W
person
¡¡X ^
)
¡¡^ _
{
¬¬ 	
if
√√ 
(
√√ 
person
√√ 
==
√√ 
null
√√ 
)
√√ 
{
ƒƒ 
return
≈≈ 
null
≈≈ 
;
≈≈ 
}
∆∆ 
Person
»» 

personInDb
»» 
=
»» 
await
»»  %

unitOfWork
»»& 0
.
»»0 1
Person
»»1 7
.
»»7 8
FindById
»»8 @
(
»»@ A
person
»»A G
.
»»G H
PersonId
»»H P
)
»»P Q
;
»»Q R
if
…… 
(
…… 

personInDb
…… 
==
…… 
null
…… "
)
……" #
{
   
return
ÀÀ 
null
ÀÀ 
;
ÀÀ 
}
ÃÃ 

personInDb
ŒŒ 
.
ŒŒ 
	FirstName
ŒŒ  
=
ŒŒ! "
person
ŒŒ# )
.
ŒŒ) *
	FirstName
ŒŒ* 3
;
ŒŒ3 4

personInDb
œœ 
.
œœ 
LastName
œœ 
=
œœ  !
person
œœ" (
.
œœ( )
LastName
œœ) 1
;
œœ1 2

personInDb
–– 
.
–– 
Gender
–– 
=
–– 
person
––  &
.
––& '
Gender
––' -
[
––- .
$num
––. /
]
––/ 0
;
––0 1

personInDb
—— 
.
—— 
	BirthDate
——  
=
——! "
person
——# )
.
——) *
	BirthDate
——* 3
;
——3 4

personInDb
““ 
.
““ 
	DeathDate
““  
=
““! "
person
““# )
.
““) *
	DeathDate
““* 3
;
““3 4

personInDb
”” 
.
”” 

ModifiedOn
”” !
=
””" #
DateTime
””$ ,
.
””, -
UtcNow
””- 3
;
””3 4

personInDb
‘‘ 
.
‘‘ 
NationalityId
‘‘ $
=
‘‘% &
person
‘‘' -
.
‘‘- .
Nationality
‘‘. 9
.
‘‘9 :
Id
‘‘: <
;
‘‘< =

personInDb
’’ 
.
’’ 

ReligionId
’’ !
=
’’" #
person
’’$ *
.
’’* +
Religion
’’+ 3
.
’’3 4
Id
’’4 6
;
’’6 7
if
÷÷ 
(
÷÷ 
person
÷÷ 
.
÷÷ 
LivingPlace
÷÷ "
!=
÷÷# %
null
÷÷& *
)
÷÷* +
{
◊◊ 

personInDb
ÿÿ 
.
ÿÿ 
LivingPlace
ÿÿ &
.
ÿÿ& '
State
ÿÿ' ,
=
ÿÿ- .
person
ÿÿ/ 5
.
ÿÿ5 6
LivingPlace
ÿÿ6 A
.
ÿÿA B
State
ÿÿB G
;
ÿÿG H

personInDb
ŸŸ 
.
ŸŸ 
LivingPlace
ŸŸ &
.
ŸŸ& '
Country
ŸŸ' .
=
ŸŸ/ 0
person
ŸŸ1 7
.
ŸŸ7 8
LivingPlace
ŸŸ8 C
.
ŸŸC D
Country
ŸŸD K
;
ŸŸK L

personInDb
⁄⁄ 
.
⁄⁄ 
LivingPlace
⁄⁄ &
.
⁄⁄& '
City
⁄⁄' +
=
⁄⁄, -
person
⁄⁄. 4
.
⁄⁄4 5
LivingPlace
⁄⁄5 @
.
⁄⁄@ A
City
⁄⁄A E
;
⁄⁄E F
}
€€ 
if
‹‹ 
(
‹‹ 
person
‹‹ 
.
‹‹ 

BirthPlace
‹‹ !
!=
‹‹" $
null
‹‹% )
)
‹‹) *
{
›› 

personInDb
ﬁﬁ 
.
ﬁﬁ 

BirthPlace
ﬁﬁ %
.
ﬁﬁ% &
State
ﬁﬁ& +
=
ﬁﬁ, -
person
ﬁﬁ. 4
.
ﬁﬁ4 5

BirthPlace
ﬁﬁ5 ?
.
ﬁﬁ? @
State
ﬁﬁ@ E
;
ﬁﬁE F

personInDb
ﬂﬂ 
.
ﬂﬂ 

BirthPlace
ﬂﬂ %
.
ﬂﬂ% &
Country
ﬂﬂ& -
=
ﬂﬂ. /
person
ﬂﬂ0 6
.
ﬂﬂ6 7

BirthPlace
ﬂﬂ7 A
.
ﬂﬂA B
Country
ﬂﬂB I
;
ﬂﬂI J

personInDb
‡‡ 
.
‡‡ 

BirthPlace
‡‡ %
.
‡‡% &
City
‡‡& *
=
‡‡+ ,
person
‡‡- 3
.
‡‡3 4

BirthPlace
‡‡4 >
.
‡‡> ?
City
‡‡? C
;
‡‡C D
}
·· 
await
‚‚ 
updateLocations
‚‚ !
(
‚‚! "

personInDb
‚‚" ,
)
‚‚, -
;
‚‚- .
Person
‰‰ 
personEntity
‰‰ 
=
‰‰  !
await
‰‰" '

unitOfWork
‰‰( 2
.
‰‰2 3
Person
‰‰3 9
.
‰‰9 :
Update
‰‰: @
(
‰‰@ A

personInDb
‰‰A K
)
‰‰K L
;
‰‰L M 
PersonDetailsModel
ÂÂ 
returnEvent
ÂÂ *
=
ÂÂ+ ,
_mapper
ÂÂ- 4
.
ÂÂ4 5
Map
ÂÂ5 8
<
ÂÂ8 9 
PersonDetailsModel
ÂÂ9 K
>
ÂÂK L
(
ÂÂL M
personEntity
ÂÂM Y
)
ÂÂY Z
;
ÂÂZ [
returnEvent
ÊÊ 
.
ÊÊ 
	ImageFile
ÊÊ !
=
ÊÊ" #
await
ÊÊ$ )$
_fileManagementService
ÊÊ* @
.
ÊÊ@ A
GetFile
ÊÊA H
(
ÊÊH I
personEntity
ÊÊI U
.
ÊÊU V
Image
ÊÊV [
)
ÊÊ[ \
;
ÊÊ\ ]
return
ÁÁ 
returnEvent
ÁÁ 
;
ÁÁ 
}
ËË 	
private
ÍÍ 
async
ÍÍ 
Task
ÍÍ 
updateLocations
ÍÍ *
(
ÍÍ* +
Person
ÍÍ+ 1
person
ÍÍ2 8
)
ÍÍ8 9
{
ÎÎ 	
if
ÏÏ 
(
ÏÏ 
person
ÏÏ 
.
ÏÏ 
LivingPlace
ÏÏ "
!=
ÏÏ# %
null
ÏÏ& *
&&
ÏÏ+ -
person
ÏÏ. 4
.
ÏÏ4 5
LivingPlace
ÏÏ5 @
.
ÏÏ@ A
Id
ÏÏA C
!=
ÏÏD F
$num
ÏÏG H
)
ÏÏH I
{
ÌÌ 
await
ÓÓ 

unitOfWork
ÓÓ  
.
ÓÓ  !
Location
ÓÓ! )
.
ÓÓ) *
Update
ÓÓ* 0
(
ÓÓ0 1
person
ÓÓ1 7
.
ÓÓ7 8
LivingPlace
ÓÓ8 C
)
ÓÓC D
;
ÓÓD E
}
ÔÔ 
if
 
(
 
person
 
.
 

BirthPlace
 !
!=
" $
null
% )
&&
* ,
person
- 3
.
3 4

BirthPlace
4 >
.
> ?
Id
? A
!=
B D
$num
E F
)
F G
{
ÒÒ 
await
ÚÚ 

unitOfWork
ÚÚ  
.
ÚÚ  !
Location
ÚÚ! )
.
ÚÚ) *
Update
ÚÚ* 0
(
ÚÚ0 1
person
ÚÚ1 7
.
ÚÚ7 8

BirthPlace
ÚÚ8 B
)
ÚÚB C
;
ÚÚC D
}
ÛÛ 
}
ÙÙ 	
public
ˆˆ 
async
ˆˆ 
Task
ˆˆ 
<
ˆˆ 
	ImageFile
ˆˆ #
>
ˆˆ# $ 
UpdatePictureAsync
ˆˆ% 7
(
ˆˆ7 8
int
ˆˆ8 ;
personId
ˆˆ< D
,
ˆˆD E
int
ˆˆF I
imageId
ˆˆJ Q
)
ˆˆQ R
{
˜˜ 	
Person
¯¯ 
person
¯¯ 
=
¯¯ 
await
¯¯ !

unitOfWork
¯¯" ,
.
¯¯, -
Person
¯¯- 3
.
¯¯3 4
FindById
¯¯4 <
(
¯¯< =
personId
¯¯= E
)
¯¯E F
;
¯¯F G
int
˘˘ 

oldImageId
˘˘ 
=
˘˘ 
(
˘˘ 
person
˘˘ $
.
˘˘$ %
ImageId
˘˘% ,
==
˘˘- /
null
˘˘0 4
)
˘˘4 5
?
˘˘6 7
$num
˘˘8 9
:
˘˘: ;
(
˘˘< =
int
˘˘= @
)
˘˘@ A
person
˘˘A G
.
˘˘G H
ImageId
˘˘H O
;
˘˘O P
person
˙˙ 
.
˙˙ 
ImageId
˙˙ 
=
˙˙ 
imageId
˙˙ $
;
˙˙$ %
Person
˚˚ 
personEntity
˚˚ 
=
˚˚  !
await
˚˚" '

unitOfWork
˚˚( 2
.
˚˚2 3
Person
˚˚3 9
.
˚˚9 :
Update
˚˚: @
(
˚˚@ A
person
˚˚A G
)
˚˚G H
;
˚˚H I
if
¸¸ 
(
¸¸ 

oldImageId
¸¸ 
!=
¸¸ 
$num
¸¸ 
)
¸¸  
{
˝˝ 
await
˛˛ "
checkImageUsageAsync
˛˛ *
(
˛˛* +

oldImageId
˛˛+ 5
)
˛˛5 6
;
˛˛6 7
}
ˇˇ 
return
ÄÄ 
await
ÄÄ $
_fileManagementService
ÄÄ /
.
ÄÄ/ 0
GetFile
ÄÄ0 7
(
ÄÄ7 8
personEntity
ÄÄ8 D
.
ÄÄD E
Image
ÄÄE J
)
ÄÄJ K
;
ÄÄK L
}
ÅÅ 	
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ  
PersonDetailsModel
ÉÉ ,
>
ÉÉ, -
DeletePersonAsync
ÉÉ. ?
(
ÉÉ? @
int
ÉÉ@ C
personId
ÉÉD L
)
ÉÉL M
{
ÑÑ 	
List
ÖÖ 
<
ÖÖ 
int
ÖÖ 
>
ÖÖ 
parentChildIds
ÖÖ $
=
ÖÖ% &

unitOfWork
ÖÖ' 1
.
ÖÖ1 2
ParentChild
ÖÖ2 =
.
ÖÖ= >
Filter
ÖÖ> D
(
ÖÖD E
parentChild
ÖÖE P
=>
ÖÖQ S
parentChild
ÖÖT _
.
ÖÖ_ `
ParentId
ÖÖ` h
==
ÖÖi k
personId
ÖÖl t
||
ÖÖu w
parentChildÖÖx É
.ÖÖÉ Ñ
ChildIdÖÖÑ ã
==ÖÖå é
personIdÖÖè ó
)ÖÖó ò
.ÖÖò ô
SelectÖÖô ü
(ÖÖü †
parentChildÖÖ† ´
=>ÖÖ¨ Æ
parentChildÖÖØ ∫
.ÖÖ∫ ª
IdÖÖª Ω
)ÖÖΩ æ
.ÖÖæ ø
ToListÖÖø ≈
(ÖÖ≈ ∆
)ÖÖ∆ «
;ÖÖ« »
foreach
ÜÜ 
(
ÜÜ 
var
ÜÜ 
parentChildId
ÜÜ &
in
ÜÜ' )
parentChildIds
ÜÜ* 8
)
ÜÜ8 9
{
áá 
await
àà 

unitOfWork
àà  
.
àà  !
ParentChild
àà! ,
.
àà, -
Delete
àà- 3
(
àà3 4
parentChildId
àà4 A
)
ààA B
;
ààB C
}
ââ 
List
ää 
<
ää 
int
ää 
>
ää 
marriageIds
ää !
=
ää" #

unitOfWork
ää$ .
.
ää. /
Marriage
ää/ 7
.
ää7 8
Filter
ää8 >
(
ää> ?
marriage
ää? G
=>
ääH J
marriage
ääK S
.
ääS T
FirstPersonId
ääT a
==
ääb d
personId
ääe m
||
ään p
marriage
ääq y
.
ääy z
SecondPersonIdääz à
==ääâ ã
personIdääå î
)ääî ï
.ääï ñ
Selectääñ ú
(ääú ù
marriageääù •
=>ää¶ ®
marriageää© ±
.ää± ≤
Idää≤ ¥
)ää¥ µ
.ääµ ∂
ToListää∂ º
(ääº Ω
)ääΩ æ
;ääæ ø
foreach
ãã 
(
ãã 
var
ãã 

marriageId
ãã #
in
ãã$ &
marriageIds
ãã' 2
)
ãã2 3
{
åå 
await
çç 

unitOfWork
çç  
.
çç  !
Marriage
çç! )
.
çç) *
Delete
çç* 0
(
çç0 1

marriageId
çç1 ;
)
çç; <
;
çç< =
}
éé 
Person
èè 
personEntity
èè 
=
èè  !
await
èè" '

unitOfWork
èè( 2
.
èè2 3
Person
èè3 9
.
èè9 :
Delete
èè: @
(
èè@ A
personId
èèA I
)
èèI J
;
èèJ K
int
êê 

oldImageId
êê 
=
êê 
(
êê 
personEntity
êê *
.
êê* +
ImageId
êê+ 2
==
êê3 5
null
êê6 :
)
êê: ;
?
êê< =
$num
êê> ?
:
êê@ A
(
êêB C
int
êêC F
)
êêF G
personEntity
êêG S
.
êêS T
ImageId
êêT [
;
êê[ \
if
ëë 
(
ëë 

oldImageId
ëë 
!=
ëë 
$num
ëë 
)
ëë  
{
íí 
await
ìì "
checkImageUsageAsync
ìì *
(
ìì* +

oldImageId
ìì+ 5
)
ìì5 6
;
ìì6 7
}
îî 
return
ïï 
_mapper
ïï 
.
ïï 
Map
ïï 
<
ïï  
PersonDetailsModel
ïï 1
>
ïï1 2
(
ïï2 3
personEntity
ïï3 ?
)
ïï? @
;
ïï@ A
}
ññ 	
private
òò 
async
òò 
Task
òò "
checkImageUsageAsync
òò /
(
òò/ 0
int
òò0 3
imageId
òò4 ;
)
òò; <
{
ôô 	
Image
öö 
image
öö 
=
öö 
await
öö 
_imageService
öö  -
.
öö- .
GetImageAsync
öö. ;
(
öö; <
imageId
öö< C
)
ööC D
;
ööD E
if
õõ 
(
õõ 
!
õõ 
image
õõ 
.
õõ 
People
õõ 
.
õõ 
Any
õõ !
(
õõ! "
)
õõ" #
)
õõ# $
{
úú 
await
ùù 
_imageService
ùù #
.
ùù# $
DeleteImageAsync
ùù$ 4
(
ùù4 5
imageId
ùù5 <
)
ùù< =
;
ùù= >
}
ûû 
}
üü 	
}
†† 
}°° ˇs
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

unitOfWork	| Ü
)
Ü á
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
.	 Ä
ThenInclude
Ä ã
(
ã å
u
å ç
=>
é ê
u
ë í
.
í ì
Person
ì ô
)
ô ö
.
ö õ
ToList
õ °
(
° ¢
)
¢ £
;
£ §
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
foreach 
( 
var 
relative !
in" $
	relatives% .
). /
{   
RelativeModel!! 
personToReturn!! ,
=!!- .
_mapper!!/ 6
.!!6 7
Map!!7 :
<!!: ;
RelativeModel!!; H
>!!H I
(!!I J
relative!!J R
)!!R S
;!!S T
personToReturn"" 
."" 
RelativeUser"" +
.""+ ,
	ImageFile"", 5
=""6 7
await""8 ="
_fileManagementService""> T
.""T U
GetFile""U \
(""\ ]
relative""] e
.""e f
RelativeUser""f r
.""r s
Person""s y
.""y z
Image""z 
)	"" Ä
;
""Ä Å
returnEvent## 
.## 
Add## 
(##  
personToReturn##  .
)##. /
;##/ 0
}$$ 
return%% 
returnEvent%% 
;%% 
}&& 	
public(( 
async(( 
Task(( 
<(( 
RelativeModel(( '
>((' (
GetRelative(() 4
(((4 5
int((5 8

relativeId((9 C
)((C D
{)) 	
Relative** 
relative** 
=** 
await**  %

unitOfWork**& 0
.**0 1
	Relatives**1 :
.**: ;
FindById**; C
(**C D

relativeId**D N
)**N O
;**O P
RelativeModel++ 
returnEvent++ %
=++& '
_mapper++( /
.++/ 0
Map++0 3
<++3 4
RelativeModel++4 A
>++A B
(++B C
relative++C K
)++K L
;++L M
return,, 
returnEvent,, 
;,, 
}-- 	
public.. 
async.. 
Task.. 
<.. 
RelativeState.. '
>..' (
CheckRelative..) 6
(..6 7
Guid..7 ;
userId..< B
,..B C
Guid..D H

relativeId..I S
)..S T
{// 	
bool00 
isAlreadyRelative00 "
=00# $
await00% *
Task00+ /
.00/ 0
Run000 3
(003 4
(004 5
)005 6
=>007 9

unitOfWork00: D
.00D E
	Relatives00E N
.00N O
Filter00O U
(00U V
r00V W
=>00X Z
(00[ \
r00\ ]
.00] ^
PrimaryUserId00^ k
==00l n
userId00o u
&&00v x
r00y z
.00z {
RelativeUserId	00{ â
==
00ä å

relativeId
00ç ó
)
00ó ò
)
00ò ô
.
00ô ö
Any
00ö ù
(
00ù û
)
00û ü
)
00ü †
;
00† °
if11 
(11 
isAlreadyRelative11 !
)11! "
{22 
return33 
RelativeState33 $
.33$ %
Related33% ,
;33, -
}44 
bool55 
requestAlreadySent55 #
=55$ %
await55& +
Task55, 0
.550 1
Run551 4
(554 5
(555 6
)556 7
=>558 :

unitOfWork55; E
.55E F
Requests55F N
.55N O
Filter55O U
(55U V
r55V W
=>55X Z
(55[ \
r55\ ]
.55] ^
SenderId55^ f
==55g i
userId55j p
&&55q s
r55t u
.55u v

ReceiverId	55v Ä
==
55Å É

relativeId
55Ñ é
)
55é è
||
55ê í
(
55ì î
r
55î ï
.
55ï ñ
SenderId
55ñ û
==
55ü °

relativeId
55¢ ¨
&&
55≠ Ø
r
55∞ ±
.
55± ≤

ReceiverId
55≤ º
==
55Ω ø
userId
55¿ ∆
)
55∆ «
)
55« »
.
55» …
Any
55… Ã
(
55Ã Õ
)
55Õ Œ
)
55Œ œ
;
55œ –
if66 
(66 
requestAlreadySent66 "
)66" #
{77 
return88 
RelativeState88 $
.88$ %
	Requested88% .
;88. /
}99 
return:: 
RelativeState::  
.::  !
	Unrelated::! *
;::* +
};; 	
public== 
async== 
Task== 
<== 
RelativeModel== '
>==' (
MarkChanges==) 4
(==4 5
int==5 8

relativeId==9 C
)==C D
{>> 	
Relative?? 
relativeToUpdate?? %
=??& '
await??( -

unitOfWork??. 8
.??8 9
	Relatives??9 B
.??B C
FindById??C K
(??K L

relativeId??L V
)??V W
;??W X
relativeToUpdate@@ 
.@@ 
LastSyncCheck@@ *
=@@+ ,
DateTime@@- 5
.@@5 6
Now@@6 9
;@@9 :
RelativeAA 
relativeEntityAA #
=AA$ %
awaitAA& +

unitOfWorkAA, 6
.AA6 7
	RelativesAA7 @
.AA@ A
UpdateAAA G
(AAG H
relativeToUpdateAAH X
)AAX Y
;AAY Z
RelativeModelBB 
returnEventBB %
=BB& '
_mapperBB( /
.BB/ 0
MapBB0 3
<BB3 4
RelativeModelBB4 A
>BBA B
(BBB C
relativeEntityBBC Q
)BBQ R
;BBR S
returnCC 
returnEventCC 
;CC 
}DD 	
publicGG 
asyncGG 
TaskGG 
<GG 
RelativeModelGG '
>GG' (
AddRelativeUserGG) 8
(GG8 9
UsersToLinkModelGG9 I
usersToLinkGGJ U
)GGU V
{HH 	
RelativeII 
senderRelativeII #
=II$ %
newII& )
RelativeII* 2
(II2 3
)II3 4
{JJ 
PrimaryUserIdKK 
=KK 
usersToLinkKK  +
.KK+ ,
PrimaryUserIdKK, 9
,KK9 :
RelativeUserIdLL 
=LL  
usersToLinkLL! ,
.LL, -
LinkedUserIdLL- 9
,LL9 :)
RelativePersonInPrimaryTreeIdMM -
=MM. /
usersToLinkMM0 ;
.MM; <'
LinkedPersonInPrimaryTreeIdMM< W
,MMW X
LastSyncCheckNN 
=NN 
DateTimeNN  (
.NN( )
UtcNowNN) /
}OO 
;OO 
RelativePP !
createdSenderRelativePP *
=PP+ ,
awaitPP- 2

unitOfWorkPP3 =
.PP= >
	RelativesPP> G
.PPG H
CreatePPH N
(PPN O
senderRelativePPO ]
)PP] ^
;PP^ _
RelativeModelQQ 
returnEventQQ %
=QQ& '
_mapperQQ( /
.QQ/ 0
MapQQ0 3
<QQ3 4
RelativeModelQQ4 A
>QQA B
(QQB C!
createdSenderRelativeQQC X
)QQX Y
;QQY Z
ifSS 
(SS 
usersToLinkSS 
.SS )
PrimaryPersonInRelativeTreeIdSS 9
!=SS: <
$numSS= >
)SS> ?
{TT 
RelativeUU 
receiverRelativeUU )
=UU* +
newUU, /
RelativeUU0 8
(UU8 9
)UU9 :
{VV 
PrimaryUserIdWW !
=WW" #
usersToLinkWW$ /
.WW/ 0
LinkedUserIdWW0 <
,WW< =
RelativeUserIdXX "
=XX# $
usersToLinkXX% 0
.XX0 1
PrimaryUserIdXX1 >
,XX> ?)
RelativePersonInPrimaryTreeIdYY 1
=YY2 3
usersToLinkYY4 ?
.YY? @)
PrimaryPersonInRelativeTreeIdYY@ ]
,YY] ^
LastSyncCheckZZ !
=ZZ" #
DateTimeZZ$ ,
.ZZ, -
UtcNowZZ- 3
}[[ 
;[[ 
Relative\\ #
createdReceiverRelative\\ 0
=\\1 2
await\\3 8

unitOfWork\\9 C
.\\C D
	Relatives\\D M
.\\M N
Create\\N T
(\\T U
receiverRelative\\U e
)\\e f
;\\f g
returnEvent]] 
=]] 
_mapper]] %
.]]% &
Map]]& )
<]]) *
RelativeModel]]* 7
>]]7 8
(]]8 9#
createdReceiverRelative]]9 P
)]]P Q
;]]Q R
}^^ 
return__ 
returnEvent__ 
;__ 
}`` 	
publicbb 
asyncbb 
Taskbb 
<bb 
RelativeModelbb '
>bb' (
DeleteRelativebb) 7
(bb7 8
intbb8 ;

relativeIdbb< F
)bbF G
{cc 	
Relativedd 
relativeEntitydd #
=dd$ %
awaitdd& +

unitOfWorkdd, 6
.dd6 7
	Relativesdd7 @
.dd@ A
DeleteddA G
(ddG H

relativeIdddH R
)ddR S
;ddS T
RelativeModelee 
returnEventee %
=ee& '
_mapperee( /
.ee/ 0
Mapee0 3
<ee3 4
RelativeModelee4 A
>eeA B
(eeB C
relativeEntityeeC Q
)eeQ R
;eeR S
returnff 
returnEventff 
;ff 
}gg 	
publicii 
asyncii 
Taskii 
<ii 
Listii 
<ii 
UserPositionModelii 0
>ii0 1
>ii1 2 
GetRelativesPositionii3 G
(iiG H
GuidiiH L
userIdiiM S
)iiS T
{jj 	
Listkk 
<kk 
Userkk 
>kk 
relativeUserskk $
=kk% &

unitOfWorkkk' 1
.kk1 2
	Relativeskk2 ;
.kk; <
Filterkk< B
(kkB C
relativekkC K
=>kkL N
relativekkO W
.kkW X
PrimaryUserIdkkX e
==kkf h
userIdkki o
)kko p
.ll4 5
Includell5 <
(ll< =
rll= >
=>ll? A
rllB C
.llC D
RelativeUserllD P
)llP Q
.mm8 9
ThenIncludemm9 D
(mmD E
rummE G
=>mmH J
rummK M
.mmM N
PositionmmN V
)mmV W
.nn4 5
Includenn5 <
(nn< =
rnn= >
=>nn? A
rnnB C
.nnC D
RelativeUsernnD P
)nnP Q
.oo8 9
ThenIncludeoo9 D
(ooD E
ruooE G
=>ooH J
ruooK M
.ooM N
PersonooN T
)ooT U
.pp4 5
Wherepp5 :
(pp: ;
relativepp; C
=>ppD F
relativeppG O
.ppO P
RelativeUserppP \
.pp\ ]
ShareLocationpp] j
&&ppk m
relativeppn v
.ppv w
RelativeUser	ppw É
.
ppÉ Ñ
Position
ppÑ å
.
ppå ç
	UpdatedOn
ppç ñ
!=
ppó ô
null
ppö û
)
ppû ü
.qq4 5
Selectqq5 ;
(qq; <
relativeqq< D
=>qqE G
relativeqqH P
.qqP Q
RelativeUserqqQ ]
)qq] ^
.qq^ _
ToListqq_ e
(qqe f
)qqf g
;qqg h
Listss 
<ss 
UserPositionModelss "
>ss" #
returnEventss$ /
=ss0 1
newss2 5
Listss6 :
<ss: ;
UserPositionModelss; L
>ssL M
(ssM N
)ssN O
;ssO P
foreachtt 
(tt 
vartt 
relativett !
intt" $
relativeUserstt% 2
)tt2 3
{uu 
UserPositionModelvv ! 
userPositionToReturnvv" 6
=vv7 8
_mappervv9 @
.vv@ A
MapvvA D
<vvD E
UserPositionModelvvE V
>vvV W
(vvW X
relativevvX `
)vv` a
;vva b 
userPositionToReturnww $
.ww$ %
	ImageFileww% .
=ww/ 0
awaitww1 6"
_fileManagementServiceww7 M
.wwM N
GetFilewwN U
(wwU V
relativewwV ^
.ww^ _
Personww_ e
.wwe f
Imagewwf k
)wwk l
;wwl m
returnEventxx 
.xx 
Addxx 
(xx   
userPositionToReturnxx  4
)xx4 5
;xx5 6
}yy 
returnzz 
returnEventzz 
;zz 
}{{ 	
}|| 
}}} Á
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
return 
returnEvent 
; 
} 	
public 
async 
Task 
< 
GenericNameModel *
>* +
AddReligionAsync, <
(< =
string= C
religionNameD P
)P Q
{ 	
if 
( 
religionName 
== 
null  $
)$ %
{ 
return 
null 
; 
}   
Religion!! 
religion!! 
=!! 
new!!  #
Religion!!$ ,
(!!, -
)!!- .
{"" 
Name## 
=## 
religionName## #
}$$ 
;$$ 
Religion%% 
religionEntity%% #
=%%$ %
await%%& +

unitOfWork%%, 6
.%%6 7
Religion%%7 ?
.%%? @
Create%%@ F
(%%F G
religion%%G O
)%%O P
;%%P Q
GenericNameModel&& 
returnEvent&& (
=&&) *
_mapper&&+ 2
.&&2 3
Map&&3 6
<&&6 7
GenericNameModel&&7 G
>&&G H
(&&H I
religionEntity&&I W
)&&W X
;&&X Y
return'' 
returnEvent'' 
;'' 
}(( 	
})) 
}** ≤ã
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
public 
RequestService 
( 
IUnitOfWork )

unitOfWork* 4
,4 5
IMapper6 =
mapper> D
,D E"
IFileManagementServiceF \!
fileManagementService] r
,r s
IRelativeService	t Ñ
relativeService
Ö î
)
î ï
:
ñ ó
base
ò ú
(
ú ù

unitOfWork
ù ß
)
ß ®
{ 	
_mapper 
= 
mapper 
; "
_fileManagementService "
=# $!
fileManagementService% :
;: ;
_relativeService 
= 
relativeService .
;. /
} 	
public 
async 
Task 
< 
List 
< 
RequestDetailsModel 2
>2 3
>3 4
GetRequestsSent5 D
(D E
GuidE I
senderIdJ R
)R S
{ 	
List 
< 
Request 
> 
requests "
=# $

unitOfWork% /
./ 0
Requests0 8
.8 9
Filter9 ?
(? @
x@ A
=>B D
xE F
.F G
SenderIdG O
==P R
senderIdS [
&&\ ^
!_ `
x` a
.a b
ReceiverRespondedb s
)s t
.0 1
Include1 8
(8 9
x9 :
=>; =
x> ?
.? @
Receiver@ H
)H I
.I J
ThenIncludeJ U
(U V
rV W
=>X Z
r[ \
.\ ]
Person] c
)c d
.d e
ThenIncludee p
(p q
pq r
=>s u
pv w
.w x
Imagex }
)} ~
.  0 1
Include  1 8
(  8 9
x  9 :
=>  ; =
x  > ?
.  ? @
Sender  @ F
)  F G
.  G H
ThenInclude  H S
(  S T
r  T U
=>  V X
r  Y Z
.  Z [
Person  [ a
)  a b
.  b c
ThenInclude  c n
(  n o
p  o p
=>  q s
p  t u
.  u v
Image  v {
)  { |
.!!0 1
Include!!1 8
(!!8 9
x!!9 :
=>!!; =
x!!> ?
.!!? @)
ReceiverReferenceInSenderTree!!@ ]
)!!] ^
.!!^ _
ThenInclude!!_ j
(!!j k
p!!k l
=>!!m o
p!!p q
.!!q r
Image!!r w
)!!w x
.""0 1
ToList""1 7
(""7 8
)""8 9
;""9 :
return## 
await## 
MapRequestDetails## *
(##* +
requests##+ 3
)##3 4
;##4 5
}$$ 	
private&& 
async&& 
Task&& 
<&& 
List&& 
<&&  
RequestDetailsModel&&  3
>&&3 4
>&&4 5
MapRequestDetails&&6 G
(&&G H
List&&H L
<&&L M
Request&&M T
>&&T U
requests&&V ^
)&&^ _
{'' 	
List(( 
<(( 
RequestDetailsModel(( $
>(($ %
returnEvent((& 1
=((2 3
new((4 7
List((8 <
<((< =
RequestDetailsModel((= P
>((P Q
(((Q R
)((R S
;((S T
foreach)) 
()) 
var)) 
request))  
in))! #
requests))$ ,
))), -
{** 
RequestDetailsModel++ #
returnRequest++$ 1
=++2 3
new++4 7
RequestDetailsModel++8 K
(++K L
)++L M
{,, 
Id-- 
=-- 
request--  
.--  !
Id--! #
,--# $
ReceiverUser..  
=..! "
_mapper..# *
...* +
Map..+ .
<... /
GenericPersonModel../ A
>..A B
(..B C
request..C J
...J K
Receiver..K S
)..S T
,..T U

SenderUser// 
=//  
_mapper//! (
.//( )
Map//) ,
<//, -
GenericPersonModel//- ?
>//? @
(//@ A
request//A H
.//H I
Sender//I O
)//O P
,//P Q+
ReceiverReferenceInSenderTreeId00 3
=004 5
request006 =
.00= >+
ReceiverReferenceInSenderTreeId00> ]
}11 
;11 
returnRequest22 
.22 
ReceiverUser22 *
.22* +
	ImageFile22+ 4
=225 6
await227 <"
_fileManagementService22= S
.22S T
GetFile22T [
(22[ \
request22\ c
.22c d
Receiver22d l
.22l m
Person22m s
.22s t
Image22t y
)22y z
;22z {
returnRequest33 
.33 

SenderUser33 (
.33( )
	ImageFile33) 2
=333 4
await335 :"
_fileManagementService33; Q
.33Q R
GetFile33R Y
(33Y Z
request33Z a
.33a b
Sender33b h
.33h i
Person33i o
.33o p
Image33p u
)33u v
;33v w
returnEvent44 
.44 
Add44 
(44  
returnRequest44  -
)44- .
;44. /
}55 
return66 
returnEvent66 
;66 
}77 	
private99 
async99 
Task99 
<99 
List99 
<99   
RequestResponseModel99  4
>994 5
>995 6
MapRequestResponse997 I
(99I J
List99J N
<99N O
Request99O V
>99V W
requests99X `
)99` a
{:: 	
List;; 
<;;  
RequestResponseModel;; %
>;;% &
returnEvent;;' 2
=;;3 4
new;;5 8
List;;9 =
<;;= > 
RequestResponseModel;;> R
>;;R S
(;;S T
);;T U
;;;U V
foreach<< 
(<< 
var<< 
request<<  
in<<! #
requests<<$ ,
)<<, -
{==  
RequestResponseModel>> $
returnRequest>>% 2
=>>3 4
new>>5 8 
RequestResponseModel>>9 M
(>>M N
)>>N O
{?? 
Id@@ 
=@@ 
request@@  
.@@  !
Id@@! #
,@@# $
ReceiverUserAA  
=AA! "
_mapperAA# *
.AA* +
MapAA+ .
<AA. /
GenericPersonModelAA/ A
>AAA B
(AAB C
requestAAC J
.AAJ K
ReceiverAAK S
)AAS T
,AAT U
ResponseBB 
=BB 
requestBB &
.BB& '
ResponseBB' /
}CC 
;CC 
returnRequestDD 
.DD 
ReceiverUserDD *
.DD* +
	ImageFileDD+ 4
=DD5 6
awaitDD7 <"
_fileManagementServiceDD= S
.DDS T
GetFileDDT [
(DD[ \
requestDD\ c
.DDc d
ReceiverDDd l
.DDl m
PersonDDm s
.DDs t
ImageDDt y
)DDy z
;DDz {
returnEventEE 
.EE 
AddEE 
(EE  
returnRequestEE  -
)EE- .
;EE. /
}FF 
returnGG 
returnEventGG 
;GG 
}HH 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
ListJJ 
<JJ 
RequestDetailsModelJJ 2
>JJ2 3
>JJ3 4
GetRequestsReceivedJJ5 H
(JJH I
GuidJJI M

receiverIdJJN X
)JJX Y
{KK 	
ListLL 
<LL 
RequestLL 
>LL 
requestsLL "
=LL# $

unitOfWorkLL% /
.LL/ 0
RequestsLL0 8
.LL8 9
FilterLL9 ?
(LL? @
xLL@ A
=>LLB D
xLLE F
.LLF G

ReceiverIdLLG Q
==LLR T

receiverIdLLU _
&&LL` b
!LLc d
xLLd e
.LLe f
ReceiverRespondedLLf w
)LLw x
.MM0 1
IncludeMM1 8
(MM8 9
xMM9 :
=>MM; =
xMM> ?
.MM? @
ReceiverMM@ H
)MMH I
.MMI J
ThenIncludeMMJ U
(MMU V
rMMV W
=>MMX Z
rMM[ \
.MM\ ]
PersonMM] c
)MMc d
.MMd e
ThenIncludeMMe p
(MMp q
pMMq r
=>MMs u
pMMv w
.MMw x
ImageMMx }
)MM} ~
.NN0 1
IncludeNN1 8
(NN8 9
xNN9 :
=>NN; =
xNN> ?
.NN? @
SenderNN@ F
)NNF G
.NNG H
ThenIncludeNNH S
(NNS T
rNNT U
=>NNV X
rNNY Z
.NNZ [
PersonNN[ a
)NNa b
.NNb c
ThenIncludeNNc n
(NNn o
pNNo p
=>NNq s
pNNt u
.NNu v
ImageNNv {
)NN{ |
.OO0 1
IncludeOO1 8
(OO8 9
xOO9 :
=>OO; =
xOO> ?
.OO? @)
ReceiverReferenceInSenderTreeOO@ ]
)OO] ^
.OO^ _
ThenIncludeOO_ j
(OOj k
pOOk l
=>OOm o
pOOp q
.OOq r
ImageOOr w
)OOw x
.OOx y
ToListOOy 
(	OO Ä
)
OOÄ Å
;
OOÅ Ç
returnPP 
awaitPP 
MapRequestDetailsPP *
(PP* +
requestsPP+ 3
)PP3 4
;PP4 5
}QQ 	
publicSS 
asyncSS 
TaskSS 
<SS 
ListSS 
<SS  
RequestResponseModelSS 3
>SS3 4
>SS4 5 
GetRequestsRespondedSS6 J
(SSJ K
GuidSSK O
senderIdSSP X
)SSX Y
{TT 	
ListUU 
<UU 
RequestUU 
>UU 
requestsUU "
=UU# $

unitOfWorkUU% /
.UU/ 0
RequestsUU0 8
.UU8 9
FilterUU9 ?
(UU? @
xUU@ A
=>UUB D
xUUE F
.UUF G
SenderIdUUG O
==UUP R
senderIdUUS [
&&UU\ ^
xUU_ `
.UU` a
ReceiverRespondedUUa r
)UUr s
.VV0 1
IncludeVV1 8
(VV8 9
xVV9 :
=>VV; =
xVV> ?
.VV? @
ReceiverVV@ H
)VVH I
.VVI J
ThenIncludeVVJ U
(VVU V
rVVV W
=>VVX Z
rVV[ \
.VV\ ]
PersonVV] c
)VVc d
.VVd e
ThenIncludeVVe p
(VVp q
pVVq r
=>VVs u
pVVv w
.VVw x
ImageVVx }
)VV} ~
.VV~ 
ToList	VV Ö
(
VVÖ Ü
)
VVÜ á
;
VVá à
returnWW 
awaitWW 
MapRequestResponseWW +
(WW+ ,
requestsWW, 4
)WW4 5
;WW5 6
}XX 	
publicZZ 
asyncZZ 
TaskZZ 
<ZZ $
RequestCreateUpdateModelZZ 2
>ZZ2 3

AddRequestZZ4 >
(ZZ> ?$
RequestCreateUpdateModelZZ? W
requestZZX _
)ZZ_ `
{[[ 	
if\\ 
(\\ 
request\\ 
==\\ 
null\\ 
)\\  
{]] 
return^^ 
null^^ 
;^^ 
}__ 
Request`` 
requestEntity`` !
=``" #
_mapper``$ +
.``+ ,
Map``, /
<``/ 0
Request``0 7
>``7 8
(``8 9
request``9 @
)``@ A
;``A B
requestEntityaa 
.aa )
ReceiverReferenceInSenderTreeaa 7
=aa8 9
nullaa: >
;aa> ?
Requestbb 
createdRequestbb "
=bb# $
awaitbb% *

unitOfWorkbb+ 5
.bb5 6
Requestsbb6 >
.bb> ?
Createbb? E
(bbE F
requestEntitybbF S
)bbS T
;bbT U$
RequestCreateUpdateModelcc $
returnEventcc% 0
=cc1 2
_mappercc3 :
.cc: ;
Mapcc; >
<cc> ?$
RequestCreateUpdateModelcc? W
>ccW X
(ccX Y
createdRequestccY g
)ccg h
;cch i
returndd 
returnEventdd 
;dd 
}ee 	
publicgg 
asyncgg 
Taskgg 
<gg 
UsersToLinkModelgg *
>gg* +
RespondToRequestgg, <
(gg< =
intgg= @
	requestIdggA J
,ggJ K 
RequestResponseModelggL `
respondedRequestgga q
)ggq r
{hh 	
Requestii 
requestii 
=ii 
awaitii #

unitOfWorkii$ .
.ii. /
Requestsii/ 7
.ii7 8
FindByIdii8 @
(ii@ A
	requestIdiiA J
)iiJ K
;iiK L
ifjj 
(jj 
requestjj 
==jj 
nulljj 
)jj  
{kk 
returnll 
nullll 
;ll 
}mm 
requestnn 
.nn 
ReceiverRespondednn %
=nn& '
truenn( ,
;nn, -
requestoo 
.oo 
Responseoo 
=oo 
respondedRequestoo /
.oo/ 0
Responseoo0 8
;oo8 9
Relativeqq 
alreadyRelatedqq #
=qq$ %

unitOfWorkqq& 0
.qq0 1
	Relativesqq1 :
.qq: ;
Filterqq; A
(qqA B
xqqB C
=>qqD F
xqqG H
.qqH I
PrimaryUserIdqqI V
==qqW Y
requestqqZ a
.qqa b

ReceiverIdqqb l
&&qqm o
xqqp q
.qqq r
RelativeUserId	qqr Ä
==
qqÅ É
request
qqÑ ã
.
qqã å
SenderId
qqå î
)
qqî ï
.
qqï ñ
FirstOrDefault
qqñ §
(
qq§ •
)
qq• ¶
;
qq¶ ß
ifss 
(ss 
respondedRequestss  
.ss  !+
SenderReferenceInReceiverTreeIdss! @
!=ssA C
$numssD E
&&ssF H
alreadyRelatedssI W
!=ssX Z
defaultss[ b
(ssb c
Relativessc k
)ssk l
)ssl m
{tt 
requestuu 
.uu +
ReceiverReferenceInSenderTreeIduu 7
=uu8 9
respondedRequestuu: J
.uuJ K+
SenderReferenceInReceiverTreeIduuK j
;uuj k
}vv 
Requestxx 
updatedRequestxx "
=xx# $
awaitxx% *

unitOfWorkxx+ 5
.xx5 6
Requestsxx6 >
.xx> ?
Updatexx? E
(xxE F
requestxxF M
)xxM N
;xxN O
UsersToLinkModelzz 
firstRelativezz *
=zz+ ,
newzz- 0
UsersToLinkModelzz1 A
(zzA B
)zzB C
{{{ 
PrimaryUserId|| 
=|| 
updatedRequest||  .
.||. /
SenderId||/ 7
,||7 8
LinkedUserId}} 
=}} 
updatedRequest}} -
.}}- .

ReceiverId}}. 8
,}}8 9)
PrimaryPersonInRelativeTreeId~~ -
=~~. /
respondedRequest~~0 @
.~~@ A+
SenderReferenceInReceiverTreeId~~A `
,~~` a'
LinkedPersonInPrimaryTreeId +
=, -
updatedRequest. <
.< =+
ReceiverReferenceInSenderTreeId= \
}
ÄÄ 
;
ÄÄ 
if
ÅÅ 
(
ÅÅ 
respondedRequest
ÅÅ  
.
ÅÅ  !
Response
ÅÅ! )
)
ÅÅ) *
{
ÇÇ 
await
ÉÉ 
_relativeService
ÉÉ &
.
ÉÉ& '
AddRelativeUser
ÉÉ' 6
(
ÉÉ6 7
firstRelative
ÉÉ7 D
)
ÉÉD E
;
ÉÉE F
}
ÑÑ 
return
ÖÖ 
firstRelative
ÖÖ  
;
ÖÖ  !
}
ÜÜ 	
public
àà 
async
àà 
Task
àà 
<
àà !
RequestDetailsModel
àà -
>
àà- .
DeleteRequest
àà/ <
(
àà< =
int
àà= @
	requestId
ààA J
)
ààJ K
{
ââ 	
Request
ää 
request
ää 
=
ää 
await
ää #

unitOfWork
ää$ .
.
ää. /
Requests
ää/ 7
.
ää7 8
Delete
ää8 >
(
ää> ?
	requestId
ää? H
)
ääH I
;
ääI J!
RequestDetailsModel
ãã 
returnEvent
ãã  +
=
ãã, -
_mapper
ãã. 5
.
ãã5 6
Map
ãã6 9
<
ãã9 :!
RequestDetailsModel
ãã: M
>
ããM N
(
ããN O
request
ããO V
)
ããV W
;
ããW X
return
åå 
returnEvent
åå 
;
åå 
}
çç 	
}
éé 
}èè ≠˙
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
public 
UserService 
( 
IUnitOfWork &

unitOfWork' 1
,1 2
IMapper3 :
mapper; A
,A B"
IFileManagementServiceC Y!
fileManagementServiceZ o
,o p
IRequestService	q Ä
requestService
Å è
,
è ê
IPersonService
ë ü
personService
† ≠
)
≠ Æ
:
Ø ∞
base
± µ
(
µ ∂

unitOfWork
∂ ¿
)
¿ ¡
{ 	
_mapper 
= 
mapper 
; "
_fileManagementService "
=# $!
fileManagementService% :
;: ;
_requestService 
= 
requestService ,
;, -
_personService 
= 
personService *
;* +
} 	
public!! 
async!! 
Task!! 
<!! 

UsersFound!! $
>!!$ %
	FindUsers!!& /
(!!/ 0 
InfiniteScrollFilter!!0 D
filter!!E K
)!!K L
{"" 	
if## 
(## 
filter## 
.## 
Name## 
==## 
null## #
)### $
{$$ 
filter%% 
.%% 
Name%% 
=%% 
$str%%  
;%%  !
}&& 
List'' 
<'' 
string'' 
>'' 
names'' 
=''  
filter''! '
.''' (
Name''( ,
.'', -
Split''- 2
(''2 3
$str''3 6
)''6 7
.''7 8
ToList''8 >
(''> ?
)''? @
;''@ A
IEnumerable(( 
<(( 
User(( 
>(( 
filteredUsers(( +
=((, -

unitOfWork((. 8
.((8 9
User((9 =
.((= >
GetAll((> D
(((D E
)((E F
.)) 
Include)) 
()) 
user)) 
=>))  
user))! %
.))% &
Person))& ,
))), -
.** 
ThenInclude** 
(** 
person** #
=>**$ &
person**' -
.**- .
Image**. 3
)**3 4
.**4 5
ToList**5 ;
(**; <
)**< =
;**= >
filteredUsers++ 
=++ 
filteredUsers++ )
.++) *
Where++* /
(++/ 0
(++0 1
user++1 5
)++5 6
=>++7 9
names++: ?
.++? @
All++@ C
(++C D
name++D H
=>++I K
user++L P
.++P Q
Person++Q W
.++W X
	FirstName++X a
.++a b
Contains++b j
(++j k
name++k o
)++o p
||++q s
user++t x
.++x y
Person++y 
.	++ Ä
LastName
++Ä à
.
++à â
Contains
++â ë
(
++ë í
name
++í ñ
)
++ñ ó
)
++ó ò
)
++ò ô
.
++ô ö
ToList
++ö †
(
++† °
)
++° ¢
;
++¢ £

UsersFound.. 

usersFound.. !
=.." #
new..$ '

UsersFound..( 2
(..2 3
)..3 4
;..4 5
List// 
<// 
User// 
>// 

foundUsers// !
=//" #
filteredUsers//$ 1
.//1 2
Skip//2 6
(//6 7
filter//7 =
.//= >
Skip//> B
)//B C
.//C D
Take//D H
(//H I
filter//I O
.//O P
Take//P T
)//T U
.//U V
ToList//V \
(//\ ]
)//] ^
;//^ _

usersFound00 
.00 

totalUsers00 !
=00" #
filteredUsers00$ 1
.001 2
Count002 7
(007 8
)008 9
;009 :

usersFound11 
.11 
skippedUsers11 #
=11$ %
filter11& ,
.11, -
Skip11- 1
;111 2

usersFound22 
.22 

takenUsers22 !
=22" #
filter22$ *
.22* +
Take22+ /
;22/ 0

usersFound33 
.33 
areLast33 
=33  

usersFound33! +
.33+ ,

totalUsers33, 6
<=337 9
filter33: @
.33@ A
Skip33A E
+33F G
filter33H N
.33N O
Take33O S
;33S T
foreach44 
(44 
var44 
user44 
in44  

foundUsers44! +
)44+ ,
{55 
GenericPersonModel66 "
personToReturn66# 1
=662 3
_mapper664 ;
.66; <
Map66< ?
<66? @
GenericPersonModel66@ R
>66R S
(66S T
user66T X
)66X Y
;66Y Z
personToReturn77 
.77 
	ImageFile77 (
=77) *
await77+ 0"
_fileManagementService771 G
.77G H
GetFile77H O
(77O P
user77P T
.77T U
Person77U [
.77[ \
Image77\ a
)77a b
;77b c

usersFound88 
.88 
users88  
.88  !
Add88! $
(88$ %
personToReturn88% 3
)883 4
;884 5
}99 
return:: 

usersFound:: 
;:: 
};; 	
public== 
async== 
Task== 
<== 
UserDetailsModel== *
>==* +
GetUserByIdAsync==, <
(==< =
Guid=== A
userId==B H
)==H I
{>> 	
User?? 
user?? 
=?? 

unitOfWork?? "
.??" #
User??# '
.??' (
Filter??( .
(??. /
user??/ 3
=>??4 6
user??7 ;
.??; <
Id??< >
==??? A
userId??B H
)??H I
.@@ 
Include@@ $
(@@$ %
u@@% &
=>@@' )
u@@* +
.@@+ ,
Person@@, 2
)@@2 3
.AA 
IncludeAA $
(AA$ %
uAA% &
=>AA' )
uAA* +
.AA+ ,
PersonAA, 2
.AA2 3
NationalityAA3 >
)AA> ?
.BB 
IncludeBB $
(BB$ %
uBB% &
=>BB' )
uBB* +
.BB+ ,
PersonBB, 2
.BB2 3
ReligionBB3 ;
)BB; <
.CC 
IncludeCC $
(CC$ %
uCC% &
=>CC' )
uCC* +
.CC+ ,
PersonCC, 2
.CC2 3
LivingPlaceCC3 >
)CC> ?
.DD 
IncludeDD $
(DD$ %
uDD% &
=>DD' )
uDD* +
.DD+ ,
PersonDD, 2
.DD2 3

BirthPlaceDD3 =
)DD= >
.EE 
IncludeEE $
(EE$ %
uEE% &
=>EE' )
uEE* +
.EE+ ,
PersonEE, 2
.EE2 3
ImageEE3 8
)EE8 9
.FF 
IncludeFF $
(FF$ %
uFF% &
=>FF' )
uFF* +
.FF+ ,

EducationsFF, 6
)FF6 7
.GG 
ThenIncludeGG (
(GG( )
eGG) *
=>GG+ -
eGG. /
.GG/ 0
EducationLevelGG0 >
)GG> ?
.HH 
IncludeHH $
(HH$ %
uHH% &
=>HH' )
uHH* +
.HH+ ,
OccupationsHH, 7
)HH7 8
.II 
FirstOrDefaultII +
(II+ ,
)II, -
;II- .
UserDetailsModelJJ 
returnEventJJ (
=JJ) *
_mapperJJ+ 2
.JJ2 3
MapJJ3 6
<JJ6 7
UserDetailsModelJJ7 G
>JJG H
(JJH I
userJJI M
)JJM N
;JJN O
ifKK 
(KK 
userKK 
!=KK 
nullKK 
&&KK 
!KK  !
userKK! %
.KK% &
SharePersonalInfoKK& 7
)KK7 8
{LL 
returnEventMM 
.MM 
EmailMM !
=MM" #
nullMM$ (
;MM( )
returnEventNN 
.NN 
PhoneNumberNN '
=NN( )
nullNN* .
;NN. /
returnEventOO 
.OO 
	ImageFileOO %
=OO& '
awaitOO( -"
_fileManagementServiceOO. D
.OOD E
GetFileOOE L
(OOL M
userOOM Q
.OOQ R
PersonOOR X
.OOX Y
ImageOOY ^
)OO^ _
;OO_ `
}PP 
returnQQ 
returnEventQQ 
;QQ 
}RR 	
publicTT 
asyncTT 
TaskTT 
<TT 
UserDetailsModelTT *
>TT* +
GetUserTT, 3
(TT3 4
stringTT4 :
usernameTT; C
)TTC D
{UU 	
UserVV 
userVV 
=VV 

unitOfWorkVV "
.VV" #
UserVV# '
.VV' (
FilterVV( .
(VV. /
xVV/ 0
=>VV1 3
xVV4 5
.VV5 6
UsernameVV6 >
==VV? A
usernameVVB J
)VVJ K
.WW 
IncludeWW $
(WW$ %
uWW% &
=>WW' )
uWW* +
.WW+ ,
PersonWW, 2
)WW2 3
.XX 
IncludeXX $
(XX$ %
uXX% &
=>XX' )
uXX* +
.XX+ ,
PersonXX, 2
.XX2 3
NationalityXX3 >
)XX> ?
.YY 
IncludeYY $
(YY$ %
uYY% &
=>YY' )
uYY* +
.YY+ ,
PersonYY, 2
.YY2 3
ReligionYY3 ;
)YY; <
.ZZ 
IncludeZZ $
(ZZ$ %
uZZ% &
=>ZZ' )
uZZ* +
.ZZ+ ,
PersonZZ, 2
.ZZ2 3
LivingPlaceZZ3 >
)ZZ> ?
.[[ 
Include[[ $
([[$ %
u[[% &
=>[[' )
u[[* +
.[[+ ,
Person[[, 2
.[[2 3

BirthPlace[[3 =
)[[= >
.\\ 
Include\\ $
(\\$ %
u\\% &
=>\\' )
u\\* +
.\\+ ,
Person\\, 2
.\\2 3
Image\\3 8
)\\8 9
.]] 
Include]] $
(]]$ %
u]]% &
=>]]' )
u]]* +
.]]+ ,

Educations]], 6
)]]6 7
.^^ 
ThenInclude^^ (
(^^( )
e^^) *
=>^^+ -
e^^. /
.^^/ 0
EducationLevel^^0 >
)^^> ?
.__ 
Include__ $
(__$ %
u__% &
=>__' )
u__* +
.__+ ,
Occupations__, 7
)__7 8
.__8 9
FirstOrDefault__9 G
(__G H
)__H I
;__I J
UserDetailsModel`` 

userEntity`` '
=``( )
_mapper``* 1
.``1 2
Map``2 5
<``5 6
UserDetailsModel``6 F
>``F G
(``G H
user``H L
)``L M
;``M N
ifaa 
(aa 
useraa 
!=aa 
nullaa 
)aa 
{bb 

userEntitycc 
.cc 
	ImageFilecc $
=cc% &
awaitcc' ,"
_fileManagementServicecc- C
.ccC D
GetFileccD K
(ccK L
userccL P
.ccP Q
PersonccQ W
.ccW X
ImageccX ]
)cc] ^
;cc^ _
}dd 
returnee 

userEntityee 
;ee 
}ff 	
publicgg 
asyncgg 
Taskgg 
<gg 
GenericPersonModelgg ,
>gg, -
GetTreeRootgg. 9
(gg9 :
Guidgg: >
treeIdgg? E
)ggE F
{hh 	
Userii 
userii 
=ii 
awaitii 
Taskii "
.ii" #
Runii# &
(ii& '
(ii' (
)ii( )
=>ii* ,

unitOfWorkii- 7
.ii7 8
Userii8 <
.ii< =
Filterii= C
(iiC D
xiiD E
=>iiF H
xiiI J
.iiJ K
PersoniiK Q
.iiQ R
TreeIdiiR X
==iiY [
treeIdii\ b
)iib c
.jj 
Includejj  
(jj  !
ujj! "
=>jj# %
ujj& '
.jj' (
Personjj( .
)jj. /
.kk 
FirstOrDefaultkk '
(kk' (
)kk( )
)kk) *
;kk* +
GenericPersonModelll 

userEntityll )
=ll* +
_mapperll, 3
.ll3 4
Mapll4 7
<ll7 8
GenericPersonModelll8 J
>llJ K
(llK L
userllL P
)llP Q
;llQ R
returnmm 

userEntitymm 
;mm 
}nn 	
publicpp 
asyncpp 
Taskpp 
<pp 
intpp 
>pp !
GetNotificationsCountpp 4
(pp4 5
Guidpp5 9
userIdpp: @
)pp@ A
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
urrD E
=>rrF H
urrI J
.rrJ K
IdrrK M
==rrN P
userIdrrQ W
)rrW X
.ss( )
Includess) 0
(ss0 1
uss1 2
=>ss3 5
uss6 7
.ss7 8
Personss8 >
)ss> ?
.tt( )
Includett) 0
(tt0 1
utt1 2
=>tt3 5
utt6 7
.tt7 8
ReceivedRequeststt8 H
)ttH I
.uu( )
Includeuu) 0
(uu0 1
uuu1 2
=>uu3 5
uuu6 7
.uu7 8
SentRequestsuu8 D
)uuD E
.vv( )
Includevv) 0
(vv0 1
uvv1 2
=>vv3 5
uvv6 7
.vv7 8
UserRelativesvv8 E
)vvE F
.ww( )
FirstOrDefaultww) 7
(ww7 8
)ww8 9
)ww9 :
;ww: ;
ifyy 
(yy 
useryy 
==yy 
nullyy 
)yy 
{zz 
return{{ 
$num{{ 
;{{ 
}|| 
int~~ 
totalNotifications~~ "
=~~# $
$num~~% &
;~~& '
totalNotifications 
+= !
user" &
.& '
ReceivedRequests' 7
.7 8
Count8 =
(= >
x> ?
=>@ B
!C D
xD E
.E F
ReceiverRespondedF W
)W X
;X Y 
totalNotifications
ÄÄ 
+=
ÄÄ !
user
ÄÄ" &
.
ÄÄ& '
SentRequests
ÄÄ' 3
.
ÄÄ3 4
Count
ÄÄ4 9
(
ÄÄ9 :
x
ÄÄ: ;
=>
ÄÄ< >
x
ÄÄ? @
.
ÄÄ@ A
ReceiverResponded
ÄÄA R
)
ÄÄR S
;
ÄÄS T
if
ÅÅ 
(
ÅÅ 
user
ÅÅ 
.
ÅÅ 
NotifyBirthdays
ÅÅ $
)
ÅÅ$ %
{
ÇÇ  
totalNotifications
ÉÉ "
+=
ÉÉ# %

unitOfWork
ÉÉ& 0
.
ÉÉ0 1
Person
ÉÉ1 7
.
ÉÉ7 8
Filter
ÉÉ8 >
(
ÉÉ> ?
p
ÉÉ? @
=>
ÉÉA C
p
ÉÉD E
.
ÉÉE F
TreeId
ÉÉF L
==
ÉÉM O
user
ÉÉP T
.
ÉÉT U
Person
ÉÉU [
.
ÉÉ[ \
TreeId
ÉÉ\ b
&&
ÉÉc e
p
ÉÉf g
.
ÉÉg h
	BirthDate
ÉÉh q
.
ÉÉq r
HasValue
ÉÉr z
&&
ÉÉ{ }
p
ÉÉ~ 
.ÉÉ Ä
	BirthDateÉÉÄ â
.ÉÉâ ä
ValueÉÉä è
.ÉÉè ê
	DayOfYearÉÉê ô
==ÉÉö ú
DateTimeÉÉù •
.ÉÉ• ¶
NowÉÉ¶ ©
.ÉÉ© ™
	DayOfYearÉÉ™ ≥
)ÉÉ≥ ¥
.ÉÉ¥ µ
CountÉÉµ ∫
(ÉÉ∫ ª
)ÉÉª º
;ÉÉº Ω 
totalNotifications
ÑÑ "
+=
ÑÑ# %

unitOfWork
ÑÑ& 0
.
ÑÑ0 1
Marriage
ÑÑ1 9
.
ÑÑ9 :
Filter
ÑÑ: @
(
ÑÑ@ A
m
ÑÑA B
=>
ÑÑC E
m
ÑÑF G
.
ÑÑG H
FirstPerson
ÑÑH S
.
ÑÑS T
TreeId
ÑÑT Z
==
ÑÑ[ ]
user
ÑÑ^ b
.
ÑÑb c
Person
ÑÑc i
.
ÑÑi j
TreeId
ÑÑj p
&&
ÑÑq s
m
ÑÑt u
.
ÑÑu v
	StartDate
ÑÑv 
.ÑÑ Ä
	DayOfYearÑÑÄ â
==ÑÑä å
DateTimeÑÑç ï
.ÑÑï ñ
NowÑÑñ ô
.ÑÑô ö
	DayOfYearÑÑö £
)ÑÑ£ §
.ÑÑ§ •
CountÑÑ• ™
(ÑÑ™ ´
)ÑÑ´ ¨
;ÑÑ¨ ≠
}
ÖÖ 
if
ÜÜ 
(
ÜÜ 
user
ÜÜ 
.
ÜÜ 
NotifyUpdates
ÜÜ "
)
ÜÜ" #
{
áá 
foreach
àà 
(
àà 
var
àà 
relative
àà %
in
àà& (
user
àà) -
.
àà- .
UserRelatives
àà. ;
)
àà; <
{
ââ  
totalNotifications
ää &
+=
ää' )

unitOfWork
ää* 4
.
ää4 5
Person
ää5 ;
.
ää; <
Filter
ää< B
(
ääB C
person
ääC I
=>
ääJ L
person
ääM S
.
ääS T
TreeId
ääT Z
==
ää[ ]
relative
ää^ f
.
ääf g
RelativeUser
ääg s
.
ääs t
Person
äät z
.
ääz {
TreeIdää{ Å
&&ääÇ Ñ
relativeääÖ ç
.ääç é
LastSyncCheckääé õ
.ääõ ú
	CompareToääú •
(ää• ¶
personää¶ ¨
.ää¨ ≠
	CreatedOnää≠ ∂
)ää∂ ∑
<ää∏ π
$numää∫ ª
)ääª º
.ääº Ω
CountääΩ ¬
(ää¬ √
)ää√ ƒ
;ääƒ ≈ 
totalNotifications
ãã &
+=
ãã' )

unitOfWork
ãã* 4
.
ãã4 5
Person
ãã5 ;
.
ãã; <
Filter
ãã< B
(
ããB C
person
ããC I
=>
ããJ L
person
ããM S
.
ããS T
TreeId
ããT Z
==
ãã[ ]
relative
ãã^ f
.
ããf g
RelativeUser
ããg s
.
ããs t
Person
ããt z
.
ããz {
TreeIdãã{ Å
&&ããÇ Ñ
personããÖ ã
.ããã å

ModifiedOnããå ñ
.ããñ ó
HasValueããó ü
&&ãã† ¢
relativeãã£ ´
.ãã´ ¨
LastSyncCheckãã¨ π
.ããπ ∫
	CompareToãã∫ √
(ãã√ ƒ
personããƒ  
.ãã  À

ModifiedOnããÀ ’
.ãã’ ÷
Valueãã÷ €
)ãã€ ‹
<ãã› ﬁ
$numããﬂ ‡
)ãã‡ ·
.ãã· ‚
Countãã‚ Á
(ããÁ Ë
)ããË È
;ããÈ Í 
totalNotifications
åå &
+=
åå' )

unitOfWork
åå* 4
.
åå4 5
Marriage
åå5 =
.
åå= >
Filter
åå> D
(
ååD E
marriage
ååE M
=>
ååN P
marriage
ååQ Y
.
ååY Z
FirstPerson
ååZ e
.
ååe f
TreeId
ååf l
==
ååm o
relative
ååp x
.
ååx y
RelativeUserååy Ö
.ååÖ Ü
PersonååÜ å
.ååå ç
TreeIdååç ì
&&ååî ñ
relativeååó ü
.ååü †
LastSyncCheckåå† ≠
.åå≠ Æ
	CompareToååÆ ∑
(åå∑ ∏
marriageåå∏ ¿
.åå¿ ¡
	CreatedOnåå¡  
)åå  À
<ååÃ Õ
$numååŒ œ
)ååœ –
.åå– —
Countåå— ÷
(åå÷ ◊
)åå◊ ÿ
;ååÿ Ÿ 
totalNotifications
çç &
+=
çç' )

unitOfWork
çç* 4
.
çç4 5
Marriage
çç5 =
.
çç= >
Filter
çç> D
(
ççD E
marriage
ççE M
=>
ççN P
marriage
ççQ Y
.
ççY Z
FirstPerson
ççZ e
.
ççe f
TreeId
ççf l
==
ççm o
relative
ççp x
.
ççx y
RelativeUserççy Ö
.ççÖ Ü
PersonççÜ å
.ççå ç
TreeIdççç ì
&&ççî ñ
marriageççó ü
.ççü †

ModifiedOnçç† ™
.çç™ ´
HasValueçç´ ≥
&&çç¥ ∂
relativeçç∑ ø
.ççø ¿
LastSyncCheckçç¿ Õ
.ççÕ Œ
	CompareToççŒ ◊
(çç◊ ÿ
marriageççÿ ‡
.çç‡ ·

ModifiedOnçç· Î
.ççÎ Ï
ValueççÏ Ò
)ççÒ Ú
<ççÛ Ù
$numççı ˆ
)ççˆ ˜
.çç˜ ¯
Countçç¯ ˝
(çç˝ ˛
)çç˛ ˇ
;ççˇ Ä 
totalNotifications
éé &
+=
éé' )

unitOfWork
éé* 4
.
éé4 5
ParentChild
éé5 @
.
éé@ A
Filter
ééA G
(
ééG H
parentChild
ééH S
=>
ééT V
parentChild
ééW b
.
ééb c
Parent
ééc i
.
ééi j
TreeId
ééj p
==
ééq s
relative
éét |
.
éé| }
RelativeUseréé} â
.ééâ ä
Personééä ê
.ééê ë
TreeIdééë ó
&&ééò ö
relativeééõ £
.éé£ §
LastSyncCheckéé§ ±
.éé± ≤
	CompareToéé≤ ª
(ééª º
parentChildééº «
.éé« »
	CreatedOnéé» —
)éé— “
<éé” ‘
$numéé’ ÷
)éé÷ ◊
.éé◊ ÿ
Countééÿ ›
(éé› ﬁ
)ééﬁ ﬂ
;ééﬂ ‡
}
èè 
}
êê 
return
ëë  
totalNotifications
ëë %
;
ëë% &
}
íí 	
public
îî 
async
îî 
Task
îî 
<
îî !
NotificationsBundle
îî -
>
îî- .
GetNotifications
îî/ ?
(
îî? @
Guid
îî@ D
userId
îîE K
)
îîK L
{
ïï 	
User
ññ 
user
ññ 
=
ññ 

unitOfWork
ññ "
.
ññ" #
User
ññ# '
.
ññ' (
Filter
ññ( .
(
ññ. /
user
ññ/ 3
=>
ññ4 6
user
ññ7 ;
.
ññ; <
Id
ññ< >
==
ññ? A
userId
ññB H
)
ññH I
.
ññI J
Include
ññJ Q
(
ññQ R
u
ññR S
=>
ññT V
u
ññW X
.
ññX Y
UserRelatives
ññY f
)
ññf g
.
ññg h
ThenInclude
ññh s
(
ññs t
r
ññt u
=>
ññv x
r
ññy z
.
ññz {
RelativeUserññ{ á
)ññá à
.ññà â
ThenIncludeññâ î
(ññî ï
ruññï ó
=>ññò ö
ruññõ ù
.ññù û
Personññû §
)ññ§ •
.ññ• ¶
FirstOrDefaultññ¶ ¥
(ññ¥ µ
)ññµ ∂
;ññ∂ ∑!
NotificationsBundle
óó 
notifications
óó  -
=
óó. /
new
óó0 3!
NotificationsBundle
óó4 G
(
óóG H
)
óóH I
;
óóI J
notifications
òò 
.
òò 
RequestsReceived
òò *
=
òò+ ,
await
òò- 2
_requestService
òò3 B
.
òòB C!
GetRequestsReceived
òòC V
(
òòV W
userId
òòW ]
)
òò] ^
;
òò^ _
notifications
ôô 
.
ôô 
RequestsResponded
ôô +
=
ôô, -
await
ôô. 3
_requestService
ôô4 C
.
ôôC D"
GetRequestsResponded
ôôD X
(
ôôX Y
userId
ôôY _
)
ôô_ `
;
ôô` a
if
õõ 
(
õõ 
user
õõ 
==
õõ 
null
õõ 
)
õõ 
{
úú 
return
ùù 
notifications
ùù $
;
ùù$ %
}
ûû 
if
†† 
(
†† 
user
†† 
.
†† 
NotifyBirthdays
†† $
)
††$ %
{
°° 
List
¢¢ 
<
¢¢ 
EventInTreeModel
¢¢ %
>
¢¢% &
eventsInTree
¢¢' 3
=
¢¢4 5
(
¢¢6 7
await
¢¢7 <
_personService
¢¢= K
.
¢¢K L
GetEventsInTree
¢¢L [
(
¢¢[ \
user
¢¢\ `
.
¢¢` a
Person
¢¢a g
.
¢¢g h
TreeId
¢¢h n
)
¢¢n o
)
¢¢o p
;
¢¢p q
notifications
££ 
.
££ 
EventsToday
££ )
=
££* +
eventsInTree
££, 8
.
££8 9
FindAll
££9 @
(
££@ A
e
££A B
=>
££C E
e
££F G
.
££G H
Date
££H L
.
££L M
Day
££M P
==
££Q S
DateTime
££T \
.
££\ ]
Today
££] b
.
££b c
Day
££c f
&&
££g i
e
££j k
.
££k l
Date
££l p
.
££p q
Month
££q v
==
££w y
DateTime££z Ç
.££Ç É
Today££É à
.££à â
Month££â é
)££é è
;££è ê
}
§§ 
else
•• 
{
¶¶ 
notifications
ßß 
.
ßß 
EventsToday
ßß )
=
ßß* +
new
ßß, /
List
ßß0 4
<
ßß4 5
EventInTreeModel
ßß5 E
>
ßßE F
(
ßßF G
)
ßßG H
;
ßßH I
}
®® 
notifications
©© 
.
©© 
RelativeUpdates
©© )
=
©©* +
new
©©, /
List
©©0 4
<
©©4 5
RelativeUpdates
©©5 D
>
©©D E
(
©©E F
)
©©F G
;
©©G H
if
™™ 
(
™™ 
user
™™ 
.
™™ 
NotifyUpdates
™™ "
)
™™" #
{
´´ 
foreach
¨¨ 
(
¨¨ 
var
¨¨ 
relative
¨¨ %
in
¨¨& (
user
¨¨) -
.
¨¨- .
UserRelatives
¨¨. ;
)
¨¨; <
{
≠≠ 
RelativeUpdates
ÆÆ #
relativeUpdates
ÆÆ$ 3
=
ÆÆ4 5
new
ÆÆ6 9
RelativeUpdates
ÆÆ: I
(
ÆÆI J
)
ÆÆJ K
;
ÆÆK L
relativeUpdates
ØØ #
.
ØØ# $
Updates
ØØ$ +
.
ØØ+ ,
AddRange
ØØ, 4
(
ØØ4 5

unitOfWork
ØØ5 ?
.
ØØ? @
Person
ØØ@ F
.
ØØF G
Filter
ØØG M
(
ØØM N
person
ØØN T
=>
ØØU W
person
ØØX ^
.
ØØ^ _
TreeId
ØØ_ e
==
ØØf h
relative
ØØi q
.
ØØq r
RelativeUser
ØØr ~
.
ØØ~ 
PersonØØ Ö
.ØØÖ Ü
TreeIdØØÜ å
&&ØØç è
relativeØØê ò
.ØØò ô
LastSyncCheckØØô ¶
.ØØ¶ ß
	CompareToØØß ∞
(ØØ∞ ±
personØØ± ∑
.ØØ∑ ∏
	CreatedOnØØ∏ ¡
)ØØ¡ ¬
<ØØ√ ƒ
$numØØ≈ ∆
)ØØ∆ «
.
∞∞ 
Select
∞∞ 
(
∞∞  
person
∞∞  &
=>
∞∞' )
new
∞∞* -
UpdateInfoModel
∞∞. =
(
∞∞= >
)
∞∞> ?
{
±± 
ReferenceId
≤≤ '
=
≤≤( )
person
≤≤* 0
.
≤≤0 1
Id
≤≤1 3
,
≤≤3 4

UpdateType
≥≥ &
=
≥≥' (

UpdateType
≥≥) 3
.
≥≥3 4
PersonCreated
≥≥4 A
,
≥≥A B!
AffectedPeopleNames
¥¥ /
=
¥¥0 1$
GetAffectedPersonNames
¥¥2 H
(
¥¥H I
person
¥¥I O
,
¥¥O P
null
¥¥Q U
)
¥¥U V
}
µµ 
)
µµ 
.
µµ 
ToList
µµ !
(
µµ! "
)
µµ" #
)
µµ# $
;
µµ$ %
relativeUpdates
∂∂ #
.
∂∂# $
Updates
∂∂$ +
.
∂∂+ ,
AddRange
∂∂, 4
(
∂∂4 5

unitOfWork
∂∂5 ?
.
∂∂? @
Person
∂∂@ F
.
∂∂F G
Filter
∂∂G M
(
∂∂M N
person
∂∂N T
=>
∂∂U W
person
∂∂X ^
.
∂∂^ _
TreeId
∂∂_ e
==
∂∂f h
relative
∂∂i q
.
∂∂q r
RelativeUser
∂∂r ~
.
∂∂~ 
Person∂∂ Ö
.∂∂Ö Ü
TreeId∂∂Ü å
&&∂∂ç è
person∂∂ê ñ
.∂∂ñ ó

ModifiedOn∂∂ó °
.∂∂° ¢
HasValue∂∂¢ ™
&&∂∂´ ≠
relative∂∂Æ ∂
.∂∂∂ ∑
LastSyncCheck∂∂∑ ƒ
.∂∂ƒ ≈
	CompareTo∂∂≈ Œ
(∂∂Œ œ
person∂∂œ ’
.∂∂’ ÷

ModifiedOn∂∂÷ ‡
.∂∂‡ ·
Value∂∂· Ê
)∂∂Ê Á
<∂∂Ë È
$num∂∂Í Î
)∂∂Î Ï
.
∑∑ 
Select
∑∑ 
(
∑∑  
person
∑∑  &
=>
∑∑' )
new
∑∑* -
UpdateInfoModel
∑∑. =
(
∑∑= >
)
∑∑> ?
{
∏∏ 
ReferenceId
ππ '
=
ππ( )
person
ππ* 0
.
ππ0 1
Id
ππ1 3
,
ππ3 4

UpdateType
∫∫ &
=
∫∫' (

UpdateType
∫∫) 3
.
∫∫3 4
PersonModified
∫∫4 B
,
∫∫B C!
AffectedPeopleNames
ªª /
=
ªª0 1$
GetAffectedPersonNames
ªª2 H
(
ªªH I
person
ªªI O
,
ªªO P
null
ªªQ U
)
ªªU V
}
ºº 
)
ºº 
.
ºº 
ToList
ºº !
(
ºº! "
)
ºº" #
)
ºº# $
;
ºº$ %
relativeUpdates
ΩΩ #
.
ΩΩ# $
Updates
ΩΩ$ +
.
ΩΩ+ ,
AddRange
ΩΩ, 4
(
ΩΩ4 5

unitOfWork
ΩΩ5 ?
.
ΩΩ? @
Marriage
ΩΩ@ H
.
ΩΩH I
Filter
ΩΩI O
(
ΩΩO P
marriage
ΩΩP X
=>
ΩΩY [
marriage
ΩΩ\ d
.
ΩΩd e
FirstPerson
ΩΩe p
.
ΩΩp q
TreeId
ΩΩq w
==
ΩΩx z
relativeΩΩ{ É
.ΩΩÉ Ñ
RelativeUserΩΩÑ ê
.ΩΩê ë
PersonΩΩë ó
.ΩΩó ò
TreeIdΩΩò û
&&ΩΩü °
relativeΩΩ¢ ™
.ΩΩ™ ´
LastSyncCheckΩΩ´ ∏
.ΩΩ∏ π
	CompareToΩΩπ ¬
(ΩΩ¬ √
marriageΩΩ√ À
.ΩΩÀ Ã
	CreatedOnΩΩÃ ’
)ΩΩ’ ÷
<ΩΩ◊ ÿ
$numΩΩŸ ⁄
)ΩΩ⁄ €
.
ææ 
Select
ææ 
(
ææ  
marriage
ææ  (
=>
ææ) +
new
ææ, /
UpdateInfoModel
ææ0 ?
(
ææ? @
)
ææ@ A
{
øø 
ReferenceId
¿¿ '
=
¿¿( )
marriage
¿¿* 2
.
¿¿2 3
FirstPersonId
¿¿3 @
,
¿¿@ A

UpdateType
¡¡ &
=
¡¡' (

UpdateType
¡¡) 3
.
¡¡3 4
MarriageCreated
¡¡4 C
,
¡¡C D!
AffectedPeopleNames
¬¬ /
=
¬¬0 1$
GetAffectedPersonNames
¬¬2 H
(
¬¬H I
marriage
¬¬I Q
.
¬¬Q R
FirstPerson
¬¬R ]
,
¬¬] ^
marriage
¬¬_ g
.
¬¬g h
SecondPerson
¬¬h t
)
¬¬t u
}
√√ 
)
√√ 
.
√√ 
ToList
√√ !
(
√√! "
)
√√" #
)
√√# $
;
√√$ %
relativeUpdates
ƒƒ #
.
ƒƒ# $
Updates
ƒƒ$ +
.
ƒƒ+ ,
AddRange
ƒƒ, 4
(
ƒƒ4 5

unitOfWork
ƒƒ5 ?
.
ƒƒ? @
Marriage
ƒƒ@ H
.
ƒƒH I
Filter
ƒƒI O
(
ƒƒO P
marriage
ƒƒP X
=>
ƒƒY [
marriage
ƒƒ\ d
.
ƒƒd e
FirstPerson
ƒƒe p
.
ƒƒp q
TreeId
ƒƒq w
==
ƒƒx z
relativeƒƒ{ É
.ƒƒÉ Ñ
RelativeUserƒƒÑ ê
.ƒƒê ë
Personƒƒë ó
.ƒƒó ò
TreeIdƒƒò û
&&ƒƒü °
marriageƒƒ¢ ™
.ƒƒ™ ´

ModifiedOnƒƒ´ µ
.ƒƒµ ∂
HasValueƒƒ∂ æ
&&ƒƒø ¡
relativeƒƒ¬  
.ƒƒ  À
LastSyncCheckƒƒÀ ÿ
.ƒƒÿ Ÿ
	CompareToƒƒŸ ‚
(ƒƒ‚ „
marriageƒƒ„ Î
.ƒƒÎ Ï

ModifiedOnƒƒÏ ˆ
.ƒƒˆ ˜
Valueƒƒ˜ ¸
)ƒƒ¸ ˝
<ƒƒ˛ ˇ
$numƒƒÄ Å
)ƒƒÅ Ç
.
≈≈ 
Select
≈≈ 
(
≈≈  
marriage
≈≈  (
=>
≈≈) +
new
≈≈, /
UpdateInfoModel
≈≈0 ?
(
≈≈? @
)
≈≈@ A
{
∆∆ 
ReferenceId
«« '
=
««( )
marriage
««* 2
.
««2 3
FirstPersonId
««3 @
,
««@ A

UpdateType
»» &
=
»»' (

UpdateType
»») 3
.
»»3 4
MarriageModified
»»4 D
,
»»D E!
AffectedPeopleNames
…… /
=
……0 1$
GetAffectedPersonNames
……2 H
(
……H I
marriage
……I Q
.
……Q R
FirstPerson
……R ]
,
……] ^
marriage
……_ g
.
……g h
SecondPerson
……h t
)
……t u
}
   
)
   
.
   
ToList
   !
(
  ! "
)
  " #
)
  # $
;
  $ %
relativeUpdates
ÀÀ #
.
ÀÀ# $
Updates
ÀÀ$ +
.
ÀÀ+ ,
AddRange
ÀÀ, 4
(
ÀÀ4 5

unitOfWork
ÀÀ5 ?
.
ÀÀ? @
ParentChild
ÀÀ@ K
.
ÀÀK L
Filter
ÀÀL R
(
ÀÀR S
parentChild
ÀÀS ^
=>
ÀÀ_ a
parentChild
ÀÀb m
.
ÀÀm n
Parent
ÀÀn t
.
ÀÀt u
TreeId
ÀÀu {
==
ÀÀ| ~
relativeÀÀ á
.ÀÀá à
RelativeUserÀÀà î
.ÀÀî ï
PersonÀÀï õ
.ÀÀõ ú
TreeIdÀÀú ¢
&&ÀÀ£ •
relativeÀÀ¶ Æ
.ÀÀÆ Ø
LastSyncCheckÀÀØ º
.ÀÀº Ω
	CompareToÀÀΩ ∆
(ÀÀ∆ «
parentChildÀÀ« “
.ÀÀ“ ”
	CreatedOnÀÀ” ‹
)ÀÀ‹ ›
<ÀÀﬁ ﬂ
$numÀÀ‡ ·
)ÀÀ· ‚
.
ÃÃ 
Select
ÃÃ 
(
ÃÃ  
parentChild
ÃÃ  +
=>
ÃÃ, .
new
ÃÃ/ 2
UpdateInfoModel
ÃÃ3 B
(
ÃÃB C
)
ÃÃC D
{
ÕÕ 
ReferenceId
ŒŒ '
=
ŒŒ( )
parentChild
ŒŒ* 5
.
ŒŒ5 6
ParentId
ŒŒ6 >
,
ŒŒ> ?

UpdateType
œœ &
=
œœ' (

UpdateType
œœ) 3
.
œœ3 4
ParentChildAdded
œœ4 D
,
œœD E!
AffectedPeopleNames
–– /
=
––0 1$
GetAffectedPersonNames
––2 H
(
––H I
parentChild
––I T
.
––T U
Parent
––U [
,
––[ \
parentChild
––] h
.
––h i
Child
––i n
)
––n o
}
—— 
)
—— 
.
—— 
ToList
—— !
(
——! "
)
——" #
)
——# $
;
——$ %
if
““ 
(
““ 
relativeUpdates
““ '
.
““' (
Updates
““( /
.
““/ 0
Any
““0 3
(
““3 4
)
““4 5
)
““5 6
{
”” 
relativeUpdates
‘‘ '
.
‘‘' (

RelativeId
‘‘( 2
=
‘‘3 4
relative
‘‘5 =
.
‘‘= >
Id
‘‘> @
;
‘‘@ A
relativeUpdates
’’ '
.
’’' (
Relative
’’( 0
=
’’1 2
_mapper
’’3 :
.
’’: ;
Map
’’; >
<
’’> ? 
GenericPersonModel
’’? Q
>
’’Q R
(
’’R S
relative
’’S [
.
’’[ \
RelativeUser
’’\ h
)
’’h i
;
’’i j
relativeUpdates
÷÷ '
.
÷÷' (
Relative
÷÷( 0
.
÷÷0 1
	ImageFile
÷÷1 :
=
÷÷; <
await
÷÷= B$
_fileManagementService
÷÷C Y
.
÷÷Y Z
GetFile
÷÷Z a
(
÷÷a b
relative
÷÷b j
.
÷÷j k
RelativeUser
÷÷k w
.
÷÷w x
Person
÷÷x ~
.
÷÷~ 
Image÷÷ Ñ
)÷÷Ñ Ö
;÷÷Ö Ü
notifications
◊◊ %
.
◊◊% &
RelativeUpdates
◊◊& 5
.
◊◊5 6
Add
◊◊6 9
(
◊◊9 :
relativeUpdates
◊◊: I
)
◊◊I J
;
◊◊J K
}
ÿÿ 
}
ŸŸ 
}
⁄⁄ 
return
€€ 
notifications
€€  
;
€€  !
}
‹‹ 	
private
ﬁﬁ 
static
ﬁﬁ 
List
ﬁﬁ 
<
ﬁﬁ 
string
ﬁﬁ "
>
ﬁﬁ" #$
GetAffectedPersonNames
ﬁﬁ$ :
(
ﬁﬁ: ;
Person
ﬁﬁ; A
firstPerson
ﬁﬁB M
,
ﬁﬁM N
Person
ﬁﬁO U
secondPerson
ﬁﬁV b
)
ﬁﬁb c
{
ﬂﬂ 	
List
‡‡ 
<
‡‡ 
string
‡‡ 
>
‡‡ 
affectedNames
‡‡ &
=
‡‡' (
new
‡‡) ,
List
‡‡- 1
<
‡‡1 2
string
‡‡2 8
>
‡‡8 9
(
‡‡9 :
)
‡‡: ;
;
‡‡; <
affectedNames
·· 
.
·· 
Add
·· 
(
·· 
firstPerson
·· )
.
··) *
	FirstName
··* 3
+
··4 5
$str
··6 9
+
··: ;
firstPerson
··< G
.
··G H
LastName
··H P
)
··P Q
;
··Q R
if
‚‚ 
(
‚‚ 
secondPerson
‚‚ 
!=
‚‚ 
null
‚‚  $
)
‚‚$ %
{
„„ 
affectedNames
‰‰ 
.
‰‰ 
Add
‰‰ !
(
‰‰! "
secondPerson
‰‰" .
.
‰‰. /
	FirstName
‰‰/ 8
+
‰‰9 :
$str
‰‰; >
+
‰‰? @
secondPerson
‰‰A M
.
‰‰M N
LastName
‰‰N V
)
‰‰V W
;
‰‰W X
}
ÂÂ 
return
ÊÊ 
affectedNames
ÊÊ  
;
ÊÊ  !
}
ÁÁ 	
public
ÈÈ 
async
ÈÈ 
Task
ÈÈ 
<
ÈÈ 
UserDetailsModel
ÈÈ *
>
ÈÈ* +

UpdateUser
ÈÈ, 6
(
ÈÈ6 7
Guid
ÈÈ7 ;
userId
ÈÈ< B
,
ÈÈB C
UserUpdateModel
ÈÈD S
user
ÈÈT X
)
ÈÈX Y
{
ÍÍ 	
User
ÎÎ 
userToUpdate
ÎÎ 
=
ÎÎ 
await
ÎÎ  %

unitOfWork
ÎÎ& 0
.
ÎÎ0 1
User
ÎÎ1 5
.
ÎÎ5 6
FindById
ÎÎ6 >
(
ÎÎ> ?
userId
ÎÎ? E
)
ÎÎE F
;
ÎÎF G
if
ÏÏ 
(
ÏÏ 
userToUpdate
ÏÏ 
==
ÏÏ 
null
ÏÏ  $
||
ÏÏ% '
user
ÏÏ( ,
==
ÏÏ- /
null
ÏÏ0 4
)
ÏÏ4 5
{
ÌÌ 
return
ÓÓ 
null
ÓÓ 
;
ÓÓ 
}
ÔÔ 
userToUpdate
 
.
 
About
 
=
  
user
! %
.
% &
About
& +
;
+ ,
userToUpdate
ÒÒ 
.
ÒÒ 
Email
ÒÒ 
=
ÒÒ  
user
ÒÒ! %
.
ÒÒ% &
Email
ÒÒ& +
;
ÒÒ+ ,
userToUpdate
ÚÚ 
.
ÚÚ 
PhoneNumber
ÚÚ $
=
ÚÚ% &
user
ÚÚ' +
.
ÚÚ+ ,
PhoneNumber
ÚÚ, 7
;
ÚÚ7 8
User
ÛÛ 

userEntity
ÛÛ 
=
ÛÛ 
await
ÛÛ #

unitOfWork
ÛÛ$ .
.
ÛÛ. /
User
ÛÛ/ 3
.
ÛÛ3 4
Update
ÛÛ4 :
(
ÛÛ: ;
userToUpdate
ÛÛ; G
)
ÛÛG H
;
ÛÛH I
UserDetailsModel
ÙÙ 
returnEvent
ÙÙ (
=
ÙÙ) *
_mapper
ÙÙ+ 2
.
ÙÙ2 3
Map
ÙÙ3 6
<
ÙÙ6 7
UserDetailsModel
ÙÙ7 G
>
ÙÙG H
(
ÙÙH I

userEntity
ÙÙI S
)
ÙÙS T
;
ÙÙT U
return
ıı 
returnEvent
ıı 
;
ıı 
}
ˆˆ 	
public
¯¯ 
async
¯¯ 
Task
¯¯ 
<
¯¯ 
bool
¯¯ 
>
¯¯ $
CheckUsernameAvailable
¯¯  6
(
¯¯6 7
string
¯¯7 =
username
¯¯> F
)
¯¯F G
{
˘˘ 	
User
˙˙ 
user
˙˙ 
=
˙˙ 
await
˙˙ 
Task
˙˙ "
.
˙˙" #
Run
˙˙# &
(
˙˙& '
(
˙˙' (
)
˙˙( )
=>
˙˙* ,

unitOfWork
˙˙- 7
.
˙˙7 8
User
˙˙8 <
.
˙˙< =
Filter
˙˙= C
(
˙˙C D
x
˙˙D E
=>
˙˙F H
x
˙˙I J
.
˙˙J K
Username
˙˙K S
==
˙˙T V
username
˙˙W _
)
˙˙_ `
.
˙˙` a
FirstOrDefault
˙˙a o
(
˙˙o p
)
˙˙p q
)
˙˙q r
;
˙˙r s
return
˚˚ 
user
˚˚ 
==
˚˚ 
default
˚˚ "
(
˚˚" #
User
˚˚# '
)
˚˚' (
;
˚˚( )
}
¸¸ 	
public
˛˛ 
async
˛˛ 
Task
˛˛ 
<
˛˛ 
bool
˛˛ 
>
˛˛ !
CheckEmailAvailable
˛˛  3
(
˛˛3 4
string
˛˛4 :
email
˛˛; @
)
˛˛@ A
{
ˇˇ 	
User
ÄÄ 
user
ÄÄ 
=
ÄÄ 
await
ÄÄ 
Task
ÄÄ "
.
ÄÄ" #
Run
ÄÄ# &
(
ÄÄ& '
(
ÄÄ' (
)
ÄÄ( )
=>
ÄÄ* ,

unitOfWork
ÄÄ- 7
.
ÄÄ7 8
User
ÄÄ8 <
.
ÄÄ< =
Filter
ÄÄ= C
(
ÄÄC D
x
ÄÄD E
=>
ÄÄF H
x
ÄÄI J
.
ÄÄJ K
Email
ÄÄK P
==
ÄÄQ S
email
ÄÄT Y
)
ÄÄY Z
.
ÄÄZ [
FirstOrDefault
ÄÄ[ i
(
ÄÄi j
)
ÄÄj k
)
ÄÄk l
;
ÄÄl m
return
ÅÅ 
user
ÅÅ 
==
ÅÅ 
default
ÅÅ "
(
ÅÅ" #
User
ÅÅ# '
)
ÅÅ' (
;
ÅÅ( )
}
ÇÇ 	
public
ÑÑ 
async
ÑÑ 
Task
ÑÑ 
<
ÑÑ 
UserSettingsModel
ÑÑ +
>
ÑÑ+ ,
GetUserSettings
ÑÑ- <
(
ÑÑ< =
Guid
ÑÑ= A
userId
ÑÑB H
)
ÑÑH I
{
ÖÖ 	
User
ÜÜ 
user
ÜÜ 
=
ÜÜ 
await
ÜÜ 

unitOfWork
ÜÜ (
.
ÜÜ( )
User
ÜÜ) -
.
ÜÜ- .
FindById
ÜÜ. 6
(
ÜÜ6 7
userId
ÜÜ7 =
)
ÜÜ= >
;
ÜÜ> ?
return
áá 
_mapper
áá 
.
áá 
Map
áá 
<
áá 
UserSettingsModel
áá 0
>
áá0 1
(
áá1 2
user
áá2 6
)
áá6 7
;
áá7 8
}
àà 	
public
ää 
async
ää 
Task
ää 
<
ää 
UserSettingsModel
ää +
>
ää+ , 
UpdateUserSettings
ää- ?
(
ää? @
Guid
ää@ D
userId
ääE K
,
ääK L
UserSettingsModel
ääM ^
userSettings
ää_ k
)
ääk l
{
ãã 	
User
åå 
userToUpdate
åå 
=
åå 
await
åå  %

unitOfWork
åå& 0
.
åå0 1
User
åå1 5
.
åå5 6
FindById
åå6 >
(
åå> ?
userId
åå? E
)
ååE F
;
ååF G
if
çç 
(
çç 
userToUpdate
çç 
==
çç 
null
çç  $
||
çç% '
userSettings
çç( 4
==
çç5 7
null
çç8 <
)
çç< =
{
éé 
return
èè 
null
èè 
;
èè 
}
êê 
userToUpdate
ëë 
.
ëë 
NotifyUpdates
ëë &
=
ëë' (
userSettings
ëë) 5
.
ëë5 6
NotifyUpdates
ëë6 C
;
ëëC D
userToUpdate
íí 
.
íí 
NotifyBirthdays
íí (
=
íí) *
userSettings
íí+ 7
.
íí7 8
NotifyBirthdays
íí8 G
;
ííG H
userToUpdate
ìì 
.
ìì 
SharePersonalInfo
ìì *
=
ìì+ ,
userSettings
ìì- 9
.
ìì9 :
SharePersonalInfo
ìì: K
;
ììK L
userToUpdate
îî 
.
îî 
ShareLocation
îî &
=
îî' (
userSettings
îî) 5
.
îî5 6
ShareLocation
îî6 C
;
îîC D
User
ïï 

userEntity
ïï 
=
ïï 
await
ïï #

unitOfWork
ïï$ .
.
ïï. /
User
ïï/ 3
.
ïï3 4
Update
ïï4 :
(
ïï: ;
userToUpdate
ïï; G
)
ïïG H
;
ïïH I
UserSettingsModel
ññ 
returnEvent
ññ )
=
ññ* +
_mapper
ññ, 3
.
ññ3 4
Map
ññ4 7
<
ññ7 8
UserSettingsModel
ññ8 I
>
ññI J
(
ññJ K

userEntity
ññK U
)
ññU V
;
ññV W
return
óó 
returnEvent
óó 
;
óó 
}
òò 	
public
öö 
async
öö 
Task
öö 
<
öö 
PositionModel
öö '
>
öö' ( 
UpdateUserPosition
öö) ;
(
öö; <
Guid
öö< @
userId
ööA G
,
ööG H
PositionModel
ööI V
position
ööW _
)
öö_ `
{
õõ 	
Position
úú 
positionInDb
úú !
=
úú" #
(
úú$ %
await
úú% *

unitOfWork
úú+ 5
.
úú5 6
User
úú6 :
.
úú: ;
FindById
úú; C
(
úúC D
userId
úúD J
)
úúJ K
)
úúK L
.
úúL M
Position
úúM U
;
úúU V
if
ùù 
(
ùù 
positionInDb
ùù 
==
ùù 
null
ùù  $
||
ùù% '
position
ùù( 0
==
ùù1 3
null
ùù4 8
)
ùù8 9
{
ûû 
return
üü 
null
üü 
;
üü 
}
†† 
positionInDb
°° 
.
°° 
	UpdatedOn
°° "
=
°°# $
DateTime
°°% -
.
°°- .
Now
°°. 1
;
°°1 2
positionInDb
¢¢ 
.
¢¢ 
Latitude
¢¢ !
=
¢¢" #
position
¢¢$ ,
.
¢¢, -
Latitude
¢¢- 5
;
¢¢5 6
positionInDb
££ 
.
££ 
	Longitude
££ "
=
££# $
position
££% -
.
££- .
	Longitude
££. 7
;
££7 8
Position
§§ 
positionEntity
§§ #
=
§§$ %
await
§§& +

unitOfWork
§§, 6
.
§§6 7
Position
§§7 ?
.
§§? @
Update
§§@ F
(
§§F G
positionInDb
§§G S
)
§§S T
;
§§T U
PositionModel
•• 
returnEvent
•• %
=
••& '
_mapper
••( /
.
••/ 0
Map
••0 3
<
••3 4
PositionModel
••4 A
>
••A B
(
••B C
positionEntity
••C Q
)
••Q R
;
••R S
return
¶¶ 
returnEvent
¶¶ 
;
¶¶ 
}
ßß 	
}
®® 
}©© 