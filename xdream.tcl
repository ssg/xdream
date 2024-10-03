# <x-dream>
#
# code by ssg, clairvoyant, disq, mengus
#
# http://www.sourtimes.org
# thanks goes to Scotch/CLQ, `BLaCK, AsMoD3uS

# refer to "xdream.cfg" file for user configuration...

# to do's & changes since 1.9a
# ============================
# - add ctrl+1, ctrl+2, ctrl+n shortcuts for windows?
# - implement last url's history
# - play.. play on paste..
# - smart identification system
# ! removed dcc receive notification
# ! slms made customizable (disq)
# ! now it does not gain favoritenick in away mode (disq)
# ! /opa and /dopa now handles nick lists bigger than 6 nicks (disq)
# ! massop/deop/voice operations changed, masscmd proc added (disq)
# ! no such nick messages to queries (works for me already? -disq)
# ! bugfixed nickname completion with tab key bug once more for nicks containing open braces (disq)
# ! removed "selam et" from status menu -meaningless- (disq)
# ! fixed nickname completion with tab key bug (hede@hodo thing) (disq)
# ! fixed complete;return bugs (disq)
# ! removed help for /c64 and /cpc464 (obsolete) (disq)
# ! fixed bkz handling, now correctly handles strings like "(bkz: hede)hodo" and "`hede`hodo" (disq)
# ! changed sozlukurl and ayet numarasi anchor name (disq)
# ! bugfixed kicktriggers..
# ! fixed ban flood bug..
# ! changed to new sozluk server..
# ! bugfixed mode..
# ! changed join layout.. (much more readable)
# ! remove sms,dict and sozluk code.. (obsolete)
# ! last bkz & last url matching now cleaner (disq)
# ! bugfixed nldelete (disq)
# ! bugfixed identbase save.
# ! bugfixed double mode bug on channel joins..
# ! bugfixed bkz:// conversion (disq)
# ! bugfixed mailto:// handling (disq)
# ! bugfixed away in menus (disq)
# ! bugfixed xlat..
# ! cancel button in menu-dialogs now works (disq)
# ! kicks are shown in status window when you get kicked
# ! getting back from 10 min autoaway correctly shows elapsed time..
# ! bugfixed auto-joins...
# ! bugfixed conference room 1.5.x null-lines...
# ! bugfixed away delay...
# ! bugfixed "[" char in nick completion bug...
# ! bugfixed random version...
# ! bugfixed query...
# ! bugfixed remove alias...
# ! bugfixed killdcc...
# ! bugfixed /kb
# ! xircon channel window title bugfix..
# ! config filename changed to xdream.cfg
# ! bugfixed kline.. (disq)
# ! changed serial / crack method to avoid floods (ssg)
# + added /reload, same as /refresh (disq)
# + added auto-execs. set aexec(irc.server.org) { "/cmd1 params" "/cmd2 params" } (disq)
# + added /xlat* undefined language pair error (disq)
# + added /dict* alias (langtolang translation) (disq)
# + added /command completion with tab key (disq)
# + added checkversionatstartup (disq)
# + added /checkversion (disq)
# + added /dop alias for /deop and /mdop alias for /mdeop (disq)
# + added /dopca and /dopa aliases (disq)
# + added /opca and /opa aliases (disq)
# + added user-bkz (mengus-nyks)
# + added selam-matik(tm) (mengus)
# + added zobanvision(tm) (disq)
# + added versioninfo of klient..
# + added alt+a and f6 (away shortcuts)
# + finished all helptext..
# + added all the missing help files
# + added /wix alias
# + "gorunmez bkz"'s are now clickable (disq)
# + added /id alias..
# + if notifynick is on, highlights messages containing own nick (disq)
# + /bkz alias (shows bkz history) (disq)
# + /sus alias (turns off titlebar flashing) (disq)
# + all url's are now opened in new browser window (disq)
# + bkz's are now clickable (opened in new browser window) (disq)
# + highlight lines containing notifytriggers (disq)
# + added "open last url in new window" (F8) (disq)
# + added "open last bkz" (F7) (disq)
# + +++ath0 hangup trick protection.. (disq)
# + /nquery (noticequery) added.. (disq)
# + /n alias added..
# + added csadd (chanserv access add) alias..
# + fkb alias... (filter kick ban)
# + auto-unban thru chanserv when joining a channel
# + added part messsage support..
# + new popups..
# + auto-op request..
# + #cracks automation
# + made date formatting more readable..
# + now strips path from dcc finish notices..
# + topic and channel mode correction
# + user and channel mode descriptions..
# + run alias...
# + auto hotkey open for received dcc files...
# + country codes onjoin and whois
# + nick completion auto-shortening
# + /detach alias & separate private messages window
# + nicer away time layout...
# + clairvoyant alias.. (random mp3 player)
# + mp3 alias
# + set alias (allows to change config options at runtime)
# + added random auto-greet support
# + random quit messages
# + xlat alias (babelfish translation)...
# + recoded seen alias... (via nickserv)
# + nickname completion with tab key and smart /msg prefix with tab
# + added server-op and admin numerics...
# + added wi alias...
# + added hack alias...
# + added taskbar notification feature...
# + "*" support in "op in channels" field...
# + added _away suffix to nick option...
# + dcc autoreject...
# + channel name completion
# + initial channel topics/urls are shown in the active window
# + autowatch feature added.
# + lines which have notify triggers cause them to be highlighted.
# + split detection
# + dcc status in separate window
# + shows invisible text
# + configurable status info
# + WHOIS query...
# + dictionary lookup...
# + ircop & clone scan during join...
# + encrypted messaging (/enc)
# + added auto-dcc ip catching..

set xdream "\x02<x-dream>\x02"
set xversion "1.99.996f"

set TurkishSource { "Ş" "İ" "ı" "Ğ" "ş" "ğ" }
set TurkishDest   { "$" "i" "I" "G" "$" "g" }

set mp3player "c:/program files/winamp/winamp.exe"
set defaultkey "defaultkey"
set autorejectfiles {"script.ini"}
set defaultwindowheader "XiRCON - $xdream v$xversion - the script of your dreams! (SSG/aRtEffECt)"
set defaultawaymessage ""
set minimizenewqueries ""
set pagesound "beep"
set kraltopic "we live as we dream: alone"
set showmotd 0
set idle 0
set usequeries ""
set lastverindex 0
set isaway 0
set lastprivmsg ""
set watchsupported 0
set skipcompletion 0
set scanchannel ""
set massive_shield 0
set listing_bans 0
set invisiblectcps {"ACTION" "DCC"}
set noback 0
set lastban ""
set awaysince [clock seconds]
set lastbanchannel ""
set tryingtogain ""
set banclearmode 0
set startexe ""
set nickaway ""
set awaysuffix "_away"
set defaultKickReason $xdream
set klersecs 908863806
set infostatus "yes"
set separatemsg ""
set sozcounter 0
set favoritenick ""
set dumping 0
set xvared en_de
set xvaref en_fr
set xvarei en_it
set xvarep en_pt
set xvares en_es
set xvarde de_en
set xvarfe fr_en
set xvarie it_en
set xvarpe pt_en
set xvarse es_en
set dictvare "English"
set dictvart "Turkish"
set dictvarg "German"
set dictvarf "French"
set dictvars "Spanish"
set dictvarr "Russian"
set dictvari "Italian"
set lastfile ""
set crackppl {}
set translation ""
set begintranslate 0
set lasttranslation ""

set dicttranslating 0
set dictword ""

set lastmp3 ""
set lastevent ""
set lastmsgniq ""
set lastmsg ""
set lastnotniq ""
set lastnot ""
set clearbanlist {}
set awaymins 0
set translating 0
set checkversioninprogress 0
set checkversionServer "ssg.sourtimes.org"
set checkversionFile "/files/xdream.version"
set checkversionatstartup 1
set aliases {}
set lastjoin ""
set NickCompletionCase "normal"
set encsrc "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\$1234567890 "
set encdst " \$1234509876qwertyuiopQWERTYUIOPasdfghjklASDFGHJKLzxcvbnmZXCVBNM"
set countryshort {af al dz as ad ao ai aq ag ar am aw au az bs bh bd bb by be bz bj bm bt bo ba bw\
bv br io bn bg bf bi kh cm ca cv ky cf td cl cn cx cc co km cg ck cr ci hr cu cy cs dk dj dm\
do tp ec eg sv gq ee et fk fo fj fi fr gf pf tf ga gm ge de gh gi gr gl gd gp gu gt gn gw gy\
ht hm hn hk hu is in id ir iq ie il it jm jp jo kz ke ki kp kr kw kg la lv lb ls lr ly li lt\
lu mo mk mg mw my mv ml mt mh mq mr mu mx fm md mc mn ms ma mz mm na nr np nl an nt nc nz ni ne\
ng nu nf mp no om pk pw pa pg py pe ph pn pl pt pr qa re ro ru rw kn lc vc ws sm st sa sn sc sl\
sg si sb so za es lk sh pm sd sr sj sz se ch sy tw tj tz th tg tk to tt tn tr tm tc tv ug ua\
ae uk gb us um uy su uz vu va ve vn vi vg wf eh ye yu zr zm zw edu net mil org gov sk cz ato at}
set countrylong {"afghanistan" "albania" "algeria" "american samoa" "andorra" "angola" "anguilla"\
"antarctica" "antigua/barbuda" "argentina" "armenia" "aruba" "australia" "azerbaijan" "bahamas"\
"bahrain" "bangladesh" "barbados" "belarus" "belgium" "belize" "benin" "bermuda" "bhutan" "bolivia"\
"bosnia" "botswana" "bouvet island" "brazil" "british indian ocean territory" "brunei" "bulgaria"\
"burkina faso" "burundi" "cambodia" "cameroon" "canada" "cape verde" "cayman islands"\
"central african republic" "chad" "chile" "china" "christmas island" "cocos islands" "columbia"\
"comoros" "congo" "cook islands" "costa rica" "cote d'ivoire" "croatia" "cuba" "cyprus" "czechoslovakia"\
"denmark" "dijibouti" "dominica" "dominican republic" "east timor" "ecuador" "egypt" "el salvador"\
"equatorial guinea" "estonia" "ethiopia" "falkland islands" "faroe islands" "fiji" "finland" "france"\
"french guinea" "french polynesia" "french southern territorries" "gabon" "gambia" "georgia" "germany"\
"ghana" "gibraltar" "greece" "greenland" "grenada" "guadeloupe" "guam" "guatemala" "guinea" "guinea bissau"\
"gyana" "haiti" "heard/mcdonald islands" "honduras" "hong kong" "hungary" "iceland" "india" "indonesia" "iran" "iraq"\
"ireland" "israel" "italy" "jamaica" "japan" "jordan" "kazakhstan" "kenya" "kirbaiti" "north korea"\
"south korea" "kuwait" "kyrgyzstan" "laos" "latvia" "lebanon" "lesotho" "liberia" "libyan arab jamahiriya"\
"liechtenstein" "lithuania" "luxemborg" "macau" "macedonia" "madagascar" "malawi" "malaysia" "maldives"\
"mali" "malta" "marshall islands" "martinique" "mauritania" "mauritus" "mexico" "micronesia" "moldova"\
"monaco" "mongolia" "montserrat" "morocco" "mozambique" "myanmar" "nambia" "mauru" "nepal" "netherlands"\
"netherlands antilles" "neutral zone" "new caledonia" "new zealand" "nicaragua" "niger" "nigeria" "niue"\
"norfolk island" "northern mariana islands" "norway" "oman" "pakistan" "palau" "panama" "papua new guinea"\
"paraguay" "peru" "philippines" "pitcairn" "poland" "portugal" "puerto rico" "qatar" "reunion" "romania"\
"russia" "rwanda" "saint kitts/nevis" "saint lucia" "saint vincent" "samoa" "san marino"\
"sat tome" "saudi arabia" "senegal" "seychelles" "sierra leone" "singapore" "slovenia" "solomon islands"\
"somalia" "south africa" "spain" "sri lanka" "st helena" "st pierre" "sudan" "suriname" "svalbard islands"\
"swaziland" "sweden" "canton helvetique" "syria" "taiwan" "tajikistan" "tanzania" "thailand" "togo" "tokelau"\
"tonga" "trinidad/tobago" "tunisia" "turkiye" "turkmenistan" "turks islands" "tuvalu" "uganda" "ukrania"\
"united arab emirates" "united kingdom" "great britain" "united states of america" "minor outlying islands"\
"uruguay" "soviet republic" "uzbeksitan" "vanatu" "vatican" "venezuela" "vietnam" "us virgin islands"\
"uk virgin islands" "wallis/futuna islands" "western sahara" "yemen" "yugoslavia" "zaire" "zambia" "zimbabwe"\
"us-educational" "network" "us-military" "organization" "us-government" "slovakia"\
"czech" "nato" "austria"
}

set identbase {
  {"pirch" "pirch user" -1}
  {"root" "lame unix user (mal)" -1}
  {"deliv3" "mirc script user (mal)" -1}
}

set vers {
    "Klient 1.0 beta 15 (www.klient.com)"
    "Baxter (W) for BeOS R4.5"
    "Microsoft Chat 2.0 (4.71.0701.3) (comics mode)"
    "OpenChat/2 1.05 :OpenChat/2 OS/2 PM"
    "WSIRC 2.00-S - CopyRight 1994, 1995  Caesar M Samsi csamsi@clark.net TEXT CHANNEL"
    "mIRC32 v5.02 K.Mardam-Bey"
    "PIRCH32:WIN 95/WIN NT:Beta Version 0.92:97.01.11"
    "Ircle 3.0b8 US PPC. Reg. #29070AAFCBA"
    "ircII 2.9_roof HP-UX B.10.01 :this is a bug free client.  honest"
    "AmIRC/AmigaOS 1.8 BETA by Oliver Wagner (owagner@lsd.wupper.de)"
    "Running Visual IRC '97 0.94pre8. Get your copy today!! http://www.megalith.co.uk/virc"
    "GammaTech IRC (PM) : Version 1.04  : OS/2 Warp"
    "rxIRC 2.0.1 VM/CMS :Survival package for VM-struck humans"
    "cIRCus 0.41 (c) 1996-97 Ivo van der Wijk, Mark de Boer. http://www.nijenrode.nl/~ivo/circus/"
    "Running KVirc 0.9.0 by Szymon 'Pragma@ircnet' Stefanek <kvirc@tin.it> No script"
    "X-Chat 0.9.4 By ZED - Linux 2.2.5-15 [i686/299MHz]: http://xchat.linuxpower.org"
    "\x02\BitchX-75p1+\x02 by panasync - Linux 2.0.35 : \x02Keep it to yourself!\x02"
    "sirc 2.21, a \x02perl\x02 client -- using ssfe"
    "Grapevine Amiga IRC Client 1.452j1 Registered (Release 2 Beta) by Brian J. Cerveny (brianc@warped.com)."
    "leafChat 1.5, unregistered (Win32)"
}

set umode(a) "admin"
set umode(A) "services admin"
set umode(b) "show chatops"
set umode(c) "show connections"
set umode(C) "coadmin"
set umode(d) "deaf"
set umode(e) "no dcc"
set umode(E) "english"
set umode(f) "flood warnings"
set umode(F) "french"
set umode(g) "show gnotice"
set umode(G) "german"
set umode(h) "helper"
set umode(i) "invisible"
set umode(j) "java user"
set umode(k) "show kills"
set umode(m) "no privmsg"
set umode(n) "show news"
set umode(N) "network admin"
set umode(O) "local ircop"
set umode(o) "ircop"
set umode(p) "no ctcp"
set umode(r) "registered nick"
set umode(s) "show servermsg"
set umode(S) "spanish"
set umode(t) "reports"
set umode(T) "technical admin"
set umode(w) "show wallops"
set umode(x) "hidden host"
set umode(y) "show whois"
set umode(z) "zombie"

set cmode(a) "auth only"
set cmode(c) "no colors"
set cmode(d) "cloneable"
set cmode(e) "no ctcps"
set cmode(f) "raw"
set cmode(i) "invite only"
set cmode(h) "hidden"
set cmode(k) "key lock"
set cmode(K) "knock"
set cmode(l) "user limit"
set cmode(L) "language filter"
set cmode(m) "moderated"
set cmode(M) "forward moderated"
set cmode(N) "receive moderated"
set cmode(n) "no extmsg"
set cmode(p) "private"
set cmode(R) "restricted"
set cmode(r) "registered"
set cmode(s) "secret"
set cmode(t) "topic protection"
set cmode(u) "knock"
set cmode(w) "no whisper"
set cmode(z) "service"

set configfile "xdream.cfg"
set ibfile "xdream.ids"
set noticenicks {}
set noticewindows {}
set highkeys {}
set modemescapechar "+"
set lasturl ""
set lastbkzhistory {}
set sozlukurl "http://sozluk.sourtimes.org/show.asp?t="
set browser "c:\\program files\\internet explorer\\iexplore.exe"

set slms(f) {
        "/me %nick: sana ve bu vesile ile tum sozluk bayanlarina selam ederim..."
        "/me %nick: selamlarimi yanyana koysan iki ekvator eder..."
    "/me %nick: bir papatyanin gune\$ altinda sarimtrak gorunen bembeyaz yapraklarindan suzulen bir billur damlasi gibi gozya\$larimin icinden sana selam etmek, bu vesile ile kapilarimin tum sozluk bayanlarina acik oldugunu belirtmek isterim."
        "/me %nick: kariyerim su topculuktan mankenlige, coder'liktan muzisyenlige uzanan cok geni\$ bir yelpazeyi kapsar. selam etsem, alir misin?"
}

set slms(m) {
        "/me %nick: sana ve bu vesile ile tum sozluk baylarina selam ederim..."
        "/me %nick: selamlarimi yanyana koysan iki ekvator eder..."
    "/me %nick: bir papatyanin gune\$ altinda sarimtrak gorunen bembeyaz yapraklarindan suzulen bir billur damlasi gibi gozya\$larimin icinden sana selam etmek, bu vesile ile kapilarimin tum sozluk baylarina acik oldugunu belirtmek isterim."
        "/me %nick: kariyerim balerinlikten mankenlige, ressamliktan kama-sutra'ya uzanan cok geni\$ bir yelpazeyi kapsar. selam etsem, alir misin?"
}

if [catch {source $configfile}] {
  echo "$xdream --warning: $configfile file not found"
}

proc sortbylength { aone atwo } {
set l1 [string length $aone]
set l2 [string length $atwo]
if {$l1 > $l2} {
    return -1
} elseif { $l1 < $l2} {
    return 1
}
return 0
}

set highkeys [string toupper [lsort -command sortbylength $highkeys]]

rename alias oldalias

proc alias {name body} {
  global aliases
  lappend aliases $name
  oldalias $name $body
}

############### ##### ### # #     aliases

alias wix {
  set hede [arg]
  if {$hede==""} {
    set hede [channel]
    if {$hede==""} {
      showusage "/wix <target>"
      complete
      return
    }
  }
  showinfo "wix" "retrieving $xdream info for $hede"
  ctcp $hede CLIENTINFO
  complete
}

alias id {
  if {[args]==""} {
    showusage "/id <nick> <explanation>"
    complete
    return
  }
  complete
}

alias bkz {
global lastbkzhistory

    /query \xA0Bkz
    echo "$xdream bkz history" query \xA0Bkz
  echo "-----------------------------------------" query \xA0Bkz

  foreach x $lastbkzhistory {
      echo "$x" query \xA0Bkz
    }
  complete
}


alias sus {
  if [info exists flashreason] {
        unset flashreason
        window set_title $defaultwindowheader main
    }
    complete
}


oldalias kline {
  set reason [join [lrange [args] 1 end]]
  if {$reason==""} {
    set reason $xdream
  }
  /quote KLINE [lindex [args] 0] :$reason
  complete
}

oldalias notice {
global noticenicks noticewindows

    set niq [lindex [args] 0]
    if {[lsearch $noticenicks $niq]==-1} {
        return
    } else {
        set w [ngetactualwindowname $niq]
        if {[window exists query $w]} {
            set txt [lrange [args] 1 end]
            echo "<[my_nick]> $txt" query $w
            /quote NOTICE $niq :$txt
        } else {
            set noticenicks [nldelete $noticenicks $niq]
            set noticewindows [nldelete $noticewindows $w]
            return
        }

    }
    complete
    return
}
alias slm {
    if {[arg]==""} {
        showusage "</slm <cinsiyet(m/f)> <nick>"
        complete
        return
    }

  set g [lindex [args] 0]
  
  if {[info exists slms($g)]==0} {
        showusage "</slm <cinsiyet(m/f)> <nick>"
        complete
        return
    }
  
  set l [llength $slms($g)]
        
    set a [random 0 [expr $l - 1]]
    set s [lindex $slms($g) $a]

    set i [string first "%nick" $s]
    while {$i>-1} {
    set sb [string range $s 0 [expr $i - 1]]
    set se [string range $s [expr $i + 5] [string length $s]]
    set s "$sb[lindex [args] 1]$se"
    set i [string first "%nick" $s]
  }

    $s
}


alias nquery {

global noticenicks noticewindows

  if {[arg]==""} {
    showusage "/nquery <nick>"
    complete
    return
  }

  set niq [join [arg]]

    if {[set a [lsearch $noticenicks $niq]]==-1} {
        set w [ncreatewindowname $niq]
    lappend noticenicks $niq
    lappend noticewindows $w
    } else {
        set w [ngetactualwindowname $niq]
    }

  if {![window exists query $w]} {
    /query $w
        window set_title "Notice: $niq" query $w
        window clear query $w
    }
  complete
}

alias n {
  /notice [arg]
  complete
}

alias raw {
  /quote PRIVMSG OperServ :RAW [arg]
  complete
}

alias newuser {
  /raw NICK [arg] 1
  /raw :[arg] USER ident ident@x.xdream services : x-dream user
  complete
}

alias order {
  if {[llength [args]]<2} {
    showusage "/order <nick> <rawcmd>"
    complete
    return
  }
  /raw :[lindex [args] 0] [join [lrange [args] 1 end]]
  complete
}

alias svsnick {
  if {[llength [args]]!=2} {
    showusage "/svsnick <oldnick> <newnick>"
    complete
    return
  }
  /raw :NickServ SVSNICK [lindex [args] 0] [lindex [args] 1] :0
  complete
}

alias svskill {
  if {[arg]==""} {
    showusage "/svskill <nick> \[reason\]"
    complete
    return
  }
  /raw :NickServ SVSKILL [lindex [args] 0] :[join [lrange [args] 1 end]]
  complete
}

alias global {
  /operserv global [arg]
  complete
}

alias csdel {
  /cs access [channel] del [arg]
  complete
}

alias cslist {
  /cs access [channel] list
  complete
}

alias csadd {
  /cs access [channel] add [arg]
  complete
}

alias cs {
  /imsg chanserv [arg]
  complete
}

alias ns {
  /imsg nickserv [arg]
  complete
}

alias ms {
  /imsg memoserv [arg]
  complete
}

alias debug {
  /query \xA0Raw
  complete
}

alias fkb {
  if {[arg]==""} {
    showusage "/fkb <mask> <reason>"
    complete
    return
  }
  set tmp [lindex [args] 0]
  set reason [join [lrange [args] 1 end]]
  foreach x [nicks [channel]] {
    set x [normalizenick $x]
    if [info exists IAL($x)] {
      set tmp $x![lindex $IAL($x) 0]@[lindex $IAL($x) 1]
      if [string match $mask $tmp] {
        /kb $x $reason
      }
    } else {
      showwarning fkb "ial info missing for $x.. try after /who"
    }
  }
  complete
}

oldalias ctcp {
  set niq [lindex [args] 0]
  set msg [join [lrange [args] 1 end]]
  ctcp $niq $msg
  showinfo ctcp "$msg sent to $niq"
  complete
}

oldalias kill {
  set reason [join [lrange [args] 1 end]]
  if {$reason==""} {
    set reason $xdream
  }
  /quote KILL [lindex [args] 0] :$reason
  complete
}

alias serial {
  if {$crackppl=={}} {
    showwarning "no ppl is in the list (try !msg)"
    complete
    return
  }
  foreach x $crackppl {
    /msg $x !serial [arg]
  }
  complete
}

alias search {
  if {$crackppl=={}} {
    showwarning "no ppl is in the list (try !msg)"
    complete
    return
  }
  foreach x $crackppl {
    /msg $x !search [arg]
  }
  complete
}

alias cls {
  /clear
  complete
}

alias enc {
  if {[arg]==""} {
    showusage "/enc <message>"
    complete
    return
  }
  say [encrypt [arg]]
  complete
}

alias dec {
  if {[arg]==""} {
    showusage "/dec <message>"
    complete
    return
  }
  chaninfo [channel] "[color notice]Decryption: [decrypt [arg]]"
}

oldalias whois {
  set whoisinfo ""
}

alias cmode {
  if {[arg]==""} {
    showusage "/cmode <channel mode>"
  } else {
    /mode [channel] [arg]
  }
  complete
}

alias run {
  if [catch "exec [arg] &"] {
    showerror run "error running [arg]"
  }
  complete
}

alias wiq {
  if {[llength [args]]==0} {
    showusage "/wiq host whoisserver"
    complete
    return
  }
  set host [lindex [args] 0]
  if [info exists IAL($host)] {
    set adr [lindex $IAL($host) 1]
  } else {
    set adr $host
  }
  set wiu [lindex [args] 1]
  if {$wiu==""} {
    set wiu "whois.networksolutions.com"
  }
  showinfo whois-query "querying $adr thru $wiu"
  whoisquery $adr $wiu
  complete
}

alias lm {
  /msg [channel] [formatseconds [expr [clock seconds]-$klersecs]]
  complete
}

alias reload {
    /refresh
    complete
    }

alias refresh {
  if {![catch {source $configfile}]} {
    showinfo refresh "reloaded configuration"
    set highkeys [lsort -command sortbylength $highkeys]
  } else {
    showerror refresh "error loading configuration"
  }
  complete
}

alias summon {
  foreach tmp [args] {
    /fjoin $tmp [channel]
  }
  complete
}

alias dcc {
  if {[arg]==""} {
    /showdcc
    complete
    return
  }
}

alias detach {
  if {$separatemsg=="yes"} {
    set separatemsg ""
    window close query \xA0Private
    showinfo detach "Private messages will be displayed in active window."
  } else {
    set separatemsg yes
    showinfo detach "Private messages will be detached."
  }
  complete
}

alias motd {
  set showmotd 1
}

alias set {
  /tcl set [arg]
  complete
}

alias mp3 {
  if {![info exists mp3dir]} {
    showerror mp3 "mp3dir variable not set in $configfile"
    complete
    return
  }
  if {[arg]==""} {
    if {$lastmp3!=""} {
      /me is listening $lastmp3 / $xdream
    }
    complete
    return
  }
  if ![string match "*/" $mp3dir] { set mp3dir $mp3dir/ }
  set tmp [glob -nocomplain ${mp3dir}*.mp3]
  if {[llength $tmp]==0} {
    showerror mp3 "no mp3 files found in $mp3dir"
    complete
    return
  }
  if {[arg]=="?"} {
    foreach x $tmp {
      showinfo mp3list [getfilename $x]
    }
    complete
    return
  }
  set final ""
  foreach x $tmp {
    if [string match "*[string toupper [arg]]*" [string toupper $x]] {
      set final $x
      break
    }
  }
  if {$final==""} {
    showerror mp3 "Not found: [arg]"
    complete
    return
  }
  showinfo mp3 "Playing $final"
  if ![catch { exec $mp3player $final &} ] {
    set lastmp3 [getfilename $final]
    regsub .mp3 $lastmp3 "" lastmp3
  }
  complete
}

alias clairvoyant {
  if {![info exists mp3dir]} {
    showerror clairvoyant "mp3dir variable not set in $configfile"
    complete
    return
  }
  if ![string match "*/" $mp3dir] { set mp3dir $mp3dir/ }
  set tmp [glob -nocomplain ${mp3dir}*.mp3]
  if {[llength $tmp]==0} {
    showerror clairvoyant "no mp3 files found in $mp3dir"
    complete
    return
  }
  set lastmp3 [rlist $tmp]
  showinfo clairvoyant "Playing $lastmp3"
  exec $mp3player $lastmp3 &
  set lastmp3 [lindex [split $lastmp3 /] end]
  regsub .mp3 $lastmp3 "" lastmp3
  complete
}

alias why {
  /imsg chanserv why [channel] [arg]
  complete
}

alias sop {
  if {[arg]==""} {
    set tmp [my_nick]
  } else {
    set tmp [arg]
  }
  /samode [channel] +o $tmp
  complete
}

alias sdeop {
  if {[arg]==""} {
    set tmp [my_nick]
  } else {
    set tmp [arg]
  }
  /samode [channel] -o $tmp
  complete
}

alias xlat* {
  set translation ""
  if {[llength [args]]==1} {
    complete
    return
  }
  set tmp [string tolower [string range [lindex [args] 0] 4 5]]
  if [catch {set pair [subst $[subst xvar$tmp]]}] {
    showerror xlat "Language pair not defined: '$tmp'"
    complete
    return
  }
  if $translating {
    showerror xlat "Already translating one"
    complete
    return
  }
  if [catch {set sock [socket -async babelfish.altavista.com 80]}] {
    showerror xlat "connection failed"
    complete
    return
  }
  set translating 1
  fconfigure $sock -blocking 0 -buffering line
  set x [join [lrange [args] 1 end]]
  showinfo xlat "Translating '$x'"
  regsub -all " " $x + x
  set lastline "doit=done&urltext=$x&BabelFishFrontPage=yes&languagepair=$pair"
  set temptext "POST /translate.dyn HTTP/1.1\nContent-Type: application/x-www-form-urlencoded\nUser-Agent: $xdream\nHost: babelfish.altavista.com\nContent-Length: [string length $lastline]\nConnection: Keep-Alive\n\n$lastline"
  puts $sock $temptext
  if [catch {flush $sock}] {
    showerror xlat "data connection failed"
    close $sock
    set translating 0
    complete
    return
  }
  fileevent $sock readable "xlathandler $sock"
  complete
}

oldalias quit {
  if {[arg]==""} {
    set tmp ""
    catch { set tmp [lindex $quits [random 0 [llength $quits]]] }
    if {$tmp!=""} {
      /quit $tmp
      complete
    }
  }
}

alias hack {
  if {[arg]==""} {
    showusage "/hack <nick>"
  } else {
    if [string match "#*" [arg]] {
      set tmp [nicks [arg]]
    } else {
      set tmp [args]
    }
    foreach x $tmp {
      set x [normalizenick $x]
      showinfo hack "trying $x"
      set x [string tolower $x]
      if [info exists IAL($x)] {
        set ip [lindex $IAL($x) 1]
        if [validip $ip] {
          hackip $ip
        } else {
          set hacking($ip) 1
          /dns $ip
        }
      }
    }
  }
  complete
}

alias wallops {
  set chan [lindex [args] 0]
  if [window exists channel $chan] {
    chaninfo [channel] "\x02wallops/[channel]:\x02 [color notice][arg]"
    foreach x [nicks $chan] {
      set x [normalizenick $x]
      if [isop $x $chan] {
        /quote NOTICE $x :\x02wallops/$chan:\x02 [arg]
      }
    }
  } else {
    showinfo wallops [arg]
  }
}

alias wi {
  /whois [arg]
  complete
}

alias sv {
  /me is using: $xdream $xversion
  complete
}

alias seen {
  /msg NickServ info [arg]
  complete
}

alias voice {
  /mode [channel] +vvvvvv [arg]
  complete
}

alias devoice {
  /mode [channel] -vvvvvv [arg]
  complete
}

alias cop {
  if {[arg]==""} {
    set who [my_nick]
  } else {
    set who [arg]
  }
  showinfo cop "chanserv op requested for $who"
  /imsg ChanServ op [channel] $who
  complete
}

alias cdeop {
  if {[arg]==""} {
    set who [my_nick]
  } else {
    set who [arg]
  }
  showinfo cdeop "chanserv deop requested for $who"
  /imsg ChanServ deop [channel] $who
  complete
}

oldalias join {
  if {[arg]==""} {
    complete
    return
  }
}

alias j {
  if {[string index [arg] 0]=="#"} {
    /join [arg]
  } else {
    /join #[arg]
  }
  complete
}


alias config {
  /edit $configfile
  complete
}

alias gain {
  set tryingtogain [string tolower [lindex [args] 0]]
  showinfo "Gain" "Trying to gain nick \"$tryingtogain\""
  /imsg NickServ ghost $tryingtogain [getnickpass]
  complete
}

alias caban {
  global banclearmode
  showinfo caban "clearing all bans in [channel]"
  set banclearmode 1
  set clearbanlist {}
  /mode [channel] +b
  complete
}

alias clban {
  if {$lastbanchannel==""} {
    showerror clban "No recorded ban(s)"
  } else {
    showinfo clban "clearing last ban in $lastbanchannel"
    /mode $lastbanchannel -b $lastban
  }
  complete
}

alias help {
  set tmp [string tolower [lindex [args] 0]]
  if {$tmp==""} {
    /query \xA0Help
    echo "$xdream commands:"
    echo "-----------------------------------------"
    foreach x [lsort [array names help]] {
      echo "[strfix $x 12] - [lindex $help($x) 1]" query \xA0Help
    }
  } else {
    foreach x [array names help] {
      if {$tmp==$x} {
        showinfo help "Usage: /[lindex $help($x) 0]"
        showinfo help "[lindex $help($x) 2]"
        break
      }
    }
  }
  complete
}

alias noawmsg {
  set noback 1
  /msg [arg]
  set noback 0
  complete
}

alias page {
  if {[arg]==""} {
    showusage "/page <nick>"
    complete
    return
  }
  /ctcp [arg] page
  complete
}

alias tsend {
  /tdcc send [arg]
  complete
}

alias send {
  /dcc send [arg]
  complete
}

alias notify {
  set cmd [string toupper [lindex [args] 0]]
  switch $cmd {
    "" {
      showusage "/notify \[-r\] <nick>"
    }
    default {
      if {$cmd=="-R"} {
        /remove [lindex [args] 1]!*@*
      } else {
        set tmp [lindex [args] 0]!*@*
        set i [add_user $tmp]
        set_user $i notify Y
        showinfo Notify "$tmp added to notify list"
     }
    }
  }
  complete
}

alias akick {
  set alist [get_cookie AutoKickList]
  set cmd [string toupper [lindex [args] 0]]
  switch $cmd {
    "" {
      showusage "/akick <add|del|list> <mask> \[reason\]"
    }
    "LIST" {
      if {[llength $alist]>0} {
        showinfo AutoKick "Current autokick list:"
        showinfo AutoKick "======================"
        foreach tmp $alist {
          showinfo AutoKick "[strfix [lindex $tmp 0] 30] ([lindex $tmp 1])"
        }
      } else {
        showinfo AutoKick "You've no defined AutoKick(s)."
      }
    }
    "ADD" {
      lappend alist [list [lindex [args] 1] [join [lrange [args] 2 end]]]
      set_cookie AutoKickList $alist
      showinfo AutoKick "Mask [lindex [args] 1] added to list"
    }
    "DEL" {
      set x 0
      set found 0
      set mask [lindex [args] 1]
      foreach tmp $alist {
        if {[lindex $tmp 0]==$mask} {
          set found 1
        } else { lappend templist $tmp }
        incr x
      }
      if {$found==-1} {
        showwarning AutoKick "Mask $mask not found in AutoKick list"
      } else {
        set_cookie AutoKickList $templist
        unset templist
        showinfo AutoKick "Mask $mask removed"
      }
    }
  }
  unset alist
  complete
}

alias killdcc {
  if {[arg]==""} {
    showusage "/killdcc <session_index>"
    complete
    return
  }
  if {[dcc_count]==0} {
    showinfo "Kill DCC" "no active transfers."
  } else {
    if {[arg]>=[dcc_count]} {
      showerror "Kill DCC" "no such transfer."
    } else {
      catch {dcc_cancel [arg]}
    }
  }
  complete
}

alias kadcc {
  if {[dcc_count]==0} {
    showwarning KillAllDCC "No active DCC transfers to kill"
    complete
    return
  }
  showinfo KillAllDCC "Killing all active DCC transfer sessions"
  while {[dcc_count]>0} {
    dcc_cancel 0
  }
  showinfo KillAllDCC "done"
  complete
}

alias showdcc {
  if {![window exists query \xA0\DCC]} {
    /query \xA0\DCC
  }
  window clear query \xA0\DCC
  if {[dcc_count]==0} {
    echo "No active transfer(s)" query \xA0\DCC
  } else {
    echo "Active DCC transfer(s)" query \xA0\DCC
    echo "--------------------------------------" query \xA0\DCC
    for {set tmp 0} {$tmp < [dcc_count]} {incr tmp} {
      set x [dcc_info $tmp]
      if {[lindex $x 0]=="SEND"} {
        echo "[strfix $tmp 3] [percstr [lindex $x 4] [lindex $x 5]] Sending [lindex $x 3] to [lindex $x 2] at [lindex $x 8]k/sec ([expr ([lindex $x 4]*100)/[lindex $x 5]]%)" query \xA0\DCC
      } else {
        echo "[strfix $tmp 3] [percstr [lindex $x 4] [lindex $x 5]] Receiving [lindex $x 3] from [lindex $x 2] at [lindex $x 8]k/sec ([expr ([lindex $x 4]*100)/[lindex $x 5]]%)" query \xA0\DCC
      }
    }
  }
  complete
}

alias rev {
  set tmp ""
  for {set x [expr [string length [arg]]-1]} {$x >= 0} {set x [expr $x-1]} {
    set tmp $tmp[string index [arg] $x]
  }
  say $tmp
  complete
}

alias dns {
  set param [arg]
  if {$param==""} {
    showusage "/dns <nick|address>"
  } else {
    if {[string first . $param]==-1} {
      if [info exists IAL($param)] {
        set param [lindex $IAL($param) 1]
      } else {
        showerror DNS "couldn't get address for $param."
        complete
        return
      }
    }
    showinfo DNS "looking up $param"
    lookup $param
  }
  complete
}

alias scan {
  set invisiblewho([string tolower [channel]]) 1
  /who [channel]
  complete
}

alias calc {
  if ![catch {set tmp [expr [arg]]}] {
    say "[arg] = $tmp"
  } else {
    showerror calc "invalid expression"
  }
  complete
}

alias userlist {
  for {set i 0} {$i!=[user_count]} {incr i} {
    print_user $i
  }
  complete
}

alias remove {
  set mask [lindex [args] 0]
  if {$mask==""} {
    showusage "/remove <mask>"
    complete
    return
  }
  if {[string first * $mask]==-1} {
    set mask $mask!*@*
  }
  for {set i 0} {$i<[user_count]} {incr i} {
    if {[string match $mask [get_user $i mask]]} {
      delete_user $i
      showinfo Remove "Removed $mask from userlist"
      break
    }
  }
  complete
}

alias aop {
  set chn [lrange [args] 1 end]
  if {$chn==""} {
    showusage "/aop <mask> <channels>"
    complete
    return
  }
  set mask [lindex [args] 0]
  if ![string match *!*@* $mask] {
    set mask $mask!*@*
  }
  set_user [add_user $mask] op $chn
  showinfo AutoOp "Added $mask for $chn"
  complete
}

alias imsg {
  /quote privmsg [lindex [args] 0] :[join [lrange [args] 1 end]]
  complete
}

oldalias msg {
  noidle
}

alias m {
  /msg [arg]
  complete
}

alias ignore {
  set mask [lindex [args] 0]
  if {$mask==""} {
    showusage "/ignore <mask> \[all|private|public|none\]"
    complete
    return
  }
  if {![string match *!*@* $mask]} {
    set mask $mask!*@*
  }
  set mode [string toupper [lindex [args] 1]]
  if {[stricmp $mode ""]==0} {
    set mode "ALL"
  }
  set_user [add_user $mask] ignore $mode
  showinfo Ignore "Ignoring $mask for $mode messages"
  complete
}

alias sysinfo {
  set tmp 0
  showinfo SysInfo "hostname   : [info hostname]"
  showinfo SysInfo "irc server : [server]"
  showinfo SysInfo "your mask  : [my_nick]![my_user]@[my_host]"
  showinfo SysInfo "client     : XiRCON [version]"
  showinfo SysInfo "tcl version: [info patchlevel]"
  showinfo SysInfo "os         : $tcl_platform(os) v$tcl_platform(osVersion)"
  showinfo SysInfo "tcl perf   : [time {
    set tmp [expr $tmp*2]
    if {$tmp==0} {
      incr tmp
      set hubele [expr $tmp-1]
    } else {
      set tmp [expr $tmp-1]
      set hubele [expr $tmp+1]
    }
  } 10000]"
  complete
}

oldalias server {
  set lastserver [get_cookie lastserver]
  if {[arg]=="" && $lastserver!=""} {
    /server $lastserver
    complete
  }
}

alias op {
    /mode [channel] +oooooo [arg]
    complete
}

alias dop {
    /deop [arg]
    complete
}

alias deop {
    /mode [channel] -oooooo [arg]
    complete
}

alias xtir {
  set victims ""
  foreach nick [nicks [channel] *] {
    if {([string first "@" $nick]==-1) && ([string first "+" $nick]==-1)} {
    set nick [normalizenick $nick]
    if {$nick != [my_nick]} {
      lappend victims $nick
    }
    }
  }
  foreach x $victims {
    /kb $x xtir $xdream
  }
  showinfo xtir Xtired.
  complete
}

alias mdop {
    /mdeop [args]
    complete
}


alias mdeop {
    masscmd [nicks [channel]] "" 0 "/mode [channel] -oooooo"
    complete
}

alias mvoice {
    masscmd [nicks [channel]] "+" -1 "/mode [channel] +vvvvvv"
    complete
}

alias mop {
    masscmd [nicks [channel]] "@" -1 "/mode [channel] +oooooo"
    complete
}

alias showcolors {
  set tmp ""
  if {[arg]==""} { set x 16 } else { set x [arg] }
  for {set i 1} {$i <= $x} {incr i} {
    append tmp "[cl $i] $i "
  }
  foreach i {public private action notice ctcp change join part quit highlight error nick channel mode url command users} {
    append tmp "[color $i] $i "
  }

  showinfo colors $tmp
  complete
}

alias es {
  /edit xdream
  complete
}

alias locktopic {
  if {[channel]==""} {
    showerror Locktopic "You must be in a channel"
    complete
    return
  }
  if {[arg]==""} {
    set topiclock([channel]) "[topic [channel]]"
  } else {
    /topic [arg]
    set topiclock([channel]) "[arg]"
  }
  showinfo TopickLock "enabled for [channel]"
  complete
}

alias unlocktopic {
  if {![info exists topicklock([channel])]} {
    showerror TopicLock "[channel] topic isn't locked"
  } else {
    unset topicklock([channel])
    showinfo TopicLock "[channel] topic unlocked"
  }
  complete
}

alias ping {
  if {[arg]==""} {
    /quote PING :[unixtime]
  } else {
    /ctcp [arg] ping [unixtime]
  }
  complete
}

alias amsg {
  foreach c [channels] {
    /msg $c [arg]
  }
  complete
}

alias ame {
  foreach c [channels] {
    /imsg $c \x01\ACTION [arg]\x01
    echo "[color nick]* [my_nick][color action] [arg]" channel $c
  }
  complete
}

alias tcl {
  if { [catch { eval [arg] } msg] } {
    echo "Error executing TCL command \"[arg]\" : "
    echo $msg
  }
  complete
}

alias hop {
  set chan [arg]
  if {$chan==""} {
    /rejoin
    complete
    return
  }
  if {![string match "\#*" $chan]} { set chan \#$chan }
  if {[channel]!=""} { /part [channel] }
  /join $chan
  complete
}

oldalias privmsg {
  noidle

  global noticenicks noticewindows

  set dest [lindex [args] 0]
  set msg [join [lrange [args] 1 end]]

  if {[string first \xA0Notice_ [window name]]>=0} {
        set tit [window get_title query [window name]]
        set dest [string range $tit [expr [string first "Notice: " $tit] + 8] end]
        if {[lsearch $noticenicks $dest]==-1} {
            lappend noticenicks $dest
            lappend noticewindows [window name]
        }
        /quote NOTICE $dest :$msg
      set msg [highlightkeys [bkzlaricevir $msg] "query"]
        echo "<[my_nick]> $msg" query [window name]
        complete
        return
    }


  if {[string first \xA0 [window name]]>=0} {
    complete
    return
  }

  set visiblemsg [highlightkeys [bkzlaricevir [decrypt $msg]] "channel"]
  if {$dest == [channel] && [string first : [lindex [args] 1]]>0} {
    set nick ""
    set niq [string tolower [string trimright [lindex [args] 1] ":"]]
    if {$niq!=""} {
      foreach i [nicks [channel] "*$niq*"] {
        set i [normalizenick $i]
        if {[string first $niq [string tolower $i]]==0} {
          set nick $i
          break
        }
      }
    }
    if {$nick != ""} {
      set niq [getconfig NickCompletionCase]
      if {$niq=="lowercase"} {
        set nick [string tolower $nick]
      } elseif {$niq=="uppercase"} {
        set nick [string toupper $nick]
      }
      if {[string length $nick] > 14} {
        set nick "[string range $nick 0 10]..."
      }
      set msg "$nick: [join [lrange [args] 2 end]]"
      set visiblemsg [highlightkeys [bkzlaricevir $msg] "default"]
    }
  }
  if {[string first "#" $dest]==0} {
    if [window exists channel $dest] {
      echo "[color nick]<[my_nick]>[color default] $visiblemsg" channel $dest
    } else {
      showinfo "message -> $dest" $visiblemsg
    }
  } else {
    if [window exists query $dest] {
      echo "<[my_nick]> $visiblemsg" query $dest
    } else {
      echo "-> <$dest> $visiblemsg"
    }
  }
  /imsg $dest $msg

  complete
  return
}

alias ver {
  /ctcp [arg] version
  complete
}

alias away {
  if {[connected]} {
    set awaysince [unixtime]
    if {[arg]==""} {
      set tmp $defaultawaymessage
    } else {
      set tmp [arg]
    }
    /ame is away (\x02$tmp\x02) since [ctime $awaysince]
    /quote AWAY :[arg] (away since [ctime $awaysince])
    if {($nickaway=="yes")&&([string first $awaysuffix [my_nick]]==-1)} {
      /nick [my_nick]$awaysuffix
    }
    set isaway 1
  }
  set idle 0
  complete
}

alias back {
  if {!$isaway} {
    showerror Away "You're already awake!"
  } else {
    set aw [expr [unixtime]-$awaysince]
    set x [string first $awaysuffix [my_nick]]
    if {$x>=0} {
      /nick [string range [my_nick] 0 [expr {$x-1}]]
    }
    /ame is back!! - away for [formatseconds $aw]
    unset awaysince
    set isaway 0
    set idle 0
  }
  /quote AWAY
  complete
}

alias ct {
  set temp [my_nick]
  /topic $kraltopic
  complete
}

alias ban {
  set x [string tolower [arg]]
  if {[string first "*" $x]!=-1} {
    /mode #coders +b [arg]
    complete
    return
  }
  global IAL
  if [info exists IAL($x)] {
    set tmp $IAL($x)
    /mode [channel] -o+b [arg] *![lindex $tmp 0]@[lindex $tmp 1]
  } else {
    showwarning ban "IAL info missing for $x. try banning again after /whois"
  }
  complete
}

alias k {
  set reason [join [lrange [args] 1 end]]
  if {$reason==""} {set reason $defaultKickReason}
  /quote KICK [channel] [lindex [args] 0] :$reason
  complete
}

alias kb {
  /ban [lindex [args] 0]
  /k [arg]
  complete
}

alias rejoin {
  showinfo rejoin "cycling [channel]"
  /quote PART [channel] brb\x0AJOIN [channel]
  complete
}


alias opca {
  if {[arg]==""} {
   set who [my_nick]
  } else {
    set who [arg]
  }

  showinfo opca "massive chanserv op requested for $who"

  foreach c [channels] {
    foreach w $who {
        if {[isop2 $w $c]==0} {
              showinfo opca "chanserv op requested for $w in $c"
            /imsg ChanServ op $c $w
            }
        }
  }
  complete
}

alias opa {
  if {[arg]==""} {
   showusage "/opa <target>"
   complete
   return
  } else {
    set who [arg]
  }

  showinfo opa "massive op requested for $who"

  foreach c [channels] {
    set olist ""
    foreach w $who {
        if {[isop2 $w $c]==0} {
            append olist " $w"
            }
        }
      if {$olist!=""} {
        showinfo opa "opping$olist in $c"
#           /mode $c +oooooo $olist
            masscmd $olist "@" -1 "/mode $c +oooooo"
            }
  }
  complete
}


alias dopca {
  if {[arg]==""} {
   showusage "/dopca <target>"
   complete
   return
  } else {
    set who [arg]
  }

  showinfo dopca "massive chanserv deop requested for $who"

  foreach c [channels] {
    foreach w $who {
        if {[isop2 $w $c]==1} {
              showinfo dopca "chanserv deop requested for $w in $c"
            /imsg ChanServ deop $c $w
            }
        }
  }
  complete
}

alias dopa {
  if {[arg]==""} {
   showusage "/dopa <target>"
   complete
   return
  } else {
    set who [arg]
  }

  showinfo dopa "massive deop requested for $who"

  foreach c [channels] {
    set olist ""
    foreach w $who {
        if {[isop2 $w $c]==1} {
            append olist " $w"
            }
        }
      if {$olist!=""} {
        showinfo dopa "deopping$olist in $c"
#           /mode $c -oooooo $olist
            masscmd $olist "" 0 "/mode $c -oooooo"
            }
  }
  complete
}


# check version code by disq (based on ssg's translate code)
alias checkversion {
global checkversioninprogress checkversionServer checkversionFile

  if $checkversioninprogress {
    showerror checkversion "Already checking for version"
    complete
    return

  }

  if [catch {set sock [socket -async $checkversionServer 80]}] {
    showerror checkversion "connection failed"
    complete
    return
  }
  set checkversioninprogress 1

  fconfigure $sock -blocking 0 -buffering line

  set temptext "GET $checkversionFile HTTP/1.1\nUser-Agent: $xdream\nHost: $checkversionServer\nConnection: Keep-Alive\n\n"
  puts $sock $temptext
  if [catch {flush $sock}] {
    showerror checkversion "data connection failed"
    close $sock
    set checkversioninprogress 0
    complete
    return
  }
  fileevent $sock readable "checkversionhandler $sock"
  complete
}


alias dict {
 /dictte [args]
 complete
}

alias dict* {
global dictword

  if {[llength [args]]==1} {
    complete
    return
  } else {
    set fromLang [string tolower [string range [lindex [args] 0] 4 4]]
    set toLang [string tolower [string range [lindex [args] 0] 5 5]]
  }

  if [catch {set fromLang [subst $[subst dictvar$fromLang]]}] {
    showerror lang "No language as '$fromLang'"
    complete
    return
  }
  if [catch {set toLang [subst $[subst dictvar$toLang]]}] {
    showerror lang "No language as '$toLang'"
    complete
    return
  }
  
  if $dicttranslating {
    showerror dict "Already translating one"
    complete
    return
  }
  if [catch {set sock [socket -async www.langtolang.com 80]}] {
    showerror dict "connection failed"
    complete
    return
  }
  set dicttranslating 1
  fconfigure $sock -blocking 0 -buffering line
  set x [join [lrange [args] 1 end]]
  showinfo dict "Looking up '$x' in dictionary ($fromLang -> $toLang)"
  set dictword $x
  regsub -all " " $x + x
    
  set lastline "selectFrom=$fromLang&selectTo=$toLang&txtLang=$x&submit=Search"
  set temptext "POST /index.asp HTTP/1.1\nContent-Type: application/x-www-form-urlencoded\nUser-Agent: $xdream\nHost: www.langtolang.com\nContent-Length: [string length $lastline]\nConnection: Keep-Alive\n\n$lastline"

  puts $sock $temptext
  if [catch {flush $sock}] {
    showerror dict "data connection failed"
    close $sock
    set dicttranslating 0
    complete
    return
  }
  fileevent $sock readable "dicthandler $sock"
  complete
}



################### # #   #    #       hooks

for {set x 0} {$x < 1000} {incr x} {
  on [format "%3d" $x] {
    if [window exists query \xA0Raw] {
      echo "[color mode][event][color default] [raw_args]" query \xA0Raw
    }
  }
}


on url_output {
    global lasturl

    set uri [lindex [args] 0]

    if {[string first "://" $uri]!=0 && [string first "bkz://" $uri]!=0} { set lasturl $uri }
    complete
}


on url_select {
    set uri [lindex [args] 0]

    handle_urls $uri
    complete
}


on topic {
  if [info exists topiclock([channel])] {
    if {$topiclock([channel])!=[arg] && [nick]!=[my_nick]} {
      /deop [nick]
      /topic $topiclock([channel])
      say "[nick]: topic has been locked."
    }
  }
  set tmp [nick]
  if {$tmp==""} {
    set tmp [host]
  }
  set chan [lindex [args] 0]
  set topic [turkishtranslate [join [lrange [args] 1 end]]]
  if [window exists channel $chan] {
    chaninfo $chan "[color mode]Topic: \"$topic[color mode]\" set by $tmp"
    set tmp [window get_title channel $chan]
    set parsestr [parsetopic $tmp]
    window set_title "[join [lrange $parsestr 0 1]] $topic" channel $chan
  } else {
    showinfo "topic $chan" "\"$topic\" set by $tmp"
  }
  complete
}

on mode {
  set tmp [nick]
  if {$tmp==""} { set tmp [host] }
  if {[lindex [args] 0]==[my_nick]} {
    showinfo "user mode" [lrange [args] 1 end]
  } else {
    set modestr [lindex [args] 1]
    chaninfo [lindex [args] 0] "[color mode]Mode \"[join [lrange [args] 1 end]]\" by $tmp"
    set modestr [string trim [string trim $modestr +] -]
    if {[regexp \[A-Zc-np-uw-z\] $modestr]} {
      /mode [lindex [args] 0]
    }
  }
  complete
}

on mode+b {
  set chan [lindex [args] 0]
  set mask [lindex [args] 1]
  set lastban $mask
  set lastbanchannel $chan
  if [string match $mask [my_nick]![my_user]@[my_host]] {
    if {[isop [my_nick] $chan] && [my_nick]!=[nick]} {
      /quote "MODE $chan -o-b [nick] $mask"
      /noawmsg $chan [nick]: $xdream self-ban protection.
    }
  }
}

on kick {
  set chan [lindex [args] 0]
  set victim [lindex [args] 1]
  set nick [nick]
  set reason [join [lrange [args] 2 end]]
  if {$nick!=[my_nick]} {
    if [info exists kickcount($nick-$chan)] {
      incr kickcount($nick-$chan)
      if {$kickcount($nick-$chan) > 3} {
        if {[abs [expr {[unixtime]-$kicktime($nick-$chan)}]] < 5} {
          showwarning Mass "Masskick from $nick detected"
          if [isop [my_nick] $chan] {
            /kick $chan $nick Masskick detected
          }
        }
      }
    } else {
      set kickcount($nick-$chan) 1
    }
    set kicktime($nick-$chan) [unixtime]
  }

  if {$victim==[my_nick]} {
    showinfo "kicked" "[nick] kicked you from $chan ($reason)"
  } else {
    chaninfo $chan "[color part][lindex [args] 1] has been kicked outta $chan by [nick] ($reason)"
  }
  complete
}

on mode-o {
  set chan [lindex [args] 0]
  set victim [lindex [args] 1]
  set nick [nick]
  if {[nick]!=[my_nick]} {

    if {$nick=="" && $victim==[my_nick]} {
      showwarning [host] "Server deop. Nothing to do"
      return
    }

    if [info exists deopcount($nick-$chan)] {
      incr deopcount($nick-$chan)
      if {$deopcount($nick-$chan) > 3} {
        if {[abs [expr {[unixtime]-$deoptime($nick-$chan)}]] < 5} {
          showwarning Mass "Massdeop from $nick detected"
          if [isop [my_nick] $chan] {
            /kick $chan $nick $xdream Massdeop detected.
          }
        }
      }
    } else {
      set deopcount($nick-$chan) 1
    }
    set deoptime($nick-$chan) [unixtime]

    if {[my_nick]==$victim} {
      opget $chan
    }
  }
}

on "" {
  complete
}

on timer {
  global idle
  incr idle
  if {$awaymins > 0} {
    if {[expr $idle % 60] == 0} {
      if {$idle >= [expr $awaymins*60] && !$isaway} {
        /away $awaymins [plural $awaymins min] auto-away
        if [info exists awaysince] {
          incr awaysince [expr -$awaymins*60]
        }
      }
    }
  }
  if [window exists query \xA0\DCC] /showdcc
  if {([window state main]=="minimize") || ($isaway)} {
    if [info exists flashreason] {
      if {[expr $idle % 2] == 0} {
        window set_title $flashreason main
      } else {
        window set_title $defaultwindowheader main
      }
    }
  } else {
    if [info exists flashreason] {
      unset flashreason
      window set_title $defaultwindowheader main
    }
  }
}

on load {
    global checkversionatstartup

  window set_title $defaultwindowheader main
  load_identbase
  showinfo init "$xdream v$xversion ready"

  if {$checkversionatstartup} {
    /checkversion
    }

  complete
}

on unload {
  if $isaway /back
  save_identbase
  showinfo $xdream Unloaded.
  complete
}

on connect {
  global watchsupported isaway idlesecs
  set watchsupported 0
  set isaway 0
  set idlesecs 0
  showinfo $xdream "connected to [server]"
  set_cookie lastserver [server]
  set tmp [lindex [server] 0]
  if [info exists aexec($tmp)] {
    showinfo AutoExec "AutoExecing: $aexec($tmp)"
    foreach x $aexec($tmp) {
      after 500 $x
    }
  }
  if [info exists ajoin($tmp)] {
    showinfo AutoJoin "Joining: $ajoin($tmp)"
    foreach x $ajoin($tmp) {
      after 500 "/join $x"
    }
  }
  if {[user_count]>0} {
    set niqlist {}
    for {set i 0} {$i<[user_count]} {incr i} {
      if {[get_user $i notify]=="Y"} {
        set mask [get_user $i mask]
        lappend niqlist "+[lindex [split $mask !] 0]"
      }
    }
    if {[llength $niqlist]>0} {
      showinfo AutoWatch "registering notify list as watches."
      /watch [join $niqlist]
    }
  }
}

on disconnect {
  set flashreason "disconnected"
}

on notify {
  if !$watchsupported {
    xbeep
    showinfo Notify "[nick] ([user]@[host]) is on irc"
  }
}

on denotify {
  if !$watchsupported {
    showinfo Notify "[nick] has left irc"
    complete
  }
}

on nick {
  global noticenicks noticewindows
  set niq [arg]
  foreach x [channels] {
    if [ison [nick] $x] {
      chaninfo $x "[color change][nick] is now known as $niq"
    }
  }
  if {$niq==$tryingtogain} {
    showinfo Gain "successfully gained \"$niq\""
    set $tryingtogain ""
  }
  catch {unset IAL([nick])}
  update_ial $niq [user] [host]

  if {[set a [lsearch $noticenicks [nick]]]!=-1} {
        set w [ngetactualwindowname [nick]]
        window set_title "Notice: $niq" query $w
        set noticenicks [lreplace $noticenicks $a $a $niq]
  }

  complete
}

on quit {
  global favoritenick tryingtogain noticenicks noticewindows isaway
  if {[nick]!=[my_nick]} {
    set tmp [string tolower [nick]]
    if {$tryingtogain==$tmp || ($tmp==[string tolower $favoritenick] && $isaway!=1)} {
      /nick [nick]
    }
    catch {unset IAL($tmp)}
  }
  if [string match "(*.*.* *.*.*)" [arg]] {
    set tmp Split
  } else {
    set tmp Quit
  }
  set tmp "[color quit]$tmp: [nick] ([arg])"
  foreach x [channels] {
    if {[ison [nick] $x]} {
      chaninfo $x $tmp
    }
  }
  foreach x [queries [nick]] {
    queryinfo $x $tmp
  }

  if {[lsearch $noticenicks [nick]]!=-1} {
        set noticenicks [nldelete $noticenicks [nick]]
        set noticewindows [nldelete $noticewindows [ngetactualwindowname [nick]]]
  }
  complete
}

on wallops {
  showinfo wallops [arg]
  complete
}

on notice {
  global noticenicks noticewindows
  set msg [turkishtranslate [join [lrange [args] 1 end]]]
  if {$msg==""} {
    complete
    return
  }
  global lastnot lastnotniq lastevent
  set lastnot $msg
  set lastnotniq [nick]
  set lastevent "notice"
  set test [string tolower $msg]
  if [string match "*op/vo*accepting*command*" $msg] {
    set crackppl {}
  } elseif [string match "*accepting*/msg*!*" $msg] {
    set hede [lindex [split $msg] 0]
    lappend crackppl $hede
    showinfo cracks "added $hede to crackppl list"
  }
  if {[nick]=="NickServ"} {
    if {[string match "*nickserv*identify*" $test]} {
      showinfo AutoNick "NickServ password request replied."
      /imsg NickServ identify [getnickpass]
      /NickServ identify [getnickpass]
      complete
      return
    }
  }
  if {[nick]=="ChanServ"} {
    global csaction
    if {[info exists csaction]} {
      eval $csaction
      unset csaction
    }
  }
  if {[nick]==""} {
    if {[string first "type /pass" $test]!=-1} {
      showinfo AutoNick "NickServ password request replied."
      /PASS [getnickpass]
      complete
      return
    }
    if {[host]==""} {
      set test "server"
    } else {
      set test [host]
    }
    if {[string first "*** Notice" $msg]>=0} {
       showinfo servernotice "[color notice][string range $msg 14 end]"
    } else {
      if {$msg==""} { set msg [join [lrange [args] 0 end]] }
      showinfo $test "[color notice]$msg"
    }
    complete
  } else {
        if {[lsearch $noticenicks [nick]]!=-1} {
            set w [ngetactualwindowname [nick]]
            if {[window exists query $w]} {
        set msg [highlightkeys [bkzlaricevir $msg] "query"]
                echo "<[nick]> $msg" query $w
                complete
                return
            } else {
                set noticenicks [nldelete $noticenicks [nick]]
                set noticewindows [nldelete $noticewindows $w]
            }
        }
        set msg [highlightkeys [bkzlaricevir $msg] "notice"]
    echo "[color notice]-[nick]- $msg"
    complete
  }
}

on privmsg {
  update_ial [nick] [user] [host]
  set chan [lindex [args] 0]
  set msg [decrypt [stripcolors [turkishtranslate [join [lrange [args] 1 end]]]]]
  global lastmsg
  set lastmsg $msg

  set test [string toupper $msg]
  if [info exists kicktriggers] {
    foreach i $kicktriggers {
      if {[string first [string toupper [lindex $i 0]] $test]!=-1} {
        /kick $chan [nick] $xdream [lindex $i 1]
        break
      }
    }
  }

  if [info exists replies] {
    foreach x $replies {
      if [string match "*[string toupper [lindex $x 0]]*" $test] {
        set hede [lrange $x 1 end]
        /msg $chan [nick]: [lindex $hede [random 0 [expr [llength $hede]-1]]]
        break
      }
    }
  }

    set highcolor ""

  if [info exists notifytriggers] {
    foreach x $notifytriggers {
      if [string match "*[string toupper [lindex $x 0]]*" $test] {
        set flashreason [lindex $x 1]
                set highcolor [color Highlight]
        break
      }
    }
  }

  set msg [highlightkeys [bkzlaricevir $msg] "channel"]
  set msgcolor [color channel]

  if [info exists notifynick] {
    if {[string tolower $notifynick]=="yes"} {
      if {[string first "[string toupper [my_nick]]" $test]>=0} {
        if $isaway xbeep
        set flashreason "[nick] -> [my_nick]"
                set highcolor [color Highlight]
      }
    }
  }

  if {[string toupper $chan]==[string toupper [my_nick]]} {
    global lastmsgniq lastevent
    set lastmsgniq [nick]
    set lastevent msg
    set qq ""
    foreach x [queries] {
      if {[string toupper $x]==[string toupper [nick]]} {
        set qq $x
      }
    }
    if {$qq==""} {
      if {$usequeries!="yes"} {
        if {$separatemsg!="yes"} {
          echo "$highcolor*[nick]* [color private]$msg"
        } else {
          if ![window exists query \xA0Private] {
            /query \xA0Private
          }
          echo "$highcolor*[nick]* [color private]$msg" query \xA0Private
        }
        complete
      } else {
        /query [nick]
        if {$minimizenewqueries=="yes"} {
          window minimize query [nick]
        }
        echo "$highcolor<[nick]> $msgcolor$msg" query [nick]
        complete
      }
    } else {
      echo "$highcolor<[nick]> $msgcolor$msg" query $qq
      complete
    }
  } else {
    echo "$highcolor<[nick]> $msgcolor$msg" channel $chan
  }
  complete
}

on dcc_create {
  set filename [string tolower [lindex [args] 2]]
  if {[lindex [args] 0]=="SEND"} {
    showinfo DCC "Preparing to send $filename ([lindex [args] 3] bytes) to [lindex [args] 1]"
  } else {
    showinfo DCC "Preparing to receive $filename ([lindex [args] 3] bytes) from [lindex [args] 1]"
  }
  complete
}

on dcc_rename {
  showinfo "DCC" "Renamed [lindex [args] 2] to [lindex [args] 4]"
  complete
}

on dcc_begin {
  set filename [string tolower [lindex [args] 2]]
  if {[lindex [args] 0]=="SEND"} {
    showinfo DCC "Sending $filename to [lindex [args] 1]"
  } else {
    showinfo DCC "Receiving $filename from [lindex [args] 1]"
  }
  complete
}

on dcc_complete {
  set file [lindex [args] 2]
  set mode [lindex [args] 0]
  if {$mode=="SEND"} {
    showinfo DCC "$file has been sent to [lindex [args] 1] successfully. ([lindex [args] 4] k/sec)"
  } else {
    global lastfile
    set lastfile $file
    showinfo DCC "$file has been received from [lindex [args] 1] successfully. ([lindex [args] 4] k/sec) (Press F3 to open last received file)"
  }
  complete
}

on dcc_error {
  set file [lindex [args] 2]
  set mode [lindex [args] 0]
  if {$mode=="SEND"} {
    showerror DCC "Failed to send $file!!"
  } else {
    showerror DCC "Receive of $file aborted!!"
  }
  complete
}

on ctcp {
  global modemescapechar
  if {$massive_shield==1} {
    complete
    return
  }
  set host [host]
  set cmd [string toupper [lindex [args] 1]]
  set params [join [lrange [args] 2 end]]
  if {($cmd!="DCC")&&($cmd!="ACTION")} {
    if {$host!=[my_host]} {
      if {![info exists ctcpcount($host)]} {
        set ctcpcount($host) 1
        after 10000 {unset ctcpcount($host)}
      } else {
        incr ctcpcount($host)
        if {$ctcpcount($host)==5} {
          showwarning CTCP "Flood detected -> [nick]![user]@$host"
          /notice [nick] Flood detected from your host.
          set id [add_user *!*@$host]
          set_user $id ignore private
          unset ctcpcount($host)
          after 20000 [subst {delete_user $id}]
         complete
          return
        }
      }
    }
  }
  update_ial [nick] [user] [host]
  switch "$cmd" {
    "ACTION" {
      return
    }
    "DCC" {
      set params [lindex [args] 2]
      set filename [lindex $params 0]
      foreach tmp $autorejectfiles {
        if [string match *$tmp $filename] {
          /notice [lindex [args] 1] $xdream \"$filename\" automatically rejected.
          complete
          return
        }
      }
      if {[lindex $params 0]=="SEND"} {
        set userip [long2ip [lindex $params 2]]
        if {$userip!=[lindex $IAL([string tolower [nick]]) 1]} {
          showinfo "auto dcc catch" "ip mismatch for [nick] ([host] <-> $userip).. updating real ip address"
          update_ial [nick] [user] $userip
        }
      } else {
        update_ial [nick] [user] [host]
      }
      return
    }
    "TIME" {
      showctcp time [nick] ""
      ctcpreply [nick] TIME [ctime [unixtime]]
    }
    "VERSION" {
      set verindex [random 0 [expr [llength $vers] - 1]]
      if {$verindex==$lastverindex} {
        set verindex [expr {($verindex + 1) % [llength $vers]}]
        set lastverindex $verindex
      }
      set verreply [lindex $vers $verindex]
      showctcp version [nick] "FakeVersion sent: $verreply"
      ctcpreply [nick] version $verreply
    }
    "CLIENTINFO" {
      showctcp clientinfo [nick] "x-dream version information sent"
      ctcpreply [nick] clientinfo "$xdream v$xversion"
    }
    "PAGE" {
      if {$isaway} {
        xbeep
        window focus main
        showinfo Page "[nick] is PAGING YOU!! ($params)"
      } else {
        showinfo Page "Page request from [nick] while you're not away"
      }
    }
    "PING" {
      showinfo ping "[nick] pinged you.. ($params)"
      if {([stricmp $modemescapechar ""]) && ([string match "*$modemescapechar$modemescapechar$modemescapechar*" $params])} {
                showinfo ping "ping string contains modem escape char, sent warning to [nick]";
                ctcpreply [nick] fuck you
                complete
                return
      }
      ctcpreply [nick] PING $params
    }
    default {
      showwarning "ctcp [string tolower $cmd] from [nick]" "[join [lrange [args] 2 end]] (ignored)"
    }
  }
  complete
}

on ctcp_reply {
  set cmd [string toupper [lindex [args] 1]]
  set params [join [lrange [args] 2 end]]
  switch $cmd {
    "PING" {
      if [catch {set tmp [expr [unixtime]-$params]}] {
        showerror pong "invalid ping reply ($params) from [nick]"
      } else {
        catch {showinfo "pong" "[nick]: [formatseconds $tmp]"}
      }
      complete
      return
    }
  }
  showinfo "ctcp [string tolower $cmd] reply from [nick]" "$params"
  complete
}

on pong {
  set params [lindex [args] 1]
  set num 0
  scan $params "%d" num
  if {$num >0} {
    showinfo "server pong" "[formatseconds [expr [unixtime]-$num]]"
    complete
  }
}

#numeric hooks

on 001 {
  showinfo welcome [join [lrange [args] 1 end]]]
  complete
}
on 002 { complete }
on 003 {
  showinfo serverinfo [join [lrange [args] 1 end]]]
  complete
}
on 004 {
  showinfo serverinfo "running software [lindex [args] 2]"
  showinfo serverinfo "supported user modes: [lindex [args] 3]"
  showinfo serverinfo "supported channel modes: [lindex [args] 4]"
  complete
}
on 005 {
  showinfo serverinfo [join [lrange [args] 1 end]]
  complete
}

on 324 {
  set mode [lrange [args] 2 end]
  if {$mode==""} {
    complete
    return
  }
  set tmp [lindex [args] 1]
  if [string match "#*" $tmp] {
    if [window exists channel $tmp] {
      chaninfo $tmp "[color notice]Mode: $mode [chanmodestr [lindex $mode 0]]"
      set x [window get_title channel $tmp]
      set parsestr [parsetopic $x]
      window set_title "$tmp [join $mode] [lindex $parsestr 2]" channel $tmp
    } else {
      showinfo "mode $tmp" "$mode [chanmodestr $mode]"
    }
  } else {
    showinfo "user mode" "$mode [usermodestr $mode]"
  }
  complete
}

on 325 {
  showinfo "whois [lindex [args] 1]" "is an help operator"
  complete
}

on 301 {
  showinfo "away [lindex [args] 1]" "[join [lrange [args] 2 end]]"
  complete
}

on 372 {
  if {$showmotd} {
    showinfo motd [join [lrange [args] 1 end]]
  }
  complete
}

on 376 {
  set showmotd 0
  complete
}

on 375 { complete }
on 305 { complete }
on 306 { complete }

# 251 HeDe :There are 5 users and 8 invisible on 2 servers
# 252 HeDe 7 :operator(s) online
# 253 HeDe 1 :unknown connection(s)
# 254 HeDe 2 :channels formed
# 255 HeDe :I have 5 clients and 1 servers
# 265 HeDe :Current local users: 5  Max: 6
# 266 HeDe :Current global users: 13  Max: 14

on 265 {
  showinfo userstats [join [lrange [args] 1 end]]
  complete
}

on 266 {
  showinfo userstats [join [lrange [args] 1 end]]
  complete
}

#on 251 { complete }
#on 252 { complete }
#on 253 { complete }
#on 254 { complete }
#on 255 { complete }

on 221 {
  set mode [lindex [args] 1]
  showinfo "user mode" "$mode [usermodestr $mode]"
  complete
}

on 216 {
# :irc.aggressor.net 216 eben A AGIS * ayrI bi enforcer olayI . 0 -1
  switch [lindex [args] 1] {
    A { set tmp akill }
    k { set tmp kline }
    default { set tmp [lindex [args] 1] }
  }
  showinfo stats "$tmp for [lindex [args] 3]@[lindex [args] 2] [join [lrange [args] 4 end]]"
  complete
}

on 219 {
  showinfo stats "end of stats [lindex [args] 1] report"
  complete
}

on 328 {
  chaninfo [lindex [args] 1] "[color notice]URL: [join [lrange [args] 2 end]]"
  complete
}

on 600 {
  showinfo Watch "[color nick][lindex [args] 1][color default] ([lindex [args] 2]@[lindex [args] 3]) logged online @ [ctime [lindex [args] 4]]"
  supportwatch
  complete
}

on 601 {
  showinfo Watch "[lindex [args] 1] ([lindex [args] 2]@[lindex [args] 3]) logged offline @ [ctime [lindex [args] 4]]"
  supportwatch
  complete

}

on 604 {
  showinfo Watch "[color nick][lindex [args] 1][color default] ([lindex [args] 2]@[lindex [args] 3]) is online @ [ctime [lindex [args] 4]]"
  supportwatch
  complete
}

on 605 {
#  showinfo Watch "[lindex [args] 1] ([lindex [args] 2]@[lindex [args] 3]) is offline"
  supportwatch
  complete
}

on 603 {
  showinfo Watch "[join [lrange [args] 1 end]]"
  supportwatch
  complete
}

on 607 {
  showinfo Watch "finished."
  supportwatch
  complete
}

on 606 {
  showwarning 606??? "[arg]"
  complete
}

on 391 {
  showinfo servertime [join [lrange [args] 2 end]]
  complete
}

#482 SSG #coders :You're not channel operator
#404 SSG #coders :Cannot send to channel
#474 SSG #coders :Cannot join channel (+b)
#401 SSG hede :No such nick/channel

on 401 {
  set niq [lindex [args] 1]
  showwarning "$niq??" "no such nick/channel"
  if [window exists query $niq] {
    foreach x [queries $niq] {
      queryinfo $x "[color highlight]$niq: no such nick/channel"
    }
  }
  complete
}

on 482 {
  showwarning "access denied" "you do not have ops on [lindex [args] 1]"
  complete
}

on 404 {
  showwarning "banned/moderated" "you are not allowed to talk on [lindex [args] 1]"
  complete
}

on 474 {
  global csaction triedunban
  set chan [lindex [args] 1]
  showwarning "banned" "you're banned from $chan. trying to unban thru ChanServ"
  if {![info exists triedunban($chan)]} {
    set triedunban($chan) 1
    /imsg ChanServ unban $chan
    set csaction "/join $chan"
  }
  complete
}

on 422 {
  showinfo motd "server doesn't have motd"
  complete
}

on 436 {
  showwarning NickConflict "auto-changing nickname"
  /nick [string range [my_nick] 0 5]-[string range [unixtime] [expr [string length [unixtime]] - 2] end]
  complete
}

on 438 {
  showinfo "profane word alert" "[join [lrange [args] 2 end]]"
  complete
}

on 329 {
  set chan [lindex [args] 1]
  if {[lindex [args] 2] < 1000000} {
    showwarning "channel info" "$chan has buggy channel creation date"
  } else {
    showinfo "info $chan" "created on [ctime [lindex [args] 2]]"
  }
  complete
}

on 385 {
  showinfo Oper "You're not an IRC operator anymore."
  complete
}

on 381 {
  showinfo Oper "You're now an IRC operator. woah!"
  complete
}

# no sight of those following:

on 303 {
  showinfo ison [lindex [args] 1]
  complete
}

on 371 {
  showinfo serverinfo [join [lrange [args] 1 end]]
  complete
}

on 316 {
  showwarning 316 [arg]
}

on 352 {
  set nick [lindex [args] 5]
  set user [lindex [args] 2]
  set host [lindex [args] 3]
  update_ial $nick $user $host
  global invisiblewho
  set chn [lindex [args] 1]

  global ircops
  global clones
  lappend clones($host) $nick
  set tmp [lindex [args] 6]
  if {[string first * $tmp]!=-1} { lappend ircops $nick }

  if {![info exists invisiblewho([string tolower [lindex [args] 1])]]} {
    showinfo "who [lindex [args] 1]" "$nick!$user@$host thru [lindex [args] 4] ([whostr [lindex [args] 6]]) [string trimleft [join [lrange [args] 7 end]] :]"
  }
  complete
}

on 315 {
  set chan [lindex [args] 1]
  if [string match "#*" $chan] {
    global clones
    global ircops
    set scanning 0
    foreach tmp [array names clones] {
      if {[llength $clones($tmp)]>1} {
        chaninfo $chan "[color notice]Clones from $tmp: [join $clones($tmp)]"
      }
    }
    if [info exists ircops] {
      chaninfo $chan "[color notice]Ircops: [join $ircops]"
    }
  }
  catch {unset clones}
  catch {unset ircops}
  complete
}

on 310 {
  showinfo "whois [lindex [args] 1]" "A potential motherfucker! (aka admin)"
  complete
}

on 295 {
  showinfo "whois [lindex [args] 1]" "A potential fucker! (aka server master)"
  complete
}

on 311 {
  set nick [lindex [args] 1]
  set user [lindex [args] 2]
  set host [lindex [args] 3]
  update_ial $nick $user $host
  set lastwhoismask "$nick!$user@$host"
  set lastwhoisdescription [join [lrange [args] 4 end]]
  set lastwhoisircop 0
  set tmp [countrycode $host]
  if {$tmp!=""} {
    set tmp "(\x02$tmp\x02)"
  }
  showinfo "whois $nick" "$nick!$user@$host ($lastwhoisdescription) $tmp"
  complete
}

on 312 {
  set lastwhoisserver [lindex [args] 2]
  showinfo "whois [lindex [args] 1]" "via [lindex [args] 2] ([join [lrange [args] 3 end]])"
  complete
}

on 313 {
  set nick [lindex [args] 1]
  set lastwhoisircop 1
  showinfo "whois $nick" "A potential asshole! (aka ircop)"
  complete
}

on 314 {
  set nick [lindex [args] 1]
  showinfo "whowas $nick" "[join [lrange [args] 2 end]]"
  complete
}

on 317 {
  if [catch {showinfo "whois [lindex [args] 1]" "Away since [ctime [lindex [args] 3]]"}] {
    showwarning "whois [lindex [args] 1]" "Erroneus whois/away reply: [arg]"
  }
  complete
}

on 319 {
  showinfo "whois [lindex [args] 1]" "on channels: [join [lrange [args] 2 end]]"
  set lastwhoischannels [lrange [args] 2 end]
  complete
}

on 318 {
# end of WHOIS
  complete
}

on 332 {
  global lasttopic
  set lasttopic([lindex [args] 1]) [join [lrange [args] 2 end]]
  complete
}

on 333 {
  set chan [lindex [args] 1]
  chaninfo $chan "[color notice]Topic: \"$lasttopic($chan)[color notice]\" set by [lindex [args] 2] @ [ctime [lindex [args] 3]]"
  complete
}

on 367 {
  global banclearmode clearbanlist
  if $banclearmode {
    lappend clearbanlist [lindex [args] 2]
  }
  complete
}

on 368 {
  global banclearmode clearbanlist
  if $banclearmode {
    set banclearmode 0
    set count 0
    set tmp {}
    set chan [lindex [args] 1]
    foreach x $clearbanlist {
      incr count
      lappend tmp $x
      if {[expr "$count % 6"]==0} {
        /mode $chan -b-b-b-b-b-b [join $tmp]
        set tmp {}
      }
    }
    if {[llength $tmp]>0} {
      /mode $chan -b-b-b-b-b-b [join $tmp]
    }
  }
  complete
}

on 369 {
  showinfo whowas "end of whowas"
  complete
}

on lookup {
  if {[lindex [args] 1]==""} {
    showwarning DNS "couldn''t resolve [arg]"
  } else {
    set tmp [lindex [args] 0]
    showinfo DNS "$tmp resolved to [lindex [args] 1]"
    if {![validip $tmp]} {
      set x [countrycode $tmp]
    } else {
      set x [countrycode [lindex [args] 1]]
    }
    if {$x!=""} {
      showinfo DNS "origin is $x"
    }
    if [info exists hacking($tmp)] {
      unset hacking($tmp)
      hackip $x [lindex [args] 1]
    }
  }
}

on join {
  set chan [lindex [args] 0]
  global invisiblewho
  if {[nick]!=[my_nick]} {
    set chan [lindex [args] 0]
    set tmp "[countrycode [host]]"
    if {$tmp!=""} {
      set tmp (\x02$tmp\x02)
    }
    chaninfo $chan "[color join]Join: [nick] ([user]@[host]) $tmp"
    update_ial [nick] [user] [host]
    set niq [string tolower [nick]]
    foreach tmp $greetz {
      if {$niq==[string tolower [lindex $tmp 0]]} {
        if {[llength $tmp]<=2} {
          set x 1
        } else {
          set x [random 1 [expr [llength $tmp]-1]]
        }
        /noawmsg $chan \x02\[[nick]\]\x02 [lindex $tmp $x]
        break
      }
    }
    set niq [string tolower [nick]]
    foreach tmp [nicks $chan] {
      set tmp [string tolower [normalizenick $tmp]]
      if {$niq!=$tmp} {
        if [info exists IAL($tmp)] {
          if {[lindex $IAL($tmp) 1]==[host]} {
            showwarning Clone "[nick] is a clone of $tmp."
            break
          }
        }
      }
    }
    if [isop [my_nick] $chan] {
      set mask [string tolower "[nick]![user]@[host]"]
      set alist [get_cookie AutoKickList]
      foreach tmp $alist {
        set umask [string tolower [lindex $tmp 0]]
        if {[string match $umask $mask]} {
          /mode $chan +b $umask
          /kick $chan [nick] [lindex $tmp 1]
          break
        }
      }
    }
  } else {
    catch "unset triedunban($chan)"
  }
  complete
}

on part {
  if {[nick]!=[my_nick]} {
    if {[llength [nicks [arg]]]==1} {
      if {[string first @ [nicks [arg]]]==-1} {
        showinfo AutoGain "Autogaining op on [arg]"
        /rejoin [arg]
      }

    }
    if [info exists repeatcount([nick])] {
      unset repeatcount([nick])
      unset repeattext([nick])
    }
    set partmsg [join [lrange [args] 1 end]]
    if {$partmsg!=""} {
      set partmsg "($partmsg)"
    }
    chaninfo [lindex [args] 0] "[color part]Part: [nick] ([user]@[host]) $partmsg"
  }
  complete
}

on whois {
  update_ial [nick] [user] [host]
}

############################ ############ #### procs

proc checkversionhandler sock {
  global checkversioninprogress xdream xversion
  
  if [eof $sock] {
    showinfo checkversion "reached eof"
    close $sock
    set checkversioninprogress 0
    return
  }
  gets $sock tmp

#  echo "*$tmp*$checkversioninprogress"
  if {$checkversioninprogress==1} {
    if {[string match *200*OK* $tmp]} { # HTTP/1.1 line
#       showerror checkversion "version works."
        set checkversioninprogress 2
    } else {
        showerror checkversion "error retrieving version."
        set checkversioninprogress 0
          close $sock
          return
    }
  } elseif {$checkversioninprogress==2} { # first empty line
    if {$tmp==""} {
        set checkversioninprogress 3
    }
  } elseif {$checkversioninprogress==3} { # data
    if {$tmp==$xversion} {
        showinfo checkversion "You have the most recent $xdream version."
    } else {
        showinfo checkversion "Current $xdream version: $tmp"
        showinfo checkversion "Click to download: http://ssg.sourtimes.org/files/xdream.zip"
    }
      close $sock
    set checkversioninprogress 0
  }
}

proc highlightkeys { msg defcolor } {
global highkeys

set a1 [color Highlight]
set a2 [color $defcolor]

#buggy, sucks even -disq
foreach i $highkeys {
    regsub -all -nocase "($i)" "$msg" "$a1\\1$a2" msg
}

return $msg
}

proc handle_urls { uri } {
    global browser sozlukurl

    if {[string first "mailto://" $uri]==0} {
        exec "start.exe" "mailto:[string range $uri 9 end]" &
        return
    }

    if {[string first "bkz://" $uri]==0} {
        set uri [translate [string range $uri 6 end] "_" "+"]
        if {[string first "/" $uri]>-1} { set uri "$uri#a" }
    set uri "$sozlukurl$uri"
    } elseif {[string first "://" $uri]==0} {
        set uri [translate [string range $uri 3 end] "_" "+"]
    set uri "$sozlukurl$uri"
    } elseif {[string first "//" $uri]==0} { ;# xircon "feature"
        set uri [lindex $uri 0] ;# another xircon "feature"
        set uri [translate [string range $uri 2 end] "_" "+"]
    set uri "$sozlukurl$uri"
    }
    exec "$browser" "$uri" &

    return
}

proc bkzlaricevir { msg } {
global lastbkzhistory

# biri parantezden kapandIktan sonra biti$ik kelime duran bkz'lar icin. -disq
    regsub -all {\(bkz(:|\.) *([A-Za-z0-9 ]+)\) +} "$msg" "(bkz://\\2) " msg
    regsub -all {\(bkz(:|\.) *([A-Za-z0-9 ]+)\)} "$msg" "(bkz://\\2) " msg

#ayet numarasI -disq
    regsub -all {\(bkz(:|\.) *([A-Za-z0-9 ]+)(\/[0-9]+)\)} "$msg" "(bkz://\\2\\3)" msg

#gorunmez bkz -disq
    regsub -all {\`([A-Za-z0-9 ]+)\`} "$msg" "(gbkz://\\1) " msg

    while {[string first "(bkz://" $msg]!=-1} {
    set i [string first "(bkz://" $msg]
    set sub [string range $msg $i end]
    set j [string first ")" $sub]
    if {$j==-1} {set j [expr [string length $i]-1]} else {set j [expr $i+$j]}
        set icsel [string range $msg $i $j]
        set icsel [translate $icsel " " "_"]
        regsub -all {\(bkz://([A-Za-z0-9\_\/]+)\)} "$icsel" "bkz://\\1" icsel
    if {[set ahmet [lsearch $lastbkzhistory $icsel]]>-1} { set lastbkzhistory [lreplace $lastbkzhistory $ahmet $ahmet] }
        lappend lastbkzhistory $icsel
    set msg "[string range $msg 0 [expr $i-1]]$icsel[string range $msg [expr $j+1] end]"
        }
    while {[string first "(gbkz://" $msg]!=-1} {
    set i [string first "(gbkz://" $msg]
    set sub [string range $msg $i end]
    set j [string first ")" $sub]
    if {$j==-1} {set j [expr [string length $i]-1]} else {set j [expr $i+$j]}
        set icsel [string range $msg $i $j]
        set icsel [translate $icsel " " "_"]
        regsub -all {\(gbkz://([A-Za-z0-9\_]+)\)} "$icsel" "://\\1" icsel
    if {[set ahmet [lsearch $lastbkzhistory $icsel]]>-1} { set lastbkzhistory [lreplace $lastbkzhistory $ahmet $ahmet] }
        lappend lastbkzhistory $icsel
    set msg "[string range $msg 0 [expr $i-1]]$icsel[string range $msg [expr $j+1] end]"
        }
    return $msg
}



proc xprompt { title desc default } {
    set a [prompt $title $desc $default]
    if {$a==""} { error "hey hey" }
    return "$a"
}


proc nldelete { list element } {
    set a [lsearch $list $element]
    if {$a==-1} { return $list }

        return [lreplace $list $a $a]
}

proc ngetactualwindowname { niq } {
  global noticenicks noticewindows
  return [lindex $noticewindows [lsearch $noticenicks $niq]]
}

proc ncreatewindowname { niq } {
  global noticewindows

  set a "\xA0Notice_$niq"
  while {[lsearch $noticewindows $a]!=-1} { set a $a."1" }
  return $a
}

proc load_identbase {} {
  global ibfile identbase
  if {![catch {source $ibfile}]} {
    showinfo init "identbase loaded"
  }
}

proc save_identbase {} {
  showinfo "flush" "saving identbase"
  global ibfile identbase
  set myfile [open $ibfile "w"]
  puts $myfile "set identbase \{$identbase\}"
  close $myfile
}

proc getkey where {
  global defaultkey
  if [info exists key($where)] {
    return $key($where)
  } else {
    return $defaultkey
  }
}

proc keyit {str key} {
  set result ""
  for {set x 0} {$x<[string length $str]} {incr x} {
    scan [string index $str $x] "%c" a
    scan [string index $key [expr $x%[string length $key]]] "%c" b
    set c [expr ($a+$b)%256]
    append result [format "%c" $c]
  }
}

proc infowindow {windowname text} {
  if {![window exists \xA0$windowname]} {
    /query \xA0$windowname
  }
  echo $text query \xA0$windowname
}

proc urlencode url {
  regsub -all " " $url "+" temp
  return $temp
}

proc long2ip long {
  set x1 [expr $long % 256]
  set long [expr $long/256]
  set x2 [expr $long % 256]
  set long [expr $long/256]
  set x3 [expr $long % 256]
  set long [expr $long/256]
  set x4 [expr $long % 256]
  return "$x4.$x3.$x2.$x1"
}

proc opget chan {
  global opgetmethod
  if [info exists opgetmethod($chan)] {
    eval $opgetmethod($chan)
  } else {
    /imsg ChanServ OP $chan [my_nick]
  }
}

proc getfilename fullpath {
  if {[string first / $fullpath]!=-1} {
    return [lindex [split $fullpath /] end]
  } else {
    return [lindex [split $fullpath \\] end]
  }
}

proc encsign {} {
  return \xA0
}

proc encrypt str {
  global encsrc encdst
  return "[encsign][translate $str $encsrc $encdst]"
}

proc decrypt str {
  global encsrc encdst
  set i [string first [encsign] $str]
  if {$i==0} {
    return "[color highlight]-o-[color default] [translate [string range $str [incr i] end] $encdst $encsrc]"
  } else {
    return $str
  }
}

proc translate {str src dst} {
  set result ""
  foreach x [split $str {}] {
    set i [string first $x $src]
    if {$i >= 0} {
      set x [string index $dst $i]
    }
    append result $x
  }
  return $result
}

proc stripmarks {str beg end} {
  while {[string first $beg $str]!=-1} {
    set i [string first $beg $str]
    set sub [string range $str $i end]
    set j [string first $end $sub]
    if {$j==-1} {set j [expr [string length $i]-1]} else {set j [expr $i+$j]}
    set str "[string range $str 0 [expr $i-1]][string range $str [expr $j+1] end]"
  }
  return $str
}

proc bgerror msg {
  showerror bgerror $msg
}

proc getwhoisserver {adr} {
  global wis
  set suffix [lindex [split $adr "."] end]
  if [validip $adr] {
    return 192.149.252.21
  } else {
    echo $suffix
    foreach x [array names wis] {
      echo $wis($x)
      if {[lsearch $wis($x) $suffix]!=-1} {
        return $x
      }
    }
  }
  return 193.0.0.200
}

proc stripdomain {adr} {
  if [validip $adr] {
    return $adr
  } else {
    set tmp [split $adr "."]
    return [join [lrange $tmp 1 end] "."]
  }
}

proc supportwatch {} {
  global watchsupported
  set watchsupported 1
}

proc parsetopic {topic} {
  # topic is parsed into a list contains {chan mode topic}
  set topic [split $topic " "]
  set result {}
  if {[string first "\[" [lindex $topic 0]]!=-1} {
    set topic [lrange $topic 1 end]
  }
  lappend result [lindex $topic 0]
  set modestr [lindex $topic 1]
  if {[string first "+" $modestr]==-1} {
    lappend result {}
    set i 1
  } else {
    set i 2
    if {[string first "l" $modestr]!=-1} {incr i}
    if {[string first "k" $modestr]!=-1} {incr i}
    lappend result [join [lrange $topic 1 [expr $i-1]]]
  }
  lappend result [join [lrange $topic $i end]]
  return $result
}

proc hexencode {str} {
  set result ""
  for {set i 0} {$i < [string length $str]} {incr i} {
    set c [string index $str $i]
    if {($c>="0" && $c<="9")||($c>="A" && $c<="Z")||($c>="a" && $c<="z")} {
      append result $c
    } else {
      scan $c "%c" val
      set hex [format "%02X" $val]
      append result %$hex
    }
  }
  return $result
}

proc stripcolors {text} {
  for {set x 0} {$x <= 15} {incr x} {
    regsub -all "\x03$x,$x" $text "\x02" text
  }
  regsub -all "\x03\1" $text [color default] text
  return $text
}

proc strdup {char num} {
  set result ""
  for {set i 0} {$i < $num} {incr i} {
    append result $char
  }
  return $result
}

proc percstr {val max} {
  set i [expr ($val*20)/$max]
  return "[color quit][strdup / $i][color highlight][strdup = [expr 20-$i]]"
}

proc usermodestr mode {
  global umode
  set tmp {}
  for {set x 0} {$x<[string length $mode]} {incr x} {
    set char [string index $mode $x]
    if {$char!="+"} {
      if [info exists umode($char)] {
        lappend tmp "($char/$umode($char))"
      } else {
        lappend tmp "($char/???)"
      }
    }
  }
  return [join $tmp]
}

proc chanmodestr mode {
  global cmode
  set tmp {}
  for {set x 0} {$x<[string length $mode]} {incr x} {
    set char [string index $mode $x]
    if {$char!="+"} {
      if [info exists cmode($char)] {
        lappend tmp "($char/$cmode($char))"
      } else {
        lappend tmp "($char/???)"
      }
    }
  }
  return [join $tmp]
}

proc countrycode adr {
  if [validip $adr] {
    return ""
  }
  global countryshort
  global countrylong
  set suffix [string tolower [lindex [split $adr .] end]]
  set x [lsearch -exact $countryshort $suffix]
  if {$x==-1} {
    return ""
  } else {
    return [lindex $countrylong $x]
  }
}

proc whostr str {
  set tmp ""
  if {[string first "G" $str]!=-1} {
    set tmp away
  }
  if {[string first "*" $str]!=-1} {
    set tmp "$tmp ircop "
  }
  if {[string first "@" $str]!=-1} {
    set tmp "$tmp op"
  }
  if {[string first "+" $str]!=-1} {
    set tmp "$tmp voice"
  }
  if {[string first "%" $str]!=-1} {
    set tmp "$tmp %"
  }
  return [string trim $tmp " "]
}

proc hackip ip {
  showinfo hack "penetrating $ip"
  exec "c:/windows/command/start.exe" "\\\\$ip" &
}

proc formatseconds secs {
  if {$secs==0} {
    return "0 secs"
  }
  set tmp [expr $secs % 60]
  set x ""
  if $tmp {
    set x "$tmp [plural $tmp sec]"
  }
  set secs [expr $secs/60]
  set tmp [expr $secs % 60]
  if $tmp {
    set x "$tmp [plural $tmp min] $x"
  }
  set secs [expr $secs/60]
  set tmp [expr $secs % 24]
  if $tmp {
    set x "$tmp [plural $tmp hour] $x"
  }
  set secs [expr $secs/24]
  set tmp [expr $secs % 30]
  if $tmp {
    set x "$tmp [plural $tmp day] $x"
  }
  set secs [expr $secs/30]
  if $secs {
    set x "$secs [plural $tmp month] $x"
  }
  return $x
}

proc plural { num suf } {
  if {$num==1} {
    return $suf
  } else {
    return ${suf}s
  }
}

proc whoisquery {adr server} {
  global whois_sock
  if [info exists whois_sock] {
    showerror whois "currently querying one"
    complete
    return
  }
  if [catch {set whois_sock [socket -async $server 43]}] {
    showerror whois "connection failed"
    complete
    return
  }
  fconfigure $whois_sock -blocking 0 -buffering line
  puts $whois_sock $adr
  if [catch {flush $whois_sock}] {
    showerror whois "data connection failed"
    close $whois_sock
    unset whois_sock
    complete
    return
  }
  fileevent $whois_sock readable {whoishandler $whois_sock}
  complete
}

proc whoishandler sock {
  if {![window exists query \xA0Whois]} {
    /query \xA0Whois
  }
  if [eof $sock] {
    queryinfo \xA0Whois "end of WHOIS information"
    close $sock
    global whois_sock
    catch {unset whois_sock}
    return
  }
  gets $sock read
  echo $read query \xA0Whois
}

proc xlathandler sock {
  global translating begintranslate translation lasttranslation
  if [eof $sock] {
    showinfo xlat "reached eof"
    close $sock
    set translating 0
    return
  }
  gets $sock tmp
  # echo $tmp
  if {[string match *Error*100* $tmp]} {
    showerror xlat "error retrieving translation."
    close $sock
    set translating 0
    return
  } elseif {[string first "<textarea" $tmp]!=-1} {
    set begintranslate 1
  } elseif $begintranslate {
    if {[string first "</textarea" $tmp]!=-1} {
      set tmp [stripmarks $translation "<" ">"]
      set tmp [stripmarks $tmp "&" ";"]
      set lasttranslation $tmp
      chaninfo [channel] "[color highlight]Translation: [color default]$tmp[color highlight] (press F5 to paste)"
      close $sock
      set begintranslate 0
      set translating 0
    } else {
      set translation "$translation $tmp"
    }
  }
}

proc dicthandler sock {
global dicttranslating dictword lasttranslation

  if [eof $sock] {
    showinfo dict "reached eof"
    close $sock
    set dicttranslating 0
    return
  }
  gets $sock tmp
#  echo $tmp

  if {[string match *Error*100* $tmp]} {
    showerror dict "error retrieving translation."
    close $sock
    set dicttranslating 0
    return
  } elseif {[string match "*$dictword*" $tmp]!=0} {
      set tmp [stripmarks $tmp "<" ">"]
      set tmp [stripmarks $tmp "&" ";"]
      set tmp [string trim $tmp " "]
      set lasttranslation $tmp
      chaninfo [channel] "[color highlight]Translation: [color default]$tmp[color highlight] (press F5 to paste)"
      close $sock
      set dicttranslating 0
  }
}

proc rejectfile file {
  set file [string tolower $file]
  for {set tmp 0} {$tmp < [dcc_count]} {incr tmp} {
    set x [dcc_info $tmp]
    set testfile [string tolower [lindex $x 3]]
    if {[lindex $x 0]=="GET" && [string match *$testfile $file]} {
      dcc_cancel $tmp
    }
  }
}

proc xbeep {} {
  global pagesound
  if [info exists pagesound] {
    if {$pagesound!="beep"} {
      mmplay $pagesound
    } else beep
  } else beep
}

proc validip { ip } {
  return [string match \[0-9\]*.\[0-9\]*.\[0-9\]*.\[0-9\]* $ip]
}

proc cl {num} {
  return "\x03$num"
}

proc showctcp {ctcp nick msg} {
  showinfo "ctcp $ctcp from $nick" $msg
}

proc showinfo {source msg} {
  global infostatus
  set cl "[cl 14]-[cl 15]=[cl 16]"
  set cr "[cl 15]=[cl 14]-[color default]"
  if {$infostatus=="yes"} {
    echo "$cl$source$cr $msg" status
  } else {
    echo "$cl$source$cr $msg"
  }
}

proc queryinfo {nick msg} {
  echo "[cl 14]*[cl 15]*[cl 16]* $msg" query $nick
}

proc chaninfo {channel msg} {
  global isaway
  if $isaway {
    set msg "$msg @ [clock format [unixtime] -format "%H:%M"]"
  }
  echo "[cl 14]*[cl 15]*[cl 16]* $msg" channel $channel
}

proc showusage {msg} {
  echo "[color highlight]Usage: $msg"
}

proc showerror {source msg} {
  showinfo $source "[color error]$msg"
}

proc showwarning {source msg} {
  showinfo $source "[color ctcp]$msg"
}

proc arg {} {
  return [join [args]]
}

proc getconfig {varname} {
  if [info exists $varname] {
    return [string tolower [subst $$varname]]
  } else {
    return ""
  }
}

proc update_ial {nick user host} {
  global IAL
  set entry [list $user $host]
  set IAL([string tolower $nick]) $entry
}

proc stricmp { s1 s2 } {
  return [string compare [string tolower $s1] [string tolower $s2]]
}

proc noidle {} {
  global idle isaway noback awaysince awaysuffix
  set idle 0
  if {$noback==0} {
    if {$isaway} {
      set isaway 0
      set x [string first $awaysuffix [my_nick]]
      if {$x>=0} {
        /nick [string range [my_nick] 0 [expr {$x-1}]]
      }
      set tmp [expr [unixtime]-$awaysince]
      showinfo Away "You're not away anymore. (you were away for [formatseconds $tmp])"
      /quote AWAY
    }
  }
}

proc ctime unixtime {
  return [clock format $unixtime -format "%H:%M %d/%m/%y"]
}

proc unixtime {} {return [clock seconds]}

proc normalizenick {nick} {
  return [string trimleft $nick "@+"]
}

proc ison {nick chan} {
  foreach i [nicks $chan] {
    if ![stricmp $nick [normalizenick $i]] {
      return 1
    }
  }
  return 0
}

alias ctcpreply {
  /quote NOTICE [lindex [args] 0] :\x01[join [lrange [args] 1 end]]\x01
  complete
}

proc ctcp { target cmd } {
  /imsg $target \x01$cmd\x01
}

proc ctcpreply {nick ctcp parms} {
  /quote NOTICE $nick :\x01[string toupper $ctcp] $parms\x01
}

proc print_user {index} {
  set mask [strfix [get_user $index mask] 30]
  if {[get_user $index notify]=="Y"} {
    set notify "(notify) "
  } else {
    set notify ""
  }
  set ignore [string tolower [get_user $index ignore]]
  if {$ignore!=""} {
    set ignore "(ignore $ignore) "
  }
  set op [get_user $index op]
  if {$op!=""} {
    set op "(op $op) "
  }
  set ban [get_user $index ban]
  if {$ban!=""} {
    set ban "(ban $ban) "
  }
  set notes [get_user $index notes]
  if {$notes!=""} {
    set notes "($notes) "
  }
  showinfo UserList "$mask$notify$ignore$op$ban$notes"
}

proc strfix {str length} {
  while {[string length $str]<$length} {
    set str "$str "
  }
  return $str
}

proc getnickpass {} {
  global NickServPassword
  set srv [string tolower [lindex [server] 0]]
  global NickServPassword($srv)
  if [info exists NickServPassword($srv)] {
    return $NickServPassword($srv)
  } elseif [info exists NickServPassword] {
    return $NickServPassword
  } else {
    showwarning "AutoNick" "Your NickServPassword variable is not set"
    return ebeninki
  }
}

proc isop {nick chan} {
  set nick [string toupper $nick]
  foreach tmp [nicks $chan] {
    if {[string toupper $tmp]=="@$nick"} {
      return 1
    }
  }
  return 0
}

proc isop2 {nick chan} {
  set nick [string toupper $nick]
  foreach tmp [nicks $chan] {
    if {[string toupper $tmp]=="@$nick"} {
      return 1
    } elseif {[string toupper $tmp]=="$nick"} {
      return 0
    } elseif {[string toupper $tmp]=="+$nick"} {
      return 0
    }
  }
  return 2
}

proc turkishtranslate {str} {
  global TurkishSource
  global TurkishDest
  set y [string length $str]
  set out ""
  for {set i 0} {$i < $y} {incr i} {
    set c [string index $str $i]
    if {($c!="*")&&($c!="?")} {
      set tmp [lsearch $TurkishSource $c]
      if {$tmp!=-1} {
        set c [lindex $TurkishDest $tmp]
      }
    }
    append out $c
  }
  return $out
}

proc rlist alist {
  return [lindex $alist [random 0 [expr [llength $alist]-1]]]
}

proc abs {num} {
  if {$num<0} {
    return [expr -$num]
  } else {
    return $num
  }
}

proc masscmd {nicks firstchartocheck checkresult cmd} {
  set count 0
  set victims ""
  foreach nick $nicks {
    if {($firstchartocheck!="" && [string first $firstchartocheck $nick]==$checkresult) || $firstchartocheck==""} {
      set nick [normalizenick $nick]
      if {$nick != [my_nick]} {
        lappend victims $nick
        incr count
        if {$count == 6} {
          $cmd [join $victims]
          echo "$cmd [join $victims]"
          set victims ""
          set count 0
        }
      }
    }
  }

  if {$count} { $cmd [join $victims]}
}

# hotkeys

hotkey F11 {
  /debug
  complete
}

hotkey escape {
  if {[string first \xA0 [window name]]>=0} {
    window close [window type] [window name]
    complete
  }
}

hotkey F3 {
  exec explorer $lastfile &
  complete
}

hotkey F12 {
  if {$massive_shield==0} {
    set massive_shield 1
    showinfo Cloak "Massive CTCP protection enabled"
  } else {
    set massive_shield 0
    showinfo Cloak "Massive CTCP protection turned off"
  }
  complete
}

hotkey F5 {
  input set_text [input get_text]$lasttranslation
  input set_sel_start [string length [input get_text]]
  complete
}

hotkey control+I {
  /xlatie $lastmsg
  complete
}

hotkey control+S {
  /xlatse $lastmsg
  complete
}

hotkey control+F {
  /xlatfe $lastmsg
  complete
}

hotkey control+P {
  /xlatpe $lastmsg
  complete
}

hotkey control+D {
  /xlatde $lastmsg
  complete
}

hotkey control+M {
  /clairvoyant
  complete
}

hotkey F6 {
  /away
  complete
}

hotkey Alt+A {
  /away
  complete
}

hotkey Alt+D {
  /dcc
  complete
}

hotkey Alt+1 {
  status_page 0
  complete
}

hotkey Alt+2 {
  status_page 1
  complete
}

hotkey Alt+3 {
  status_page 2
  complete
}

hotkey Alt+4 {
  status_page 3
  complete
}

hotkey Alt+5 {
  status_page 4
  complete
}

hotkey Tab {
  set inputtext [split [input get_text] " "]
  set tmp [lindex $inputtext end]
  global lastevent lastnotniq
  if {$tmp==""} {
    if {$lastmsgniq!=""} {
      set tmp "/msg $lastmsgniq "
      input set_text $tmp
      input set_sel_start [string length [input get_text]]
    }
    complete
    return
  }
  if [string match "#*" $tmp] {
    set alist [channels]
  } elseif [string match "/*" $tmp] {
    set tmp2 [array names help]
    foreach x $tmp2 {
    lappend alist "/$x"
    }
  } else {
    set alist ""
    set xxx "[channel] [channels]"
    foreach x $xxx {
        foreach xx [nicks $x] {
            lappend alist $xx
            }
    }
  }

  foreach x $alist {
    set x [normalizenick $x]
    if {[string first [string tolower "$tmp"] [string tolower $x]]==0} {
      if {[llength $inputtext]>1} { set x " $x" }
      set tmp [expr [llength $inputtext]-2]
      input set_text "[join [lrange $inputtext 0 $tmp]]$x"
      input set_sel_start [string length [input get_text]]
      break
    }
  }
  complete
}


hotkey F7 {
    if {$lastbkzhistory != {}} {
        handle_urls [lindex $lastbkzhistory [expr [llength $lastbkzhistory] - 1]]
    complete
    }
}


hotkey F8 {
    if {$lasturl!=""} {
        exec "$browser" "$lasturl" &
    }
  complete
}


################## ####### #### ## #     menus

set tmp "\[xprompt \"babelfish translation\" \"phrase to translate\" \"\"\]"

menu status "$xdream server menu"
menu status ""
menu status "connect to server" { /server [xprompt "connect" "server" [get_cookie lastserver]] }
menu status "join channel" { catch { /j [xprompt join "channel name" "#coders"] } }
menu status ""
menu status "away" { catch { /away [xprompt "Away" "Away reason" $defaultawaymessage] } }
menu status "back" { /back }
menu status ""
menu status "*global ircop && clone scan" { /scan }
menu status "internic whois query" { catch { /wiq [xprompt "whois query" "hostname" ""] } }
menu status ""
menu status "mp3->play" { catch { /mp3 [xprompt "play a mp3 from $mp3dir" "mp3 name?" ""] } }
menu status "mp3->*play random" { /clairvoyant }
menu status "mp3->"
menu status "mp3->show mp3 list" { /mp3 ? }
menu status ""
menu status "show message of the day" { /motd }
menu status "system information" { /sysinfo }
menu status "show color table" { /showcolors }
menu status "server ping" { /ping }
menu status "user list" { /userlist }
menu status ""
menu status "dcc status" { /dcc }
menu status "halt all dcc transfers" { /kadcc }
menu status ""
menu status "dictionary lookup" { catch { /dict [xprompt "dictionary lookup" "word to search" ""] } }
menu status "babelfish translation->english->spanish" { /xlates [subst $tmp] }
menu status "babelfish translation->english->french" { /xlatef [subst $tmp] }
menu status "babelfish translation->english->deutsch" { /xlated [subst $tmp] }
menu status "babelfish translation->english->italian" { /xlatei [subst $tmp] }
menu status "babelfish translation->english->portuguese" { /xlatep [subst $tmp] }
menu status "babelfish translation->spanish->english" { /xlatse [subst $tmp] }
menu status "babelfish translation->french->english" { /xlatfe [subst $tmp] }
menu status "babelfish translation->deutsch->english" { /xlatde [subst $tmp] }
menu status "babelfish translation->italian->english" { /xlatie [subst $tmp] }
menu status "babelfish translation->portuguese->english" { /xlatpe [subst $tmp] }
menu status ""
menu status "IRCop->unkline" { catch { /unkline [xprompt "unkline" "nick/adress"] } }
menu status "IRCop->Drop->Channel" { catch { /msg chanserv drop [xprompt "Drop channel" "channel name"] } }
menu status "IRCop->Drop->Nickname" { catch { /msg nickserv drop [xprompt "Drop nickname" "nickname"] } }
menu status "IRCop->Forbid channel" { catch { /msg chanserv forbid [xprompt "Forbid channel" "channel name"] } }
menu status "IRCop->Shutdown services" { /msg operserv shutdown }
menu status "IRCop->Akill" { catch { /msg operserv akill add [xprompt "Akill" "Address/nick"] } }
menu status "IRCop->Rakill" { catch { /msg operserv akill del [xprompt "Rakill" "Address/nick"] } }
menu status "IRCop->Globops" { catch { /Globops [xprompt "Globops" "Enter Globops message"] } }
menu status "IRCop->Locops" { catch { /Locops [xprompt "Locops" "Enter Locops Message"] } }
menu status "IRCop->Wallops" { catch { /Wallops [xprompt "Wallops" "Enter Wallops Message"] } }
menu status ""
menu status "edit configuration" { /config }
menu status "refresh configuration" { /refresh }
menu status "run program" { catch { /run [xprompt "run program" "program name" "explorer"] } }
menu status ""
menu status "open raw debug window" { /debug }
menu status "check $xdream version" { /checkversion }
menu status "edit $xdream source" { /es }
menu status "help" { /help }
menu status ""
menu status "disconnect from server" { /quit }

menu channel "$xdream channel menu"
menu channel ""
menu channel "away" { catch { /away [xprompt "Away" "Away reason" $defaultawaymessage] } }
menu channel "back" { /back }
menu channel ""
menu channel "send->notice to chanops (wallops)" { catch { /wallops [arg] [xprompt "wallops [arg]" "message to send" ""] } }
menu channel "send->encrypted message" { catch { /enc [xprompt "send encrypted" "message to send" ""] } }
menu channel "send->message in away mode" { catch { /noawmsg [arg] [xprompt "message in away" "message to send" ""] } }
menu channel "send->reversed message" { catch { /rev [xprompt "send reversed" "message to send" "remal a ma i"] } }
menu channel "send->math calculation" { catch { /calc [xprompt "send calculation result" "expression to calculate" "2+2"] } }
menu channel "chanserv->*info" { /imsg chanserv info [arg] }
menu channel "chanserv->get ops" { /cop }
menu channel "chanserv->get ops (in all channels)" { /opca }
menu channel "chanserv->"
menu channel "chanserv->get password (ircop)" { /imsg chanserv getpass [arg] }
menu channel "chanserv->invite" { catch { /imsg chanserv invite [arg] [xprompt "chanserv invite" "invite whom?" ""] } }
menu channel "chanserv->"
menu channel "chanserv->set->topic" { catch { /imsg chanserv set [arg] topic [xprompt "set topic" "new topic" $kraltopic] } }
menu channel "chanserv->set->mode" { catch { /imsg chanserv set [arg] mlock [xprompt "set mode" "new mode" "+nt"] } }
menu channel "chanserv->set->"
menu channel "chanserv->set->founder" { catch { /imsg chanserv set [arg] founder [xprompt "set founder" "nickname of founder" [my_nick]] } }
menu channel "chanserv->set->successor" { catch { /imsg chanserv set [arg] successor [xprompt "set successor" "nickname of successor" ""] } }
menu channel "chanserv->set->password" { catch { /imsg chanserv set [arg] password [xprompt "set password" "channel password" ""] } }
menu channel "chanserv->set->description" { catch { /imsg chanserv set [arg] desc [xprompt "set description" "channel description" ""] } }
menu channel "chanserv->set->url" { catch { /imsg chanserv set [arg] url [xprompt "set url" "channel url" "http://www.sourtimes.org"] } }
menu channel "chanserv->set->e-mail" { catch { /imsg chanserv set [arg] email [xprompt "set email" "channel email" ""] } }
menu channel "chanserv->set->entry message" { catch { /imsg chanserv set [arg] entrymsg [xprompt "set entrymessage" "entry message" ""] } }
menu channel "chanserv->access list->show" { /imsg chanserv access [arg] list }
menu channel "chanserv->access list->add user" { catch { /imsg chanserv access [arg] add [xprompt "chanserv access add" "nickname" ""] 10 } }
menu channel "chanserv->access list->remove user" { catch { /imsg chanserv access [arg] del [xprompt "chanserv access del" "nickname" ""] } }
menu channel "chanserv->clear->modes" { /imsg chanserv clear [arg] modes }
menu channel "chanserv->clear->bans" { /imsg chanserv clear [arg] bans }
menu channel "chanserv->clear->ops" { /imsg chanserv clear [arg] ops }
menu channel "chanserv->clear->voices" { /imsg chanserv clear [arg] voices }
menu channel "chanserv->clear->users" { /imsg chanserv clear [arg] users }
menu channel "mass->op" { /mop }
menu channel "mass->voice" { /mvoice }
menu channel "mass->"
menu channel "mass->deop!" { /mdeop }
menu channel "clear all bans->*normal" { /caban }
menu channel "clear all bans->thru chanserv" { /imsg chanserv clear [arg] bans }
menu channel "clear last ban" { /clban }
menu channel "change topic" { catch { /topic [xprompt "change topic" "new topic" "$kraltopic"] } }
menu channel "cycle" { /hop }
menu channel ""
menu channel "IRCop->unkline" { catch { /unkline [xprompt "unkline" "nick/adress"] } }
menu channel "IRCop->Drop->Channel" { catch { /msg chanserv drop [xprompt "Drop channel" "channel name"] } }
menu channel "IRCop->Drop->Nickname" { catch { /msg nickserv drop [xprompt "Drop nickname" "nickname"] } }
menu channel "IRCop->Forbid channel" { catch { /msg chanserv forbid [xprompt "Forbid channel" "channel name"] } }
menu channel "IRCop->Shutdown services" { /msg operserv shutdown }
menu channel "IRCop->Akill" { catch { /msg operserv akill add [xprompt "Akill" "Address/nick"] } }
menu channel "IRCop->Rakill" { catch { /msg operserv akill del [xprompt "Rakill" "Address/nick"] } }
menu channel "IRCop->Globops" { catch { /Globops [xprompt "Globops "Enter Globops message"] } }
menu channel "IRCop->Locops" { catch { /Locops [xprompt "Locops" "Enter Locops Message"] } }
menu channel "IRCop->Wallops" { catch { /Wallops [xprompt "Wallops" "Enter Wallops Message"] } }
menu channel ""
menu channel "get ops" { opget [arg] }
menu channel "get ops (in all channels)" { /opca }
menu channel "ircop && clone scan" { /scan }
menu channel "summon user (ircop)" { catch { /summon [xprompt "summon user" "summon whom?" ""] } }
menu channel ""
menu channel "mit dictionary lookup" { catch { /dict [xprompt "dictionary lookup" "word to search" ""] } }
menu channel "babelfish translation->english->spanish" { /xlates [subst $tmp] }
menu channel "babelfish translation->english->french" { /xlatef [subst $tmp] }
menu channel "babelfish translation->english->deutsch" { /xlated [subst $tmp] }
menu channel "babelfish translation->english->italian" { /xlatei [subst $tmp] }
menu channel "babelfish translation->english->portuguese" { /xlatep [subst $tmp] }
menu channel "babelfish translation->spanish->english" { /xlatse [subst $tmp] }
menu channel "babelfish translation->french->english" { /xlatfe [subst $tmp] }
menu channel "babelfish translation->deutsch->english" { /xlatde [subst $tmp] }
menu channel "babelfish translation->italian->english" { /xlatie [subst $tmp] }
menu channel "babelfish translation->portuguese->english" { /xlatpe [subst $tmp] }
menu channel ""
menu channel "clear screen" { /cls }
menu channel "detach private messages" { /detach }
menu channel "#cracks->receive bot list" { /imsg [arg] !msg }
menu channel "#cracks->search cracks" { catch { /search [xprompt "search cracks" "keyword to search" ""] } }
menu channel "#cracks->search serials" { catch { /search [xprompt "search serials" "keyword to search" ""] } }
menu channel ""
menu channel "xtir!" { /xtir }
menu channel "filter kickban!" { catch { /fkb [xprompt "filter kickban" "mask to kickban" "user!ident@host"] } }
menu channel ""
menu channel "edit configuration" { /config }
menu channel "refresh configuration" { /refresh }
menu channel "show $xdream version info" { /sv }
menu channel "open raw debug window" { /debug }
menu channel "help" { /help }
menu channel ""
menu channel "*channel properties" { show_props channel [arg] }

menu query "$xdream query menu"
menu query ""
menu query "send file->dcc" { /dcc send [arg] }
menu query "send file->turbodcc" { /tdcc send [arg] }
menu query ""
menu query "whois" { /imsg whois [arg] }

menu query "nickserv info" { /imsg nickserv info [arg] }
menu query "add to->*notify list" { /notify [arg] }
menu query "add to->auto-op list" { catch { /aop [arg] [xprompt "auto-op user" "auto-op on channels" "*"] } }
menu query "add to->"
menu query "add to->ignore list" { /ignore [arg] }
menu query "add to->autokick list" { catch { /akick add [arg] [xprompt "auto-kick user" "reason" "fuck off"] } }
menu query "remove from->notify/aop/ignore list" { /remove [arg] }
menu query "remove from->"
menu query "remove from->autokick list" { /akick del [arg] }
menu query "ctcp->ping" { catch { /page [arg] [xprompt "page away user" "reason" "alooo"]} }
menu query "ctcp->ping" { /ctcp [arg] ping }
menu query "ctcp->version" { /ctcp [arg] version }
menu query "ctcp->clientinfo" { /ctcp [arg] clientinfo }
menu query "ctcp->finger" { /ctcp [arg] finger }
menu query "ctcp->"
menu query "ctcp->prompt..." { catch { /ctcp [arg] [xprompt "ctcp" "ctcp to send" ""] } }
menu query ""
menu query "selam et(erkege)" {/slm m [arg]}
menu query "selam et(di\$iye)" {/slm f [arg]}
menu query ""
menu query "try netbios hack" { /hack [arg] }
menu query ""
menu query "edit configuration" { /config }
menu query "refresh configuration" { /refresh }
menu query ""
menu query "*minimize query" { window minimize query [arg] }
menu query ""
menu query "close query" { window close query [arg] }

menu users "$xdream user menu"
menu users ""
menu users "*query"  { /query [arg] }
menu users "dcc chat" { /dcc chat [arg] }
menu users "notice query"  { /nquery [arg] }
menu users ""
menu users "send file->dcc" { /dcc send [arg] }
menu users "send file->turbodcc" { /tdcc send [arg] }
menu users ""
menu users "nickserv->*info" { /imsg nickserv info [arg] }
menu users "nickserv->takeover" { if {[arg]!=[my_nick]} {/gain [arg]} else {showwarning gain "your nick is already [my_nick]"} }
menu users "nickserv->getpass (ircop)" { /imsg nickserv getpass [arg] }
menu users "nickserv->why" { /imsg chanserv why [channel] [arg] }
menu users "add to->*notify list" { /notify [arg] }
menu users "add to->auto-op list" { catch { /aop [arg] [xprompt "auto-op user" "auto-op on channels" "*"] } }
menu users "add to->"
menu users "add to->ignore list" { /ignore [arg] }
menu users "add to->autokick list" { catch { /akick add [arg] [xprompt "auto-kick user" "reason" "fuck off"] } }
menu users "remove from->notify/aop/ignore list" { /remove [arg] }
menu users "remove from->"
menu users "remove from->autokick list" { /akick del [arg] }
menu users ""
menu users "whois" { /whois [arg] }
menu users "sozlukten bakayim" {exec $browser "http://sozluk.sourtimes.org/show.asp?t=[arg]"}
menu users "selam et! (erkege)" { /slm m [arg] }
menu users "selam et! (disiye)" { /slm f [arg] }
menu users "lookup hostname" { /dns [arg] }
menu users "internic query" { if [info exists IAL([arg])] { /wiq [lindex $IAL([arg]) 1] } }
menu users "ctcp->ping" { catch { /page [arg] [xprompt "page away user" "reason" "alooo"]} }
menu users "ctcp->ping" { /ctcp [arg] ping }
menu users "ctcp->version" { /ctcp [arg] version }
menu users "ctcp->clientinfo" { /ctcp [arg] clientinfo }
menu users "ctcp->finger" { /ctcp [arg] finger }
menu users "ctcp->"
menu users "ctcp->prompt..." { catch { /ctcp [arg] [xprompt "ctcp" "ctcp to send" ""] } }
menu users ""
menu users "op->*normal" { /op [arg] }
menu users "op->thru chanserv" { /cop [arg] }
menu users "op->thru samode" { /sop [arg] }
menu users "op->in all channels" { /opa [arg] }
menu users "op->in all channels (thru chanserv)" { /opca [arg] }
menu users "deop->*normal"    { /deop [arg] }
menu users "deop->thru chanserv" { /cdeop [arg] }
menu users "deop->thru samode" { /sdeop [arg] }
menu users "deop->in all channels" { /dopa [arg] }
menu users "deop->in all channels (thru chanserv)" { /dopca [arg] }
menu users ""
menu users "voice" { /voice [arg] }
menu users "devoice" { /devoice [arg] }
menu users ""
menu users "try netbios hack" { /hack [arg] }
menu users ""
menu users "kick"   { /k [arg] $xdream }
menu users "ban!"    { /ban [arg] }
menu users "kickban!" { /kb [arg] $xdream }
menu users "kill! (ircop)" { catch { /kill [arg] [xprompt kill "kill reason" "hicbir\$ey guzel olandan daha kotu degildir"] } }
menu users "kline" { /kline [arg] }
menu users "akill" { /msg operserv akill add [arg] }


menu chat "$xdream dcc chat menu"
menu chat ""
menu chat "send file->dcc" { /dcc send [arg] }
menu chat "send file->turbodcc" { /tdcc send [arg] }
menu chat ""
menu chat "whois" { /imsg whois [arg] }
menu chat "nickserv info" { /imsg nickserv info [arg] }
menu chat "add to->*notify list" { /notify [arg] }
menu chat "add to->auto-op list" { catch { /aop [arg] [xprompt "auto-op user" "auto-op on channels" "*"] } }
menu chat "add to->"
menu chat "add to->ignore list" { /ignore [arg] }
menu chat "add to->autokick list" { catch { /akick add [arg] [xprompt "auto-kick user" "reason" "fuck off"] } }
menu chat "remove from->notify/aop/ignore list" { /remove [arg] }
menu chat "remove from->"
menu chat "remove from->autokick list" { /akick del [arg] }
menu chat "ctcp->ping" { catch { /page [arg] [xprompt "page away user" "reason" "alooo"]} }
menu chat "ctcp->ping" { /ctcp [arg] ping }
menu chat "ctcp->version" { /ctcp [arg] version }
menu chat "ctcp->clientinfo" { /ctcp [arg] clientinfo }
menu chat "ctcp->finger" { /ctcp [arg] finger }
menu chat "ctcp->"
menu chat "ctcp->prompt..." { catch { /ctcp [arg] [xprompt "ctcp" "ctcp to send" ""] } }
menu chat ""
menu chat "try netbios hack" { /hack [arg] }
menu chat ""
menu chat "edit configuration" { /config }
menu chat "refresh configuration" { /refresh }
menu chat ""
menu chat "*minimize query" { window minimize query [arg] }
menu chat ""
menu chat "close query" { window close query [arg] }

# help
set help(slm) {
"slm <cinsiyet (m/f)> <nick>"
}
set help(page) {
  "page <nick>"
  "page away user"
  "Pages that nick by doing a /ctcp nick page. Used to wake up people \
  who is away. Only works for whose client/script supports this feature. \
  See also: away, back"
}

set help(tsend) {
  "tsend <nick> \[filename\]"
  "turbodcc send"
  "Sends the filename to the specified nick using TurboDCC protocol. \
  An alias to /tdcc send.
  See also: send"
}

set help(send) {
  "send <nick> \[filename\]"
  "dcc send"
  "Sends the filename to the specified nick using normal DCC protocol. \
  Use this command only if the receiver has no TurboDCC support. \
  See also: tsend"
}

set help(notify) {
  "notify \[-r\] <nick|mask>"
  "add user to notify list"
  "Adds nick or mask to your notify list. If -r parameter is used, \
  specified nick will be removed from your notify list"
}

set help(akick) {
  "akick <add|del|list> <mask> \[reason\]" \
  "add user to autokick list"
  "Used to manage your \x02autokick\x02 lists. \
  See also: kick, k"
}

set help(killdcc) {
  "killdcc <session_index>"
  "kill dcc transfer session"
  "Kills an active DCC transfer session which has the specified \
  session index. The corresponding index of a session can be \
  learned with \x02/showdcc\x02 command.
  See also: showdcc, tsend"
}

set help(showdcc) {
  "showdcc"
  "show active dcc session list"
  "Shows active DCC file transfers in status window. The number at \
  the each transfer represents the session's index which you can \
  use as a parameter for \x02/killdcc\x02 command. You also can use /dcc\
  command instead of showdcc"
  See also: killdcc"
}

set help(rev) {
  "rev <message>"
  "reverse talk"
  "Sends your message to the active channel window REVERSED. In \
  other words, DESREVER wodniw lennahc evitca eht ot egassem ruoy \
  sdneS."
}

set help(dns) {
  "dns <nick|addr>"
  "domain address resolve"
  "Resolves specified nick or address to the opposite mode. IP's \
  are resolved to domain names and domain names are resolved to \
  (guess it) ip's. Further explanation is not needed."
}

set help(scan) {
  "scan"
  "scan channel for ircops & clones"
  "Scans active channel for Clones and IRCOPS. If the command is \
  given in the status window, it scans all \x02non-secret\x02 channels. \
  But this doesn't work for \x02invisible\x02 users."
}

set help(calc) {
  "calc <expression>"
  "calculator"
  "Solves the given mathematical expression and outputs the result \
  \x02directly to channel\x02. So don't calculate your monthly revenue \
  with this."
}

set help(userlist) {
  "userlist"
  "show user list"
  "Shows the XiRCON userlist. (which is maintained on Tools|Users). \
  x-dream uses XiRCON's userlist for ignore and notify lists."
}

set help(remove) {
  "remove <mask>"
  "remove user from ignore/notify/auto list"
  "Removes specified mask from XiRCON userlist. Can be used for any \
  kind of mask (notify, ignore, etc)."
}

set help(aop) {
  "aop <mask>"
  "auto-op user"
  "Adds the mask to your auto-op list. You can remove a mask from \
  list with generic \x02remove\x02 command. (Note: It is not \
  recommended the use of this command. Better use your favorite \
  channel's ChanServ to manipulate auto-ops)"
}

set help(ignore) {
  "ignore <mask|nick> \[all|private|public|none\]"
  "ignore user"
  "Adds <mask> to your ignore list. The mask is ignored for specified \
  type. If none is specified the mask's ignore attribute is cleared. \
  If nothing is specified additional default "all" is used."
}

set help(sysinfo) {
  "sysinfo"
  "show system information"
  "Shows some unuseful system information. The benchmark may take a \
  while. But it's as accurate as the commercial ones :) Thanks to \
  TCL anyway."
}

set help(op) {
  "op <nicks...>"
  "op ppl"
  "Gives channel OPs to nicks."
}

set help(dop) {
  "dop <nicks...>"
  "/deop"
  "Short alias for /deop"
}

set help(deop) {
  "deop <nicks...>"
  "deop ppl"
  "Deops that people."
}

set help(mdop) {
  "mdop"
  "/mdeop"
  "Short alias for /mdeop"
}

set help(mdeop) {
  "mdeop"
  "massdeop"
  "Massive deop. Deops all people in channel except you."
}

set help(mop) {
  "mop"
  "massop"
  "Massive op. Ops all people in channel."
}

set help(showcolors) {
  "showcolors"
  "show color table"
  "Shows color codes to make writing colored strings easier."
}

set help(locktopic) {
  "locktopic <topic>"
  "lock channel topic"
  "Sets the topic of active channel to <topic> and changes to it \
  again whenever  someone else touches it. Also deops who touches \
  the topic to prevent mirror-locks. See also: unlocktopic"
}

set help(unlocktopic) {
  "unlocktopic"
  "unlock channel topic"
  "Unlocks the topic of the active channel if it's locked. \
  See also: locktopic"
}

set help(ping) {
  "ping <nick>"
  "ping user"
  "Pings the nick. Does a /CTCP <nick> PING exactly."
}

set help(amsg) {
  "amsg <msg>"
  "send message to all channels"
  "Sends <msg> to all joined channels."
}

set help(ame) {
  "ame <action>"
  "action to all channels"
  "Actions <action> to all channel windows."
}

set help(hop) {
  "hop \[channel\]"
  "hop to channel"
  "Parts from current channel and joins to <channel>. If channel parameter is omitted, this command is\
  treated as /rejoin command."
}

set help(ver) {
  "ver <nick>"
  "request user's version"
  "Requests the version of the client of <nick>. Does this by \
  sending a /ctcp <nick> version."
}

set help(away) {
  "away <message>"
  "go away"
  "Sets you away. See also: back"
}

set help(back) {
  "back"
  "go back"
  "Returns you from your away condition. See also: away"
}

set help(ct) {
  "ct"
  "change favorite topic"
  "Changes topic to the one specified in your configuration  \
  file as \x02kraltopic\x02."
}

set help(ban) {
  "ban <nick>"
  "ban user"
  "Banishes <nick> from channel. Note: This command doesn't \
  automatically kicks the banned person from channel. To kick \
  him simultaneously use \x02kb\x02 command. See also: k, kb"
}

set help(k) {
  "k <nick> [reason]"
  "kick user"
  "Kicks <nick> out of channel with optionally specified reason.\
  See also: ban, kb"
}

set help(kb) {
  "kb <nick> [reason]"
  "kick+ban user"
  "Banishes <nick> and kicks him out of channel with optional reason.\
  See also: k, ban"
}

set help(rejoin) {
  "rejoin"
  "rejoin channel"
  "Parts from current channel and after a small delay rejoins to it."
}

set help(caban) {
  "caban"
  "clear all bans"
  "Clears all bans set on active channel."
}

set help(clban) {
  "clban"
  "clear last set ban"
  "Clears last set ban."
}

set help(config) {
  "config"
  "edit configuration"
  "Opens your XiRCON editor with x-dream configuration file."
}

set help(gain) {
  "gain <nick>"
  "get your nick back"
  "Sends a GHOST command to NickServ and changes your nick to \
   that. You need your NickServPassword variable set."
}

set help(cop) {
  "cop <nick>"
  "op thru chanserv"
  "Sends an OP message to ChanServ to give <nick> op status."
}

set help(opca) {
  "opca \[nick\]"
  "massive op thru chanserv"
  "Sends an OP message to ChanServ to give nick or yourself op status in all channels."
}

set help(opa) {
  "opa <nicks>"
  "massive op"
  "OPs <nicks> in all channels."
}

set help(dopca) {
  "dopca <nick>"
  "massive deop thru chanserv"
  "Sends an DEOP message to ChanServ to deop nick in all channels."
}

set help(dopa) {
  "dopa <nicks>"
  "massive deop"
  "DEOPs <nicks> in all channels."
}

set help(j) {
  "j [#]channel"
  "join channel"
  "Joins channel... The '#' prefix may be omitted."
}

set help(sv) {
  "sv"
  "show script version"
  "Shows script version to current channel."
}

set help(voice) {
  "voice <nick>"
  "voice user"
  "Gives voice status to the specified user in current channel."
}

set help(wi) {
  "wi <nick>"
  "whois user"
  "Does a /WHOIS on the specified user"
}

set help(clairvoyant) {
  "clairvoyant"
  "random mp3 player"
  "Plays a random mp3 file from your favorite mp3 directory. mp3dir and mp3player variables\
  must be set in $configfile file."
}

set help(mp3) {
  "mp3 <?>|<mp3name>"
  "mp3 player"
  "Plays mp3 matching in your mp3dir directory. If ? parameter given, all mp3 files listed.\
   If no parameters given shows the currently playing mp3 to the channel"
}

set help(hack) {
  "hack <nick>"
  "hack user's disk"
  "Tries to access a remote user's shared disk"
}

set help(xlat) {
  "xlat?? <text>"
  "babelfish"
  "Translates the text using altavista babelfish translator. you have to append source and destination\
  language characters at the end of the command such as /xlatse for spanish to english translation."
}

set help(dict) {
  "dict?? <word>"
  "langtolang dictionary"
  "Looks the word in dictionary. you have to append source and destination\
  language characters at the end of the command such as /dictse for spanish to english translation."
}

set help(detach) {
  "detach"
  "toggle detached private messages"
  "If turned on, private messages are displayed on a separate private message window. This allows you to\
   avoid massive clone message attacks causes to abuse private messages in channel window or auto-create\
   queries."
}

set help(motd) {
  "motd"
  "show motd"
  "shows message of the day"
}

set help(why) {
  "why <nick>"
  "op reason request from chanserv"
  "shows why a user is being opped on #coders"
}

set help(sop) {
  "sop \[nick\]"
  "op thru samode"
  "Ops nick or yourself on a channel with oper command SAMODE"
}

set help(wallops) {
  "wallops <message>"
  "message ops on channel"
  "send message to ops only in channel"
}

set help(id) {
  "id <ident> <explanation>"
  "set identification for ident"
  "sets a permanent identification for an ident"
}

set help(summon) {
  "summon user1 user2 .. usern"
  "forces users to join channel"
  "forces specified user's to join your current channel. uses ircop command FJOIN exists on Conference Room servers"
}

set help(bkz) {
  "bkz"
  "open bkz history window"
  "opens bkz history window (so?)"
}

set help(cdeop) {
  "cdeop user"
  "deop thru chanserv"
  "deops a user via chanserv command so user probably won't see who deopped him"
}

set help(cls) {
  "cls"
  "clear screen"
  "clears current window contents"
}

set help(cmode) {
  "cmode channel mode"
  "set mode thru chanserv"
  "sets channel mode thru chanserv"
}

set help(cs) {
  "cs commands"
  "chanserv alias"
  "equivalent to /msg chanserv commands"
}

set help(csadd) {
  "csadd nick level"
  "easy chanserv add"
  "adds a nick to access list of current channel"
}

set help(csdel) {
  "csdel nick"
  "easy chanserv del"
  "removes a nick from access list of current channel"
}

set help(cslist) {
  "cslist"
  "easy chanserv access list"
  "lists the access list of current channel"
}

set help(ct) {
  "ct"
  "set favorite topic"
  "changes topic to what \$kraltopic var is set"
}

set help(ctcpreply) {
  "ctcpreply target response"
  "send fake ctcp reply"
  "sends a fake ctcpreply to a user"
}

set help(dcc) {
  "dcc \[send|chat\] \[nick\] \[file\]"
  "dcc functions"
  "runs as a regular dcc command. if invoked with no parameters opens a dcc window constantly showing current file transfers in realtime"
}

set help(debug) {
  "debug"
  "open debug window"
  "opens a window that shows all the numeric responses returned from irc server. (used for debugging purposes)"
}

set help(dec) {
  "dec string"
  "decrypt string"
  "decrypts the given string. used only if you missed a line during script loading or so."
}

set help(devoice) {
  "devoice whom"
  "remove voice"
  "remoes voice status of a user"
}

set help(enc) {
  "enc string"
  "encrypt string"
  "encrypts a given string"
}

set help(es) {
  "es"
  "edit source"
  "opens the x-dream source in your favorite text editor"
}

set help(fkb) {
  "fkb mask"
  "filter kickban"
  "kickbans a mask of users (good for clones)"
}

set help(global) {
  "global string"
  "send global notice"
  "sends a global notice thru operserv"
}

set help(help) {
  "help \[alias\]"
  "show help"
  "shows help text on a given command or shows a brief list of commands if no parameters given"
}

set help(imsg) {
  "imsg whom msg"
  "invisible msg (internal)"
  "sends a message which won't display output in screen. just used within internal code"
}

set help(kadcc) {
  "kadcc"
  "kill all dcc"
  "stops all file transfer sessions immediately"
}

set help(lm) {
  "lm"
  "lm"
  "lm"
}

set help(m) {
  "m whom message"
  "/msg"
  "short alias for /msg"
}

set help(ms) {
  "ms command"
  "/memoserv alias"
  "equivalent to /msg memoserv command"
}

set help(mvoice) {
  "mvoice"
  "massive voice"
  "gives voice status to all non-voice people"
}

set help(n) {
  "n target"
  "/notice"
  "short alias for /notice"
}

set help(newuser) {
  "newuser nick ident hede hodo"
  "create a pseudo user in server (oper)"
  "mimics a linked irc server causes the irc server itself to think that a user has entered into irc. can be used to make bots."
}

set help(noawmsg) {
  "noawmsg whom message"
  "sen message without losing away state (mostly internal)"
  "this command allows you to send messages while still keeping yourself away. used by internal commands"
}

set help(nquery) {
  "nquery nick"
  "notice query"
  "opens a notice query window for nick"
}

set help(ns) {
  "ns command"
  "/nickserv"
  "equivalent to /msg nickserv command"
}

set help(order) {
  "order nick rawcmd"
  "order someone to do something (oper)"
  "allows you to force an irc user to do something (can be used in conjunction with /newuser)"
}

set help(raw) {
  "raw rawcmd"
  "execute raw irc server commands (oper)"
  "allows you to do nasty things on an irc server. (do not try at home)"
}

set help(reload) {
  "refresh"
  "reload config file"
  "reloads configuration file so latest changes have effect. (same as /refresh)"
}

set help(refresh) {
  "refresh"
  "reload config file"
  "reloads configuration file so latest changes have effect. (same as /reload)"
}

set help(run) {
  "run command"
  "run command"
  "runs a given win32/dos command"
}

set help(sdeop) {
  "sdeop nick"
  "deop thru services (oper)"
  "deops a user via irc services"
}

set help(search) {
  "search keywords"
  "search crack"
  "searches efnet bots for a particular crack file (must be in proper channel)"
}

set help(serial) {
  "serial keywords"
  "serial crack"
  "searches efnet bots for a particular serial number (must be in proper channel)"
}

set help(set) {
  "set var value"
  "set a tcl variable"
  "sets a tcl variable to another value. allows you to change configuration temporarily without editing the config file"
}

set help(sus) {
  "sus"
  "shut off flash"
  "removes titlebar flashing which occurs when you're away"
}

set help(svskill) {
  "svskill nick reason"
  "kill via services (oper)"
  "kills a user via services and with any quit reason"
}

set help(svsnick) {
  "svsnick nick newnick"
  "change nick of any user (oper)"
  "allows you to change the nick of another irc user"
}

set help(tcl) {
  "tcl expression"
  "run tcl"
  "evaluates the given tcl expression"
}

set help(wiq) {
  "wiq address \[whoisserver\]"
  "whois query"
  "queries a whois database for given address. default is whois.networksolutions.com"
}

set help(wix) {
  "wix target"
  "who is using xdream?"
  "sends a clientinfo query to determine if target is using xdream"
}

set help(xtir) {
  "xtir"
  "silence a channel"
  "exactly kickbans all users in channel who doesn't have op or voice. allows you to protect yourself from any massive clone attacks or any channel desynchs (yuh amma abarttim)"
}

set help(seen) {
  "seen who"
  "/nickserv info"
  "shortcut for /msg nickserv info nick"
}

set help(checkversion) {
  "checkversion"
  "check for new version"
  "checks for new version of x-dream"
}

set missing {}
foreach x $aliases {
  if {![info exists help([string trim $x *])]} {
    lappend missing $x
  }
}
if {$missing!=""} {
  showwarning helpsystem "help info missing for following aliases: [color default][lsort $missing]"
}