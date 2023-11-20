# ND NuSyst

## Install

### Setups

```
export mywd=`pwd` ## working directory

source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh

## GENIE
setup genie v3_04_00d -q e26:prof
setup genie_xsec v3_04_00 -qAR2320i00000:e1000:k250

## cmake
setup cmake v3_21_4

## duneanaobj
setup duneanaobj v03_02_01 -q e26:prof
```

### Install fhicl

```
setup boost v1_80_0 -q e26:prof
setup tbb v2021_7_0 -q e26
setup sqlite v3_39_02_00

mkdir fhicl-cpp-standalone; cd fhicl-cpp-standalone;
git clone git@github.com:art-framework-suite/fhicl-cpp-standalone.git fhicl-cpp-standalone-src
mkdir build; cd build/
cmake ../fhicl-cpp-standalone-src
make -j4

## Now set environmental varaibles

export fhiclcpp_ROOT=${mywd}/fhicl-cpp-standalone/build/fhicl-cpp-install/
export PATH=${fhiclcpp_ROOT}/bin/:${PATH}
export LD_LIBRARY_PATH=${fhiclcpp_ROOT}/lib/:${LD_LIBRARY_PATH}

export cetlib_ROOT=${mywd}/fhicl-cpp-standalone/build/cetlib-install/
export PATH=${cetlib_ROOT}/bin/:${PATH}
export LD_LIBRARY_PATH=${cetlib_ROOT}/lib/:${LD_LIBRARY_PATH}

export cetlib_except_ROOT=${mywd}/fhicl-cpp-standalone/build/cetlib-except-install/
export PATH=${cetlib_except_ROOT}/bin/:${PATH}
export LD_LIBRARY_PATH=${cetlib_except_ROOT}/lib/:${LD_LIBRARY_PATH}

export hep_concurrency_ROOT=${mywd}/fhicl-cpp-standalone/build/hep-concurrency-install
export PATH=${hep_concurrency_ROOT}/bin/:${PATH}
export LD_LIBRARY_PATH=${hep_concurrency_ROOT}/lib/:${LD_LIBRARY_PATH}
```

### Install nusystematics

```
cd ${mywd}
mkdir nusystematics; cd nusystematics;
git clone git@github.com:jedori0228/nusystematics.git nusystematics-src
mkdir build; cd build
cmake ../nusystematics-src/
make install -j4

## Now set environmental varaibles
source ${mywd}/nusystematics/build/Linux/bin/setup.nusystematics.sh
```

### Install NDNuSyst

```
cd ${mywd}
mkdir ndnusyst; cd ndnusyst;
git clone git@github.com:jedori0228/NDNuSyst.git ndnusyst-src
mkdir build; cd build
cmake ../ndnusyst-src/
make install -j4

## Now set environmental varaibles
export PATH=${mywd}/ndnusyst/build/Linux/bin:${PATH}
```
