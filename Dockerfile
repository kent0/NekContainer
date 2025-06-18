   FROM ubuntu:22.04

   RUN apt-get update
   RUN apt-get install -y gcc gfortran mpich git vim make wget curl bash

   RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/kent0/Scripts/master/bootstrap)"

   ARG DEV=/root/Developer
   ARG NEK_SOURCE_ROOT=$DEV/Nek5000
   ARG NEK_BIN=$NEK_SOURCE_ROOT/bin

   RUN git clone https://github.com/kent0/Nek5000 /root/Developer/Nek5000
   RUN (cd $NEK_SOURCE_ROOT && git checkout prod && git remote add upstream https://github.com/Nek5000/Nek5000)

   RUN (cd $NEK_SOURCE_ROOT/tools && ./maketools genmap n2to3 reatore2 genbox)
   RUN (cd $NEK_SOURCE_ROOT/short_tests/eddy && cp SIZE.legacy SIZE && $NEK_BIN/makenek)

   RUN git clone https://github.com/kent0/NekROM -b setusr-fix $DEV/NekROM

#  RUN (cd ~/Developer/NekROM && git checkout 4a1f25a)
#  RUN (cd ~/Developer/Nek5000 && git checkout e24c5f9)
#  RUN (cd ~/Developer/Scripts && git pull)
#  RUN (cd ~/Developer/Dotfiles && git pull)

   RUN mkdir /root/udir
   WORKDIR /root/udir

   RUN echo "$NEK_BIN/genbox << Z" > $NEK_BIN/genboxs
   RUN echo '$1' >> $NEK_BIN/genboxs
   RUN echo 'Z' >> $NEK_BIN/genboxs
   RUN chmod +x $NEK_BIN/genboxs

   RUN echo "$NEK_BIN/genmap << Z" > $NEK_BIN/genmaps
   RUN echo '$1' >> $NEK_BIN/genmaps
   RUN echo '0.2' >> $NEK_BIN/genmaps
   RUN echo 'Z' >> $NEK_BIN/genmaps
   RUN chmod +x $NEK_BIN/genmaps

   ENV NEK_SOURCE_ROOT=$NEK_SOURCE_ROOT
   ENV NEK_BIN=$NEK_BIN

   ENV MOR_DIR=$DEV/NekROM
   ENV PATH=$PATH:$NEK_BIN:$MOR_DIR/bin

#  COPY genboxs $NEK_BIN/
#  COPY genmaps $NEK_BIN/
