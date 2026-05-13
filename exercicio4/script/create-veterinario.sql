CREATE TYPE exercicio4.status_veterinario AS ENUM(
    'ativo',
    'afastado',
    'desligado'
);

CREATE TYPE exercicio4.especialidades(
    'cirurgia',
    'patologia',
    'acunputura',
    'diagnostico por imagem',
    'anestesiologia',
    'medicina veterinaria do coletivo',
    'endocrinologia',
    'medicina de animais selvagens',
    'medicina intesiva veterinaria',
    'dermatologia',
    'cardiologia',
    'oftalmologia',
    'homeopatia',
    'oncologia',
    'inspencao higienica, sanitaria e tecnologica de produtos animais e tecnologia de produtos de origem animal e de saude publica',
    'nefrologia e urologia',
    'nutricao e nutrologia de caes e gatos'
    'nutricao de caes e gatos'
)

CREATE TABLE IF NO EXIST exercicio4.veterinario(
    id
    nome
    crmv
    cpf
    especialidade
    data_contratacao
    situacao
    created_at
    updated_at
)