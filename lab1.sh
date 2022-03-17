#!/bin/bash
echo "Программа разработана Сапуновым А.О."
echo "Название программы 'IZGNANIE'."
echo "Программа предназначена для удаления файлов, размер которых не соответствует требованиям пользователя"
re='^[0-9]+&'

while true; do
	echo "Пожалуйста, укажите путь к каталогу"
	read way
	if [ -d $way ]; then
		echo "Будет произведен поиск по пути $way"
		break
	else
		echo "Путь введен неверно!"
	fi
done

while true; do	
	echo "Пожалуйста, уажите интересующий вас размер в КБ (не более 9999кб!)"
	read value
	if [ $value != re ]; then
		break
	else
		echo "Размер слишком велик, либо было введено не целое число!"
	fi
done

echo "Если по заданному адресу существуют файлы, размером больше $value Кб, они появятся ниже:"
find $way -type f -size +$value

while true; do
	echo "Вы действительно хотите удалить найденные файлы? Y/n"
	read solution
	if [ $solution = Y ] || [ $solution = y ]; then
		find $way -type f -size +$value -delete
		echo "Файлы были успешно удалены"
		break
	elif [ $solution = N ] || [ $solution = n ]; then
		echo "Удаление файлов отменено"
		break
	else
		echo "Ошибка! введенные данные не распознаны."
	fi
done