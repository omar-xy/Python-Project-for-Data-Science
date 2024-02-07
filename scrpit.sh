MYPATH="/goinfre/$USER/miniconda3"
curl -LO "https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh"
sh Miniconda3-latest-MacOSX-x86_64.sh -b -p $MYPATH
$MYPATH/bin/conda init zsh
$MYPATH/bin/conda config --set auto_activate_base false
source ~/.zshrc


conda create --name 42AI-$USER python=3.7 jupyter pandas pycodestyle numpy
conda info --envs
conda activate 42AI-$USER
which python
python -V
python -c "print('Hello World!')"


#!/bin/bash
function which_dl {
# If operating system name contains Darwnin: MacOS. Else Linux
if uname -s | grep -iqF Darwin; then
echo "Miniconda3-latest-MacOSX-x86_64.sh"
else
echo "Miniconda3-latest-Linux-x86_64.sh"
fi
}
function which_shell {
# if $SHELL contains zsh, zsh. Else Bash
if echo $SHELL | grep -iqF zsh; then
echo "zsh"
else
echo "bash"
fi
}
function when_conda_exist {
# check and install 42AI environement
printf "Checking 42AI-$USER environment: "
if conda info --envs | grep -iqF 42AI-$USER; then
printf "\e[33mDONE\e[0m\n"
else
printf "\e[31mKO\e[0m\n"
printf "\e[33mCreating 42AI environnment:\e[0m\n"
conda update -n base -c defaults conda -y
conda create --name 42AI-$USER python=3.7 jupyter numpy pandas pycodestyle -y
fi
}
function set_conda {
MINICONDA_PATH="/goinfre/$USER/miniconda3"
CONDA=$MINICONDA_PATH"/bin/conda"
PYTHON_PATH=$(which python)
REQUIREMENTS="jupyter numpy pandas pycodestyle"
SCRIPT=$(which_dl)
MY_SHELL=$(which_shell)
DL_LINK="https://repo.anaconda.com/miniconda/"$SCRIPT
DL_LOCATION="/tmp/"
printf "Checking conda: "
TEST=$(conda -h 2>/dev/null)
if [ $? == 0 ] ; then
printf "\e[32mOK\e[0m\n"
when_conda_exist
return
fi
printf "\e[31mKO\e[0m\n"
if [ ! -f $DL_LOCATION$SCRIPT ]; then
printf "\e[33mDonwloading installer:\e[0m\n"
cd $DL_LOCATION
curl -LO $DL_LINK
cd -
fi
printf "\e[33mInstalling conda:\e[0m\n"
sh $DL_LOCATION$SCRIPT -b -p $MINICONDA_PATH
printf "\e[33mConda initial setup:\e[0m\n"
$CONDA init $MY_SHELL
$CONDA config --set auto_activate_base false
printf "\e[33mCreating 42AI-$USER environnment:\e[0m\n"
$CONDA update -n base -c defaults conda -y
$CONDA create --name 42AI-$USER python=3.7 jupyter numpy pandas pycodestyle -y
printf "\e[33mLaunch the following command or restart your shell:\e[0m\n"
if [ $MY_SHELL == "zsh" ]; then
printf "\tsource ~/.zshrc\n"
else
printf "\tsource ~/.bash_profile\n"
fi
}
pip install --upgrade pip
pip install -U numpy scipy scikit-learn
conda install scikit-learn
pip3 install matplotlib
pip3 install pandas
pip3 install pycodestyle
pip3 install beautifulsoup4



echo "alias py='/goinfre/$USER/miniconda3/envs/42AI-$USER/bin/python'" >>  /Users/$USER/.zshrc

set_conda
conda info --envs
conda activate 42AI-$USER
which python
conda install --name 42AI-$USER autopep8 -y
python -V
python -c "print('Hello World!')"


# ssh-keygen