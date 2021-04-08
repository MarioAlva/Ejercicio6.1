//Miguel Mateos Luque, Jordi Escobar Rodríguez, Mario Antonio Alva Howes
#include <mysql.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>



int main(int argc, char *argv[]) {
	MYSQL *conn;
	int err;
	// Estructura especial para almacenar resultados de consultas
	MYSQL_RES *resultado;
	MYSQL_ROW row;
	//Creamos una conexion al servidor MYSQL
	conn = mysql_init(NULL);
	if (conn==NULL) {
		printf ("Error al crear la conexin: %u %s\n",
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	conn = mysql_init(NULL);
	conn = mysql_real_connect (conn, "localhost","root", "mysql","Actividad",0, NULL, 0);
	if (conn==NULL) {
		printf ("Error al inicializar la conexion: %u %s\n",
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	
	char nombre[20];
	// Pregunto los nombre de los dos jugadores
	printf ("Dame el nombre de la Actividad \n");
	scanf ("%s", nombre);
	char consulta [80];
	strcpy (consulta,"SELECT Usuario.Nombre FROM Usuario,Actividad,Relacion WHERE Actividad.Nombre  = '" );
	strcat (consulta, nombre);
	strcat (consulta,"' AND Actividad.Identificador = Relacion.Actividad AND Usuario.Identificador = Relacion.Usuario AND Relacion.Valoracion <= 3");		
	err=mysql_query (conn, consulta);
	if (err!=0) {
		printf ("Error al consultar datos de la base %u %s\n",
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}		
	resultado = mysql_store_result (conn);
	row = mysql_fetch_row (resultado);
	if (row == NULL)
		printf ("No se han obtenido datos en la consulta\n");
	else
		while (row !=NULL) {
			// la columna 0 contiene el nombre del jugador
			printf ("%s\n", row[0]);
			// obtenemos la siguiente fila
			row = mysql_fetch_row (resultado);
	}
	mysql_close (conn);
	exit(0);		
	return 0;
}

