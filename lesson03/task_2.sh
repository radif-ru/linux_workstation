# Задание 2. 

# Дать созданным файлам другие, произвольные имена. 
# Создать новую символическую ссылку. Переместить ссылки в другую директорию.

mv file2 file2.txt;
mv file3 file3.lnk;
mv file4 file4.txt;
ln -s file2.txt file5.lnk;
mkdir newdirectory;
mv *.lnk newdirectory;
