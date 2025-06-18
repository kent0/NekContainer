# Setup script for Nek container


alias cnekrun='docker run -v "$(pwd)":/root/udir nek:latest bash'
# run non-interactive commands from inside the Nek container
# usage: cnekrun -c 'echo hello world'


alias cnekruni='docker run -it -v "$(pwd)":/root/udir nek:latest bash'
# run interactive commands from inside the Nek container
# usage: cnekruni # for interactive session
#        cnekruni -c top


# convenience wrappers for nek commands

NEKR_BIN=/root/Developer/NekROM/bin
NEK_BIN=/root/Developer/Nek5000/bin

alias cn2to3='cnekruni -c "$NEK_BIN/n2to3"'
alias cgenmap='cnekruni -c "$NEK_BIN/genmap"'
alias cgenbox='cnekruni -c "$NEK_BIN/genbox"'

cmakenek() { cnekruni -c "$NEK_BIN/makenek $1"; }
cmakerom() { cnekruni -c "source ~/.bashrc && $NEKR_BIN/makerom $1"; }

cnekmpi()  {  cnekruni -c "$NEK_BIN/nekmpi  $1 $2";  }
cneklmpi() {  cnekruni -c "$NEK_BIN/neklmpi $1 $2";  }
cnekbmpi() { (cnekrun  -c "$NEK_BIN/neklmpi $1 $2"&) }


# convenience functions

cnek1() { cnekmpi $1 1; }
cnek2() { cnekmpi $1 2; }
cnek4() { cnekmpi $1 4; }
cnek8() { cnekmpi $1 8; }

cnekl1() { cneklmpi $1 1; }
cnekl2() { cneklmpi $1 2; }
cnekl4() { cneklmpi $1 4; }
cnekl8() { cneklmpi $1 8; }

cnekb1() { cnekbmpi $1 1; }
cnekb2() { cnekbmpi $1 2; }
cnekb4() { cnekbmpi $1 4; }
cnekb8() { cnekbmpi $1 8; }
