# Setup script for Nek container


alias cnekrun='docker run -v "$(pwd)":/root/udir nek:latest bash'
# run non-interactive commands from inside the Nek container
# usage: cnekrun -c 'echo hello world'


alias cnekruni='docker run -it -v "$(pwd)":/root/udir nek:latest bash'
# run interactive commands from inside the Nek container
# usage: cnekruni # for interactive session
#        cnekruni -c top


# convenience wrappers for nek commands

alias cn2to3='cnekruni -c "~/Nek5000/bin/n2to3"'
alias cgenmap='cnekruni -c "~/Nek5000/bin/genmap"'
alias cgenbox='cnekruni -c "~/Nek5000/bin/genbox"'

cmakenek() { cnekruni -c "~/Nek5000/bin/makenek $1"; }
cmakerom() { cnekruni -c "source ~/.bashrc && ~/NekROM/bin/makerom $1"; }

cnekmpi()  {  cnekruni -c "~/Nek5000/bin/nekmpi  $1 $2";  }
cneklmpi() {  cnekruni -c "~/Nek5000/bin/neklmpi $1 $2";  }
cnekbmpi() { (cnekrun  -c "~/Nek5000/bin/neklmpi $1 $2"&) }


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
