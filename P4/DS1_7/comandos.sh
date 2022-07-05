#!/bin/sh -e

rails destroy scaffold partida
rails destroy scaffold usuario
rails destroy scaffold torneo
rails destroy scaffold juego_individual
rails destroy scaffold participa

rails g scaffold partida puntuacion:integer fecha:date --force
rails g scaffold usuario nombre:string contrasena:string admin:boolean --force
rails g scaffold torneo nombre:string fecha_max_juego:date es_bomba:boolean multiplier:float piezas_puestas:integer descripcion:string probabilidad:float  --force
rails g scaffold juega_individual usuario:belongs_to puntuacion:integer fecha:date --force
rails g scaffold participa torneo:belongs_to usuario:belongs_to puntuacion:integer fecha:date --force

rails db:migrate

#https://stackoverflow.com/questions/34559362/generate-a-model-with-a-string-field-as-primary-key
