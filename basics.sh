sudo apt-get install -y git-core fonts-firacode unzip

# Source Code Pro
wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
unzip 1.050R-it.zip
mkdir -p ~/.fonts
cp source-code-pro-*-it/OTF/*.otf ~/.fonts
fc-cache -f -v
