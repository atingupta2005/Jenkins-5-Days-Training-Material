# Trainer Tasks

## Convert Markdown to Jupyter Notebook
  - Use below tool:
    - https://pypi.org/project/notedown/
  - Commands
```
sudo apt install -y python3-venv
pip install virtualenv
python3 -m venv ~/mypythonvenv
source ~/mypythonvenv/bin/activate
pip install notedown
cd Jenkins-5-Days-Training-Material/Hands-On/7-Jenkins-in-Action/
notedown 1-A-Getting-Started-with-Jenkins.md > out.ipynb
pip install jupyter
jupyter notebook --ip=0.0.0.0
```

## Setup Shell in a Box (Access Ubuntu SSH/Shell/Console from Browser)
 - Refer: https://github.com/shellinabox/shellinabox
 - Refer: https://linoxide.com/web-remote-your-server/
```
sudo apt -y update
sudo apt -y install openssl
sudo apt -y install shellinabox
sudo /etc/init.d/shellinabox start
sudo vi /etc/default/shellinabox
  - Modify to: SHELLINABOX_ARGS="--no-beep --disable-ssl"
sudo /etc/init.d/shellinabox restart
man shellinaboxd
```
 - Open http://<ip-address>:4200
 - Note: Use Ctrl+Shift+V to paste

## Setup multiple users in Ubuntu
- For each participant, we need to setup login accounts
```
sudo groupadd docker
for ((i=1;i<=30;i++)); do
	export username="u$i"
	sudo useradd -g docker -m -p "p" $username;sudo usermod -aG sudo $username;echo $username:p | sudo /usr/sbin/chpasswd;sudo chown -R  $username:root /home/$username
done
```

## Setup VS Code in Browser
- For instructions refer:
  - [1-VS Code Browser](1-VS-Code-Browser.md)

## PPT t o PDF conversion in bulk
- Refer
  - https://jdhao.github.io/2020/03/30/pptx_to_image/
  - https://nono.ma/export-powerpoint-to-jpg-images-png-pdf
- Install Libre Office
```
sudo apt install software-properties-common
sudo apt install -y zip
sudo apt-add-repository -y ppa:libreoffice/ppa
sudo apt update && sudo apt install libreoffice
```
- From PPT to PDF - Use libreoffice directly
  - This will create a file named test.pdf.
```
soffice --headless --convert-to pdf test.pptx
```

- Or use unoconv
  - Apart from soffice, we can also use unoconv. Install related package first:
```
deactivate
sudo apt -y update && sudo apt -y install python3-uno unoconv
```

 - Then use unoconv to convert pptx to pdf:
```
for f in *.pptx ; do unoconv -f pdf "$f"; done
```

  - unoconv also support various filters to put PDF related protections
    - Refer:
      - https://wiki.openoffice.org/wiki/API/Tutorials/PDF_export
      - https://www.systutorials.com/docs/linux/man/1-unoconv/
  - We can also use below command as a sample to put certain features to the PDF to be generated
```
for f in *.pptx ; do unoconv -f pdf -e RestrictPermissions=True -e PermissionPassword=123 -e Changes=0 -e EnableCopyingOfContent=False -e OpenInFullScreenMode=True -e OpenInFullScreenMode=True -e HideViewerMenubar=True -e HideViewerToolbar=True -e HideViewerWindowControls=True -e Printing=0 "$f"; done
```
 - Zip all the PDFs
```
zip allpdf *.pdf
```

## Search for some specific text in all the PDFs
- Sometimes we need to make sure that a specific text is not appearing in the training material
- There is a chance that some text content is only relavant to the previous training.
  - Example text "VMWare" should not be there in the training material being presented to IBM
- Refer
  - https://pdfgrep.org/pdfgrep.html
```
sudo apt install pdfgrep
pdfgrep -i -R 'VMWare' .
```

## Search for some specific text in all the text files
- Below command will print the file name, line number and the matching lines on which the matched text is found
```
grep -rniH . -e 'ibm'
```

## Search and Replace With sed
- Refer: https://www.baeldung.com/linux/find-replace-text-in-file
  - Find and Replace the First Occurrence
```
sed -i 's/2019/2020/' test.txt
```
  - Find and Replace All Occurrences
```
sed -i 's/2019/2020/g' test.txt
```
- Using the sed command for replacing the nth Occurrence of a Given Word in every Line
```
sed 's/FindWord/ReplaceWord/num' file.txt
```
- Using the sed command for replacing a Given Word in a Specific Line
```
sed 'LineNum s/FindWord/ReplaceWord/' file.txt
```

## Fix spelling mistake
  - Install aspell
```
sudo apt install aspell
```
  - Move to the directory where are the files to spell checl
  - Run spell check on all the file
```
for f in *.md ; do echo $f ; aspell list < $f | sort | uniq -c ; done
```
  - Now open individual file in editor and fix the spelling
