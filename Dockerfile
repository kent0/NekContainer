   FROM ubuntu:22.04

   RUN apt-get update
   RUN apt-get install -y gcc gfortran mpich git vim make wget

   RUN git clone https://github.com/kent0/Nek5000 -b prod ~/Nek5000
   RUN (cd ~/Nek5000 && git checkout e24c5f9)

   RUN (cd ~/Nek5000/tools && ./maketools genmap n2to3 reatore2 genbox)
   RUN (cd ~/Nek5000/short_tests/eddy && cp SIZE.legacy SIZE && ../../bin/makenek eddy_uv)

   RUN git clone https://github.com/Nek5000/NekROM ~/NekROM
   RUN (cd ~/NekROM && git checkout 4c172ff)

   RUN echo 'export NEK_SOURCE_ROOT=/root/Nek5000' > ~/.bashrc
   RUN echo 'export PATH="$PATH:$NEK_SOURCE_ROOT/bin"' >> ~/.bashrc
   RUN echo 'export MOR_DIR=/root/NekROM' >> ~/.bashrc
   RUN echo 'export PATH="$PATH:$MOR_DIR/bin"' >> ~/.bashrc

   RUN mkdir /root/udir
   WORKDIR /root/udir
