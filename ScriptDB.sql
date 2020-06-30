create database livraria;
use livraria;
create table livros(
isbn CHAR(13) NOT NULL PRIMARY KEY,
titulo VARCHAR(50),
edicao_num TINYINT,
ano_publicacao YEAR,
descricao TEXT);

INSERT INTO livros (isbn, titulo, edicao_num, ano_publicacao, descricao) 
VALUES('85-7393-543-x', 'Dominando AJAX', 1, '2006', 'AJAX'),
	('35-7294-943-1', 'JAVA como programar', 8, '2019', 'AJAX'),
    ('05-7593-843-2', 'hibernate', 4, '2016', 'AJAX'),
    ('13-7363-743-3', 'eclipse', 3, '2015', 'AJAX'),
    ('99-8393-643-4', 'Dominando c#', 5, '2010', 'AJAX'),
    ('40-1392-523-5', 'JSP E SERVLET', 10, '2008', 'AJAX'),
    ('00-2399-443-6', 'PROGAMANDO EM HTML5 E CSS3', 12, '2018', 'AJAX');


select isbn, titulo from livros;
truncate table livros;

delete from livros where isbn ='98484';

DELIMITER $$
CREATE procedure sp_m_liv_isbn(IN vIsbn VARCHAR(100))
BEGIN
	SELECT * FROM livros WHERE isbn=vIsbn;
END;
$$
DELIMITER ;
select * from livros;

call sp_m_liv_isbn('00-2399-443-6');