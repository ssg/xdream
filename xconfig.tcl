# x-dream configuration file

# set this to your nickserv password if you have one. otherwise
# leave as is.
set NickServPassword "password"

# nickcompletion case: must be "lowercase", "uppercase" or "asis".
set NickCompletionCase "lowercase"

# this is the topic for /ct alias. you may find it unusable.
set kraltopic "Open dusk till dawn."

# default message when /away command run with no parameters.
set defaultawaymessage "i$ guch"

# WAV file for page sound. if you set it to a MIDI file it will
# be played. if you set it to "beep" it will just beep.
set pagesound "beep"

# autogreetz... these are spelled when related nick joins the
# channel.
set greetz {
  {"SSG" "da coder... (SSG of aRtEffECt)"}
}

# these are kick triggers... when someone spits a sentence contains
# the first parameter the person is kicked with the reason given in
# second parameter.
set kicktriggers {
  {"AMIGA SUCKS" "Amiga doesn't suck!"}
  {"CPC SUCKS" "CPC doesn't suck!"}
  {"C64 SUCKS" "C64 doesn't suck!"}
  {"OS/2 RUL" "OS/2 doesn't rule!"} 
  {"WIN95 RUL" "Win95 doesn't rule!"}
}

# these are random version replies. do whatever you want with them.
set vers {
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
}

