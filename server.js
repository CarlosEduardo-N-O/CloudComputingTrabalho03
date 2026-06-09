const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const pool = require('./db/connection');

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, 'source')));

const PORT = process.env.PORT || 3000;

// Criar tabela automaticamente
async function criarTabela() {

    await pool.query(`
        CREATE TABLE IF NOT EXISTS eventos (
            id SERIAL PRIMARY KEY,
            nome VARCHAR(100),
            local VARCHAR(100),
            data_evento DATE,
            ingressos INTEGER
        )
    `);

    console.log('Tabela criada/verificada com sucesso');
}

async function iniciarServidor() {

    let conectado = false;

    while (!conectado) {

        try {

            await criarTabela();

            conectado = true;

            console.log('Banco conectado com sucesso');

        } catch (error) {

            console.log('Aguardando banco de dados...');
            console.log(error.message);

            await new Promise(resolve => setTimeout(resolve, 3000));
        }
    }

    app.listen(PORT, () => {
        console.log(`Servidor rodando na porta ${PORT}`);
    });
}

iniciarServidor();

// Listar eventos
app.get('/eventos', async (req, res) => {
    try {
        const resultado = await pool.query(
            'SELECT * FROM eventos ORDER BY id DESC'
        );

        res.json(resultado.rows);
    } catch (error) {
        res.status(500).json(error);
    }
});

// Cadastrar evento
app.post('/eventos', async (req, res) => {
    try {
        const { nome, local, data_evento, ingressos } = req.body;

        await pool.query(
            `
            INSERT INTO eventos
            (nome, local, data_evento, ingressos)
            VALUES ($1, $2, $3, $4)
            `,
            [nome, local, data_evento, ingressos]
        );

        res.json({
            mensagem: 'Evento cadastrado com sucesso'
        });

    } catch (error) {
        res.status(500).json(error);
    }
});

// Editar evento
app.put('/eventos/:id', async (req, res) => {

    try {

        const { id } = req.params;

        const {
            nome,
            local,
            data_evento,
            ingressos
        } = req.body;

        await pool.query(
            `
            UPDATE eventos
            SET
                nome = $1,
                local = $2,
                data_evento = $3,
                ingressos = $4
            WHERE id = $5
            `,
            [nome, local, data_evento, ingressos, id]
        );

        res.json({
            mensagem: 'Evento atualizado com sucesso'
        });

    } catch (error) {

        res.status(500).json(error);
    }
});

// Excluir evento
app.delete('/eventos/:id', async (req, res) => {
    try {
        const { id } = req.params;

        await pool.query(
            'DELETE FROM eventos WHERE id = $1',
            [id]
        );

        res.json({
            mensagem: 'Evento removido'
        });

    } catch (error) {
        res.status(500).json(error);
    }
});

