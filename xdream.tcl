# <x-dream> - (c) 1997 SSG/aRtEffECt
# ssg@ogu.edu.tr
# http://arteffect.home.ml.org

# this sqript requires at least XiRCON 1.0b4

# refer to "xconfig.tcl" file for user configuration...

# to do's
# - smart identification system
# - prevent privmsg's to be appeared in status window
# - re-code split detection and working "quit" messages...
# - recoding of seen alias... (via nickserv)
# - auto-op gain

set xversion "1.9"

# thanx to Scotch/CLiQUE for the Turkish xlat table

set TurkishSource { "Ü" "ü" "Ç" "Þ" "Ý" "ý" "Ð" "Ö" "ç" "þ" "ð" "ö" }
set TurkishDest   { "?" "u" "C" "$" "i" "I" "G" "O" "c" "$" "g" "o" }

set defaultawaymessage ""
set pagesound ""
set kraltopic ""
set idle 0
set isaway 0
set awaysince 0
set lastprivmsg ""
set skipcompletion 0
set scanning 0
set scanchannel ""
set massive_shield 0
set listing_bans 0
set invisiblectcps {"ACTION" "DCC"}
set xdream "<x-dream>"
set rejoin_channel ""
set noback 0
set lastban ""
set lastbanchannel ""
set tryingtogain ""
set banclearmode 0

# setting user config
source xconfig

# aliases

alias voice {
  /mode [channel] +v [arg]
  complete
}

alias cop {
  /msg ChanServ op [channel] [arg]
  complete
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
  /edit xconfig
  complete
}

alias gain {
  set tryingtogain [string tolower [lindex [args] 0]]
  showinfo "Gain" "Trying to gain nick \"$tryingtogain\""
  /quote PRIVMSG NickServ :ghost $tryingtogain $NickServPassword
  complete
}

alias caban {
  global banclearmode
  set banclearmode 1
  /mode [channel] +b
  complete
}

alias clban {
  if {$lastbanchannel==""} {
    showerror clban No ban(s) made.
  } else {
    /mode $lastbanchannel -b $lastban
  }
  complete
}

alias help {
  set tmp [string tolower [lindex [args] 0]]
  if {$tmp==""} {
    foreach x [lsort -decreasing [array names help]] {
      set tmp "$x $tmp"
    }
    showinfo help "$xdream commands: $tmp"
  } else {
    foreach x [array names help] {
      if {$tmp==$x} {
        showinfo help "Usage: /[lindex $help($x) 0]"
        showinfo help "[lindex $help($x) 1]"
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
      catch {dcc_close [arg]}
    }
  }
  complete
}

alias showdcc {
  if {[dcc_count]==0} {
    showinfo "DCC" "no active transfers."
  } else {
    for {set tmp 0} {$tmp < [dcc_count]} {incr tmp} {
      set x [dcc_info $tmp]
      if {[lindex $x 0]=="SEND"} {
        showinfo "DCC $tmp" "Sending [lindex $x 3] to [lindex $x 2] at [lindex $x 8]k/sec ([expr ([lindex $x 4]*100)/[lindex $x 5]]%)"
      } else {
        showinfo "DCC $tmp" "Receiving [lindex $x 3] from [lindex $x 2] at [lindex $x 8]k/sec ([expr ([lindex $x 4]*100)/[lindex $x 5]]%)"
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
  if {$scanning==1} {
    complete
    return
  } 
  if {[arg]==""} {set scanchannel [channel]} else {set scanchannel [arg]}
  showinfo Scan "scanning $scanchannel..."
  set scanning 1
  /who $scanchannel
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

alias xdream {
  showinfo $xdream "Coded by SSG/ARtEffECt - (c) 1997"
  complete
}

alias remove {
  set mask [lindex [args] 0]
  if {$mask==""} {
    showusage "/remove <mask>"
    complete
    return
  }
  if {[string first "*" $mask]==0} {
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

alias msg {
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

alias server {
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

alias deop {
    /mode [channel] -oooooo [arg]
    complete
}

alias mdeop {
  set count 0
  set victims ""
  foreach nick [nicks [channel] @*] {
    set nick [normalizenick $nick]
    if {$nick != [my_nick]} {
      lappend victims $nick
      incr count
      if {$count == 6} {
        /deop [join $victims]
        set victims ""
        set count 0
      }
    }
  }
  if {$count} {/deop [join $victims]}
  complete
}

alias mop {
  set count 0
  set victims ""
  foreach nick [nicks [channel]] {
    if {![string match @* $nick]} {
      set nick [normalizenick $nick]
      if {$nick != [my_nick]} {
        lappend victims $nick
        incr count
        if {$count == 6} {
          /op [join $victims]
          set victims ""
          set count 0
        }
      }
    }
  }
  if {$count} {/op [join $victims]}
  complete
}

alias cpc464 {
  say "[cl 2,2]ssssssssssssssssssssssssssssssssssssssss"
  say "[cl 8,2] Amstrad 64K Microcomputer  (v1)[cl 2,2]ssssssss"
  say "[cl 2,2]ssssssssssssssssssssssssssssssssssssssss"
  say "[cl 8,2] c1984 Amstrad Consumer Electronics plc[cl 2,2]s"
  say "[cl 8,2]           and Locomotive Software ltd.[cl 2,2]s"
  say "[cl 2,2]ssssssssssssssssssssssssssssssssssssssss"
  say "[cl 8,2] BASIC 1.0[cl 2,2]ssssssssssssssssssssssssssssss"
  say "[cl 2,2]ssssssssssssssssssssssssssssssssssssssss"
  say "[cl 8,2]Ready[cl 2,2]sssssssssssssssssssssssssssssssssss"
  say "[cl 2,8]\
       [cl 2,2]sssssssssssssssssssssssssssssssssssssss"
  say "[cl 2,2]ssssssssssssssssssssssssssssssssssssssss"
  complete
}

alias c64 {
  say "[cl 11,11]ssssssssssssssssssssssssssssssssssssssssssss"
  say "[cl 11,11]ssssssssssssssssssssssssssssssssssssssssssss"
  say "[cl 11,11]ss[cl 11,12]                                        [cl 11,11]ss"
  say "[cl 11,11]ss[cl 11,12]    **** COMMODORE 64 BASIC V2 ****     [cl 11,11]ss"
  say "[cl 11,11]ss[cl 11,12]                                        [cl 11,11]ss"
  say "[cl 11,11]ss[cl 11,12] 64K RAM SYSTEM  38911 BASIC BYTES FREE [cl 11,11]ss"
  say "[cl 11,11]ss[cl 11,12]                                        [cl 11,11]ss"
  say "[cl 11,11]ss[cl 11,12]READY.                                  [cl 11,11]ss"
  say "[cl 11,11]sss[cl 11,12]                                       [cl 11,11]ss"
  say "[cl 11,11]ss[cl 11,12]                                        [cl 11,11]ss"
  say "[cl 11,11]ssssssssssssssssssssssssssssssssssssssssssss"
  say "[cl 11,11]ssssssssssssssssssssssssssssssssssssssssssss"
  complete 
}

alias showcolors {
  set tmp ""
  for {set i 1} {$i <= 16} {incr i} {
    append tmp "[cl $i] $i "
  }
  echo $tmp status
  complete
}

alias editsrc {
  /edit xdream
  complete
}

alias locktopic {
  /topic [arg]
  set topiclock([channel]) "[arg]"
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
  /ctcp [arg] ping
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
    /ctcp $c ACTION [arg]
    echo "[color nick]* [my_nick][color public] [arg]" channel $c
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
  if {[channel]!=""} {  /part [channel] gone to [arg] }
  /join [arg]
  complete
}

alias PRIVMSG {
  noidle
  if {[lindex [args] 0] == [channel] && $skipcompletion == 0 && [string match *: [lindex [args] 1]]} {
    set nick ""
    set niq [string tolower [string trimright [lindex [args] 1] ":"]]
    if {$niq!=""} {
      foreach i [nicks [channel] "*$niq*"] {
        set i [normalizenick $i]
        if [string match "$niq*" [string tolower $i]] {
          set nick $i
          break
        }
      }
    }
    if {$nick != ""} {
      set skipcompletion 1
      set niq [getconfig NickCompletionCase]
      if {$niq=="lowercase"} {
        set nick [string tolower $nick]
      } elseif {$niq=="uppercase"} {
        set nick [string toupper $nick]
      }
      say "$nick: [join [lrange [args] 2 end]]"
      set skipcompletion 0
      complete
    }
  }
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
    /ame is away (\x02$tmp\x02) @ [ctime $awaysince] - Pager is on.
    /quote AWAY :[arg] (away since [ctime $awaysince])
    set isaway 1
  }
  set idle 0
  complete
}

alias back {
  if {!$isaway} {
    showerror Away "You're already awake!"
  } else {
    set aw [expr [unixtime] - $awaysince]
    /ame is back!! - away for [expr $aw / 60] minutes [expr $aw % 60] seconds
    unset awaysince
    set isaway 0
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
  if [info exists IAL([string tolower [arg]])] {
    set tmp $IAL([string tolower [arg]])
    /mode [channel] +b *![lindex $tmp 0]@[lindex $tmp 1]
  }
  complete
}

alias k {
  /quote KICK [channel] [lindex [args] 0] :[join [lrange [args] 1 end]]
  complete
}

alias kb {
  /ban [lindex [args] 0]
  /k [arg]
  complete
}

alias rejoin {
  set rejoin_channel [channel]
  /part $rejoin_channel brb
  complete
}

alias awayprompt {
  /away [prompt "Away" "Away reason" "i$ guch"]
  complete
}

# hooks

on topic {
  if [info exists topiclock([channel])] {
    if {$topiclock([channel])!=[arg] && [nick]!=[my_nick]} {
      /deop [nick]
      /topic $topiclock([channel])
      say "[nick]: topic has been locked."
    }
  }
  chaninfo [lindex [args] 0] "[color mode]Topic: \"[join [lrange [args] 1 end]]\" by [nick]"
  complete
}

on mode {
  set tmp [nick]
  if {$tmp==""} { set tmp [host] }
  chaninfo [lindex [args] 0] "[color mode]Mode \"[join [lrange [args] 1 end]]\" by $tmp"
  complete
}

on mode+b {
  set chan [lindex [args] 0]
  set mask [lindex [args] 1]
  set lastban $mask
  set lastbanchannel $chan
  if [string match $mask [my_nick]![my_user]@[my_host]] {
    if [isop [my_nick] $chan] {
      /mode $chan -ob [nick] $mask
      /noawmsg $chan [nick]: You're getting too much, dude.
    }
  }
}

on kick {
  if {[nick]!=[my_nick]} {
    set chan [lindex [args] 0]
    set nick [nick]

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
      if [info exists opgetmethod($chan)] {
        showinfo AutoGetOp "Trying to get op on $chan"
        eval $opgetmethod($chan)
      }
    }
  }
}

on timer {
  incr idle
  if {[expr $idle % 60] == 0} {
    if {$idle >= 600 && !$isaway} {
      /away 10 min auto-away
    }
    set lastmin [string range [lindex [ctime [unixtime]] 3] 0 4]
  }
}

on load {
  window set_title "XiRCON! $xdream - the script of your dreams! - by SSG/arteffect '97" main
  showinfo $xdream loaded.
  complete
}

on unload {
  if $isaway /back
  showinfo $xdream Unloaded.
  complete
}

on connect {
  showinfo $xdream "connected to [server]"
  set_cookie lastserver [server]
  set IAL() ""
  /mode [my_nick] +i
}

on notify {
  if [info exists pagesound] {
    if {[string tolower $pagesound]=="beep"} {
      beep
    } else {
      mmplay $pagesound
    }
  } else {
    beep
  }
  showinfo Notify "[nick] ([user]@[host]) is on irc"
}

on denotify {
  showinfo Notify "[nick] has left irc"
  complete
}

on nick {
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
  complete
}

on quit {
  if {[nick]!=[my_nick]} {
    set tmp [string tolower [nick]]
    if {$tryingtogain==$tmp} {      
      /nick [nick]
    }
    catch {unset IAL($tmp)}
  }
}

on notice {
  set msg [turkishtranslate [join [lrange [args] 1 end]]]
  set test [string tolower $msg]
  if {[nick]=="NickServ"} {
    if {[string first "/msg nickserv identify" $test]!=-1} {
      showinfo AutoNick "NickServ password request replied."
      /quote PRIVMSG NickServ :identify $NickServPassword
      complete
      return
    }
  }
  if {[nick]==""} {
    if {[string first "type /pass" $test]!=-1} {
      showinfo AutoNick "NickServ password request replied."
      /PASS $NickServPassword
      complete
      return
    }
    if {[host]==""} {
      set test "server"
    } else {
      set test [host]
    }
    showinfo $test $msg
    complete
  } else {
    echo "[color notice]-[nick]- $msg"
    complete
  }
}

on privmsg {
  update_ial [nick] [user] [host]
  set msg [turkishtranslate [join [lrange [args] 1 end]]]
  
  set test [string toupper $msg]
  foreach i $kicktriggers {
    if {[string first [lindex $i 0] $test]!=-1} {
      /k [nick] $xdream [lindex $i 1]
      break
    }
  }
  
  set chan [lindex [args] 0]
  if {$chan==[my_nick]} {
    set temp [lindex [queries [nick]] 0]
    if {$temp==""} {
      echo "*[nick]* [color private]$msg"
      complete
    } else {
      echo "<[nick]> $msg" query $temp
      complete
    }
  } else {
    echo "<[nick]> $msg" channel $chan
    if [info exists repeatcount([nick])] {
      if {$repeattext([nick])==$msg} {
        incr repeatcount([nick])
        if {$repeatcount([nick]) > 3} {
          if [isop [nick] $chan] {
            /kick $chan [nick] $xdream Repeat flood.
            showinfo AutoKick "Kicked [nick] outta $chan due to repeat flood."
            unset repeatcount([nick])
            unset repeattext([nick])
          }
        }
      } else {
        set repeattext([nick]) $msg
        set repeatcount([nick]) 1
      }
    } else {
      set repeattext([nick]) $msg
      set repeatcount([nick]) 1
    }
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
    showinfo DCC "$file has been received from [lindex [args] 1] successfully. ([lindex [args] 4] k/sec)"
    /notice [lindex [args] 1] $file has been received successfuly. Thanks.
  }
  complete
}

on dcc_error {
  set file [lindex [args] 2]
  set mode [lindex [args] 0]
  if {$mode=="SEND"} {
    showerror DCC "Failed to send $file!!"
    /notice [lindex [args] 1] Sending of $file aborted.
  } else {
    showerror DCC "Receive of $file aborted!!"
    /notice [lindex [args] 1] Receive of $file aborted.
  }
  complete
}

on ctcp {
  if {$massive_shield==1} {
    complete
    return
  }
  set host [host]
  set cmd [string toupper [lindex [args] 1]]
  if {$cmd!="DCC"} {
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
  if {[lsearch -exact $invisiblectcps "$cmd"] == -1} {
    showinfo "[string tolower $cmd] [nick]" [join [lrange [args] 2 end]]
  }
  switch "$cmd" {
    "VERSION" {
      set verreply [lindex $vers [random 0 [expr [llength $vers] - 1]]]
      showinfo FakeVersion "sent: $verreply"
      ctcpreply nick version $verreply
      complete
    }
    "CLIENTINFO" {
      ctcpreply nick clientinfo "$xdream v$xversion .. (c) SSG '97"
      complete
    }
    "PAGE" {
      mmplay $pagesound
      showinfo Page "[nick] is PAGING YOU!!"
      /query [nick]
      complete
    }
    "PING" {
      ctcpreply nick ping [lindex [args] 2]
      complete
    }
  }
}

on ctcp_reply {
  set cmd [string toupper [lindex [args] 1]]
  set params [join [lrange [args] 2 end]]
  switch $cmd {
    "PING" {      
      catch {showinfo "pong [nick]" "[expr {[unixtime]-$params}] sec(s)"}
      complete
    }
    default {
      showinfo "[string tolower $cmd] reply [nick]" "$params"
      complete
    }
  }
}

#numeric hooks

on 001 { complete }
on 002 { complete }
on 003 { complete }
on 004 { complete }
on 005 { complete }
on 376 { complete }
on 375 { complete }
on 372 { complete }
on 305 { complete }
on 306 { complete }
on 251 { complete }
on 252 { complete }
on 253 { complete }
on 254 { complete }
on 255 { complete }

on 436 {
  showwarning NickConflict "auto-changing nickname"
  /nick [string range [my_nick] 0 5]-[string range [unixtime] [expr [string length [unixtime]] - 2] end]
  complete
}

on 329 {
  showinfo "channel info" "[lindex [args] 1] was created on [clock format [lindex [args] 2]]"
  showinfo "channel info" "[llength [nicks $chan]] users on $chan"
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
  showwarning 371 [arg]
}

on 316 {
  showwarning 316 [arg]
}

on 352 {
  set nick [lindex [args] 5]
  set user [lindex [args] 2]
  set host [lindex [args] 3]
  update_ial $nick $user $host
  set chn [lindex [args] 1]
  if {$scanning==1} {
    global ircops
    global clones
    lappend clones($host) $nick
    set tmp [lindex [args] 6]
    if {[string first * $tmp]!=-1} { lappend ircops $nick }
    complete
  }
  if [info exists invisiblewho([lindex [args] 1])] {
    complete
  }
}

on 315 {
  if {$scanning==1} {
    global clones
    global ircops
    set scanning 0
    foreach tmp [array names clones] {
      if {[llength $clones($tmp)]>1} {
        showwarning Scan "Clones from $tmp: [join $clones($tmp)]"      
      }
    }
    if [info exists ircops] {
      showinfo Scan "Ircops: [join $ircops]"
    }
    unset clones
    catch {unset ircops}
    showinfo Scan "scan complete"
    complete
  }
  if [info exists invisiblewho([lindex [args] 1])] {
    unset invisiblewho([lindex [args] 1])
    complete
  }
}

on 311 {
  set lastwhoismask "[lindex [args] 1]![lindex [args] 2]"
  set lastwhoisdescription [join [lrange [args] 4 end]]
  set lastwhoisircop 0
  showinfo "whois [lindex [args] 1]" "[lindex [args] 1]![lindex [args] 2]@[lindex [args] 3] ([join [lrange [args] 4 end]])" 
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
  showinfo "whois [lindex [args] 1]" "Away since [clock format [lindex [args] 3]]"
  complete
}

on 319 {
  showinfo "whois [lindex [args] 1]" "on channels: [join [lrange [args] 2 end]]"
  set lastwhoischannels [lrange [args] 2 end]
  complete
}

on 318 {
# end of whois event
  
  complete
}

on 332 {
  showinfo "topic [lindex [args] 1]" "[lrange [args] 2 end]"
  complete
}

on 333 {
  showinfo "topic [lindex [args] 1]" "set by [lindex [args] 2] @ [clock format [lindex [args] 3]]"
  complete
}

on 367 {
  if {$banclearmode==1} {
    /mode [lindex [args] 1] -b [lindex [args] 2]
  }
  complete
}

on 368 {
  set banclearmode 0
  complete
}

on lookup {
  if {[lindex [args] 1]==""} {
    showwarning DNS "couldn''t resolve [arg]"
  } else {
    showinfo DNS "[lindex [args] 0] resolved to [lindex [args] 1]"
  }
}

on join {
  set chan [lindex [args] 0]
  if {[nick]==[my_nick]} {
    if [info exists opgetmethod($chan)] {
      eval $opgetmethod($chan)
    }
#     set invisiblewho($chan) 1
#    /who $chan
  } else {
    set chan [lindex [args] 0]
    chaninfo $chan "[color join]Join: [nick] ([user]@[host])"
    update_ial [nick] [user] [host]
    set niq [string tolower [nick]]
    foreach tmp $greetz {
      if {$niq==[string tolower [lindex $tmp 0]]} {
        /noawmsg $chan \x02\[[nick]\]\x02 [lindex $tmp 1]
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
  }
  complete
}

on part {
  if {[nick]!=[my_nick]} {
    if {[llength [nicks [arg]]]==1} {
      if {![string match @* [nicks [arg]]]} {
        showinfo AutoGain "Autogaining op on [arg]"
        /rejoin [arg]
      }
    }
    if [info exists repeatcount([nick])] {
      unset repeatcount([nick])
      unset repeattext([nick])
    }
    chaninfo [lindex [args] 0] "[color part]Part: [nick] ([user]@[host])"
  } else {
    if {$rejoin_channel==[arg]} {
      showinfo "Rejoin" "Rejoining [arg]"
      set rejoin_channel ""
      after 3000 {/join [arg]}
    }
  }
  complete
}

on whois {
  update_ial [nick] [user] [host]
}

#procs

proc cl {num} {
  return "\x03$num"
}

proc showinfo {source msg} {
  echo "[cl 14]<[cl 16]$source[cl 14]> [cl 15]$msg" status
}

proc chaninfo {channel msg} {
  echo "[cl 14]*[cl 15]*[cl 16]* $msg" channel $channel
}

proc showusage {msg} {
  showinfo Usage $msg
}

proc showerror {source msg} {
  showinfo $source "[color error]$msg"
}

proc showwarning {source msg} {
  showinfo $source "[cl 8]$msg"
}

proc arg {} {
  return [join [args]]
}

proc getconfig {varname} {
  if [info exists $varname] {
    return [string tolower [subst $$varname]] 
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
  global idle
  global isaway
  global noback
  set idle 0
  if {$noback==0} {
    if {$isaway} {
      set isaway 0
      showinfo Away "You're not away anymore."
      /quote AWAY
    }
  }
}

proc ctime unixtime {return [clock format $unixtime]}

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

proc ctcpreply {nick ctcp parms} {
  /quote NOTICE [$nick] :\x01[string toupper $ctcp] $parms\x01
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

proc isop {nick chan} {
  set nick [string toupper $nick]
  foreach tmp [nicks $chan] {
    if {[string toupper $tmp]=="@$nick"} {
      return 1
    }
  }
  return 0
}

proc turkishtranslate {str} {
  global TurkishSource
  global TurkishDest
  set y [string length $str]
  set out ""
  for {set i 0} {$i < $y} {incr i} {
    set c [string index $str $i]
    set tmp [lsearch $TurkishSource $c]
    if {$tmp!=-1} {
      set c [lindex $TurkishDest $tmp]
    }
    append out $c
  }
  return $out
}

proc show_logo {} {
  for {set tmp 0} {$tmp<25} {incr tmp} {echo " " status}
  echo "[cl 16]ßÜ Üß     ßßßßÜ Üßßßß Üßßßß    ÜÛ ÜßÜßÜ" status
  echo "[cl 15] ÜßÜ  ßßß Û   Û Û     Ûßßß   Üß Û Û Û Û" status
  echo "[cl 14]ß   ß     ßßßß  ß      ßßßß ß  ßß ß ß ß" status
}

proc abs {num} {
  if {$num<0} {
    return [expr -$num]
  } else {
    return $num
  }
}

# hotkeys

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

#menus

menu status "&Connect to server" { /server [get_cookie lastserver] }
menu status ""
menu status "&Away"          { /awayprompt }
menu status "&Back"          { /back }
menu status ""
menu status "*&Global IRCOP && clone scan" { /scan }
menu status ""
menu status "&System information" { /sysinfo }
menu status "&User list" { /userlist }
menu status ""
menu status "&Disconnect from server" { /quit TERMINATED }

menu channel "&Away" { /awayprompt }
menu channel "&Back" { /back }
menu channel ""
menu channel "Scan &channel" { /scan }
menu channel ""
menu channel "MASSDEOP!" { /mdeop }
menu channel ""
menu channel "*&Properties" { show_props channel [arg] }

menu users "*&Whois"   { /whois [arg] }
menu users "DCC &Send" { /dcc send [arg] }
menu users "&TurboDCC Send" { /tdcc send [arg] }
menu users "&Ping"    { /ctcp [arg] ping }
menu users "&Version" { /ctcp [arg] version }
menu users ""
menu users "DCC &Chat" { /dcc chat [arg] }
menu users "*&Query"  { /query [arg] }
menu users ""
menu users "&Op"      { /op [arg] }
menu users "&Deop"    { /deop [arg] }
menu users ""
menu users "&Kick!"   { /k [arg] $xdream }
menu users "&Ban!"    { /ban [arg] }
menu users "&Kickban!" { /kb [arg] $xdream }

# help

set help(page) {
  "page <nick>"
  "Pages that nick by doing a /ctcp nick page. Used to wake up people \
  who is away. Only works for whose client/script supports this feature. \
  See also: away, back"
}

set help(tsend) {
  "tsend <nick> \[filename\]"
  "Sends the filename to the specified nick using TurboDCC protocol. \
  An alias to /tdcc send.
  See also: send"
}

set help(send) {
  "send <nick> \[filename\]"
  "Sends the filename to the specified nick using normal DCC protocol. \
  Use this command only if the receiver has no TurboDCC support. \
  See also: tsend"
}

set help(notify) {
  "notify \[-r\] <nick|mask>"
  "Adds nick or mask to your notify list. If -r parameter is used, \
  specified nick will be removed from your notify list"
}

set help(akick) {
  "akick <add|del|list> <mask> \[reason\]" \
  "Used to manage your \x02autokick\x02 lists. \
  See also: kick, k"
}

set help(killdcc) {
  "killdcc <session_index>"
  "Kills an active DCC transfer session which has the specified \
  session index. The corresponding index of a session can be \
  learned with \x02/showdcc\x02 command.
  See also: showdcc, tsend"
}

set help(showdcc) {
  "showdcc"
  "Shows active DCC file transfers in status window. The number at \
  the each transfer represents the session's index which you can \
  use as a parameter for \x02/killdcc\x02 command.
  See also: killdcc"
}

set help(rev) {
  "rev <message>"
  "Sends your message to the active channel window REVERSED. In \
  other words, DESREVER wodniw lennahc evitca eht ot egassem ruoy \
  sdneS."
}

set help(dns) {
  "dns <nick|addr>"
  "Resolves specified nick or address to the opposite mode. IP's \
  are resolved to domain names and domain names are resolved to \
  (guess it) ip's. Further explanation is not needed."
}

set help(scan) {
  "scan"
  "Scans active channel for Clones and IRCOPS. If the command is \
  given in the status window, it scans all \x02non-secret\x02 channels. \
  But this doesn't work for \x02invisible\x02 users."
}

set help(calc) {
  "calc <expression>"
  "Solves the given mathematical expression and outputs the result \
  \x02directly to channel\x02. So don't calculate your monthly revenue \
  with this."
}

set help(userlist) {
  "userlist"
  "Shows the XiRCON userlist. (which is maintained on Tools|Users). \
  x-dream uses XiRCON's userlist for ignore and notify lists."
}

set help(xdream) {
  "xdream"
  "Shows the script version and who did it. :)"
}

set help(remove) {
  "remove <mask>"
  "Removes specified mask from XiRCON userlist. Can be used for any \
  kind of mask (notify, ignore, etc)."
}

set help(aop) {
  "aop <mask>"
  "Adds the mask to your auto-op list. You can remove a mask from \
  list with generic \x02remove\x02 command. (Note: It is not \
  recommended the use of this command. Better use your favorite \
  channel's ChanServ to manipulate auto-ops)"
}

set help(ignore) {
  "ignore <mask> \[all|private|public|none\]"
  "Adds <mask> to your ignore list. The mask is ignored for specified \
  type. If none is specified the mask's ignore attribute is cleared. \
  If nothing is specified additional default "all" is used."
}

set help(sysinfo) {
  "sysinfo"
  "Shows some unuseful system information. The benchmark may take a \
  while. But it's as accurate as the commercial ones :) Thanks to \
  TCL anyway."
}

set help(op) {
  "op <nicks...>"
  "Gives channel OPs to nicks."
}

set help(deop) {
  "deop <nicks...>"
  "Deops that people."
}

set help(mdeop) {
  "mdeop"
  "Massive deop. Deops all people in channel except you."
}

set help(mop) {
  "mop"
  "Massive op. Ops all people in channel."
}

set help(cpc464) {
  "cpc464"
  "Outputs a CPC464 opening screen to active channel. Don't do this \
  unless you know all of the ops :)"
}

set help(c64) {
  "c64"
  "Outputs a C64 opening screen to active channel. Don't try this on \
  flood protected channels :)"
}

set help(showcolors) {
  "showcolors"
  "Shows color codes to make writing colored strings easier."
}

set help(locktopic) {
  "locktopic <topic>"
  "Sets the topic of active channel to <topic> and changes to it \
  again whenever  someone else touches it. Also deops who touches \
  the topic to prevent mirror-locks. See also: unlocktopic"
}

set help(unlocktopic) {
  "unlocktopic"
  "Unlocks the topic of the active channel if it's locked. \
  See also: locktopic"
}

set help(ping) {
  "ping <nick>"
  "Pings the nick. Does a /CTCP <nick> PING exactly."
}

set help(amsg) {
  "amsg <msg>"
  "Sends <msg> to all channel windows."
}

set help(ame) {
  "ame <action>"
  "Actions <action> to all channel windows."
}

set help(hop) {
  "hop <channel>"
  "Parts from current channel and joins to <channel>"
}

set help(ver) {
  "ver <nick>"
  "Requests the version of the client of <nick>. Does this by \
  sending a /ctcp <nick> version."
}

set help(away) {
  "away <message>"
  "Sets you away. See also: back"
}

set help(back) {
  "back"
  "Returns you from your away condition. See also: away"
}

set help(ct) {
  "ct"
  "Changes topic to the one specified in your configuration  \
  file as \x02kraltopic\x02."
}

set help(ban) {
  "ban <nick>"
  "Banishes <nick> from channel. Note: This command doesn't \
  automatically kicks the banned person from channel. To kick \
  him simultaneously use \x02kb\x02 command. See also: k, kb"
}

set help(k) {
  "k <nick> [reason]"
  "Kicks <nick> out of channel with optionally specified reason.\
  See also: ban, kb"
}

set help(kb) {
  "kb <nick> [reason]"
  "Banishes <nick> and kicks him out of channel with optional reason.\
  See also: k, ban"
}

set help(rejoin) {
  "rejoin"
  "Parts from current channel and after a small delay rejoins to it."
}

set help(caban) {
  "caban"
  "Clears all bans set on active channel."
}

set help(clban) {
  "clban"
  "Clears last set ban."
}

set help(config) {
  "config"
  "Opens your XiRCON editor with $xdream configuration file."
}

set help(gain) {
  "gain <nick>"
  "Sends a GHOST command to NickServ and changes your nick to \
   that. You need your NickServPassword variable set."
}

set help(cop) {
  "cop <nick>"
  "Sends an OP message to ChanServ to give <nick> op status."
}

set help(j) {
  "j [#]channel"
  "Joins channel... The '#' prefix may be omitted."
}

set help(voice) {
  "voice <nick>"
  "Gives voice status to the specified user in current channel."
}

show_logo
