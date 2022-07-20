truncate table DimTiempo --truncate elimina el contenido de la tabla

--declaracion de la variable
declare @fechaInicio date 
set @fechaInicio=convert(date,'2020-01-01')
declare @fechaFin date = convert(date,'2030-01-01')

--establecemos idioma 
set language Spanish


--llenamos la tabla 
while(@fechaInicio < @fechaFin)begin
	insert into DimTiempo(idFecha,dia,mes,anio,diaSemana,desMes,numSemana,
	numTrimestre,desTrimestre)
	values(
	@fechaInicio,
	DATEPART(day,@fechaInicio),
	DATEPART(month,@fechaInicio),
	DATEPART(year,@fechaInicio), 
	DATEPART(WEEKDAY,@fechaInicio),
	DATENAME(month,@fechaInicio),
	DATEPART(week,@fechaInicio),
	DATEPART(quarter,@fechaInicio), 
	case DATEPART(quarter,@fechaInicio)
		when 1 then 'Primer Trimestre'
		when 2 then 'Segundo Trimestre'
		when 3 then 'Tercer Trimestre'
		when 4 then 'Cuarto Trimestre'
		end
	)
	set @fechaInicio=DATEADD(day,1,@fechaInicio)
end