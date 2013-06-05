class motd {
 File { owner => 0, group => 0, mode => 0644 }

 file { "/etc/motd":

   content => "[1m[36m
                            ?ZZZ
                           ZZZZZZ
                          ZZZZ7ZZ?
                         ZZZZ ?ZZI  ?ZZZ?
               ZZ$       ZZZ  ZZZ, ZZZZZZ7
               ZZZ      +ZZ7  ZZZ ZZZZ ZZZ
         ZZ    ZZZ$     ZZZ  ZZZI~ZZZ  ZZZ
        ZZZ~   ZZZZ =$  ZZZ ?ZZZ ZZZ,  ZZZ
        ZZZ    ZZZZ ZZZ ZZZ=ZZZ  ZZZ  :ZZZ
   ,ZZ7 ZZZ    ZZZZ :7  ZZZZZZ: ,ZZZ  ZZZ:   IZZZZ     _ZZZZ+     IZZ$
   ~ZZZ ZZZ    ZZZ$     ZZZZZ   :ZZZ +ZZZ  :ZZZZZZZ   ZZZZZZZ$  ?ZZZZZZ
        ZZZ=   ZZZ=~ZZ~ZZZZZ     ZZZ ZZZ   ZZZ~ ZZZ=  ZZZ  ZZZ  ZZZ ZZZ
    ZZZ 7ZZZ   ZZZ ZZZ7+ZZZZ     ZZZZZZ,  ZZZ   ZZZ   ZZZ   II +ZZZZZZ,
   ~ZZZ  ZZZ  _ZZZ ZZZI  ZZZ$    7ZZZZ,  ZZZZ  ,ZZZ   ZZZZ    ~ZZZZZ7     ZZ,
   ,ZZZ  ZZZZZZZZ  ZZZI   ZZZZ_ZZZZZZZ?=ZZZZZ$ ZZZZ$   ZZZZ ZZZZZZZ+   :ZZZ?
    ZZZ   ZZZZZZ+  =ZZ~    ZZZZZZZZZZZZZZZZZZZZZZZZZZZ? ZZZZZZZ: ZZZZZZZZZ
     =     IZZZ     :+      ~ZZZ+    ZZZ$   ~ZZZ   II :ZZZZZZ      IZZ\$:
                                                    :ZZZZZZZZ+
                                                   ZZZZ$  7ZZZ
                                                  _ZZZ     ZZZZ
                                                  ZZZ       ZZZ
                                                  ZZZ       ZZZ
                                                  ZZZ      ~ZZZ
                                                  ZZZZ    IZZZ?
                                                   ZZZZZZZZZZZ
                                                    ZZZZZZZZ[32m
                                                                                
Welcome to an iVillage VM managed by Vagrant, VirtualBox, and Puppet.[0m\n\n"
  }
}
