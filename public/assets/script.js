document.addEventListener("DOMContentLoaded", () => {
    loadPersons();
    loadContacts();
});

function loadPersons() {
    fetch('/persons')
        .then(response => response.json())
        .then(persons => {
            const personList = document.getElementById('personList');
            personList.innerHTML = '';
            
            persons.forEach(person => {
                const personDiv = document.createElement('div');
                personDiv.className = 'person';
                personDiv.innerHTML = `<strong>${person.name}</strong> (CPF: ${person.cpf})`;
                personList.appendChild(personDiv);
            });
        });
}

function loadContacts() {
    // Adicione a rota e a lógica para carregar os contatos do backend
}

function searchPerson() {
    const searchTerm = document.getElementById('searchPerson').value.toLowerCase();
    
    fetch('/persons')
        .then(response => response.json())
        .then(persons => {
            const filteredPersons = persons.filter(person => person.name.toLowerCase().includes(searchTerm));
            
            const personList = document.getElementById('personList');
            personList.innerHTML = '';
            
            filteredPersons.forEach(person => {
                const personDiv = document.createElement('div');
                personDiv.className = 'person';
                personDiv.innerHTML = `<strong>${person.name}</strong> (CPF: ${person.cpf})`;
                personList.appendChild(personDiv);
            });
        });
}
