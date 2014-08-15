

CREATE TABLE IF NOT EXISTS `employe` (
  id integer AUTO_INCREMENT,
  jp_name varchar(100) comment "日本語名",
  en_name varchar(100) comment "英語名",
  email varchar(100) comment "メール",
  password  varchar(50) comment "ログインパスワード",
  face_img varchar(100) comment "顔写真",
  department_id integer comment "部門",
  address varchar(200) comment "住所",
  enter_date varchar(20) comment "入社日",
  leave_date varchar(20) comment "退社日",
  position_id integer comment "職位"
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;


CREATE TABLE IF NOT EXISTS `department` (
  id integer AUTO_INCREMENT,
  name varchar(100) comment "",
  description text comment "",
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;


CREATE TABLE IF NOT EXISTS `position` (
  id integer AUTO_INCREMENT,
  name varchar(100) comment "",
  description text comment "",
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;


CREATE TABLE IF NOT EXISTS `admin` (
  id integer AUTO_INCREMENT,
  name varchar(100) comment "",
  password varchar(100) comment "",
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS `paidvacation` (
  id integer AUTO_INCREMENT,
  employe_id integer not null,
  start_at varchar(20) comment "",
  end_at varchar(20) comment "",
  days  integer comment "",
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;


CREATE TABLE IF NOT EXISTS `vacation` (
  id integer AUTO_INCREMENT,
  paidvacation_id integer not null,
  use_at varchar(20) comment "",
  is_ok  integer comment "",
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `attendance` (
  id integer AUTO_INCREMENT,
  employe_id integer not null,
  date_at varchar(20) comment "",
  start_at varchar(20) comment "",
  end_at varchar(20) comment "",
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

