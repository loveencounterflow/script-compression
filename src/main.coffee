
###
http://www.gernot-katzers-spice-pages.com/var/korean_hangul_unicode.html

Number  Lead  Jamo  Character
reference
1 G ᄀ ㄱ &#x1100;
2 GG  ᄁ ㄲ &#x1101;
3 N ᄂ ㄴ &#x1102;
4 D ᄃ ㄷ &#x1103;
5 DD  ᄄ ㄸ &#x1104;
6 R ᄅ ㄹ &#x1105;
7 M ᄆ ㅁ &#x1106;
8 B ᄇ ㅂ &#x1107;
9 BB  ᄈ ㅃ &#x1108;
10  S ᄉ ㅅ &#x1109;
11  SS  ᄊ ㅆ &#x110A;
12    ᄋ ㅇ &#x110B;
13  J ᄌ ㅈ &#x110C;
14  JJ  ᄍ ㅉ &#x110D;
15  C ᄎ ㅊ &#x110E;
16  K ᄏ ㅋ &#x110F;
17  T ᄐ ㅌ &#x1110;
18  P ᄑ ㅍ &#x1111;
19  H ᄒ ㅎ &#x1112;

Number  Vowel Jamo  Character
reference
1 A ᅡ ㅏ &#x1161;
2 AE  ᅢ ㅐ &#x1162;
3 YA  ᅣ ㅑ &#x1163;
4 YAE ᅤ ㅒ &#x1164;
5 EO  ᅥ ㅓ &#x1165;
6 E ᅦ ㅔ &#x1166;
7 YEO ᅧ ㅕ &#x1167;
8 YE  ᅨ ㅖ &#x1168;
9 O ᅩ ㅗ &#x1169;
10  WA  ᅪ ㅘ &#x116A;
11  WAE ᅫ ㅙ &#x116B;
12  OE  ᅬ ㅚ &#x116C;
13  YO  ᅭ ㅛ &#x116D;
14  U ᅮ ㅜ &#x116E;
15  WEO ᅯ ㅝ &#x116F;
16  WE  ᅰ ㅞ &#x1170;
17  WI  ᅱ ㅟ &#x1171;
18  YU  ᅲ ㅠ &#x1172;
19  EU  ᅳ ㅡ &#x1173;
20  YI  ᅴ ㅢ &#x1174;
21  I ᅵ ㅣ &#x1175;

Number  Tail  Jamo  Character
reference
1 G ᆨ ㄱ &#x11A8;
2 GG  ᆩ ㄲ &#x11A9;
3 GS  ᆪ ㄳ &#x11AA;
4 N ᆫ ㄴ &#x11AB;
5 NJ  ᆬ ㄵ &#x11AC;
6 NH  ᆭ ㄶ &#x11AD;
7 D ᆮ ㄷ &#x11AE;
8 L ᆯ ㄹ &#x11AF;
9 LG  ᆰ ㄺ &#x11B0;
10  LM  ᆱ ㄻ &#x11B1;
11  LB  ᆲ ㄼ &#x11B2;
12  LS  ᆳ ㄽ &#x11B3;
13  LT  ᆴ ㄾ &#x11B4;
14  LP  ᆵ ㄿ &#x11B5;
15  LH  ᆶ ㅀ &#x11B6;
16  M ᆷ ㅁ &#x11B7;
17  B ᆸ ㅂ &#x11B8;
18  BS  ᆹ ㅄ &#x11B9;
19  S ᆺ ㅅ &#x11BA;
20  SS  ᆻ ㅆ &#x11BB;
21  NG  ᆼ ㅇ &#x11BC;
22  J ᆽ ㅈ &#x11BD;
23  C ᆾ ㅊ &#x11BE;
24  K ᆿ ㅋ &#x11BF;
25  T ᇀ ㅌ &#x11C0;
26  P ᇁ ㅍ &#x11C1;
27  H ᇂ ㅎ &#x11C2;


###

############################################################################################################
CND                       = require 'cnd'
rpr                       = CND.rpr
badge                     = 'SCRIPTCOMPRESSION'
debug                     = CND.get_logger 'debug',     badge
alert                     = CND.get_logger 'alert',     badge
whisper                   = CND.get_logger 'whisper',   badge
warn                      = CND.get_logger 'warn',      badge
help                      = CND.get_logger 'help',      badge
urge                      = CND.get_logger 'urge',      badge
info                      = CND.get_logger 'info',      badge
echo                      = CND.echo.bind CND
#...........................................................................................................
HT                        = require 'hangul-tools'




decompose_hangeul = ( text ) ->
  chrs  = Array.from text.normalize 'NFC'
  R     = ''
  ### TAINT inefficient, but probably good enough ###
  for chr in chrs
    for sub_chr in HT.disintegrate chr
      sub_chr = sub_chr.replace /ㄲ/g, 'ㄱㄱ'
      sub_chr = sub_chr.replace /ㄸ/g, 'ㄷㄷ'
      sub_chr = sub_chr.replace /ㅃ/g, 'ㅂㅂ'
      sub_chr = sub_chr.replace /ㅆ/g, 'ㅅㅅ'
      sub_chr = sub_chr.replace /ㅉ/g, 'ㅈㅈ'
      sub_chr = sub_chr.replace /ㅘ/g, 'ㅗㅏ'
      sub_chr = sub_chr.replace /ㅙ/g, 'ㅗㅐ'
      sub_chr = sub_chr.replace /ㅚ/g, 'ㅗㅣ'
      sub_chr = sub_chr.replace /ㅝ/g, 'ㅜㅓ'
      sub_chr = sub_chr.replace /ㅞ/g, 'ㅜㅔ'
      sub_chr = sub_chr.replace /ㅟ/g, 'ㅜㅣ'
      sub_chr = sub_chr.replace /ㅢ/g, 'ㅡㅣ'
      sub_chr = sub_chr.replace /ㄳ/g, 'ㄱㅅ'
      sub_chr = sub_chr.replace /ㄵ/g, 'ㄴㅈ'
      sub_chr = sub_chr.replace /ㄶ/g, 'ㄴㅎ'
      sub_chr = sub_chr.replace /ㄺ/g, 'ㄹㄱ'
      sub_chr = sub_chr.replace /ㄻ/g, 'ㄹㅁ'
      sub_chr = sub_chr.replace /ㄼ/g, 'ㄹㅂ'
      sub_chr = sub_chr.replace /ㄽ/g, 'ㄹㅅ'
      sub_chr = sub_chr.replace /ㄾ/g, 'ㄹㅌ'
      sub_chr = sub_chr.replace /ㄿ/g, 'ㄹㅍ'
      sub_chr = sub_chr.replace /ㅀ/g, 'ㄹㅎ'
      sub_chr = sub_chr.replace /ㅄ/g, 'ㅂㅅ'
      ### these replacements go beyond what is most often thought of as 'letters': ###
      sub_chr = sub_chr.replace /ㅐ/g, 'ㅏㅣ'
      sub_chr = sub_chr.replace /ㅒ/g, 'ㅑㅣ'
      sub_chr = sub_chr.replace /ㅔ/g, 'ㅓㅣ'
      sub_chr = sub_chr.replace /ㅖ/g, 'ㅕㅣ'
      R += sub_chr
  return Array.from R



###
각
[ 'ᄀ', 'ᅡ', 'ᆨ' ]
coffee> ( Array.from d.normalize 'NFC' )
[ '각' ]
[ 'ᄋ', 'ᅪ' ]
coffee> Array.from d
[ '와' ]
###

# d = '각'
# d = '와'
# debug Array.from d
# debug Array.from d.normalize 'NFD'
# debug Array.from decompose_hangeul d
# d = 'ㅘ'
# debug ( ( chr.codePointAt 0 ).toString 16 for chr in Array.from d )
# d = '\u3131'
# debug ( ( chr.codePointAt 0 ).toString 16 for chr in Array.from d )
# debug ( ( chr.codePointAt 0 ).toString 16 for chr in Array.from d.normalize 'NFD' )

# 0x1100 0x11ff ### combining     ###
# 0x3130 0x318f ### compatibility ###

# for cid in [ 0x314f .. 0x3163 ]
#   help String.fromCodePoint cid

as_hex      = ( n ) -> '0x' + n.toString 16
chr_as_hex  = ( chr ) -> as_hex chr.codePointAt 0


texts = [
  '각'
  '와'
  '노드.제이에스'
  '문자열'
  '공백이나 초성, 중성, 기타 문자들이 들어가'
  'ㅏ'
  'ㅐ'
  'ㅑ'
  'ㅒ'
  'ㅓ'
  'ㅔ'
  'ㅕ'
  'ㅖ'
  'ㅗ'
  'ㅘ'
  'ㅙ'
  'ㅚ'
  'ㅛ'
  'ㅜ'
  'ㅝ'
  'ㅞ'
  'ㅟ'
  'ㅠ'
  'ㅡ'
  'ㅢ'
  'ㅣ'
  '유니코드 정규화는 모양이 같은 여러 문자들이 있을'
  '*훯'
  ### three conjoining Jamo (H+WEO+LH) 훯 ###
  '*훯'
  ### Hangul HWEO 훠 plus tail Jamo LH ㅀ ###
  '*훯'
  ### three Compatibility Jamo ㅎㅝㅀ ###
  '*ㅎㅝㅀ'
  ]
for text in texts
  if text.startsWith '*'
    text = text[ 1 .. ]
    for chr in Array.from text
      info chr, chr_as_hex chr
    for chr in Array.from decompose_hangeul text
      urge '  ', chr, chr_as_hex chr
  else
    help ( rpr text ), ( CND.white ( Array.from decompose_hangeul text ).join '' )

# d = 'ᅡㅏ'
# debug ( ( chr.codePointAt 0 ).toString 16 for chr in Array.from decompose_hangeul d )


texts =
  en:   """All human beings are born free and equal in dignity and rights. They are endowed with reason and conscience and should act towards one another in a spirit of brotherhood."""
  cns: """人人生而自由,在尊严和权利上一律平等。他们赋有理性和良心,并应以兄弟关系的精神相对待。"""
  fin: """Kaikki ihmiset syntyvät vapaina ja tasavertaisina arvoltaan ja oikeuksiltaan. Heille on annettu järki ja omatunto, ja heidän on toimittava toisiaan kohtaan veljeyden hengessä."""
  kor: """모든 인간은 태어날 때부터 자유로우며 그 존엄과 권리에 있어 동등하다. 인간은 천부적으로 이성과 양심을 부여받았으며 서로 형제애의 정신으로 행동하여야 한다."""
  jpn: """すべての人間は、生まれながらにして自由であり、かつ、尊厳と権利と について平等である。人間は、理性と良心とを授けられており、互いに同 胞の精神をもって行動しなければならない。"""


for language_marker, original_text of texts
  ### dcp: distinct code points ###
  original_chrs           = Array.from original_text
  original_length         = original_chrs.length
  original_dcp_count      = ( new Set original_chrs ).size
  transcoded_chrs         = decompose_hangeul original_text
  transcoded_length       = transcoded_chrs.length
  transcoded_dcp_count    = ( new Set transcoded_chrs ).size
  transcoded_text         = transcoded_chrs.join ''
  help "characters:   ", original_length,     '->', transcoded_length
  help "distinct CPs: ", original_dcp_count,  '->', transcoded_dcp_count
  help original_text
  help transcoded_text


