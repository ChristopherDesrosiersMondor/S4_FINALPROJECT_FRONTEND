import { Component } from "react";
import { Message } from "semantic-ui-react";

class AccountCreation extends Component {

    state = {
        resultat: "",
        error: ""
    }

    addNewAccount = async () => {
        let firstName = document.querySelector("#firstNameInput").value;
        let lastName = document.querySelector("#lastNameInput").value;
        let email = document.querySelector("#emailInput").value;
        let pseudo = document.querySelector("#pseudoInput").value;
        let password = document.querySelector("#passwordInput").value;
        let birthday = document.querySelector("#birthdayInput").value;

        if(firstName !== '' && lastName !== '' && email !== '' && pseudo !== '' && password !== '' && birthday !== '') {
            let newAccount = {
                userLastName: lastName,
                userFirstName: firstName,
                userEmail: email,
                userPseudo: pseudo,
                userPassword: password,
                userBirthday: birthday
            }
            try {
                fetch(`http://localhost:8082/accounts/add`, {
                    method: "POST",
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(newAccount)
                })
                .then(response => response.json())
                .then(entry => console.log("Success:", entry))
                this.setState({resultat: 'Le compte a été créé avec succès', error: ''})
            }
            catch(e) {
                this.setState({error: e});
            }
        }
        else {
            this.setState({resultat: 'Veuillez remplir tous les champs', error: ''})
        }
    }

    render() {
        
        return(
            <div><h1>Création de Compte</h1>
            <form>
                <p>First Name: </p><input id="firstNameInput" type="text"></input>
                <p>Last Name: </p><input id="lastNameInput" type="text"></input>
                <p>Email: </p><input id="emailInput" type="text"></input>
                <p>Pseudo: </p><input id="pseudoInput" type="text"></input>
                <p>Password: </p><input id="passwordInput" type="password"></input>
                <p>Birthday: </p><input id="birthdayInput" type="date"></input>
                <input type="submit" onClick={this.addNewAccount}></input>
            </form>

            {this.state.error ? <Message warning>{this.state.error}</Message> : undefined}
            {this.state.resultat ? <Message warning>{this.state.resultat}</Message>: undefined}

            </div>
        )
    }
}

export default AccountCreation;