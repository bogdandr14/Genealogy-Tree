ß
bE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Auth\LoginModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
User# '
{ 
public 

class 

LoginModel 
{ 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} …
jE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Auth\LoginResponseModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
User# '
{ 
public 

class 
LoginResponseModel #
{ 
public 
int 
PersonId 
{ 
get !
;! "
set# &
;& '
}( )
public 
Guid 
TreeId 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Token		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} ù
eE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Auth\RegisterModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
User# '
{ 
public 

class 
RegisterModel 
:  

LoginModel! +
{ 
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
Gender		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
int

 
?

 
NationalityId

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
int 
? 

ReligionId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
	BirthDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ﬂ
kE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Auth\UpdatePasswordModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
User# '
{ 
public 

class 
UpdatePasswordModel $
{ 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
CurrentPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
NewPassword !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
}		 é

aE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\EducationModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
{ 
public 

class 
EducationModel 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
Guid		 
UserId		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 "
EducationInstituteName

 ,
{

- .
get

/ 2
;

2 3
set

4 7
;

7 8
}

9 :
public 
DateTime 
	StartDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
EndDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
GenericNameModel 
EducationLevel  .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} Æ
bE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Email\SmtpModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Email# (
{ 
public 

class 
	SmtpModel 
{ 
public 
string 
Host 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
Port 
{ 
get 
; 
set "
;" #
}$ %
public 
string 
From 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
	EnableSsl 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
string		 
Password		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
bool

 

IsBodyHtml

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
bool !
UseDefaultCredentials )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} Ö	
fE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Email\SupportTicket.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Email# (
{ 
public 

class 
SupportTicket 
{ 
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Subject 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
string		 
EmailContact		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
string

 
Language

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
} 
} ¨
kE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Generic\GenericNameModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Generic# *
{ 
public 

class 
GenericNameModel !
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ·
mE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Generic\GenericPersonModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Person# )
{ 
public 

class 
GenericPersonModel #
{ 
public 
Guid 
TreeId 
{ 
get  
;  !
set" %
;% &
}' (
public 
Guid 
? 
UserId 
{ 
get !
;! "
set# &
;& '
}( )
public		 
int		 
PersonId		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
	FirstName

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
? 
ImageId 
{ 
get !
;! "
set# &
;& '
}( )
public 
DateTime 
? 
	BirthDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
? 
	DeathDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
	ImageFile 
? 
	ImageFile #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ƒ
oE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Generic\GenericRelativeModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Generic# *
{ 
public 

class  
GenericRelativeModel %
{ 
public 
int 

RelativeId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
BloodRelatives "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ƒ
\E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\ImageFile.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
{ 
public 

class 
	ImageFile 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
string		 
MimeType		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
Stream

 
Stream

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
long 
SizeInBytes 
{  !
get" %
;% &
set' *
;* +
}, -
public 
Guid 
Name 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
FileName 
=> !
$"" $
{$ %
Name% )
}) *
$str* +
{+ ,
	Extension, 5
}5 6
"6 7
;7 8
public 
string 
	Extension 
=>  "

FileHelper# -
.- .
GetExtension. :
(: ;
MimeType; C
)C D
;D E
public 
byte 
[ 
] 
FileInBytes !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Æ
`E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\LocationModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
{ 
public 

class 
LocationModel 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Country 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
}		 
}

 ∞	
uE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Marriage\MarriageCreateUpdateModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Marriage# +
{ 
public 

class %
MarriageCreateUpdateModel *
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
DateTime 
	StartDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
DateTime		 
?		 
EndDate		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
int

 
FirstPersonId

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
int 
SecondPersonId !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Â
pE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Marriage\MarriageDetailsModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Marriage# +
{ 
public 

class  
MarriageDetailsModel %
:& '
MarriedPersonModel( :
{ 
public 
PersonDetailsModel !
FirstPerson" -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
}		 
}

 †
nE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Marriage\MarriedPersonModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Marriage# +
{ 
public 

class 
MarriedPersonModel #
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
DateTime		 
MarriageStarted		 '
{		( )
get		* -
;		- .
set		/ 2
;		2 3
}		4 5
public

 
DateTime

 
?

 
MarriageEnded

 &
{

' (
get

) ,
;

, -
set

. 1
;

1 2
}

3 4
public 
GenericPersonModel !
PersonMarriedTo" 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
} ‘	
fE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\NotificationsBundle.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
{ 
public 

class 
NotificationsBundle $
{ 
public		 
List		 
<		 
RequestDetailsModel		 '
>		' (
RequestsReceived		) 9
{		: ;
get		< ?
;		? @
set		A D
;		D E
}		F G
public

 
List

 
<

  
RequestResponseModel

 (
>

( )
RequestsResponded

* ;
{

< =
get

> A
;

A B
set

C F
;

F G
}

H I
public 
List 
< 
RelativeUpdates #
># $
RelativeUpdates% 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
List 
< 
EventInTreeModel $
>$ %
EventsToday& 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
} û

bE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\OccupationModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
{ 
public 

class 
OccupationModel  
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
OccupationName		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public

 
string

 
WorkingPlaceName

 &
{

' (
get

) ,
;

, -
set

. 1
;

1 2
}

3 4
public 
DateTime 
? 
	StartDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
? 
EndDate  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ™
iE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\ParentChild\ChildModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
ParentChild# .
{ 
public 

class 

ChildModel 
: 
ParentChildModel .
{ 
} 
} É
{E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\ParentChild\ParentChildCreateUpdateModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
ParentChild# .
{ 
public 

class (
ParentChildCreateUpdateModel -
:. / 
GenericRelativeModel0 D
{ 
public 
int 
ParentId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
ChildId 
{ 
get  
;  !
set" %
;% &
}' (
}		 
}

 ì
vE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\ParentChild\ParentChildDetailsModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
ParentChild# .
{ 
public 

class #
ParentChildDetailsModel (
:) * 
GenericRelativeModel+ ?
{ 
public 
PersonDetailsModel !
Child" '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public		 
PersonDetailsModel		 !
Parent		" (
{		) *
get		+ .
;		. /
set		0 3
;		3 4
}		5 6
}

 
} ˆ
oE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\ParentChild\ParentChildModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
ParentChild# .
{ 
public 

class 
ParentChildModel !
:! "
GenericPersonModel# 5
{ 
public 
int 
ParentChildId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
BloodRelatives "
{# $
get% (
;( )
set* -
;- .
}/ 0
}		 
}

 ¨
jE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\ParentChild\ParentModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
ParentChild# .
{ 
public 

class 
ParentModel 
: 
ParentChildModel /
{ 
} 
} ò
jE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Person\EventInTreeModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Person# )
{ 
public 

class 
EventInTreeModel !
{ 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
string		 
	EventType		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
ICollection

 
<

 
PersonBaseModel

 *
>

* +
AffectedPeople

, :
{

; <
get

= @
;

@ A
set

B E
;

E F
}

G H
} 
} ˛
iE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Person\PersonBaseModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Person# )
{ 
public 

class 
PersonBaseModel  
{ 
public 
int 
PersonId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public

 
	ImageFile

 
?

 
	ImageFile

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
} 
} ÷
qE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Person\PersonCreateUpdateModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Person# )
{ 
public 

class #
PersonCreateUpdateModel (
:) *
GenericPersonModel+ =
{ 
public 
GenericNameModel 
Nationality  +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public		 
GenericNameModel		 
Religion		  (
{		) *
get		+ .
;		. /
set		0 3
;		3 4
}		5 6
public 
LocationModel 

BirthPlace '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
LocationModel 
LivingPlace (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} –
lE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Person\PersonDetailsModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Person# )
{ 
public 

class 
PersonDetailsModel #
:$ %#
PersonCreateUpdateModel& =
{		 
public

 
ICollection

 
<

 
ParentChildModel

 +
>

+ ,
Parents

- 4
{

5 6
get

7 :
;

: ;
set

< ?
;

? @
}

A B
public 
ICollection 
< 
ParentChildModel +
>+ ,
Children- 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
ICollection 
< 
MarriedPersonModel -
>- .
	Marriages/ 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
} 
} À
pE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Person\PersonImageUpdateModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Person# )
{ 
public 

class "
PersonImageUpdateModel '
{ 
public 
int 
PersonId 
{ 
get !
;! "
set# &
;& '
}( )
public		 
int		 
?		 
ImageId		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} π
mE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Person\PersonTreeInfoModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Person# )
{ 
public 

class 
PersonTreeInfoModel $
:$ %
GenericPersonModel& 8
{ 
public 
int 
FatherId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
MotherId 
{ 
get !
;! "
set# &
;& '
}( )
public		 
ICollection		 
<		 
int		 
>		 
PartnersIds		  +
{		, -
get		. 1
;		1 2
set		3 6
;		6 7
}		8 9
}

 
} û
`E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\PositionModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
{ 
public 

class 
PositionModel 
{ 
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public 
float 
Latitude 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
float		 
	Longitude		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
}

 
} ß	
bE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\RelativeUpdates.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
{ 
public 

class 
RelativeUpdates  
{ 
public 
RelativeUpdates 
( 
)  
{		 	
this

 
.

 
Updates

 
=

 
new

 
List

 #
<

# $
UpdateInfoModel

$ 3
>

3 4
(

4 5
)

5 6
;

6 7
} 	
public 
int 

RelativeId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
GenericPersonModel !
Relative" *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
List 
< 
UpdateInfoModel #
># $
Updates% ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} „
iE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Relative\RelativeModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Relative# +
{ 
public 

class 
RelativeModel 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
GenericPersonModel !
RelativeUser" .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public		 
int		 "
RelativePersonInTreeId		 )
{		* +
get		, /
;		/ 0
set		1 4
;		4 5
}		6 7
}

 
} ö
lE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Relative\UsersToLinkModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Relative# +
{ 
public 

class 
UsersToLinkModel !
{ 
public 
Guid 
PrimaryUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Guid 
LinkedUserId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
int		 '
LinkedPersonInPrimaryTreeId		 .
{		/ 0
get		1 4
;		4 5
set		6 9
;		9 :
}		; <
public

 
int

 )
PrimaryPersonInRelativeTreeId

 0
{

1 2
get

3 6
;

6 7
set

8 ;
;

; <
}

= >
} 
} ≠
sE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Request\RequestCreateUpdateModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Request# *
{ 
public 

class $
RequestCreateUpdateModel )
{ 
public 
int 
? 
Id 
{ 
get 
; 
set !
;! "
}# $
public		 
Guid		 
SenderUserId		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
GenericPersonModel

 !
ReceiverUser

" .
{

/ 0
get

1 4
;

4 5
set

6 9
;

9 :
}

; <
public 
int +
ReceiverReferenceInSenderTreeId 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} †
nE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Request\RequestDetailsModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Request# *
{ 
public 

class 
RequestDetailsModel $
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
GenericPersonModel		 !
ReceiverUser		" .
{		/ 0
get		1 4
;		4 5
set		6 9
;		9 :
}		; <
public

 
GenericPersonModel

 !

SenderUser

" ,
{

- .
get

/ 2
;

2 3
set

4 7
;

7 8
}

9 :
public 
int +
ReceiverReferenceInSenderTreeId 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} í
oE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\Request\RequestResponseModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
Request# *
{ 
public 

class  
RequestResponseModel %
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
GenericPersonModel !
ReceiverUser" .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public		 
int		 +
SenderReferenceInReceiverTreeId		 2
{		3 4
get		5 8
;		8 9
set		: =
;		= >
}		? @
public

 
bool

 
Response

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
} 
} Ë
bE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\UpdateInfoModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
{ 
public 

class 
UpdateInfoModel  
{ 
public		 

UpdateType		 

UpdateType		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public

 
List

 
<

 
String

 
>

 
AffectedPeopleNames

 /
{

0 1
get

2 5
;

5 6
set

7 :
;

: ;
}

< =
public 
int 
ReferenceId 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ô
eE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\User\SettingsModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
User# '
{ 
public 

class 
SettingsModel 
{ 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
bool 
NotifyBirthdays #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
NotifyUpdates !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
SharePersonalInfo %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
}

 
} ∑

hE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\User\UserDetailsModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
User# '
{ 
public 

class 
UserDetailsModel !
:" #
PersonDetailsModel$ 6
{ 
public		 
ICollection		 
<		 
OccupationModel		 *
>		* +
Occupations		, 7
{		8 9
get		: =
;		= >
set		? B
;		B C
}		D E
public

 
ICollection

 
<

 
EducationModel

 )
>

) *

Educations

+ 5
{

6 7
get

8 ;
;

; <
set

= @
;

@ A
}

B C
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
About 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Æ
iE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\User\UserPositionModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
User# '
{ 
public 

class 
UserPositionModel "
:# $
PositionModel% 2
{ 
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
DateTime		 
	UpdatedOn		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public 
	ImageFile 
? 
	ImageFile #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ˇ
iE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\User\UserSettingsModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
User# '
{ 
public 

class 
UserSettingsModel "
{ 
public 
bool 
NotifyUpdates !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
NotifyBirthdays #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public		 
bool		 
SharePersonalInfo		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
public

 
bool

 
ShareLocation

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
} 
} ˇ
bE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\User\UsersFound.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
User# '
{ 
public 

class 

UsersFound 
{ 
public 

UsersFound 
( 
) 
{		 	
users

 
=

 
new

 
List

 
<

 
GenericPersonModel

 /
>

/ 0
(

0 1
)

1 2
;

2 3
} 	
public 
ICollection 
< 
GenericPersonModel -
>- .
users/ 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
int 
skippedUsers 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 

takenUsers 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
$num. 0
;0 1
public 
int 

totalUsers 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
areLast 
{ 
get !
;! "
set# &
;& '
}( )
} 
}  
gE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\DTO\User\UserUpdateModel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
DTO "
." #
User# '
{ 
public 

class 
UserUpdateModel  
{ 
public 
string 
About 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
PhoneNumber

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
} 
} »
aE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Education.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
	Education 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
string		 "
EducationInstituteName		 ,
{		- .
get		/ 2
;		2 3
set		4 7
;		7 8
}		9 :
public

 
DateTime

 
	StartDate

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
DateTime 
EndDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

ForeignKey	 
( 
$str 
) 
] 
public 
virtual 
User 
User  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
? 
EducationLevelId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	

ForeignKey	 
( 
$str &
)& '
]' (
public 
virtual 
EducationLevel %
EducationLevel& 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
} 
} Ø	
fE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\EducationLevel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
EducationLevel 
{ 
public 
EducationLevel 
( 
) 
{ 	
this		 
.		 

Educations		 
=		 
new		 !
HashSet		" )
<		) *
	Education		* 3
>		3 4
(		4 5
)		5 6
;		6 7
}

 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
virtual 
ICollection "
<" #
	Education# ,
>, -

Educations. 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
} 
} √
]E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Image.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
Image 
{ 
public 
Image 
( 
) 
{ 	
this		 
.		 
People		 
=		 
new		 
HashSet		 %
<		% &
Person		& ,
>		, -
(		- .
)		. /
;		/ 0
}

 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
FileName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
MimeType 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
long 
SizeInBytes 
{  !
get" %
;% &
set' *
;* +
}, -
public 
virtual 
ICollection "
<" #
Person# )
>) *
People+ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
} ñ
`E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Location.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
Location 
{ 
public 
Location 
( 
) 
{ 	
this		 
.		 
PeopleBornHere		 
=		  !
new		" %
HashSet		& -
<		- .
Person		. 4
>		4 5
(		5 6
)		6 7
;		7 8
this

 
.

 
PeopleLivingHere

 !
=

" #
new

$ '
HashSet

( /
<

/ 0
Person

0 6
>

6 7
(

7 8
)

8 9
;

9 :
} 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Country 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
virtual 
ICollection "
<" #
Person# )
>) *
PeopleBornHere+ 9
{: ;
get< ?
;? @
setA D
;D E
}F G
public 
virtual 
ICollection "
<" #
Person# )
>) *
PeopleLivingHere+ ;
{< =
get> A
;A B
setC F
;F G
}H I
} 
} Ì
`E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Marriage.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
Marriage 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
DateTime		 
	StartDate		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
DateTime

 
?

 
EndDate

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
int 
FirstPersonId  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	

ForeignKey	 
( 
$str #
)# $
]$ %
public 
virtual 
Person 
FirstPerson )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
int 
SecondPersonId !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	

ForeignKey	 
( 
$str $
)$ %
]% &
public 
virtual 
Person 
SecondPerson *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
DateTime 
	CreatedOn !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
? 

ModifiedOn #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ò	
cE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Nationality.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
Nationality 
{ 
public 
Nationality 
( 
) 
{ 	
this		 
.		 
People		 
=		 
new		 
HashSet		 %
<		% &
Person		& ,
>		, -
(		- .
)		. /
;		/ 0
}

 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
virtual 
ICollection "
<" #
Person# )
>) *
People+ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
} Ø
bE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Occupation.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 

Occupation 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
string		 
OccupationName		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public

 
string

 
WorkingPlaceName

 &
{

' (
get

) ,
;

, -
set

. 1
;

1 2
}

3 4
public 
DateTime 
? 
	StartDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
? 
EndDate  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

ForeignKey	 
( 
$str 
) 
] 
public 
virtual 
User 
User  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ∞
cE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\ParentChild.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
ParentChild 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
bool		 
BloodRelatives		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public 
int 
ParentId 
{ 
get !
;! "
set# &
;& '
}( )
[ 	

ForeignKey	 
( 
$str 
) 
]  
public 
virtual 
Person 
Parent $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
ChildId 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

ForeignKey	 
( 
$str 
) 
] 
public 
virtual 
Person 
Child #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
DateTime 
	CreatedOn !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
? 

ModifiedOn #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} 4
^E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Person.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
Person 
{		 
public

 
Person

 
(

 
)

 
{ 	 
FirstPersonMarriages  
=! "
new# &
HashSet' .
<. /
Marriage/ 7
>7 8
(8 9
)9 :
;: ;!
SecondPersonMarriages !
=" #
new$ '
HashSet( /
</ 0
Marriage0 8
>8 9
(9 :
): ;
;; <
Parents 
= 
new 
HashSet !
<! "
ParentChild" -
>- .
(. /
)/ 0
;0 1
Children 
= 
new 
HashSet "
<" #
ParentChild# .
>. /
(/ 0
)0 1
;1 2#
SenderRequestsForPerson #
=$ %
new& )
HashSet* 1
<1 2
Request2 9
>9 :
(: ;
); <
;< =
} 	
[ 	
Key	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
char 
Gender 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
? 
	BirthDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
? 
	DeathDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
	CreatedOn !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
? 

ModifiedOn #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public   
int   
?   
ImageId   
{   
get   !
;  ! "
set  # &
;  & '
}  ( )
[!! 	

ForeignKey!!	 
(!! 
$str!! 
)!! 
]!! 
public"" 
virtual"" 
Image"" 
Image"" "
{""# $
get""$ '
;""' (
set""( +
;""+ ,
}"", -
public$$ 
Guid$$ 
TreeId$$ 
{$$ 
get$$  
;$$  !
set$$" %
;$$% &
}$$' (
[%% 	

ForeignKey%%	 
(%% 
$str%% 
)%% 
]%% 
public&& 
virtual&& 
Tree&& 
Tree&&  
{&&! "
get&&# &
;&&& '
set&&( +
;&&+ ,
}&&- .
public(( 
int(( 
?(( 
BirthPlaceId((  
{((! "
get((# &
;((& '
set((( +
;((+ ,
}((- .
[)) 	

ForeignKey))	 
()) 
$str)) "
)))" #
]))# $
public** 
virtual** 
Location** 

BirthPlace**  *
{**+ ,
get**- 0
;**0 1
set**2 5
;**5 6
}**7 8
public,, 
int,, 
?,, 
LivingPlaceId,, !
{,," #
get,,$ '
;,,' (
set,,) ,
;,,, -
},,. /
[-- 	

ForeignKey--	 
(-- 
$str-- #
)--# $
]--$ %
public.. 
virtual.. 
Location.. 
LivingPlace..  +
{.., -
get... 1
;..1 2
set..3 6
;..6 7
}..8 9
public00 
int00 
?00 
NationalityId00 !
{00" #
get00$ '
;00' (
set00) ,
;00, -
}00. /
[11 	

ForeignKey11	 
(11 
$str11 #
)11# $
]11$ %
public22 
virtual22 
Nationality22 "
Nationality22# .
{22/ 0
get221 4
;224 5
set226 9
;229 :
}22; <
public44 
int44 
?44 

ReligionId44 
{44  
get44! $
;44$ %
set44& )
;44) *
}44+ ,
[55 	

ForeignKey55	 
(55 
$str55  
)55  !
]55! "
public66 
virtual66 
Religion66 
Religion66  (
{66) *
get66+ .
;66. /
set660 3
;663 4
}665 6
public88 
virtual88 
ICollection88 "
<88" #
Marriage88# +
>88+ , 
FirstPersonMarriages88- A
{88B C
get88D G
;88G H
set88I L
;88L M
}88N O
public99 
virtual99 
ICollection99 "
<99" #
Marriage99# +
>99+ ,!
SecondPersonMarriages99- B
{99C D
get99E H
;99H I
set99J M
;99M N
}99O P
public;; 
virtual;; 
ICollection;; "
<;;" #
ParentChild;;# .
>;;. /
Parents;;0 7
{;;8 9
get;;: =
;;;= >
set;;? B
;;;B C
};;D E
public<< 
virtual<< 
ICollection<< "
<<<" #
ParentChild<<# .
><<. /
Children<<0 8
{<<9 :
get<<; >
;<<> ?
set<<@ C
;<<C D
}<<E F
public?? 
virtual?? 
Relative?? 
RelativeForPerson??  1
{??2 3
get??4 7
;??7 8
set??9 <
;??< =
}??> ?
publicAA 
virtualAA 
ICollectionAA "
<AA" #
RequestAA# *
>AA* +#
SenderRequestsForPersonAA, C
{AAD E
getAAF I
;AAI J
setAAK N
;AAN O
}AAP Q
}BB 
}CC ˆ
`E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Position.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
Position 
{ 
[ 	
Key	 
] 
public		 
int		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
public

 
float

 
Latitude

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
float 
	Longitude 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
? 
	UpdatedOn "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} Õ
`E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Relative.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
Relative 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public

 
Guid

 
PrimaryUserId

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
[ 	

ForeignKey	 
( 
$str #
)# $
]$ %
public 
virtual 
User 
PrimaryUser '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
Guid 
RelativeUserId "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	

ForeignKey	 
( 
$str $
)$ %
]% &
public 
virtual 
User 
RelativeUser (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
int )
RelativePersonInPrimaryTreeId 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
[ 	

ForeignKey	 
( 
$str 3
)3 4
]4 5
public 
virtual 
Person '
RelativePersonInPrimaryTree 9
{: ;
get< ?
;? @
setA D
;D E
}F G
public 
DateTime 
LastSyncCheck %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} è	
`E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Religion.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
Religion 
{ 
public 
Religion 
( 
) 
{ 	
this		 
.		 
People		 
=		 
new		 
HashSet		 %
<		% &
Person		& ,
>		, -
(		- .
)		. /
;		/ 0
}

 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
virtual 
ICollection "
<" #
Person# )
>) *
People+ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
} ò
_E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Request.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
Request 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
bool		 
ReceiverResponded		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
public

 
bool

 
Response

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
Guid 
SenderId 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	

ForeignKey	 
( 
$str 
) 
]  
public 
User 
Sender 
{ 
get  
;  !
set" %
;% &
}' (
public 
Guid 

ReceiverId 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	

ForeignKey	 
( 
$str  
)  !
]! "
public 
User 
Receiver 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int +
ReceiverReferenceInSenderTreeId 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
[ 	

ForeignKey	 
( 
$str 5
)5 6
]6 7
public 
Person )
ReceiverReferenceInSenderTree 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
} 
} ª

\E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\Tree.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
Tree 
{ 
public 
Tree 
( 
) 
{		 	
this

 
.

 
Id

 
=

 
Guid

 
.

 
NewGuid

 "
(

" #
)

# $
;

$ %
this 
. 
PeopleInTree 
= 
new  #
HashSet$ +
<+ ,
Person, 2
>2 3
(3 4
)4 5
;5 6
} 	
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
DateTime 

LastUpdate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
ICollection "
<" #
Person# )
>) *
PeopleInTree+ 7
{8 9
get: =
;= >
set? B
;B C
}D E
} 
} ä.
\E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Entities\User.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Entities '
{ 
public 

class 
User 
{ 
public		 
User		 
(		 
)		 
{

 	
this 
. 
Id 
= 
Guid 
. 
NewGuid "
(" #
)# $
;$ %
this 
. 

Educations 
= 
new !
HashSet" )
<) *
	Education* 3
>3 4
(4 5
)5 6
;6 7
this 
. 
Occupations 
= 
new "
HashSet# *
<* +

Occupation+ 5
>5 6
(6 7
)7 8
;8 9
this 
. 
UserRelatives 
=  
new! $
HashSet% ,
<, -
Relative- 5
>5 6
(6 7
)7 8
;8 9
this 
. 
RelativesWithUser "
=# $
new% (
HashSet) 0
<0 1
Relative1 9
>9 :
(: ;
); <
;< =
this 
. 
SentRequests 
= 
new  #
HashSet$ +
<+ ,
Request, 3
>3 4
(4 5
)5 6
;6 7
this 
. 
ReceivedRequests !
=" #
new$ '
HashSet( /
</ 0
Request0 7
>7 8
(8 9
)9 :
;: ;
} 	
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
PasswordHash "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
PasswordSalt "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
About 
{ 
get !
;! "
set# &
;& '
}( )
public 
bool 
NotifyBirthdays #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
NotifyUpdates !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
SharePersonalInfo %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
bool 
ShareLocation !
{" #
get$ '
;' (
set) ,
;, -
}. /
public   
int   
PersonId   
{   
get   !
;  ! "
set  # &
;  & '
}  ( )
[!! 	

ForeignKey!!	 
(!! 
$str!! 
)!! 
]!!  
public"" 
virtual"" 
Person"" 
Person"" $
{""% &
get""' *
;""* +
set"", /
;""/ 0
}""1 2
public## 
int## 
?## 

PositionId## 
{##  
get##! $
;##$ %
set##& )
;##) *
}##+ ,
[$$ 	

ForeignKey$$	 
($$ 
$str$$  
)$$  !
]$$! "
public%% 
virtual%% 
Position%% 
Position%%  (
{%%) *
get%%+ .
;%%. /
set%%0 3
;%%3 4
}%%5 6
public'' 
virtual'' 
ICollection'' "
<''" #
	Education''# ,
>'', -

Educations''. 8
{''9 :
get''; >
;''> ?
set''@ C
;''C D
}''E F
public(( 
virtual(( 
ICollection(( "
<((" #

Occupation((# -
>((- .
Occupations((/ :
{((; <
get((= @
;((@ A
set((B E
;((E F
}((G H
public** 
virtual** 
ICollection** "
<**" #
Relative**# +
>**+ ,
UserRelatives**- :
{**; <
get**= @
;**@ A
set**B E
;**E F
}**G H
public++ 
virtual++ 
ICollection++ "
<++" #
Relative++# +
>+++ ,
RelativesWithUser++- >
{++? @
get++A D
;++D E
set++F I
;++I J
}++K L
public-- 
virtual-- 
ICollection-- "
<--" #
Request--# *
>--* +
SentRequests--, 8
{--9 :
get--; >
;--> ?
set--@ C
;--C D
}--E F
public.. 
virtual.. 
ICollection.. "
<.." #
Request..# *
>..* +
ReceivedRequests.., <
{..= >
get..? B
;..B C
set..D G
;..G H
}..I J
}// 
}00 ˛
cE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Enums\EducationLevel.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Enums $
{ 
public 

enum 
EducationLevel 
{ 
Kindergarten 
= 
$num 
, 
Primary 
= 
$num 
, 
	Gymnasium 
= 
$num 
, 
	HighScool 
= 
$num 
, 
PostSecondary		 
=		 
$num		 
,		 
Faculty

 
=

 
$num

 
,

 
Masters 
= 
$num 
, 
	Doctorate 
= 
$num 
} 
} ã
bE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Enums\Nationalities.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Enums $
{ 
public 

enum 
Nationalities 
{ 
Danish 
, 
British 
, 
Estonian 
, 
Finnish 
, 
	Icelandic		 
,		 
Irish

 
,

 
Latvian 
, 

Lithuanian 
, 
Northern_Irish 
, 
	Norwegian 
, 
Scottish 
, 
Swedish 
, 
Welsh 
, 
Austrian 
, 
Belgian 
, 
French 
, 
German 
, 
Dutch 
, 
Swiss 
, 
Albanian 
, 
Croatian 
, 
Cypriot 
, 
Greek 
, 
Italian 
, 

Portuguese 
, 
Serbian 
, 
	Slovenian 
, 
Spanish   
,   

Belarusian!! 
,!! 
	Bulgarian"" 
,"" 
Czech## 
,## 
	Hungarian$$ 
,$$ 
Polish%% 
,%% 
Romanian&& 
,&& 
Russian'' 
,'' 
	Slovakian(( 
,(( 
	Ukrainian)) 
}** 
}++ ñ
bE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Enums\RelativeState.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Enums $
{ 
public 

enum 
RelativeState 
{ 
Related 
= 
$num 
, 
	Requested 
= 
$num 
, 
	Unrelated 
= 
$num 
} 
}		 Ø	
^E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Enums\Religions.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Enums $
{ 
public 

enum 
	Religions 
{ 
CHRISTIANITY 
, 
ISLAM 
, 
AGNOSTIC 
, 
ATHEIST 
, 
HINDUISM		 
,		 
BUDDHISM

 
,

 
CHINESE_TRADITIONAL 
, 
ETHNIC 
, 
AFRICAN_TRADITIONAL 
, 
SIKHISM 
, 
	SPIRITISM 
, 
JUDAISM 
, 
BAHAI 
, 
JAINISM 
, 
SHINTO 
, 
CAO_DAI 
, 
ZOROASTRIANISM 
, 
TENRIKYO 
, 
ANIMISM 
, 
NEO_PAGANISM 
, "
UNITARIAN_UNIVERSALISM 
, 
	RASTAFARI 
, 
OTHER 
} 
} Ω
_E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Enums\UpdateType.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 
Enums $
{ 
public 

enum 

UpdateType 
{ 
PersonCreated 
= 
$num 
, 
PersonModified 
= 
$num 
, 
MarriageCreated 
= 
$num 
, 
MarriageModified 
= 
$num 
, 
ParentChildAdded		 
=		 
$num		 
}

 
} Å	
YE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\FileHelper.cs
	namespace 	
GenealogyTree
 
. 
Domain 
{ 
public		 

static		 
class		 

FileHelper		 "
{

 
public 
static 
string 
GetExtension )
() *
string* 0
mimeType1 9
)9 :
{ 	
switch 
( 
mimeType 
. 
ToLower $
($ %
)% &
)& '
{ 
case 
$str !
:! "
return 
$str  
;  !
case 
$str  
:  !
return 
$str  
;  !
case 
$str  
:  !
return 
$str  
;  !
default 
: 
throw 
new #
BadImageFormatException 5
(5 6
$str6 X
)X Y
;Y Z
} 
} 	
} 
} ´
cE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\InfiniteScrollFilter.cs
	namespace 	
GenealogyTree
 
. 
Domain 
{ 
public 

class  
InfiniteScrollFilter %
{ 
public 
int 
Skip 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
Take 
{ 
get 
; 
set "
;" #
}$ %
=& '
$num( *
;* +
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 Ê
qE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\IGenealogyTreeDbContext.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
{ 
public		 

	interface		 #
IGenealogyTreeDbContext		 ,
{

 
public 
Task 
SaveChangesAsync $
($ %
)% &
;& '
} 
} º
eE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\IUnitOfWork.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
{ 
public		 

	interface		 
IUnitOfWork		  
{

 %
IEducationLevelRepository !
EducationLevel" 0
{1 2
get3 6
;6 7
}8 9 
IEducationRepository 
	Education &
{' (
get) ,
;, -
}. /
IImageRepository 
Image 
{  
get! $
;$ %
}& '
ILocationRepository 
Location $
{% &
get' *
;* +
}, -
IMarriageRepository 
Marriage $
{% &
get' *
;* +
}, -"
INationalityRepository 
Nationality *
{+ ,
get- 0
;0 1
}2 3!
IOccupationRepository 

Occupation (
{) *
get+ .
;. /
}0 1"
IParentChildRepository 
ParentChild *
{+ ,
get- 0
;0 1
}2 3
IPersonRepository 
Person  
{! "
get# &
;& '
}( )
IPositionRepository 
Position $
{% &
get' *
;* +
}, -
IReligionRepository 
Religion $
{% &
get' *
;* +
}, -
IRelativeRepository 
	Relatives %
{& '
get( +
;+ ,
}- .
IRequestRepository 
Requests #
{$ %
get& )
;) *
}+ ,
ITreeRepository 
Tree 
{ 
get "
;" #
}$ %
IUserRepository 
User 
{ 
get "
;" #
}$ %
} 
} ñ
ÄE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IEducationLevelRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 %
IEducationLevelRepository		 .
:		/ 0
IRepositoryBase		1 @
<		@ A
EducationLevel		A O
>		O P
{

 
} 
} Ü
{E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IEducationRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		  
IEducationRepository		 )
:		* +
IRepositoryBase		, ;
<		; <
	Education		< E
>		E F
{

 
} 
} ˙
wE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IImageRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 
IImageRepository		 %
:		& '
IRepositoryBase		( 7
<		7 8
Image		8 =
>		= >
{

 
} 
} É
zE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\ILocationRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 
ILocationRepository		 (
:		) *
IRepositoryBase		+ :
<		: ;
Location		; C
>		C D
{

 
} 
} É
zE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IMarriageRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 
IMarriageRepository		 (
:		) *
IRepositoryBase		+ :
<		: ;
Marriage		; C
>		C D
{

 
} 
} å
}E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\INationalityRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 "
INationalityRepository		 +
:		, -
IRepositoryBase		. =
<		= >
Nationality		> I
>		I J
{

 
} 
} â
|E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IOccupationRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 !
IOccupationRepository		 *
:		+ ,
IRepositoryBase		- <
<		< =

Occupation		= G
>		G H
{

 
} 
} å
}E:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IParentChildRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 "
IParentChildRepository		 +
:		, -
IRepositoryBase		. =
<		= >
ParentChild		> I
>		I J
{

 
} 
} ˝
xE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IPersonRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 
IPersonRepository		 &
:		' (
IRepositoryBase		) 8
<		8 9
Person		9 ?
>		? @
{

 
} 
} É
zE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IPositionRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 
IPositionRepository		 (
:		) *
IRepositoryBase		+ :
<		: ;
Position		; C
>		C D
{

 
} 
} É
zE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IRelativeRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 
IRelativeRepository		 (
:		) *
IRepositoryBase		+ :
<		: ;
Relative		; C
>		C D
{

 
} 
} É
zE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IReligionRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 
IReligionRepository		 (
:		) *
IRepositoryBase		+ :
<		: ;
Religion		; C
>		C D
{

 
} 
} Ç
vE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IRepositoryBase.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public 

	interface 
IRepositoryBase $
<$ %
T% &
>& '
:( )
IDisposable* 5
{ 
int 
Count 
{ 
get 
; 
} 

IQueryable 
< 
T 
> 
GetAll 
( 
) 
; 

IQueryable 
< 
T 
> 
Filter 
( 

Expression '
<' (
Func( ,
<, -
T- .
,. /
bool0 4
>4 5
>5 6

expression7 A
)A B
;B C
Task'' 
<'' 
T'' 
>'' 
FindById'' 
('' 
params'' 
object''  &
[''& '
]''' (
keys'') -
)''- .
;''. /
Task00 
<00 
T00 
>00 
Create00 
(00 
T00 
entity00 
)00  
;00  !
Task99 
<99 
T99 
>99 
Update99 
(99 
T99 
entity99 
)99  
;99  !
TaskBB 
<BB 
TBB 
>BB 
DeleteBB 
(BB 
paramsBB 
objectBB $
[BB$ %
]BB% &
idBB' )
)BB) *
;BB* +
}CC 
}DD Ä
yE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IRequestRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public

 

	interface

 
IRequestRepository

 '
:

( )
IRepositoryBase

* 9
<

9 :
Request

: A
>

A B
{ 
} 
} ˜
vE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\ITreeRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 
ITreeRepository		 $
:		% &
IRepositoryBase		' 6
<		6 7
Tree		7 ;
>		; <
{

 
} 
} ˜
vE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Repositories\IUserRepository.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Repositories* 6
{ 
public		 

	interface		 
IUserRepository		 $
:		% &
IRepositoryBase		' 6
<		6 7
User		7 ;
>		; <
{

 
} 
} Ê
oE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IAuthService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface 
IAuthService !
{ 
Task 
< 
LoginResponseModel 
>  
Login! &
(& '

LoginModel' 1
	userLogin2 ;
); <
;< =
Task!! 
<!! 
UserDetailsModel!! 
>!! 
Register!! '
(!!' (
RegisterModel!!( 5
userRegister!!6 B
)!!B C
;!!C D
Task,, 
<,, 
UserDetailsModel,, 
>,, 
UpdatePassword,, -
(,,- .
UpdatePasswordModel,,. A
updatePassword,,B P
),,P Q
;,,Q R
}-- 
}.. °
tE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IEducationService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public		 

	interface		 
IEducationService		 &
{

 
List 
< 
EducationModel 
> #
GetAllEducationsForUser 4
(4 5
Guid5 9
userId: @
)@ A
;A B
Task 
< 
EducationModel 
> 
GetEducationAsync .
(. /
int/ 2
educationId3 >
)> ?
;? @
Task&& 
<&& 
EducationModel&& 
>&& 
AddEducationAsync&& .
(&&. /
EducationModel&&/ =
	education&&> G
)&&G H
;&&H I
Task00 
<00 
EducationModel00 
>00  
UpdateEducationAsync00 1
(001 2
EducationModel002 @
	education00A J
)00J K
;00K L
Task99 
<99 
EducationModel99 
>99  
DeleteEducationAsync99 1
(991 2
int992 5
educationId996 A
)99A B
;99B C
TaskBB 
<BB 
ListBB 
<BB 
GenericNameModelBB "
>BB" #
>BB# $&
GetAllEducationLevelsAsyncBB% ?
(BB? @
)BB@ A
;BBA B
TaskMM 
<MM 
GenericNameModelMM 
>MM "
AddEducationLevelAsyncMM 5
(MM5 6
stringMM6 <
educationLevelNameMM= O
)MMO P
;MMP Q
}NN 
}OO £
pE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IEmailService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface 
IEmailService "
{ 
Task 
SendSupportTicket 
( 
SupportTicket ,
supportTicket- :
): ;
;; <
} 
} ◊
yE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IFileManagementService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface "
IFileManagementService +
{ 
Task 
< 
	ImageFile 
> 
GetFile 
(  
Image  %
fileName& .
). /
;/ 0
Task 
SaveFileAsync 
( 
	ImageFile $
file% )
)) *
;* +
bool%% 

DeleteFile%% 
(%% 
string%% 
fileName%% '
)%%' (
;%%( )
}&& 
}'' ∂
pE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IImageService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface 
IImageService "
{ 
Task 
< 
Image 
> 
GetImageAsync !
(! "
int" %
?% &
imageId' .
). /
;/ 0
Task 
< 
Image 
> 
AddImageAsync !
(! "
	ImageFile" +
file, 0
)0 1
;1 2
Task## 
<## 
bool## 
>## 
DeleteImageAsync## #
(### $
int##$ '
imageId##( /
)##/ 0
;##0 1
}$$ 
}%% ô
sE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\ILocationService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface 
ILocationService %
{ 
Task 
< 
LocationModel 
> 
GetLocationAsync ,
(, -
int- 0

locationId1 ;
); <
;< =
Task 
< 
LocationModel 
> 
UpdateLocation *
(* +
LocationModel+ 8
location9 A
)A B
;B C
} 
} ’
sE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IMarriageService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface 
IMarriageService %
{ 
Task 
< 
List 
< 
MarriedPersonModel $
>$ %
>% &$
GetAllMarriagesForPerson' ?
(? @
int@ C
personIdD L
)L M
;M N
Task 
<  
MarriageDetailsModel !
>! "
GetMarriageAsync# 3
(3 4
int4 7

marriageId8 B
)B C
;C D
Task%% 
<%%  
MarriageDetailsModel%% !
>%%! "
AddMarriageAsync%%# 3
(%%3 4%
MarriageCreateUpdateModel%%4 M
marriage%%N V
)%%V W
;%%W X
Task// 
<//  
MarriageDetailsModel// !
>//! "
UpdateMarriageAsync//# 6
(//6 7%
MarriageCreateUpdateModel//7 P
marriage//Q Y
)//Y Z
;//Z [
Task88 
<88  
MarriageDetailsModel88 !
>88! "
DeleteMarriageAsync88# 6
(886 7
int887 :

marriageId88; E
)88E F
;88F G
}99 
}:: π
vE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\INationalityService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface 
INationalityService (
{ 
Task 
< 
List 
< 
GenericNameModel "
>" #
># $$
GetAllNationalitiesAsync% =
(= >
)> ?
;? @
Task 
< 
GenericNameModel 
> 
AddNationalityAsync 2
(2 3
string3 9
nationalityName: I
)I J
;J K
} 
} »	
uE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IOccupationService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface 
IOccupationService '
{		 
List 
< 
OccupationModel 
> $
GetAllOccupationsForUser 6
(6 7
Guid7 ;
userId< B
)B C
;C D
Task 
< 
OccupationModel 
> 
AddOccupationAsync 0
(0 1
OccupationModel1 @

occupationA K
)K L
;L M
Task'' 
<'' 
OccupationModel'' 
>'' !
UpdateOccupationAsync'' 3
(''3 4
OccupationModel''4 C

occupation''D N
)''N O
;''O P
Task00 
<00 
OccupationModel00 
>00 !
DeleteOccupationAsync00 3
(003 4
int004 7
occupationId008 D
)00D E
;00E F
}11 
}22 Ï
vE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IParentChildService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface 
IParentChildService (
{		 
Task 
< 
List 
< 
ParentChildModel "
>" #
># $"
GetAllParentsForPerson% ;
(; <
int< ?
childId@ G
)G H
;H I
Task 
< 
List 
< 
ParentChildModel "
>" #
># $#
GetAllChildrenForPerson% <
(< =
int= @
parentIdA I
)I J
;J K
Task&& 
<&& 
List&& 
<&& 
ParentChildModel&& "
>&&" #
>&&# $
GetAllAncestors&&% 4
(&&4 5
int&&5 8
personId&&9 A
)&&A B
;&&B C
Task00 
<00 
List00 
<00 
ParentChildModel00 "
>00" #
>00# $
GetAllDescendants00% 6
(006 7
int007 :
personId00; C
)00C D
;00D E
Task:: 
<:: 
List:: 
<:: 
ParentChildModel:: "
>::" #
>::# $
GetAllRelatedPeople::% 8
(::8 9
int::9 <
personId::= E
)::E F
;::F G
TaskDD 
<DD 
ListDD 
<DD 
ParentChildModelDD "
>DD" #
>DD# $!
GetRelatedByAncestorsDD% :
(DD: ;
intDD; >
personIdDD? G
)DDG H
;DDH I
TaskNN 
<NN 
ListNN 
<NN 
ParentChildModelNN "
>NN" #
>NN# $#
GetRelatedByDescendantsNN% <
(NN< =
intNN= @
personIdNNA I
)NNI J
;NNJ K
TaskZZ 
<ZZ 
ListZZ 
<ZZ 
GenericPersonModelZZ $
>ZZ$ %
>ZZ% &
GetChildrenOptionsZZ' 9
(ZZ9 :
intZZ: =
personIdZZ> F
)ZZF G
;ZZG H
Taskee 
<ee 
Listee 
<ee 
GenericPersonModelee $
>ee$ %
>ee% &"
GetParentSpouceOptionsee' =
(ee= >
intee> A
personIdeeB J
)eeJ K
;eeK L
Taskqq 
<qq 
Listqq 
<qq 
GenericPersonModelqq $
>qq$ %
>qq% &$
GetNotRelatedByAncestorsqq' ?
(qq? @
intqq@ C
personIdqqD L
)qqL M
;qqM N
Task}} 
<}} 
List}} 
<}} 
GenericPersonModel}} $
>}}$ %
>}}% &&
GetNotRelatedByDescendants}}' A
(}}A B
int}}B E
personId}}F N
)}}N O
;}}O P
Task
áá 
<
áá %
ParentChildDetailsModel
áá $
>
áá$ %!
GetParentChildAsync
áá& 9
(
áá9 :
int
áá: =
parentChildId
áá> K
)
ááK L
;
ááL M
Task
ëë 
<
ëë %
ParentChildDetailsModel
ëë $
>
ëë$ %!
AddParentChildAsync
ëë& 9
(
ëë9 :*
ParentChildCreateUpdateModel
ëë: V
parentChild
ëëW b
)
ëëb c
;
ëëc d
Task
õõ 
<
õõ %
ParentChildDetailsModel
õõ $
>
õõ$ %$
UpdateParentChildAsync
õõ& <
(
õõ< =*
ParentChildCreateUpdateModel
õõ= Y
parentChild
õõZ e
)
õõe f
;
õõf g
Task
§§ 
<
§§ %
ParentChildDetailsModel
§§ $
>
§§$ %$
DeleteParentChildAsync
§§& <
(
§§< =
int
§§= @
parentChildId
§§A N
)
§§N O
;
§§O P
}
•• 
}¶¶ ˇ
qE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IPersonService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public		 

	interface		 
IPersonService		 #
{

 
Task 
< 
PersonDetailsModel 
>  
GetPersonAsync! /
(/ 0
int0 3
personId4 <
)< =
;= >
Task 
< 
List 
< 
GenericPersonModel $
>$ %
>% &
GetPeopleListInTree' :
(: ;
Guid; ?
treeId@ F
)F G
;G H
Task++ 
<++ 
List++ 
<++ 
PersonTreeInfoModel++ %
>++% &
>++& '#
GetPeopleTreeDataInTree++( ?
(++? @
Guid++@ D
treeId++E K
)++K L
;++L M
Task77 
<77 
List77 
<77 
GenericPersonModel77 $
>77$ %
>77% &$
GetPeopleWithoutRelative77' ?
(77? @
Guid77@ D
treeId77E K
)77K L
;77L M
TaskBB 
<BB 
ListBB 
<BB 
EventInTreeModelBB "
>BB" #
>BB# $
GetEventsInTreeBB% 4
(BB4 5
GuidBB5 9
treeIdBB: @
)BB@ A
;BBA B
TaskLL 
<LL 
PersonDetailsModelLL 
>LL  
AddPersonAsyncLL! /
(LL/ 0#
PersonCreateUpdateModelLL0 G
personLLH N
)LLN O
;LLO P
TaskVV 
<VV 
PersonDetailsModelVV 
>VV  
UpdatePersonAsyncVV! 2
(VV2 3#
PersonCreateUpdateModelVV3 J
personVVK Q
)VVQ R
;VVR S
Taskaa 
<aa 
	ImageFileaa 
>aa 
UpdatePictureAsyncaa *
(aa* +
intaa+ .
personIdaa/ 7
,aa7 8
intaa9 <
imageIdaa= D
)aaD E
;aaE F
Taskjj 
<jj 
PersonDetailsModeljj 
>jj  
DeletePersonAsyncjj! 2
(jj2 3
intjj3 6
personIdjj7 ?
)jj? @
;jj@ A
}kk 
}ll Í
sE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IRelativeService.cs
	namespace		 	
GenealogyTree		
 
.		 
Domain		 
.		 

Interfaces		 )
.		) *
Services		* 2
{

 
public 

	interface 
IRelativeService %
{ 
Task 
< 
List 
< 
RelativeModel 
>  
>  !"
GetAllRelativesForUser" 8
(8 9
Guid9 =
userId> D
)D E
;E F
Task   
<   
RelativeModel   
>   
GetRelative   '
(  ' (
int  ( +

relativeId  , 6
)  6 7
;  7 8
Task++ 
<++ 
RelativeState++ 
>++ 
CheckRelative++ )
(++) *
Guid++* .
userId++/ 5
,++5 6
Guid++7 ;

relativeId++< F
)++F G
;++G H
Task55 
<55 
RelativeModel55 
>55 
MarkChanges55 '
(55' (
int55( +

relativeId55, 6
)556 7
;557 8
Task@@ 
<@@ 
RelativeModel@@ 
>@@ 
AddRelativeUser@@ +
(@@+ ,
UsersToLinkModel@@, <
usersToLink@@= H
)@@H I
;@@I J
TaskII 
<II 
RelativeModelII 
>II 
DeleteRelativeII *
(II* +
intII+ .

relativeIdII/ 9
)II9 :
;II: ;
TaskUU 
<UU 
ListUU 
<UU 
UserPositionModelUU #
>UU# $
>UU$ % 
GetRelativesPositionUU& :
(UU: ;
GuidUU; ?
userIdUU@ F
)UUF G
;UUG H
}VV 
}WW ©
sE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IReligionService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface 
IReligionService %
{ 
Task 
< 
List 
< 
GenericNameModel "
>" #
># $ 
GetAllReligionsAsync% 9
(9 :
): ;
;; <
Task 
< 
GenericNameModel 
> 
AddReligionAsync /
(/ 0
string0 6
religionName7 C
)C D
;D E
} 
} ü
rE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IRequestService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public		 

	interface		 
IRequestService		 $
{

 
Task 
< 
List 
< 
RequestDetailsModel %
>% &
>& '
GetRequestsSent( 7
(7 8
Guid8 <
senderId= E
)E F
;F G
Task 
< 
List 
< 
RequestDetailsModel %
>% &
>& '
GetRequestsReceived( ;
(; <
Guid< @

receiverIdA K
)K L
;L M
Task'' 
<'' 
List'' 
<''  
RequestResponseModel'' &
>''& '
>''' ( 
GetRequestsResponded'') =
(''= >
Guid''> B
senderId''C K
)''K L
;''L M
Task11 
<11 $
RequestCreateUpdateModel11 %
>11% &

AddRequest11' 1
(111 2$
RequestCreateUpdateModel112 J
request11K R
)11R S
;11S T
Task;; 
<;; 
UsersToLinkModel;; 
>;; 
RespondToRequest;; /
(;;/ 0
int;;0 3
	requestId;;4 =
,;;= > 
RequestResponseModel;;? S
respondedRequest;;T d
);;d e
;;;e f
TaskDD 
<DD 
RequestDetailsModelDD  
>DD  !
DeleteRequestDD" /
(DD/ 0
intDD0 3
	requestIdDD4 =
)DD= >
;DD> ?
}EE 
}FF ◊
oE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\ITreeService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface 
ITreeService !
{ 
Task 
GetTreeForUser 
( 
Guid  
userId! '
,' (
int) ,
?, -
rootPersonId. :
): ;
;; <
} 
} Õ
oE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IUserService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public		 

	interface		 
IUserService		 !
{

 
Task 
< 

UsersFound 
> 
	FindUsers "
(" # 
InfiniteScrollFilter# 7
filter8 >
)> ?
;? @
Task   
<   
UserDetailsModel   
>   
GetUserByIdAsync   /
(  / 0
Guid  0 4
userId  5 ;
)  ; <
;  < =
Task** 
<** 
UserDetailsModel** 
>** 
GetUser** &
(**& '
string**' -
username**. 6
)**6 7
;**7 8
Task44 
<44 
GenericPersonModel44 
>44  
GetTreeRoot44! ,
(44, -
Guid44- 1
treeId442 8
)448 9
;449 :
Task>> 
<>> 
int>> 
>>> !
GetNotificationsCount>> '
(>>' (
Guid>>( ,
userId>>- 3
)>>3 4
;>>4 5
TaskHH 
<HH 
NotificationsBundleHH  
>HH  !
GetNotificationsHH" 2
(HH2 3
GuidHH3 7
userIdHH8 >
)HH> ?
;HH? @
TaskTT 
<TT 
UserDetailsModelTT 
>TT 

UpdateUserTT )
(TT) *
GuidTT* .
userIdTT/ 5
,TT5 6
UserUpdateModelTT7 F
userTTG K
)TTK L
;TTL M
Task]] 
<]] 
bool]] 
>]] "
CheckUsernameAvailable]] )
(]]) *
string]]* 0
username]]1 9
)]]9 :
;]]: ;
Taskff 
<ff 
boolff 
>ff 
CheckEmailAvailableff &
(ff& '
stringff' -
emailff. 3
)ff3 4
;ff4 5
Taskpp 
<pp 
UserSettingsModelpp 
>pp 
GetUserSettingspp  /
(pp/ 0
Guidpp0 4
userIdpp5 ;
)pp; <
;pp< =
Task{{ 
<{{ 
UserSettingsModel{{ 
>{{ 
UpdateUserSettings{{  2
({{2 3
Guid{{3 7
userId{{8 >
,{{> ?
UserSettingsModel{{@ Q
userSettings{{R ^
){{^ _
;{{_ `
Task
ÜÜ 
<
ÜÜ 
PositionModel
ÜÜ 
>
ÜÜ  
UpdateUserPosition
ÜÜ .
(
ÜÜ. /
Guid
ÜÜ/ 3
userId
ÜÜ4 :
,
ÜÜ: ;
PositionModel
ÜÜ< I
position
ÜÜJ R
)
ÜÜR S
;
ÜÜS T
}
áá 
}àà £
uE:\Facultate\Licence\Genealogy-Tree\genealogy-tree-API\GenealogyTree.Domain\Interfaces\Services\IValidationService.cs
	namespace 	
GenealogyTree
 
. 
Domain 
. 

Interfaces )
.) *
Services* 2
{ 
public 

	interface 
IValidationService '
{ 
Task 
ValidateLogin 
( 
) 
; 
Task 
< 
string 
> 
GenerateToken "
(" #
User# '
user( ,
), -
;- .
} 
} 