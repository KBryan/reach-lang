#lang ll
parts {
  "A" = interact {
    commits = T_Fun [] T_Null,
    endsWith = T_Fun [T_Bytes] T_Null,
    getHand = T_Fun [] T_Bytes,
    getParams = T_Fun [] (T_Tuple [T_UInt256,T_UInt256]),
    partnerIs = T_Fun [T_Address] T_Null,
    random = T_Fun [] T_UInt256,
    reveals = T_Fun [T_Bytes] T_Null},
  "B" = interact {
    acceptParams = T_Fun [T_UInt256,T_UInt256] T_Null,
    endsWith = T_Fun [T_Bytes] T_Null,
    getHand = T_Fun [] T_Bytes,
    partnerIs = T_Fun [T_Address] T_Null,
    random = T_Fun [] T_UInt256,
    shows = T_Fun [] T_Null},
  "O" = interact {
    }};

only("A") {
  const "one of [\"wagerAmount\",\"escrowAmount\"] (as interact)":T_Tuple [T_UInt256,T_UInt256]:1 = interact("A")."getParams"();
  const "tuple idx":T_UInt256:2 = "one of [\"wagerAmount\",\"escrowAmount\"] (as interact)":T_Tuple [T_UInt256,T_UInt256]:1[0];
  const "tuple idx":T_UInt256:3 = "one of [\"wagerAmount\",\"escrowAmount\"] (as interact)":T_Tuple [T_UInt256,T_UInt256]:1[1];
   };
only("A") {
  const "prim":T_UInt256:7 = ADD("tuple idx":T_UInt256:2,"tuple idx":T_UInt256:3);
   };
publish("A", join("A":T_Address:6))("tuple idx":T_UInt256:2,"tuple idx":T_UInt256:3)("tuple idx":T_UInt256:4, "tuple idx":T_UInt256:5).pay("prim":T_UInt256:7){
  const "prim":T_UInt256:8 = ADD("tuple idx":T_UInt256:4,"tuple idx":T_UInt256:5);
  const "prim":T_UInt256:9 = TXN_VALUE();
  const "prim":T_Bool:10 = PEQ("prim":T_UInt256:8,"prim":T_UInt256:9);
  claim(CT_Require)("prim":T_Bool:10);
  commit();
  only("B") {
    const "interact":T_Null:12 = interact("B")."acceptParams"("tuple idx":T_UInt256:4,"tuple idx":T_UInt256:5);
     };
  only("B") {
     };
  publish("B", join("B":T_Address:13))()().pay("tuple idx":T_UInt256:4).timeout((DLC_Int 10, {
    only("A") {
       };
    publish("A", again("A":T_Address:6))()().pay(DLC_Int 0){
      const "prim":T_UInt256:18 = TXN_VALUE();
      const "prim":T_Bool:19 = PEQ(DLC_Int 0,"prim":T_UInt256:18);
      claim(CT_Require)("prim":T_Bool:19);
      const "prim":T_UInt256:20 = BALANCE();
      transfer.("prim":T_UInt256:20).to("A":T_Address:6);
      commit();
      only("A") {
        claim(CT_Require)(DLC_Bool True);
        const "interact":T_Null:26 = interact("A")."endsWith"(DLC_Bytes "Bob quits");
         };
      only("B") {
        claim(CT_Require)(DLC_Bool True);
        const "interact":T_Null:31 = interact("B")."endsWith"(DLC_Bytes "Bob quits");
         };
      exit(); } })){
    const "prim":T_UInt256:14 = TXN_VALUE();
    const "prim":T_Bool:15 = PEQ("tuple idx":T_UInt256:4,"prim":T_UInt256:14);
    claim(CT_Require)("prim":T_Bool:15);
    loopvar {
      "count":T_UInt256:32 = DLC_Int 0,
      "outcome":T_UInt256:33 = DLC_Int 1};
    invariant{
      const "prim":T_UInt256:34 = BALANCE();
      const "prim":T_UInt256:35 = MUL(DLC_Int 2,"tuple idx":T_UInt256:4);
      const "prim":T_UInt256:36 = ADD("prim":T_UInt256:35,"tuple idx":T_UInt256:5);
      const "prim":T_Bool:37 = PEQ("prim":T_UInt256:34,"prim":T_UInt256:36);
      const "prim":T_Bool:39 = PLE(DLC_Int 0,"outcome":T_UInt256:33);
      const "prim":T_Bool:40 = PLT("outcome":T_UInt256:33,DLC_Int 5);
      const "prim":T_Bool:42 = IF_THEN_ELSE("prim":T_Bool:39,"prim":T_Bool:40,DLC_Bool False);
      const "prim":T_Bool:44 = IF_THEN_ELSE("prim":T_Bool:37,"prim":T_Bool:42,DLC_Bool False);
      const "prim":T_Bool:46 = PEQ("outcome":T_UInt256:33,DLC_Int 3);
      const "prim":T_Bool:48 = IF_THEN_ELSE("prim":T_Bool:46,DLC_Bool False,DLC_Bool True);
      const "prim":T_Bool:50 = IF_THEN_ELSE("prim":T_Bool:44,"prim":T_Bool:48,DLC_Bool False);
      const "prim":T_Bool:52 = PEQ("outcome":T_UInt256:33,DLC_Int 4);
      const "prim":T_Bool:54 = IF_THEN_ELSE("prim":T_Bool:52,DLC_Bool False,DLC_Bool True);
      const "prim":T_Bool:56 = IF_THEN_ELSE("prim":T_Bool:50,"prim":T_Bool:54,DLC_Bool False);
      
      return "prim":T_Bool:56; }
    while{
      const "prim":T_Bool:57 = PEQ("outcome":T_UInt256:33,DLC_Int 1);
      
      return "prim":T_Bool:57; }
    {
      commit();
      only("A") {
        let "_handA (as clo app)":T_UInt256:60;
        const "s (as interact)":T_Bytes:61 = interact("A")."getHand"();
        const "rockP (as prim)":T_Bool:62 = BYTES_EQ("s (as interact)":T_Bytes:61,DLC_Bytes "ROCK");
        const "paperP (as prim)":T_Bool:63 = BYTES_EQ("s (as interact)":T_Bytes:61,DLC_Bytes "PAPER");
        const "scissorsP (as prim)":T_Bool:64 = BYTES_EQ("s (as interact)":T_Bytes:61,DLC_Bytes "SCISSORS");
        const "_handA (as prim)":T_Bool:66 = IF_THEN_ELSE("rockP (as prim)":T_Bool:62,DLC_Bool True,"paperP (as prim)":T_Bool:63);
        const "_handA (as prim)":T_Bool:68 = IF_THEN_ELSE("_handA (as prim)":T_Bool:66,DLC_Bool True,"scissorsP (as prim)":T_Bool:64);
        claim(CT_Assume)("_handA (as prim)":T_Bool:68);
        if "rockP (as prim)":T_Bool:62 then {
          "_handA (as clo app)":T_UInt256:60 = DLC_Int 0;
           }
        else {
          if "paperP (as prim)":T_Bool:63 then {
            "_handA (as clo app)":T_UInt256:60 = DLC_Int 1;
             }
          else {
            "_handA (as clo app)":T_UInt256:60 = DLC_Int 2;
             };
           };
        const "_handA (as prim)":T_Bool:71 = PLE(DLC_Int 0,"_handA (as clo app)":T_UInt256:60);
        const "_handA (as prim)":T_Bool:72 = PLT("_handA (as clo app)":T_UInt256:60,DLC_Int 3);
        const "_handA (as prim)":T_Bool:74 = IF_THEN_ELSE("_handA (as prim)":T_Bool:71,"_handA (as prim)":T_Bool:72,DLC_Bool False);
        claim(CT_Assert)("_handA (as prim)":T_Bool:74);
        const "salt (as interact)":T_UInt256:76 = interact("A")."random"();
        const "commitment (as digest)":T_UInt256:77 = digest("salt (as interact)":T_UInt256:76,"_handA (as clo app)":T_UInt256:60);
        const "interact":T_Null:78 = interact("A")."commits"();
         };
      only("A") {
         };
      publish("A", again("A":T_Address:6))("commitment (as digest)":T_UInt256:77)("commitment (as digest)":T_UInt256:79).pay(DLC_Int 0).timeout((DLC_Int 10, {
        only("B") {
           };
        publish("B", again("B":T_Address:13))()().pay(DLC_Int 0){
          const "prim":T_UInt256:84 = TXN_VALUE();
          const "prim":T_Bool:85 = PEQ(DLC_Int 0,"prim":T_UInt256:84);
          claim(CT_Require)("prim":T_Bool:85);
          const "prim":T_UInt256:86 = BALANCE();
          transfer.("prim":T_UInt256:86).to("B":T_Address:13);
          commit();
          only("A") {
            claim(CT_Require)(DLC_Bool True);
            const "interact":T_Null:92 = interact("A")."endsWith"(DLC_Bytes "Alice quits");
             };
          only("B") {
            claim(CT_Require)(DLC_Bool True);
            const "interact":T_Null:97 = interact("B")."endsWith"(DLC_Bytes "Alice quits");
             };
          exit(); } })){
        const "prim":T_UInt256:80 = TXN_VALUE();
        const "prim":T_Bool:81 = PEQ(DLC_Int 0,"prim":T_UInt256:80);
        claim(CT_Require)("prim":T_Bool:81);
        commit();
        only("B") {
          let "handB (as clo app)":T_UInt256:100;
          const "s (as interact)":T_Bytes:101 = interact("B")."getHand"();
          const "rockP (as prim)":T_Bool:102 = BYTES_EQ("s (as interact)":T_Bytes:101,DLC_Bytes "ROCK");
          const "paperP (as prim)":T_Bool:103 = BYTES_EQ("s (as interact)":T_Bytes:101,DLC_Bytes "PAPER");
          const "scissorsP (as prim)":T_Bool:104 = BYTES_EQ("s (as interact)":T_Bytes:101,DLC_Bytes "SCISSORS");
          const "handB (as prim)":T_Bool:106 = IF_THEN_ELSE("rockP (as prim)":T_Bool:102,DLC_Bool True,"paperP (as prim)":T_Bool:103);
          const "handB (as prim)":T_Bool:108 = IF_THEN_ELSE("handB (as prim)":T_Bool:106,DLC_Bool True,"scissorsP (as prim)":T_Bool:104);
          claim(CT_Assume)("handB (as prim)":T_Bool:108);
          if "rockP (as prim)":T_Bool:102 then {
            "handB (as clo app)":T_UInt256:100 = DLC_Int 0;
             }
          else {
            if "paperP (as prim)":T_Bool:103 then {
              "handB (as clo app)":T_UInt256:100 = DLC_Int 1;
               }
            else {
              "handB (as clo app)":T_UInt256:100 = DLC_Int 2;
               };
             };
          const "handB (as prim)":T_Bool:111 = PLE(DLC_Int 0,"handB (as clo app)":T_UInt256:100);
          const "handB (as prim)":T_Bool:112 = PLT("handB (as clo app)":T_UInt256:100,DLC_Int 3);
          const "handB (as prim)":T_Bool:114 = IF_THEN_ELSE("handB (as prim)":T_Bool:111,"handB (as prim)":T_Bool:112,DLC_Bool False);
          claim(CT_Assert)("handB (as prim)":T_Bool:114);
          const "interact":T_Null:115 = interact("B")."shows"();
           };
        only("B") {
           };
        publish("B", again("B":T_Address:13))("handB (as clo app)":T_UInt256:100)("handB (as clo app)":T_UInt256:116).pay(DLC_Int 0).timeout((DLC_Int 10, {
          only("A") {
             };
          publish("A", again("A":T_Address:6))()().pay(DLC_Int 0){
            const "prim":T_UInt256:121 = TXN_VALUE();
            const "prim":T_Bool:122 = PEQ(DLC_Int 0,"prim":T_UInt256:121);
            claim(CT_Require)("prim":T_Bool:122);
            const "prim":T_UInt256:123 = BALANCE();
            transfer.("prim":T_UInt256:123).to("A":T_Address:6);
            commit();
            only("A") {
              claim(CT_Require)(DLC_Bool True);
              const "interact":T_Null:129 = interact("A")."endsWith"(DLC_Bytes "Bob quits");
               };
            only("B") {
              claim(CT_Require)(DLC_Bool True);
              const "interact":T_Null:134 = interact("B")."endsWith"(DLC_Bytes "Bob quits");
               };
            exit(); } })){
          const "prim":T_UInt256:117 = TXN_VALUE();
          const "prim":T_Bool:118 = PEQ(DLC_Int 0,"prim":T_UInt256:117);
          claim(CT_Require)("prim":T_Bool:118);
          const "prim":T_Bool:136 = PLE(DLC_Int 0,"handB (as clo app)":T_UInt256:116);
          const "prim":T_Bool:137 = PLT("handB (as clo app)":T_UInt256:116,DLC_Int 3);
          const "prim":T_Bool:139 = IF_THEN_ELSE("prim":T_Bool:136,"prim":T_Bool:137,DLC_Bool False);
          claim(CT_Require)("prim":T_Bool:139);
          commit();
          only("A") {
            let "clo app":T_Bytes:141;
            const "prim":T_Bool:143 = PLE(DLC_Int 0,"handB (as clo app)":T_UInt256:116);
            const "prim":T_Bool:144 = PLT("handB (as clo app)":T_UInt256:116,DLC_Int 3);
            const "prim":T_Bool:146 = IF_THEN_ELSE("prim":T_Bool:143,"prim":T_Bool:144,DLC_Bool False);
            claim(CT_Require)("prim":T_Bool:146);
            const "prim":T_Bool:147 = PEQ("handB (as clo app)":T_UInt256:116,DLC_Int 0);
            if "prim":T_Bool:147 then {
              "clo app":T_Bytes:141 = DLC_Bytes "ROCK";
               }
            else {
              const "prim":T_Bool:148 = PEQ("handB (as clo app)":T_UInt256:116,DLC_Int 1);
              if "prim":T_Bool:148 then {
                "clo app":T_Bytes:141 = DLC_Bytes "PAPER";
                 }
              else {
                "clo app":T_Bytes:141 = DLC_Bytes "SCISSORS";
                 };
               };
            const "interact":T_Null:149 = interact("A")."reveals"("clo app":T_Bytes:141);
             };
          only("A") {
             };
          publish("A", again("A":T_Address:6))("salt (as interact)":T_UInt256:76,"_handA (as clo app)":T_UInt256:60)("salt (as interact)":T_UInt256:150, "_handA (as clo app)":T_UInt256:151).pay(DLC_Int 0).timeout((DLC_Int 10, {
            only("B") {
               };
            publish("B", again("B":T_Address:13))()().pay(DLC_Int 0){
              const "prim":T_UInt256:156 = TXN_VALUE();
              const "prim":T_Bool:157 = PEQ(DLC_Int 0,"prim":T_UInt256:156);
              claim(CT_Require)("prim":T_Bool:157);
              const "prim":T_UInt256:158 = BALANCE();
              transfer.("prim":T_UInt256:158).to("B":T_Address:13);
              commit();
              only("A") {
                claim(CT_Require)(DLC_Bool True);
                const "interact":T_Null:164 = interact("A")."endsWith"(DLC_Bytes "Alice quits");
                 };
              only("B") {
                claim(CT_Require)(DLC_Bool True);
                const "interact":T_Null:169 = interact("B")."endsWith"(DLC_Bytes "Alice quits");
                 };
              exit(); } })){
            const "prim":T_UInt256:152 = TXN_VALUE();
            const "prim":T_Bool:153 = PEQ(DLC_Int 0,"prim":T_UInt256:152);
            claim(CT_Require)("prim":T_Bool:153);
            const "digest":T_UInt256:171 = digest("salt (as interact)":T_UInt256:150,"_handA (as clo app)":T_UInt256:151);
            const "prim":T_Bool:172 = PEQ("commitment (as digest)":T_UInt256:79,"digest":T_UInt256:171);
            claim(CT_Require)("prim":T_Bool:172);
            const "prim":T_Bool:174 = PLE(DLC_Int 0,"_handA (as clo app)":T_UInt256:151);
            const "prim":T_Bool:175 = PLT("_handA (as clo app)":T_UInt256:151,DLC_Int 3);
            const "prim":T_Bool:177 = IF_THEN_ELSE("prim":T_Bool:174,"prim":T_Bool:175,DLC_Bool False);
            claim(CT_Require)("prim":T_Bool:177);
            let "roundOutcome (as clo app)":T_UInt256:179;
            const "validA (as prim)":T_Bool:181 = PLE(DLC_Int 0,"_handA (as clo app)":T_UInt256:151);
            const "validA (as prim)":T_Bool:182 = PLT("_handA (as clo app)":T_UInt256:151,DLC_Int 3);
            const "validA (as prim)":T_Bool:184 = IF_THEN_ELSE("validA (as prim)":T_Bool:181,"validA (as prim)":T_Bool:182,DLC_Bool False);
            const "validB (as prim)":T_Bool:186 = PLE(DLC_Int 0,"handB (as clo app)":T_UInt256:116);
            const "validB (as prim)":T_Bool:187 = PLT("handB (as clo app)":T_UInt256:116,DLC_Int 3);
            const "validB (as prim)":T_Bool:189 = IF_THEN_ELSE("validB (as prim)":T_Bool:186,"validB (as prim)":T_Bool:187,DLC_Bool False);
            const "roundOutcome (as prim)":T_Bool:191 = IF_THEN_ELSE("validA (as prim)":T_Bool:184,"validB (as prim)":T_Bool:189,DLC_Bool False);
            if "roundOutcome (as prim)":T_Bool:191 then {
              const "roundOutcome (as prim)":T_UInt256:192 = SUB(DLC_Int 4,"handB (as clo app)":T_UInt256:116);
              const "roundOutcome (as prim)":T_UInt256:193 = ADD("_handA (as clo app)":T_UInt256:151,"roundOutcome (as prim)":T_UInt256:192);
              const "roundOutcome (as prim)":T_UInt256:194 = MOD("roundOutcome (as prim)":T_UInt256:193,DLC_Int 3);
              "roundOutcome (as clo app)":T_UInt256:179 = "roundOutcome (as prim)":T_UInt256:194;
               }
            else {
              if "validA (as prim)":T_Bool:184 then {
                "roundOutcome (as clo app)":T_UInt256:179 = DLC_Int 2;
                 }
              else {
                if "validB (as prim)":T_Bool:189 then {
                  "roundOutcome (as clo app)":T_UInt256:179 = DLC_Int 0;
                   }
                else {
                  "roundOutcome (as clo app)":T_UInt256:179 = DLC_Int 1;
                   };
                 };
               };
            const "roundOutcome (as prim)":T_Bool:197 = PLE(DLC_Int 0,"roundOutcome (as clo app)":T_UInt256:179);
            const "roundOutcome (as prim)":T_Bool:198 = PLT("roundOutcome (as clo app)":T_UInt256:179,DLC_Int 5);
            const "roundOutcome (as prim)":T_Bool:200 = IF_THEN_ELSE("roundOutcome (as prim)":T_Bool:197,"roundOutcome (as prim)":T_Bool:198,DLC_Bool False);
            claim(CT_Assert)("roundOutcome (as prim)":T_Bool:200);
            const "prim":T_Bool:201 = PEQ("roundOutcome (as clo app)":T_UInt256:179,DLC_Int 2);
            const "prim":T_Bool:203 = PLE(DLC_Int 0,"_handA (as clo app)":T_UInt256:151);
            const "prim":T_Bool:204 = PLT("_handA (as clo app)":T_UInt256:151,DLC_Int 3);
            const "prim":T_Bool:206 = IF_THEN_ELSE("prim":T_Bool:203,"prim":T_Bool:204,DLC_Bool False);
            const "prim":T_Bool:209 = IF_THEN_ELSE("prim":T_Bool:201,DLC_Bool False,DLC_Bool True);
            const "prim":T_Bool:211 = IF_THEN_ELSE("prim":T_Bool:209,DLC_Bool True,"prim":T_Bool:206);
            claim(CT_Assert)("prim":T_Bool:211);
            const "prim":T_Bool:212 = PEQ("roundOutcome (as clo app)":T_UInt256:179,DLC_Int 0);
            const "prim":T_Bool:214 = PLE(DLC_Int 0,"handB (as clo app)":T_UInt256:116);
            const "prim":T_Bool:215 = PLT("handB (as clo app)":T_UInt256:116,DLC_Int 3);
            const "prim":T_Bool:217 = IF_THEN_ELSE("prim":T_Bool:214,"prim":T_Bool:215,DLC_Bool False);
            const "prim":T_Bool:220 = IF_THEN_ELSE("prim":T_Bool:212,DLC_Bool False,DLC_Bool True);
            const "prim":T_Bool:222 = IF_THEN_ELSE("prim":T_Bool:220,DLC_Bool True,"prim":T_Bool:217);
            claim(CT_Assert)("prim":T_Bool:222);
            const "prim":T_Bool:224 = PEQ("roundOutcome (as clo app)":T_UInt256:179,DLC_Int 2);
            const "prim":T_Bool:227 = PEQ("_handA (as clo app)":T_UInt256:151,DLC_Int 0);
            const "prim":T_Bool:229 = IF_THEN_ELSE("prim":T_Bool:227,"prim":T_Bool:224,DLC_Bool False);
            claim(CT_Possible)("prim":T_Bool:229);
            const "prim":T_Bool:231 = PEQ("_handA (as clo app)":T_UInt256:151,DLC_Int 1);
            const "prim":T_Bool:233 = IF_THEN_ELSE("prim":T_Bool:231,"prim":T_Bool:224,DLC_Bool False);
            claim(CT_Possible)("prim":T_Bool:233);
            const "prim":T_Bool:235 = PEQ("_handA (as clo app)":T_UInt256:151,DLC_Int 2);
            const "prim":T_Bool:237 = IF_THEN_ELSE("prim":T_Bool:235,"prim":T_Bool:224,DLC_Bool False);
            claim(CT_Possible)("prim":T_Bool:237);
            const "prim":T_Bool:238 = PEQ("roundOutcome (as clo app)":T_UInt256:179,DLC_Int 0);
            const "prim":T_Bool:241 = PEQ("handB (as clo app)":T_UInt256:116,DLC_Int 0);
            const "prim":T_Bool:243 = IF_THEN_ELSE("prim":T_Bool:241,"prim":T_Bool:238,DLC_Bool False);
            claim(CT_Possible)("prim":T_Bool:243);
            const "prim":T_Bool:245 = PEQ("handB (as clo app)":T_UInt256:116,DLC_Int 1);
            const "prim":T_Bool:247 = IF_THEN_ELSE("prim":T_Bool:245,"prim":T_Bool:238,DLC_Bool False);
            claim(CT_Possible)("prim":T_Bool:247);
            const "prim":T_Bool:249 = PEQ("handB (as clo app)":T_UInt256:116,DLC_Int 2);
            const "prim":T_Bool:251 = IF_THEN_ELSE("prim":T_Bool:249,"prim":T_Bool:238,DLC_Bool False);
            claim(CT_Possible)("prim":T_Bool:251);
            const "one of [\"count\",\"outcome\"] (as prim)":T_UInt256:252 = ADD(DLC_Int 1,"count":T_UInt256:32);
            {
              "count":T_UInt256:32 = "one of [\"count\",\"outcome\"] (as prim)":T_UInt256:252,
              "outcome":T_UInt256:33 = "roundOutcome (as clo app)":T_UInt256:179}
            continue; } } } }
    const "prim":T_Bool:254 = PEQ("outcome":T_UInt256:33,DLC_Int 1);
    const "prim":T_Bool:256 = IF_THEN_ELSE("prim":T_Bool:254,DLC_Bool False,DLC_Bool True);
    claim(CT_Assert)("prim":T_Bool:256);
    let "one of [\"getsA\",\"getsB\"] (as clo app)":T_Tuple [T_UInt256,T_UInt256]:257;
    const "one of [\"getsA\",\"getsB\"] (as prim)":T_Bool:258 = PEQ("outcome":T_UInt256:33,DLC_Int 2);
    if "one of [\"getsA\",\"getsB\"] (as prim)":T_Bool:258 then {
      const "one of [\"getsA\",\"getsB\"] (as prim)":T_UInt256:259 = MUL(DLC_Int 2,"tuple idx":T_UInt256:4);
      "one of [\"getsA\",\"getsB\"] (as clo app)":T_Tuple [T_UInt256,T_UInt256]:257 = ["one of [\"getsA\",\"getsB\"] (as prim)":T_UInt256:259,DLC_Int 0];
       }
    else {
      const "one of [\"getsA\",\"getsB\"] (as prim)":T_Bool:260 = PEQ("outcome":T_UInt256:33,DLC_Int 0);
      if "one of [\"getsA\",\"getsB\"] (as prim)":T_Bool:260 then {
        const "one of [\"getsA\",\"getsB\"] (as prim)":T_UInt256:261 = MUL(DLC_Int 2,"tuple idx":T_UInt256:4);
        "one of [\"getsA\",\"getsB\"] (as clo app)":T_Tuple [T_UInt256,T_UInt256]:257 = [DLC_Int 0,"one of [\"getsA\",\"getsB\"] (as prim)":T_UInt256:261];
         }
      else {
        "one of [\"getsA\",\"getsB\"] (as clo app)":T_Tuple [T_UInt256,T_UInt256]:257 = ["tuple idx":T_UInt256:4,"tuple idx":T_UInt256:4];
         };
       };
    const "tuple idx":T_UInt256:262 = "one of [\"getsA\",\"getsB\"] (as clo app)":T_Tuple [T_UInt256,T_UInt256]:257[0];
    const "tuple idx":T_UInt256:263 = "one of [\"getsA\",\"getsB\"] (as clo app)":T_Tuple [T_UInt256,T_UInt256]:257[1];
    const "prim":T_UInt256:264 = ADD("tuple idx":T_UInt256:5,"tuple idx":T_UInt256:262);
    transfer.("prim":T_UInt256:264).to("A":T_Address:6);
    transfer.("tuple idx":T_UInt256:263).to("B":T_Address:13);
    commit();
    only("A") {
      let "clo app":T_Bytes:268;
      const "prim":T_Bool:270 = PLE(DLC_Int 0,"outcome":T_UInt256:33);
      const "prim":T_Bool:271 = PLT("outcome":T_UInt256:33,DLC_Int 5);
      const "prim":T_Bool:273 = IF_THEN_ELSE("prim":T_Bool:270,"prim":T_Bool:271,DLC_Bool False);
      claim(CT_Require)("prim":T_Bool:273);
      const "prim":T_Bool:274 = PEQ("outcome":T_UInt256:33,DLC_Int 0);
      if "prim":T_Bool:274 then {
        "clo app":T_Bytes:268 = DLC_Bytes "Bob wins";
         }
      else {
        const "prim":T_Bool:275 = PEQ("outcome":T_UInt256:33,DLC_Int 1);
        if "prim":T_Bool:275 then {
          "clo app":T_Bytes:268 = DLC_Bytes "Draw";
           }
        else {
          const "prim":T_Bool:276 = PEQ("outcome":T_UInt256:33,DLC_Int 2);
          if "prim":T_Bool:276 then {
            "clo app":T_Bytes:268 = DLC_Bytes "Alice wins";
             }
          else {
            const "prim":T_Bool:277 = PEQ("outcome":T_UInt256:33,DLC_Int 3);
            if "prim":T_Bool:277 then {
              "clo app":T_Bytes:268 = DLC_Bytes "Alice quits";
               }
            else {
              "clo app":T_Bytes:268 = DLC_Bytes "Bob quits";
               };
             };
           };
         };
      const "interact":T_Null:278 = interact("A")."endsWith"("clo app":T_Bytes:268);
       };
    only("B") {
      let "clo app":T_Bytes:280;
      const "prim":T_Bool:282 = PLE(DLC_Int 0,"outcome":T_UInt256:33);
      const "prim":T_Bool:283 = PLT("outcome":T_UInt256:33,DLC_Int 5);
      const "prim":T_Bool:285 = IF_THEN_ELSE("prim":T_Bool:282,"prim":T_Bool:283,DLC_Bool False);
      claim(CT_Require)("prim":T_Bool:285);
      const "prim":T_Bool:286 = PEQ("outcome":T_UInt256:33,DLC_Int 0);
      if "prim":T_Bool:286 then {
        "clo app":T_Bytes:280 = DLC_Bytes "Bob wins";
         }
      else {
        const "prim":T_Bool:287 = PEQ("outcome":T_UInt256:33,DLC_Int 1);
        if "prim":T_Bool:287 then {
          "clo app":T_Bytes:280 = DLC_Bytes "Draw";
           }
        else {
          const "prim":T_Bool:288 = PEQ("outcome":T_UInt256:33,DLC_Int 2);
          if "prim":T_Bool:288 then {
            "clo app":T_Bytes:280 = DLC_Bytes "Alice wins";
             }
          else {
            const "prim":T_Bool:289 = PEQ("outcome":T_UInt256:33,DLC_Int 3);
            if "prim":T_Bool:289 then {
              "clo app":T_Bytes:280 = DLC_Bytes "Alice quits";
               }
            else {
              "clo app":T_Bytes:280 = DLC_Bytes "Bob quits";
               };
             };
           };
         };
      const "interact":T_Null:290 = interact("B")."endsWith"("clo app":T_Bytes:280);
       };
    exit(); } }