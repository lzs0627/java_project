root
	|--css/ スタイルシートフォルダです。
	|	|--datatables/  	tableのスタイルシート
	|	|--datepicker/ 		時間を選択するポップアップのスタイルシートです
	|	|--daterangepicker/ 期間を選択するポップアップのスタイルシートです
	|	|--fullcalendar/ 	カレンダーのスタイルシートです
	|	|--images/ 			画像フォルダ
	|	|--jQuery/ 			jQueryライブラリ用のスタイルシートです。
	|	|--timepicker/ 		時間を選択するポップアップのスタイルシートです。
	|	|--AdminLTE.css		管理画面のスタイルシート
	|	|--bootstrap-theme.min.ss bootstrapライブラリ用のスタイルシート
	|	|--bootstrap.css		↑と同じ
	|	|--bootstrap.min.css	↑と同じ
	|	|--font-awesome.css		フォントのスタイルシート
	|	|--font-awesome.min.css　↑と同じ
	|	|--ionicons.css			アイコンのスタイルシート
	|	|--ionicons.min.css		↑と同じ
	|
	|
	|--fonts/		フォント用のファイル
	|
	|--img/ サイトのデザイン用の画像を保存するフォルダ
	|	|--faces/   アップロードした画像を保存するフォルダ
	|
	|--js/	javascriptファイルを保存するフォルダ
	|	|--AdminLTE/app.js	管理ページで、メニューのアニメーションのjavascriptファイル
	|	|--plugins		opensourceのライブラリを保存するフォルダ
	|	|--bootstrap.*.js ライブラリbootsrapのファイルです。
	|	|--jquery.*.js	ライブラリjQueryのファイルです。
	|
	|
	|--jsp/	jspファイルを保存するフォルダです。
	|	|--parts/ jspファイルのパッツファイルです。
	|	|	|--admin_authcheck.jsp ログインしているかどうかをチェックするＪＳＰファイル
	|	|	|--admin_body_header.jsp 管理画面のヘッダ部分のＨＴＭＬです。
	|	|	|--admin_header.jsp		ＨＴＭＬタグの＜head＞部分のファイルです
	|	|	|--admin_menu.jsp	管理画面の左メニューのＨＴＭＬファイルです。
	|	|	|--footer.jsp		footerにあるjavascriptファイルとjavascriptコードです。
	|	|	
	|	|--	404.jsp	ページが存在しないとき、非常する画面です。
	|	|--	admin_attendance.jsp	出席一覧の画面
	|	|--	admin_department.jsp	部門一覧画面
	|	|--	admin_edit_department.jsp	部門の追加･修正画面
	|	|--	admin_employe.jsp		社員の一覧画面
	|	|--	admin_edit_employe.jsp	社員の追加･修正画面
	|	|--	admin_position.jsp		役職の一覧画面
	|	|--	admin_edit_position.jsp	役職の修正・追加画面
	|	|-- admin_vacation.jsp		社員休暇の一覧画面
	|	|-- admin_json_vacation.jsp	社員休暇情報をＪＳＯＮ形式表示
	|	|-- admin_login.jsp		ログイン画面
	|
	|--WEB-INF/ 	java用フォルダ
	|	|--classes/	classes	を保存するフォルダ
	|	|--lib/		ライブラリを保存するフォルダ
	|	|--src/		javaのソールファイルを保存するフォルダ
	|	|	|--beans/ javabeanファイルを保存するフォルダです。
	|	|	|	|--AttendanceBean.java	出席情報を保存するクラスです。
	|	|	|	|--DepartmentBean.java  部門情報を保存するクラスです。
	|	|	|	|--EmployeBean.java		社員情報を保存するクラスです。
	|	|	|	|--PositionBean.java	役職情報を保存するクラスです。
	|	|	|	|--VacationBean.java	休暇情報を保存するクラスです。
	|	|	|
	|	|	|--dao/	 データベースを操作するクラスを保存するフォルダです。
	|	|	|	|--AdminDao.java	管理者情報に関するデータベース操作を格納しているクラスです。
	|	|	|	|--AttendanceDao.java	出席に関するデータベース操作を格納しているクラスです。
	|	|	|	|--DBManager.java		データベースを接続するクラスです。
	|	|	|	|--DepartmentDao.java	部門に関するデータベース操作を格納しているクラスです。
	|	|	|	|--EmployeDao.java		社員に関するデータベース操作を格納しているクラスです。
	|	|	|	|--PositionDao.java		役職に関するデータベース操作を格納しているクラスです。
	|	|	|	|--VacationDao.java		休暇に関するデータベース操作を格納しているクラスです。
	|	|	|
	|	|	|--AdminAttendance.java		出席に関するサーブレットファイルです。
	|	|	|--AdminDepartment.java		部門に関するサーブレットファイルです。
	|	|	|--AdminEmploye.java		社員に関するサーブレットファイルです。
	|	|	|--AdminLogin.java			ログイン処理に関するサーブレットファイルです。
	|	|	|--AdminPosition.java		役職に関するサーブレットファイルです。
	|	|	|--AdminUploadFaceImg.java	社員画像をアップする処理に関するサーブレットファイルです。
	|	|	|--AdminVacation.java		休暇に関するサーブレットファイルです。
	|	|	|--AdminVacationSearch.java	休暇検索に関するサーブレットファイルです。
	|	|	
	|	|--web.xml 	ウエブの設定ファイル
	|	
	|--build.xml	antでコンパイルする時の設定ファイルです。	
	|
	|
