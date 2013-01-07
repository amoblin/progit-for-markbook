# Úvod #

Tato kapitola vám ve stručnosti představí systém Git. Začneme od samého začátku. Nahlédneme do historie nástrojů ke správě verzí, poté se budeme věnovat tomu, jak spustit systém Git ve vašem počítači, a nakonec se podíváme na možnosti úvodního nastavení. V této kapitole se dozvíte, k čemu Git slouží a proč byste ho měli používat. Kromě toho se také naučíte, jak Git nastavit podle svých potřeb.

## Správa verzí ##

Co je to správa verzí a proč by vás měla zajímat? Správa verzí je systém, který zaznamenává změny souboru nebo sady souborů v průběhu času, a uživatel tak může kdykoli obnovit jeho/jejich konkrétní verzi (tzv. verzování). Příklady verzovaných souborů jsou v této knize ilustrovány na zdrojovém kódu softwaru, avšak ve skutečnosti lze verzování provádět téměř se všemi typy souborů v počítači.

Pokud jste grafik nebo webdesigner a chcete uchovávat všechny verze obrázku nebo všechna rozložení stránky (což jistě není k zahození), je pro vás systém správy verzí (zkráceně VCS z angl. Version Control System) ideálním nástrojem. VCS umožňuje vrátit jednotlivé soubory nebo celý projekt do předchozího stavu, porovnávat změny provedené v průběhu času, zjistit, kdo naposledy upravil něco, co nyní možná způsobuje problémy, kdo vložil jakou verzi a kdy a mnoho dalšího. Používáte-li verzovací systém, většinou to také znamená, že snadno obnovíte soubory, které jste ztratili nebo v nichž byly provedeny nežádoucí změny. Všechny funkcionality verzovacího systému můžete navíc používat velice jednoduchým způsobem.

### Lokální systémy správy verzí ###

Uživatelé často provádějí správu verzí tím způsobem, že zkopírují soubory do jiného adresáře (pokud jsou chytří, označí adresář i příslušným datem). Takový přístup je velmi častý, protože je jednoduchý. Je s ním však spojeno také velké riziko omylů a chyb. Člověk snadno zapomene, ve kterém adresáři se právě nachází, a nedopatřením začne zapisovat do nesprávného souboru nebo přepíše nesprávné soubory.

Aby se uživatelé tomuto riziku vyhnuli, vyvinuli programátoři už před dlouhou dobou lokální systémy VCS s jednoduchou databází, která uchovávala všechny změny souborů s nastavenou správou revizí (viz obrázek 1-1).

Insert 18333fig0101.png
Figure 1-1. Diagram lokální správy verzí

Jedním z velmi oblíbených nástrojů VCS byl systém s názvem rcs, který je ještě dnes distribuován s mnoha počítači. Dokonce i populární operační systém Mac OS X obsahuje po nainstalování vývojářských nástrojů (Developer Tools) příkaz rcs. Tento nástroj pracuje na tom principu, že na disku uchovává ve speciálním formátu seznam změn mezi jednotlivými verzemi. Systém později může díky porovnání těchto změn vrátit jakýkoli soubor do podoby, v níž byl v libovolném okamžiku.

### Centralizované systémy správy verzí ###

Dalším velkým problémem, s nímž se uživatelé potýkají, je potřeba spolupráce s dalšími pracovníky týmu. Řešení tohoto problému nabízejí tzv. centralizované systémy správy verzí (CVCS z angl. Centralized Version Control System). Tyto systémy, jmenovitě např. CVS, Subversion či Perforce, obsahují serverovou část, která uchovává všechny verzované soubory. Z tohoto centrálního úložiště si potom soubory stahují jednotliví klienti. Tento koncept byl dlouhá léta standardem pro správu verzí (viz obrázek 1-2).

Insert 18333fig0102.png
Figure 1-2. Diagram centralizované správy verzí

Nabízí ostatně mnoho výhod, zejména v porovnání s lokálními systémy VCS. Každý například – do určité míry – ví, co dělají ostatní účastníci projektu a administrátoři mají přesnou kontrolu nad jednotlivými právy. Kromě toho je podstatně jednodušší spravovat CVCS, než pracovat s lokálními databázemi na jednotlivých klientech.

Avšak i tato koncepce má závažné nedostatky. Tímto nejkřiklavějším je riziko kolapsu celého projektu po výpadku jediného místa – centrálního serveru. Pokud takový server na hodinu vypadne, pak během této hodiny buď nelze pracovat vůbec, nebo přinejmenším není možné ukládat změny ve verzích souborů, na nichž uživatelé právě pracují. A dojde-li k poruše pevného disku, na němž je uložena centrální databáze, a disk nebyl předem zálohován, dojde ke ztrátě všech dat, celé historie projektu, s výjimkou souborů aktuálních verzí, jež mají uživatelé v lokálních počítačích. Ke stejnému riziku jsou náchylné také lokální systémy VCS. Jestliže máte celou historii projektu uloženou na jednom místě, hrozí, že přijdete o vše.

### Distribuované systémy správy verzí ###

V tomto místě přicházejí ke slovu tzv. distribuované systémy správy verzí (DVCS z angl. Distributed Version Control System). V systémech DVCS (např. Git, Mercurial, Bazaar nebo Darcs) uživatelé pouze nestahují nejnovější verzi souborů (tzv. snímek, anglicky snapshot), ale uchovávají kompletní kopii repozitáře (repository). Pokud v takové situaci dojde ke kolapsu serveru, lze jej obnovit zkopírováním repozitáře od libovolného uživatele. Každá lokální kopie (checkout) je plnohodnotnou zálohou všech dat (viz obrázek 1-3).

Insert 18333fig0103.png
Figure 1-3. Diagram distribuované správy verzí

Mnoho z těchto systémů navíc bez větších obtíží pracuje i s několika vzdálenými repozitáři, a vy tak můžete v rámci jednoho projektu spolupracovat na různých úrovních s rozdílnými skupinami lidí. Díky tomu si můžete vytvořit několik typů pracovních postupů, což není v centralizovaných systémech (např. v hierarchických modelech) možné.

## Stručná historie systému Git ##

Tak jako mnoho velkých věcí v lidské historii se i systém Git zrodil z kreativní destrukce a vášnivého sporu. Jádro Linuxu je software s otevřeným kódem a širokou škálou využití. V letech 1991 – 2002 bylo jádro Linuxu spravováno formou záplat a archivních souborů. V roce 2002 začal projekt vývoje linuxového jádra využívat komerční systém DVCS s názvem Bit-Keeper.

V roce 2005 se zhoršily vztahy mezi komunitou, která vyvíjela jádro Linuxu, a komerční společností, která vyvinula BitKeeper, a společnost přestala tento systém poskytovat zdarma. To přimělo komunitu vývojářů Linuxu (a zejména Linuse Torvaldse, tvůrce Linuxu), aby vyvinula vlastní nástroj, založený na poznatcích, které nasbírala při užívání systému BitKeeper. Mezi požadované vlastnosti systému patřily zejména:

*	Rychlost,
*	jednoduchý design,
*	silná podpora nelineárního vývoje (tisíce paralelních větví),
*	plná distribuovatelnost,
*	schopnost efektivně spravovat velké projekty, jako je linuxové jádro (rychlost a objem dat).

Od svého vzniku v roce 2005 se Git vyvinul a vyzrál v snadno použitelný systém, který si dodnes uchovává své prvotní kvality. Je extrémně rychlý, velmi efektivně pracuje i s velkými projekty a nabízí skvělý systém větvení pro nelineární způsob vývoje (viz kapitola 3).

## Základy systému Git ##

Jak bychom tedy mohli Git charakterizovat? Odpověď na tuto otázku je velmi důležitá, protože pokud pochopíte, co je Git a na jakém principu pracuje, budete ho bezpochyby moci používat mnohem efektivněji. Při seznámení se systémem Git se pokuste zapomenout na vše, co už možná víte o jiných systémech VCS, např. Subversion nebo Perforce. Vyhnete se tak nežádoucím vlivům, které by vás mohly při používání systému Git mást. Ačkoli je uživatelské rozhraní velmi podobné, Git ukládá a zpracovává informace poněkud odlišně od ostatních systémů. Pochopení těchto rozdílů vám pomůže předejít nejasnostem, které mohou vzniknout při používání systému Git.

### Snímky, nikoli rozdíly ###

Hlavním rozdílem mezi systémem Git a všemi ostatními systémy VCS (včetně Subversion a jemu podobných) je způsob, jakým Git zpracovává data. Většina ostatních systémů ukládá informace jako seznamy změn jednotlivých souborů. Tyto systémy (CVS, Perforce, Bazaar atd.) chápou uložené informace jako sadu souborů a seznamů změn těchto souborů v čase – viz obrázek 1-4.

Insert 18333fig0104.png
Figure 1-4. Ostatní systémy ukládají data jako změny v základní verzi každého souboru.

Git zpracovává data jinak. Chápe je spíše jako sadu snímků (snapshots) vlastního malého systému souborů. Pokaždé, když v systému zapíšete (uložíte) stav projektu, Git v podstatě „vyfotí“, jak vypadají všechny vaše soubory v daném okamžiku, a uloží reference na tento snímek. Pokud v souborech nebyly provedeny žádné změny, Git v zájmu zefektivnění práce neukládá znovu celý soubor, ale pouze odkaz na předchozí identický soubor, který už byl uložen. Zpracování dat v systému Git ilustruje obrázek 1-5.

Insert 18333fig0105.png
Figure 1-5. Git ukládá data jako snímky projektu proměnlivé v čase.

Toto je důležitý rozdíl mezi systémem Git a téměř všemi ostatními systémy VCS. Git díky tomu znovu zkoumá skoro každý aspekt správy verzí, které ostatní systémy kopírovaly z předchozí generace. Git je tak z obyčejného VCS spíše povýšen na vlastní systém správy souborů s řadou skutečně výkonných nástrojů, jež stojí na jeho vrcholu. Některé přednosti, které tato metoda správy dat nabízí, si podrobně ukážeme na systému větvení v kapitole 3.

### Téměř každá operace je lokální ###

Většina operací v systému Git vyžaduje ke své činnosti pouze lokální soubory a zdroje a nejsou potřeba informace z jiných počítačů v síti. Pokud jste zvyklí pracovat se systémy CVCS, kde je většina operací poznamenána latencí sítě, patrně vás při práci v systému Git napadne, že mu bohové rychlosti dali do vínku nadpřirozené schopnosti. Protože máte celou historii projektu uloženou přímo na svém lokálním disku, probíhá většina operací takřka okamžitě.

Pokud chcete například procházet historii projektu, Git kvůli tomu nemusí vyhledávat informace na serveru – načte ji jednoduše přímo z vaší lokální databáze. Znamená to, že se historie projektu zobrazí téměř neprodleně. Pokud si chcete prohlédnout změny provedené mezi aktuální verzí souboru a týmž souborem před měsícem, Git vyhledá měsíc starý soubor a provede lokální výpočet rozdílů, aniž by o to musel žádat vzdálený server nebo stahovat starší verzi souboru ze vzdáleného serveru a poté provádět lokální výpočet.

To také znamená, že je jen velmi málo operací, které nemůžete provádět offline nebo bez připojení k VPN. Jste-li v letadle nebo ve vlaku a chcete pokračovat v práci, můžete beze všeho zapisovat nové revize. Ty se odešlou ve chvíli, kdy se opět připojíte k síti. Jestliže přijedete domů a zjistíte, že VPN klient nefunguje, stále můžete pracovat. V mnoha jiných systémech je takový postup nemožný nebo přinejmenším obtížný. Například v systému Perforce toho lze bez připojení k serveru dělat jen velmi málo, v systémech Subversion a CVS můžete sice upravovat soubory, ale nemůžete zapisovat změny do databáze, neboť ta je offline. Možná to vypadá jako maličkost, ale divili byste se, jaký je to velký rozdíl.

### Git pracuje důsledně ###

Než je v systému Git cokoli uloženo, je nejprve proveden kontrolní součet, který je potom používán k identifikaci dané operace. Znamená to, že není možné změnit obsah jakéhokoli souboru nebo adresáře, aniž by o tom Git nevěděl. Tato funkce je integrována do systému Git na nejnižších úrovních a je v souladu s jeho filozofií. Nemůže tak dojít ke ztrátě informací při přenostu dat nebo k poškození souboru, aniž by to byl Git schopen zjistit.

Mechanismus, který Git k tomuto kontrolnímu součtu používá, se nazývá otisk SHA-1 (SHA-1 hash). Jedná se o řetězec o 40 hexadecimálních znacích (0–9; a–f) vypočítaný na základě obsahu souboru nebo adresářové struktury systému Git. Otisk SHA-1 může vypadat například takto:

	24b9da6552252987aa493b52f8696cd6d3b00373

S těmito otisky se budete setkávat ve všech úložištích systému Git, protože je používá opravdu často. Neukládá totiž soubory podle jejich názvu, ale ve své databázi podle otisku (hashe) jeho obsahu.

### Git většinou jen přidává data ###

Jednotlivé operace ve většině případů jednoduše přidávají data do Git databáze. Přimět systém, aby udělal něco, co nelze vzít zpět, nebo aby smazal jakákoli data, je velice obtížné. Stejně jako ve všech systémech VCS můžete ztratit nebo nevratně zničit změny, které ještě nebyly zapsány. Jakmile však jednou zapíšete snímek do systému Git, je téměř nemožné ho ztratit, zvlášť pokud pravidelně zálohujete databázi do jiného repozitáře.

Díky tomu vás bude práce se systémem Git bavit. Budete pracovat s vědomím, že můžete experimentovat, a neriskujete přitom nevratné zničení své práce. Podrobnější informace o tom, jak Git ukládá data a jak lze obnovit zdánlivě ztracenou práci, najdete v části „Pod pokličkou“ v kapitole 9.

### Tři stavy ###

A nyní pozor. Pokud chcete dále hladce pokračovat ve studiu Git, budou pro vás následující informace stěžejní. Git používá pro spravované soubory tři základní stavy: zapsáno (committed), změněno (modified) a připraveno k zapsání (staged). Zapsáno znamená, že jsou data bezpečně uložena ve vaší lokální databázi. Změněno znamená, že v souboru byly provedeny změny, avšak soubor ještě nebyl zapsán do databáze. Připraveno k zapsání znamená, že jste změněný soubor v jeho aktuální verzi určili k tomu, aby byl zapsán v další revizi (tzv. commit).

Z toho vyplývá, že projekt je v systému Git rozdělen do tří hlavních částí: adresář systému Git (Git directory), pracovní adresář (working directory) a oblast připravených změn (staging area).

Insert 18333fig0106.png
Figure 1-6. Pracovní adresář, oblast připravených změn a adresář Git

V adresáři Git ukládá systém databázi metadat a objektů k projektu. Je to nejdůležitější část systému Git a zároveň adresář, který se zkopíruje, když klonujete repozitář z jiného počítače.

Pracovní adresář obsahuje lokální kopii jedné verze projektu. Tyto soubory jsou staženy ze zkomprimované databáze v adresáři Git a umístěny na disk, abyste je mohli upravovat.

Oblast připravených změn je jednoduchý soubor, většinou uložený v adresáři Git, který obsahuje informace o tom, co bude obsahovat příští revize. Soubor se někdy označuje také anglickým výrazem „index“, ale oblast připravených změn (staging area) je už dnes termín běžnější.

Standardní pracovní postup vypadá v systému Git následovně:

1.  Změníte soubory ve svém pracovním adresáři.
2.  Soubory připravíte k uložení tak, že vložíte jejich snímky do oblasti připravených změn.
3.  Zapíšete revizi. Snímky souborů, uložené v oblasti připravených změn, se trvale uloží do adresáře Git.

Nachází-li se konkrétní verze souboru v adresáři Git, je považována za zapsanou. Pokud je modifikovaná verze přidána do oblasti připravených změn, je považována za připravenou k zapsání. A pokud byla od posledního checkoutu změněna, ale nebyla připravena k zapsání, je považována za změněnou. O těchto stavech, způsobech jak je co nejlépe využívat nebo i o tom, jak přeskočit proces připravení souborů, se dozvíte v kapitole 2.

## Instalace systému Git ##

Je na čase začít systém Git aktivně používat. Instalaci můžete provést celou řadou způsobů – obvyklá je instalace ze zdrojových souborů nebo instalace existujícího balíčku, určeného pro vaši platformu.

### Instalace ze zdrojových souborů ###

Pokud je to možné, je nejvhodnější instalovat Git ze zdrojových souborů. Tak je zaručeno, že vždy získáte aktuální verzi. Každá další verze systému se snaží přidat nová vylepšení uživatelského rozhraní. Použití poslední verze je tedy zpravidla tou nejlepší cestou, samozřejmě pokud vám nedělá problémy kompilace softwaru ze zdrojových souborů.

Před instalcí samotného Gitu musí váš systém obsahovat následující knihovny, na nichž je Git závislý: curl, zlib, openssl, expat, a libiconv. Pokud používáte yum (např. Fedora) nebo apt-get (např. distribuce založené na Debianu), můžete k instalaci použít jeden z následujících příkazů:

	$ yum install curl-devel expat-devel gettext-devel \
	  openssl-devel zlib-devel

	$ apt-get install libcurl4-gnutls-dev libexpat1-dev gettext \
	  libz-dev libssl-dev

Po doinstalování všech potřebných závislostí můžete pokračovat stažením nejnovější verze z webových stránek systému Git:

	http://git-scm.com/download

Poté přistupte ke kompilaci a instalaci:

	$ tar -zxf git-1.7.2.2.tar.gz
	$ cd git-1.7.2.2
	$ make prefix=/usr/local all
	$ sudo make prefix=/usr/local install

Po dokončení instalace můžete rovněž vyhledat aktualizace systému Git prostřednictvím systému samotného:

	$ git clone git://git.kernel.org/pub/scm/git/git.git

### Instalace v Linuxu ###

Chcete-li nainstalovat Git v Linuxu pomocí binárního instalátoru, většinou tak můžete učinit pomocí základního nástroje pro správu balíčků, který byl součástí vaší distribuce. Ve Fedoře můžete použít nástroj yum:

	$ yum install git-core

V distribuci založené na Debianu (např. Ubuntu) zkuste použít program apt-get:

	$ apt-get install git-core

### Instalace v systému Mac ###

Existují dva jednoduché způsoby, jak nainstalovat Git v systému Mac. Tím nejjednodušším je použít grafický instalátor Git, který si můžete stáhnout ze stránky Google Code (viz obrázek 1-7):

	http://code.google.com/p/git-osx-installer

Insert 18333fig0107.png
Figure 1-7. Instalátor Git pro OS X

Jiným obvyklým způsobem je instalace systému Git prostřednictvím systému MacPorts (`http://www.macports.org`). Máte-li systém MacPorts nainstalován, nainstalujte Git příkazem:

	$ sudo port install git-core +svn +doc +bash_completion +gitweb

Není nutné přidávat všechny doplňky, ale pokud budete někdy používat Git s repozitáři systému Subversion, budete pravděpodobně chtít nainstalovat i doplněk +svn (viz kapitola 8).

### Instalace v systému Windows ###

Instalace systému Git v OS Windows je velice nenáročná. Postup instalace projektu msysGit patří k těm nejjednodušším. Ze stránky Google Code stáhněte instalační soubor exe a spusťte ho:

	http://code.google.com/p/msysgit

Po dokončení instalace budete mít k dispozici jak verzi pro příkazový řádek (včetně SSH klienta, který se vám bude hodit později), tak standardní grafické uživatelské rozhraní.

## První nastavení systému Git ##

Nyní, když máte Git nainstalovaný, můžete provést některá uživatelská nastavení systému. Nastavení stačí provést pouze jednou – zůstanou zachována i po případných aktualizacích.

Nastavení konfiguračních proměnných systému, které ovlivňují jak vzhled systému Git, tak ostatní aspekty jeho práce, umožňuje příkaz git config. Tyto proměnné mohou být uloženy na třech různých místech :

*	 soubor /etc/gitconfig obsahuje údaje o všech uživatelích systému a jejich repozitářích. Po zadání parametru --system bude systém používat pouze tento soubor;
*	 soubor ~/.gitconfig je specifický pro váš uživatelský účet. Po zadání parametru --global bude Git používat pouze tento soubor;
*	 konfigurační soubor v adresáři Git (tedy .git/config) jakéhokoli repozitáře, který právě používáte: je specifický pro tento konkrétní repozitář. Každá úroveň je nadřazená hodnotám úrovně předchozí, např. hodnoty v .git/config mají přednost před hodnotami v /etc/gitconfig.

Ve Windows používá Git soubor `.gitconfig`, který je umístěný v adresáři `$HOME` (u většiny uživatelů `C:\Documents and Settings\$USER`). Dále se pokusí vyhledat ještě soubor /etc/gitconfig, který je relativní vůči kořenovému adresáři. Ten je umístěn tam, kam jste se rozhodli nainstalovat Git po spuštění instalačního programu.

### Totožnost uživatele ###

První věcí, kterou byste měli po nainstalování systému Git udělat, je nastavení uživatelského jména (user name) a e-mailové adresy. Tyto údaje se totiž později využívají při všech revizích v systému Git a jsou nezměnitelnou složkou každé revize, kterou zapíšete:

	$ git config --global user.name "John Doe"
	$ git config --global user.email johndoe@example.com

Použijete-li parametr `--global`, pak také toto nastavení stačí provést pouze jednou. Git bude používat tyto údaje pro všechny operace, které v systému uděláte. Pokud chcete pro konkrétní projekty změnit uživatelské jméno nebo e-mailovou adresu, můžete příkaz spustit bez parametru `--global`. V takovém případě je nutné, abyste se nacházeli v adresáři daného projektu.

### Nastavení editoru ###

Nyní, když jste zadali své osobní údaje, můžete nastavit výchozí textový editor, který bude Git využívat pro psaní zpráv. Pokud toto nastavení nezměníte, bude Git používat výchozí editor vašeho systému, jímž je většinou Vi nebo Vim. Chcete-li používat jiný textový editor (např. Emacs), můžete použít následující příkaz:

	$ git config --global core.editor emacs

### Nastavení nástroje diff ###

Další proměnnou, jejíž nastavení můžete považovat za užitečné, je výchozí nástroj diff, jenž bude Git používat k řešení konfliktů při slučování. Řekněme, že jste se rozhodli používat vimdiff:

	$ git config --global merge.tool vimdiff

Jako platné nástroje slučování Git akceptuje: kdiff3, tkdiff, meld, xxdiff, emerge, vimdiff, gvimdiff, ecmerge a opendiff. Nastavit můžete ale i jiné uživatelské nástroje – více informací o této možnosti naleznete v kapitole 7.

### Kontrola provedeného nastavení ###

Chcete-li zkontrolovat provedené nastavení, použijte příkaz `git config --list`. Git vypíše všechna aktuálně dostupná nastavení:

	$ git config --list
	user.name=Scott Chacon
	user.email=schacon@gmail.com
	color.status=auto
	color.branch=auto
	color.interactive=auto
	color.diff=auto
	...

Některé klíče se mohou objevit vícekrát, protože Git načítá stejný klíč z různých souborů (např. `/etc/gitconfig` a `~/.gitconfig`). V takovém případě použije Git poslední hodnotu pro každý unikátní klíč, který vidí.

Můžete také zkontrolovat, jakou hodnotu Git uchovává pro konkrétní položku. Zadejte příkaz `git config {key}`:

	$ git config user.name
	Scott Chacon

## Kde hledat pomoc ##

Budete-li někdy při používání systému Git potřebovat pomoc, existují tři způsoby, jak vyvolat nápovědu z manuálové stránky (manpage) pro jakýkoli z příkazů systému Git:

	$ git help <příkaz>
	$ git <příkaz> --help
	$ man git-<příkaz>

Například manpage nápovědu pro příkaz config vyvoláte zadáním:

	$ git help config

Tyto příkazy jsou užitečné, neboť je můžete spustit kdykoli, dokonce i offline.
Pokud nenajdete pomoc na manuálové stránce ani v této knize a uvítali byste osobní pomoc, můžete zkusit kanál `#git` nebo `#github` na serveru Freenode IRC (irc.freenode.net). Na těchto kanálech se většinou pohybují stovky lidí, kteří mají se systémem Git bohaté zkušenosti a často ochotně pomohou.

## Shrnutí ##

Nyní byste měli mít základní představu o tom, co je to Git a v čem se liší od systému CVCS, který jste možná dosud používali. Také byste nyní měli mít nainstalovanou fungující verzi systému Git, nastavenou na vaše osobní údaje. Nejvyšší čas podívat se na základy práce se systémem Git.

