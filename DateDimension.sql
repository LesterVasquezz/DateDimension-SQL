create table  DimTiempo(
	idFecha date primary key,
	dia smallint,
	mes smallint,
	anio smallint,
	diaSemana smallint,
	desMes varchar(20),
	numSemana smallint,
	numTrimestre smallint,
	desTrimestre varchar(20)
)