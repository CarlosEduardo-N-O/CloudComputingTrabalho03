const form = document.getElementById('formEvento');

const listaEventos = document.getElementById('listaEventos');

let editandoId = null;


// LISTAR EVENTOS
async function carregarEventos() {

    const resposta = await fetch('/eventos');

    const eventos = await resposta.json();

    listaEventos.innerHTML = '';

    eventos.forEach(evento => {

        listaEventos.innerHTML += `
            <div class="evento">

                <h3>${evento.nome}</h3>

                <p><strong>Local:</strong> ${evento.local}</p>

                <p><strong>Data:</strong> ${evento.data_evento}</p>

                <p><strong>Ingressos:</strong> ${evento.ingressos}</p>

                <button onclick='editarEvento(${JSON.stringify(evento)})'>
                    Editar
                </button>

                <button onclick="removerEvento(${evento.id})">
                    Excluir
                </button>

            </div>
        `;
    });
}


// CADASTRAR / EDITAR
form.addEventListener('submit', async (e) => {

    e.preventDefault();

    const evento = {

        nome: document.getElementById('nome').value,

        local: document.getElementById('local').value,

        data_evento:
            document.getElementById('data_evento').value,

        ingressos:
            document.getElementById('ingressos').value
    };

    // EDITAR
    if (editandoId) {

        await fetch(`/eventos/${editandoId}`, {

            method: 'PUT',

            headers: {
                'Content-Type': 'application/json'
            },

            body: JSON.stringify(evento)
        });

        editandoId = null;

    } else {

        // CADASTRAR
        await fetch('/eventos', {

            method: 'POST',

            headers: {
                'Content-Type': 'application/json'
            },

            body: JSON.stringify(evento)
        });
    }

    form.reset();

    carregarEventos();
});


// PREENCHER FORMULÁRIO PARA EDIÇÃO
function editarEvento(evento) {

    document.getElementById('nome').value =
        evento.nome;

    document.getElementById('local').value =
        evento.local;

    document.getElementById('data_evento').value =
        evento.data_evento.split('T')[0];

    document.getElementById('ingressos').value =
        evento.ingressos;

    editandoId = evento.id;
}


// EXCLUIR EVENTO
async function removerEvento(id) {

    await fetch(`/eventos/${id}`, {

        method: 'DELETE'
    });

    carregarEventos();
}


// INICIALIZAR
carregarEventos();