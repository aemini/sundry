#!/bin/bash
LINES=24
COLUMNS=80

NYAN=('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
'bbmmbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
'mmbbmmbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
'bbmmbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbb'
'bbbbbbccccccccccccccccbbbbbbbbbbbbbbbbccccccccccccccaakkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkaabbbbbbbbbbbbbbbbbb'
'ccccccccccccccccccccccccccccccccccccccccccccccccccaakkkkkkllllllllllllllllllllllllllkkkkkkaabbbbbbbbbbbbbbbb'
'ccccccccccccccccccccccccccccccccccccccccccccccccccaakkkkllllllllllllhhllllhhllllllllllkkkkaabbbbbbbbbbbbbbbb'
'cccccceeeeeeeeeeeeeeeecccccccccccccccceeeeeeeeeeeeaakkllllhhllllllllllllllllllllllllllllkkaabbbbbbbbbbbbbbbb'
'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaakkllllllllllllllllllllaaaallllhhllllkkaabbaaaabbbbbbbbbb'
'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaakkllllllllllllllllllaajjjjaallllllllkkaaaajjjjaabbbbbbbb'
'eeeeeeffffffffffffffffeeeeeeeeeeeeeeeeaaaaaaaaffffaakkllllllllllllhhllllaajjjjjjaallllllkkaajjjjjjaabbbbbbbb'
'ffffffffffffffffffffffffffffffffffffffaajjjjaaaaffaakkllllllllllllllllllaajjjjjjjjaaaaaaaajjjjjjjjaabbbbbbbb'
'ffffffffffffffffffffffffffffffffffffffaaaajjjjaaaaaakkllllllhhllllllllllaajjjjjjjjjjjjjjjjjjjjjjjjaabbbbbbbb'
'ffffffddddddddddddddddffffffffffffffffddaaaajjjjaaaakkllllllllllllllhhaajjjjjjjjjjjjjjjjjjjjjjjjjjjjaabbbbbb'
'ddddddddddddddddddddddddddddddddddddddddddaaaajjjjaakkllhhllllllllllllaajjjjjjmmaajjjjjjjjjjmmaajjjjaabbbbbb'
'ddddddddddddddddddddddddddddddddddddddddddddaaaaaaaakkllllllllllllllllaajjjjjjaaaajjjjjjaajjaaaajjjjaabbbbbb'
'ddddddiiiiiiiiiiiiiiiiddddddddddddddddiiiiiiiiiiaaaakkllllllllllhhllllaajjnnnnjjjjjjjjjjjjjjjjjjnnnnaabbbbbb'
'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiaakkkkllhhllllllllllaajjnnnnjjaajjjjaajjjjaajjnnnnaabbbbbb'
'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiaakkkkkkllllllllllllllaajjjjjjaaaaaaaaaaaaaajjjjaabbbbbbbb'
'iiiiiiggggggggggggggggmmiiiiiiiiiiiiiiggggggggggaaaaaakkkkkkkkkkkkkkkkkkkkaajjjjjjjjjjjjjjjjjjjjaabbbbbbbbbb'
'ggggggggggggggggggggggggggggggggggggggggggggggaajjjjjjaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbb'
'ggggggggggggggggggggggggggggggggggggggggggggggaajjjjaaaabbaajjjjaabbbbbbbbbbaajjjjaabbaajjjjaabbbbbbbbbbbbbb'
'ggggggbbbbbbbbbbmmbbbbggggggmmggggggggbbbbbbbbaaaaaaaabbbbaaaaaabbbbbbbbbbbbbbaaaaaabbbbaaaabbbbbbbbbbbbbbbb'
'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
'bbbbbbbbbbbbbbbbbbbbbbmmbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb')

declare -A COL
COL=([a]=16 [b]=24 [c]=196 [d]=82 [e]=208 [f]=226 [g]=63 [h]=200 [i]=33 [j]=246 [k]=222 [l]=213 [m]=231 [n]=210 [o]=-1)

declare -A PALETTE
PALETTE=([16]="0000/0000/0000"
         [24]="0000/3333/6666"
        [196]="FFFF/0000/0000"
         [82]="3333/FFFF/0000"
        [208]="FFFF/9999/0000"
        [226]="FFFF/FFFF/0000"
         [63]="6666/3333/FFFF"
        [200]="FFFF/3333/9999"
         [33]="0000/9999/FFFF"
        [246]="9999/9999/9999"
        [222]="FFFF/CCCC/9999"
        [213]="FFFF/9999/FFFF"
        [231]="FFFF/FFFF/FFFF"
        [210]="FFFF/9999/9999")

for color in ${COL[@]}; do
 echo -en "\033]4;$color;rgb:${PALETTE[$color]}\033\\"
done

PIXEL=" "
SAVECURSOR=$'\0337'
HIDECURSOR=$'\033[?25l'
RESTORECURSOR=$'\0338\033[?12;25h'
QUERYCURSOR=$'\033[6n'

YOFFSET=$(((28-LINES)/2))
YOFFSET=$[ $YOFFSET > 0 ? $YOFFSET+1 : 0 ]
XOFFSET=$((108-COLUMNS))
XOFFSET=$[ $XOFFSET > 0 ? $XOFFSET : 0 ]
CHAR+=${PIXEL}

CACHE=$(mktemp -d --suffix __NYANCAT)

trap 'exit 1' INT TERM
trap 'rm -rf "${CACHE}"; echo -n $RESTORECURSOR' EXIT

#echo -n $HIDECURSOR

for ((y=YOFFSET; y<28-YOFFSET; y++)); do
	oldpixel=-1
	for ((x=XOFFSET; x<108; x++)); do
		pixel=${NYAN[y]:x:1}
		if [[ $pixel == $oldpixel ]]; then
			echo -n "$CHAR"
		else
			echo -en "\033[0;48;5;${COL[${pixel}]}m$CHAR"
		fi
		oldpixel=$pixel
	done
	echo $'\033[0m'
done

stty -echo -icanon
echo -n $QUERYCURSOR 1>&2
read -s -dR POS
stty echo icanon

CURSORHOME=$((${POS:2:${#POS}-4} - y))
echo  -n $SAVECURSOR
echo -n $RESTORECURSOR
