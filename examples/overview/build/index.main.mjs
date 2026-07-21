// Automatically generated with Reach 0.1.13
/* eslint-disable */
export const _version = '0.1.13';
export const _versionHash = '0.1.13';
export const _backendVersion = 27;

export function getExports(s) {
  const stdlib = s.reachStdlib;
  return {
    };
  };
export function _getEvents(s) {
  const stdlib = s.reachStdlib;
  return {
    };
  };
export function _getViews(s, viewlib) {
  const stdlib = s.reachStdlib;
  const ctc0 = stdlib.T_Address;
  const ctc1 = stdlib.T_UInt;
  
  return {
    infos: {
      },
    views: {
      1: [ctc0, ctc1],
      2: [ctc0, ctc1]
      }
    };
  
  };
export function _getMaps(s) {
  const stdlib = s.reachStdlib;
  const ctc0 = stdlib.T_Tuple([]);
  return {
    mapDataTy: ctc0
    };
  };
export async function Alice(ctcTop, interact) {
  if (typeof(ctcTop) !== 'object' || ctcTop._initialize === undefined) {
    return Promise.reject(new Error(`The backend for Alice expects to receive a contract as its first argument.`));}
  if (typeof(interact) !== 'object') {
    return Promise.reject(new Error(`The backend for Alice expects to receive an interact object as its second argument.`));}
  const ctc = ctcTop._initialize();
  const stdlib = ctc.stdlib;
  const ctc0 = stdlib.T_Bytes(stdlib.checkedBigNumberify('<builtin>', stdlib.UInt_max, '128'));
  const ctc1 = stdlib.T_UInt;
  const ctc2 = stdlib.T_Address;
  
  
  const v64 = stdlib.protect(ctc0, interact.info, 'for Alice\'s interact field info');
  const v65 = stdlib.protect(ctc1, interact.request, 'for Alice\'s interact field request');
  
  const txn1 = await (ctc.sendrecv({
    args: [v65],
    evt_cnt: 1,
    funcNum: 0,
    lct: stdlib.checkedBigNumberify('./index.rsh:17:5:dot', stdlib.UInt_max, '0'),
    onlyIf: true,
    out_tys: [ctc1],
    pay: [stdlib.checkedBigNumberify('./index.rsh:17:5:decimal', stdlib.UInt_max, '0'), []],
    sim_p: (async (txn1) => {
      const sim_r = { txns: [], mapRefs: [], maps: [] };
      let sim_txn_ctr = stdlib.UInt_max;
      const getSimTokCtr = () => { sim_txn_ctr = sim_txn_ctr.sub(1); return sim_txn_ctr; };
      
      
      const {data: [v69], secs: v71, time: v70, didSend: v28, from: v68 } = txn1;
      
      ;
      sim_r.isHalt = false;
      
      return sim_r;
      }),
    soloSend: true,
    timeoutAt: undefined /* mto */,
    tys: [ctc1],
    waitIfNotPresent: false
    }));
  const {data: [v69], secs: v71, time: v70, didSend: v28, from: v68 } = txn1;
  ;
  const txn2 = await (ctc.recv({
    didSend: false,
    evt_cnt: 0,
    funcNum: 1,
    out_tys: [],
    timeoutAt: undefined /* mto */,
    waitIfNotPresent: false
    }));
  const {data: [], secs: v76, time: v75, didSend: v37, from: v74 } = txn2;
  ;
  const txn3 = await (ctc.sendrecv({
    args: [v68, v69, v64],
    evt_cnt: 1,
    funcNum: 2,
    lct: v75,
    onlyIf: true,
    out_tys: [ctc0],
    pay: [stdlib.checkedBigNumberify('./index.rsh:27:5:decimal', stdlib.UInt_max, '0'), []],
    sim_p: (async (txn3) => {
      const sim_r = { txns: [], mapRefs: [], maps: [] };
      let sim_txn_ctr = stdlib.UInt_max;
      const getSimTokCtr = () => { sim_txn_ctr = sim_txn_ctr.sub(1); return sim_txn_ctr; };
      
      
      const {data: [v82], secs: v84, time: v83, didSend: v46, from: v81 } = txn3;
      
      ;
      sim_r.txns.push({
        kind: 'from',
        to: v68,
        tok: undefined /* Nothing */
        });
      sim_r.txns.push({
        kind: 'halt',
        tok: undefined /* Nothing */
        })
      sim_r.isHalt = true;
      
      return sim_r;
      }),
    soloSend: true,
    timeoutAt: undefined /* mto */,
    tys: [ctc2, ctc1, ctc0],
    waitIfNotPresent: false
    }));
  const {data: [v82], secs: v84, time: v83, didSend: v46, from: v81 } = txn3;
  ;
  const v85 = stdlib.addressEq(v68, v81);
  stdlib.assert(v85, {
    at: './index.rsh:27:5:dot',
    fs: [],
    msg: 'sender correct',
    who: 'Alice'
    });
  ;
  return;
  
  
  
  
  
  
  };
export async function Bob(ctcTop, interact) {
  if (typeof(ctcTop) !== 'object' || ctcTop._initialize === undefined) {
    return Promise.reject(new Error(`The backend for Bob expects to receive a contract as its first argument.`));}
  if (typeof(interact) !== 'object') {
    return Promise.reject(new Error(`The backend for Bob expects to receive an interact object as its second argument.`));}
  const ctc = ctcTop._initialize();
  const stdlib = ctc.stdlib;
  const ctc0 = stdlib.T_UInt;
  const ctc1 = stdlib.T_Null;
  const ctc2 = stdlib.T_Bytes(stdlib.checkedBigNumberify('<builtin>', stdlib.UInt_max, '128'));
  const ctc3 = stdlib.T_Address;
  
  
  const txn1 = await (ctc.recv({
    didSend: false,
    evt_cnt: 1,
    funcNum: 0,
    out_tys: [ctc0],
    timeoutAt: undefined /* mto */,
    waitIfNotPresent: false
    }));
  const {data: [v69], secs: v71, time: v70, didSend: v28, from: v68 } = txn1;
  ;
  stdlib.protect(ctc1, await interact.want(v69), {
    at: './index.rsh:21:18:application',
    fs: ['at ./index.rsh:20:9:application call to [unknown function] (defined at: ./index.rsh:20:13:function exp)'],
    msg: 'want',
    who: 'Bob'
    });
  
  const txn2 = await (ctc.sendrecv({
    args: [v68, v69],
    evt_cnt: 0,
    funcNum: 1,
    lct: v70,
    onlyIf: true,
    out_tys: [],
    pay: [v69, []],
    sim_p: (async (txn2) => {
      const sim_r = { txns: [], mapRefs: [], maps: [] };
      let sim_txn_ctr = stdlib.UInt_max;
      const getSimTokCtr = () => { sim_txn_ctr = sim_txn_ctr.sub(1); return sim_txn_ctr; };
      
      
      const {data: [], secs: v76, time: v75, didSend: v37, from: v74 } = txn2;
      
      sim_r.txns.push({
        amt: v69,
        kind: 'to',
        tok: undefined /* Nothing */
        });
      sim_r.isHalt = false;
      
      return sim_r;
      }),
    soloSend: true,
    timeoutAt: undefined /* mto */,
    tys: [ctc3, ctc0],
    waitIfNotPresent: false
    }));
  const {data: [], secs: v76, time: v75, didSend: v37, from: v74 } = txn2;
  ;
  const txn3 = await (ctc.recv({
    didSend: false,
    evt_cnt: 1,
    funcNum: 2,
    out_tys: [ctc2],
    timeoutAt: undefined /* mto */,
    waitIfNotPresent: false
    }));
  const {data: [v82], secs: v84, time: v83, didSend: v46, from: v81 } = txn3;
  ;
  const v85 = stdlib.addressEq(v68, v81);
  stdlib.assert(v85, {
    at: './index.rsh:27:5:dot',
    fs: [],
    msg: 'sender correct',
    who: 'Bob'
    });
  ;
  stdlib.protect(ctc1, await interact.got(v82), {
    at: './index.rsh:32:17:application',
    fs: ['at ./index.rsh:31:9:application call to [unknown function] (defined at: ./index.rsh:31:13:function exp)'],
    msg: 'got',
    who: 'Bob'
    });
  
  return;
  
  
  
  
  
  
  };
const _ALGO = {
  ABI: {
    impure: [`_reachp_0((uint64,uint64))void`, `_reachp_1((uint64))void`, `_reachp_2((uint64,byte[128]))void`],
    pure: [],
    sigs: [`_reachp_0((uint64,uint64))void`, `_reachp_1((uint64))void`, `_reachp_2((uint64,byte[128]))void`]
    },
  GlobalNumByteSlice: 2,
  GlobalNumUint: 0,
  LocalNumByteSlice: 0,
  LocalNumUint: 0,
  appApproval: `CCAFAAECCCAmAgABADEYQQEwKGRJIls1ASVbNQIpZIIDBBlcRrsEUlb9rATf2SMoNhoAjgMA/ADdAPEAMQA1DjQLIls1DDQLJVs1DYAErNEfwzQMFlA0DRZQsDQMiAEyNA40DRZQIzIGNQI1ASlMVwAoZyg0ARY0AhZQZzEZIhJEiAEYNANAAAqABBUffHU0BFCwI0MjNAESRElXACA1DiEEWzUNNAsXNQyABNUVGRQ0DBZQsDQMiADYNA2IAO00DjQNFlAkMgZC/54kNAESRElXACA1DiEEWzUNNAsiWzUMgASkbdF+NAwWUDQLVwiAULA0DIgAmzQOMQASRDQNNA6IAKQxGYEFEkSIAI8iMgoyCYgAs0L/bIgAc4GgjQY0Bgg1BjYaATULQv8QiABfNhoBNQtC/16IAFQ2GgE1C0L/iSIxNBJEJDE1EkQiMTYSRCIxNxJEiAA1gSivIiJC/wgxGSISREL/ICKyASOyELIHsgiziUiJTAlJNQYyCYgAJ4kJSUH/7kk1BogAH4kjNQOJSSISTDQCEhFEiTQGNAdKD0H/0kL/2rFC/70xFjQAIwhJNQAJRwI4BzIKEkQ4ECMSRDgIEkSJsbIJQv+b`,
  appApprovalMap: {
    0: `2`,
    1: `2`,
    10: `2`,
    100: `48`,
    101: `49`,
    102: `50`,
    103: `51`,
    104: `51`,
    105: `53`,
    106: `53`,
    107: `54`,
    108: `54`,
    109: `55`,
    11: `2`,
    110: `56`,
    111: `57`,
    112: `57`,
    113: `57`,
    114: `58`,
    115: `59`,
    116: `60`,
    117: `60`,
    118: `61`,
    119: `62`,
    12: `2`,
    120: `62`,
    121: `63`,
    122: `64`,
    123: `65`,
    124: `66`,
    125: `66`,
    126: `67`,
    127: `68`,
    128: `69`,
    129: `71`,
    13: `4`,
    130: `71`,
    131: `71`,
    132: `73`,
    133: `73`,
    134: `74`,
    135: `74`,
    136: `74`,
    137: `76`,
    138: `76`,
    139: `76`,
    14: `4`,
    140: `76`,
    141: `76`,
    142: `76`,
    143: `77`,
    144: `77`,
    145: `78`,
    146: `79`,
    147: `81`,
    148: `82`,
    149: `84`,
    15: `5`,
    150: `85`,
    151: `85`,
    152: `86`,
    153: `87`,
    154: `89`,
    155: `90`,
    156: `90`,
    157: `90`,
    158: `91`,
    159: `91`,
    16: `5`,
    160: `92`,
    161: `92`,
    162: `93`,
    163: `94`,
    164: `94`,
    165: `95`,
    166: `95`,
    167: `96`,
    168: `97`,
    169: `97`,
    17: `5`,
    170: `98`,
    171: `98`,
    172: `98`,
    173: `98`,
    174: `98`,
    175: `98`,
    176: `99`,
    177: `99`,
    178: `100`,
    179: `101`,
    18: `6`,
    180: `102`,
    181: `104`,
    182: `104`,
    183: `105`,
    184: `105`,
    185: `105`,
    186: `106`,
    187: `106`,
    188: `107`,
    189: `107`,
    19: `7`,
    190: `107`,
    191: `111`,
    192: `111`,
    193: `112`,
    194: `112`,
    195: `113`,
    196: `114`,
    197: `115`,
    198: `116`,
    199: `116`,
    2: `2`,
    20: `8`,
    200: `117`,
    201: `117`,
    202: `117`,
    203: `119`,
    204: `120`,
    205: `120`,
    206: `121`,
    207: `122`,
    208: `124`,
    209: `125`,
    21: `9`,
    210: `125`,
    211: `125`,
    212: `126`,
    213: `126`,
    214: `127`,
    215: `127`,
    216: `128`,
    217: `129`,
    218: `129`,
    219: `130`,
    22: `10`,
    220: `130`,
    221: `131`,
    222: `132`,
    223: `133`,
    224: `133`,
    225: `134`,
    226: `134`,
    227: `134`,
    228: `134`,
    229: `134`,
    23: `11`,
    230: `134`,
    231: `135`,
    232: `135`,
    233: `136`,
    234: `137`,
    235: `138`,
    236: `138`,
    237: `139`,
    238: `139`,
    239: `139`,
    24: `11`,
    240: `140`,
    241: `141`,
    242: `143`,
    243: `143`,
    244: `144`,
    245: `144`,
    246: `144`,
    247: `145`,
    248: `145`,
    249: `146`,
    25: `12`,
    250: `146`,
    251: `147`,
    252: `148`,
    253: `151`,
    254: `151`,
    255: `153`,
    256: `153`,
    257: `154`,
    258: `154`,
    259: `154`,
    26: `13`,
    260: `156`,
    261: `156`,
    262: `157`,
    263: `157`,
    264: `158`,
    265: `159`,
    266: `161`,
    267: `161`,
    268: `161`,
    269: `163`,
    27: `14`,
    270: `164`,
    271: `164`,
    272: `165`,
    273: `165`,
    274: `166`,
    275: `166`,
    276: `166`,
    277: `167`,
    278: `167`,
    279: `167`,
    28: `14`,
    280: `169`,
    281: `169`,
    282: `169`,
    283: `170`,
    284: `170`,
    285: `170`,
    286: `170`,
    287: `172`,
    288: `172`,
    289: `173`,
    29: `15`,
    290: `174`,
    291: `174`,
    292: `175`,
    293: `175`,
    294: `175`,
    295: `176`,
    296: `176`,
    297: `177`,
    298: `177`,
    299: `177`,
    3: `2`,
    30: `16`,
    300: `179`,
    301: `179`,
    302: `179`,
    303: `180`,
    304: `180`,
    305: `180`,
    306: `181`,
    307: `181`,
    308: `182`,
    309: `182`,
    31: `18`,
    310: `182`,
    311: `184`,
    312: `184`,
    313: `184`,
    314: `185`,
    315: `185`,
    316: `185`,
    317: `186`,
    318: `186`,
    319: `187`,
    32: `18`,
    320: `187`,
    321: `187`,
    322: `189`,
    323: `190`,
    324: `190`,
    325: `191`,
    326: `192`,
    327: `193`,
    328: `194`,
    329: `194`,
    33: `18`,
    330: `195`,
    331: `196`,
    332: `197`,
    333: `198`,
    334: `198`,
    335: `199`,
    336: `200`,
    337: `201`,
    338: `202`,
    339: `202`,
    34: `18`,
    340: `203`,
    341: `204`,
    342: `205`,
    343: `205`,
    344: `205`,
    345: `206`,
    346: `206`,
    347: `207`,
    348: `208`,
    349: `209`,
    35: `18`,
    350: `210`,
    351: `210`,
    352: `210`,
    353: `212`,
    354: `212`,
    355: `213`,
    356: `214`,
    357: `215`,
    358: `217`,
    359: `217`,
    36: `18`,
    360: `217`,
    361: `219`,
    362: `220`,
    363: `220`,
    364: `221`,
    365: `222`,
    366: `222`,
    367: `223`,
    368: `223`,
    369: `224`,
    37: `18`,
    370: `224`,
    371: `225`,
    372: `226`,
    373: `228`,
    374: `229`,
    375: `231`,
    376: `232`,
    377: `233`,
    378: `234`,
    379: `234`,
    38: `18`,
    380: `235`,
    381: `235`,
    382: `236`,
    383: `236`,
    384: `236`,
    385: `237`,
    386: `239`,
    387: `240`,
    388: `241`,
    389: `241`,
    39: `18`,
    390: `241`,
    391: `242`,
    392: `243`,
    393: `243`,
    394: `244`,
    395: `244`,
    396: `244`,
    397: `245`,
    398: `247`,
    399: `248`,
    4: `2`,
    40: `18`,
    400: `248`,
    401: `249`,
    402: `251`,
    403: `252`,
    404: `253`,
    405: `254`,
    406: `255`,
    407: `255`,
    408: `256`,
    409: `257`,
    41: `18`,
    410: `258`,
    411: `259`,
    412: `261`,
    413: `261`,
    414: `262`,
    415: `262`,
    416: `263`,
    417: `264`,
    418: `265`,
    419: `265`,
    42: `18`,
    420: `265`,
    421: `266`,
    422: `266`,
    423: `266`,
    424: `268`,
    425: `269`,
    426: `269`,
    427: `269`,
    428: `272`,
    429: `272`,
    43: `18`,
    430: `273`,
    431: `273`,
    432: `274`,
    433: `275`,
    434: `276`,
    435: `277`,
    436: `277`,
    437: `278`,
    438: `279`,
    439: `279`,
    44: `18`,
    440: `280`,
    441: `280`,
    442: `281`,
    443: `281`,
    444: `282`,
    445: `283`,
    446: `284`,
    447: `284`,
    448: `285`,
    449: `286`,
    45: `18`,
    450: `287`,
    451: `288`,
    452: `288`,
    453: `289`,
    454: `290`,
    455: `291`,
    456: `293`,
    457: `294`,
    458: `294`,
    459: `295`,
    46: `18`,
    47: `18`,
    48: `19`,
    49: `19`,
    5: `2`,
    50: `19`,
    51: `20`,
    52: `20`,
    53: `20`,
    54: `20`,
    55: `20`,
    56: `20`,
    57: `20`,
    58: `20`,
    59: `22`,
    6: `2`,
    60: `24`,
    61: `24`,
    62: `25`,
    63: `25`,
    64: `26`,
    65: `26`,
    66: `27`,
    67: `28`,
    68: `29`,
    69: `29`,
    7: `2`,
    70: `30`,
    71: `30`,
    72: `31`,
    73: `32`,
    74: `33`,
    75: `33`,
    76: `34`,
    77: `34`,
    78: `34`,
    79: `34`,
    8: `2`,
    80: `34`,
    81: `34`,
    82: `35`,
    83: `35`,
    84: `36`,
    85: `37`,
    86: `38`,
    87: `38`,
    88: `39`,
    89: `40`,
    9: `2`,
    90: `41`,
    91: `43`,
    92: `43`,
    93: `44`,
    94: `44`,
    95: `44`,
    96: `46`,
    97: `46`,
    98: `47`,
    99: `47`
    },
  appClear: `CA==`,
  appClearMap: {
    },
  companionInfo: null,
  extraPages: 0,
  stateKeys: 1,
  stateSize: 40,
  unsupported: [],
  version: 13,
  warnings: []
  };
const _ETH = {
  ABI: `[{"inputs":[{"components":[{"internalType":"uint256","name":"elem0","type":"uint256"},{"internalType":"uint256","name":"elem1","type":"uint256"}],"internalType":"struct T0","name":"v130","type":"tuple"}],"stateMutability":"payable","type":"constructor"},{"inputs":[{"internalType":"uint256","name":"msg","type":"uint256"}],"name":"ReachError","type":"error"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"_who","type":"address"},{"components":[{"internalType":"uint256","name":"elem0","type":"uint256"},{"internalType":"uint256","name":"elem1","type":"uint256"}],"indexed":false,"internalType":"struct T0","name":"_a","type":"tuple"}],"name":"_reach_e0","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"_who","type":"address"},{"components":[{"internalType":"uint256","name":"elem0","type":"uint256"}],"indexed":false,"internalType":"struct T2","name":"_a","type":"tuple"}],"name":"_reach_e1","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"_who","type":"address"},{"components":[{"internalType":"uint256","name":"elem0","type":"uint256"},{"components":[{"internalType":"bytes32","name":"elem0","type":"bytes32"},{"internalType":"bytes32","name":"elem1","type":"bytes32"},{"internalType":"bytes32","name":"elem2","type":"bytes32"},{"internalType":"bytes32","name":"elem3","type":"bytes32"}],"internalType":"struct T3","name":"elem1","type":"tuple"}],"indexed":false,"internalType":"struct T4","name":"_a","type":"tuple"}],"name":"_reach_e2","type":"event"},{"stateMutability":"payable","type":"fallback"},{"inputs":[],"name":"_reachCreationTime","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"_reachCurrentState","outputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"bytes","name":"","type":"bytes"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"_reachCurrentTime","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"components":[{"internalType":"uint256","name":"elem0","type":"uint256"}],"internalType":"struct T2","name":"v133","type":"tuple"}],"name":"_reachp_1","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"payable","type":"function"},{"inputs":[{"components":[{"internalType":"uint256","name":"elem0","type":"uint256"},{"components":[{"internalType":"bytes32","name":"elem0","type":"bytes32"},{"internalType":"bytes32","name":"elem1","type":"bytes32"},{"internalType":"bytes32","name":"elem2","type":"bytes32"},{"internalType":"bytes32","name":"elem3","type":"bytes32"}],"internalType":"struct T3","name":"elem1","type":"tuple"}],"internalType":"struct T4","name":"v136","type":"tuple"}],"name":"_reachp_2","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"payable","type":"function"},{"stateMutability":"payable","type":"receive"}]`,
  Bytecode: `0x608080604052604081610a56803803809161001a82856102d8565b8339810103126102b957602060405191610033836102bd565b805183520151602080830191825243600355604051919291908101906001600160401b0382118183101761025d575f916040525260ff600454166102a5577f6de3f97962105ba8e929dd0da178e54f00336c9ea6154699025bad3d4f17547f60606040513381528351602082015284516040820152a1518015908115610299575b5015610285573461027157604051906100cc826102bd565b60208201915f835233905251815260015f554360015560405190336020830152516040820152604081526101016060826102d8565b80516001600160401b03811161025d57600254600181811c91168015610253575b602082101461023f57601f81116101dc575b50602091601f821160011461017c579181925f92610171575b50508160011b915f199060031b1c1916176002555b60405161075a90816102fc8239f35b015190505f8061014d565b601f1982169260025f52805f20915f5b8581106101c4575083600195106101ac575b505050811b01600255610162565b01515f1960f88460031b161c191690555f808061019e565b9192602060018192868501518155019401920161018c565b60025f527f405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5ace601f830160051c81019160208410610235575b601f0160051c01905b81811061022a5750610134565b5f815560010161021d565b9091508190610214565b634e487b7160e01b5f52602260045260245ffd5b90607f1690610122565b634e487b7160e01b5f52604160045260245ffd5b63100960cb60e01b5f52600960045260245ffd5b63100960cb60e01b5f52600860045260245ffd5b9050600154145f6100b4565b63100960cb60e01b5f52600760045260245ffd5b5f80fd5b604081019081106001600160401b0382111761025d57604052565b601f909101601f19168101906001600160401b0382119082101761025d5760405256fe608080604052600436101561001a575b50361561001857005b005b5f3560e01c9081631e93b0f11461058e57508063573b85101461034057806357a58e18146100d057806383230757146100b35763ab53f2c61461005d575f61000f565b346100af575f3660031901126100af575f546060610079610639565b91602060405193849283526040828401528051918291826040860152018484015e5f828201840152601f01601f19168101030190f35b5f80fd5b346100af575f3660031901126100af576020600154604051908152f35b60a03660031901126100af575f6040516100e9816105a8565b526040516100f6816105c3565b600435815260803660231901126100af5760405190608082016001600160401b0381118382101761032c5760405260243582526044356020830152606435604083015260843560608301526020810191825260025f54036103185761016b61015c610639565b602080825183010191016106dd565b9160ff600454166103045760c07f3380acc111c840aea9ad8d1987b32a3eb2bf2736fb9b69768ab6c1c26ed72b379160606040519133835285516020840152518051604084015260208101518284015260408101516080840152015160a0820152a15180159081156102f8575b50156102e457346102d0578051336001600160a01b03909116036102bc575f80808093602060018060a01b03825116910151908282156102b3575bf1156102a8575f80555f60015561022b600254610601565b8061023b575b60206040515f8152f35b601f811160011461025257505f6002555b80610231565b60025f5261029590601f0160051c5f8051602061072e833981519152017f405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5acf610717565b60025f525f60208120816002555561024c565b6040513d5f823e3d90fd5b506108fc610213565b63100960cb60e01b5f52601260045260245ffd5b63100960cb60e01b5f52601160045260245ffd5b63100960cb60e01b5f52601060045260245ffd5b905060015414826101d8565b63100960cb60e01b5f52600f60045260245ffd5b63100960cb60e01b5f52600e60045260245ffd5b634e487b7160e01b5f52604160045260245ffd5b60203660031901126100af575f604051610359816105a8565b52604051610366816105a8565b600435815260015f540361057a5761037f61015c610639565b9060ff60045416610566577fcf0e8bec53cd91fa87ecf8f6f405ac75914a22acdb92a3553ee5c294fee815966040805133815283516020820152a151801590811561055a575b50156105465760208101908151340361053257604051916103e5836105c3565b5f835260208301915f835260018060a01b0390511680935251815260025f5543600155604051916020830152516040820152604081526104266060826105de565b80516001600160401b03811161032c57610441600254610601565b601f81116104ec575b50602091601f821160011461048c579181925f92610481575b50508160011b915f199060031b1c19161760025560206040515f8152f35b015190508280610463565b601f1982169260025f52805f20915f5b8581106104d4575083600195106104bc575b505050811b01600255610231565b01515f1960f88460031b161c191690558280806104ae565b9192602060018192868501518155019401920161049c565b60025f52610522905f8051602061072e833981519152601f840160051c81019160208510610528575b601f0160051c0190610717565b8261044a565b9091508190610515565b63100960cb60e01b5f52600d60045260245ffd5b63100960cb60e01b5f52600c60045260245ffd5b905060015414826103c5565b63100960cb60e01b5f52600b60045260245ffd5b63100960cb60e01b5f52600a60045260245ffd5b346100af575f3660031901126100af576020906003548152f35b602081019081106001600160401b0382111761032c57604052565b604081019081106001600160401b0382111761032c57604052565b601f909101601f19168101906001600160401b0382119082101761032c57604052565b90600182811c9216801561062f575b602083101461061b57565b634e487b7160e01b5f52602260045260245ffd5b91607f1691610610565b604051905f826002549161064c83610601565b80835292600181169081156106be5750600114610672575b610670925003836105de565b565b5060025f90815290915f8051602061072e8339815191525b8183106106a257505090602061067092820101610664565b602091935080600191548385890101520191019091849261068a565b6020925061067094915060ff191682840152151560051b820101610664565b908160409103126100af57604051906106f5826105c3565b8051906001600160a01b03821682036100af5760209183520151602082015290565b818110610722575050565b5f815560010161071756fe405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5acea164736f6c634300081a000a`,
  BytecodeLen: 2646,
  version: 9,
  views: {
    }
  };
export const _stateSourceMap = {
  1: {
    at: './index.rsh:18:11:after expr stmt semicolon',
    fs: [],
    msg: null,
    who: 'Module'
    },
  2: {
    at: './index.rsh:23:11:after expr stmt semicolon',
    fs: [],
    msg: null,
    who: 'Module'
    },
  3: {
    at: './index.rsh:29:11:after expr stmt semicolon',
    fs: [],
    msg: null,
    who: 'Module'
    }
  };
export const _Connectors = {
  ALGO: _ALGO,
  ETH: _ETH
  };
export const _Participants = {
  "Alice": Alice,
  "Bob": Bob
  };
export const _APIs = {
  };
