1) Thông tin tác giả:
		Họ và tên: Phạm Ánh Dương
		Email: phamduong47@gmail.com
		Sđt: 0986590470
2) Hướng dẫn sử dụng đĩa CD:
	- Để triển khai ứng dụng cần môi trường sau:
		+ Apache server: 2.2 trở lên.
		+ PHP: phiên bản 5.4 trở lên.
		+ MySql: phiên bản 5.6 trở lên.
	- Quy trình triển khai
		+ Tạo MySql database tên là scrumreal2 và import file scrumreal2.sql từ thư mục 'SCRUMTOOL\SOURCE\Database'
		+ Giải nén file scrumreal.rar trong thư mục 'SCRUMTOOL\SOURCE\Source code' vào thư mục chứa source của Apache
		+ Tạo đường dẫn virtual host đến thư mục 'scrumreal\public'
		+ Copy file php_zmq.dll trong thư mục 'SCRUMTOOL\SETUP\Zeromq for PHP in windows' vào thu mục 'php\ext' (thư mục extension của PHP)
		+ Thêm dòng sau vào file php.ini (trong thư mục của PHP): extension=php_zmq.dll
		+ Khởi động lại Apache