<script lang="ts">
	// @ts-nocheck
	import '../app.css';
	import { create_account_next_modal_shown, isVisible, loggedIn, userPseudo } from '../stores.js';
	import './modals.css';

	export function show() {
		$create_account_next_modal_shown = true;
	}
	export function hide() {
		$create_account_next_modal_shown = false;
	}

	let pseudo_input;
	let pwd_input;
	let lastname_input;
	let firstname_input;
	let bday_input;
	let email_input;

	const handleClick = async () => {
		const requestBody = {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify({
				userLastName: lastname_input,
				userFirstName: firstname_input,
				userEmail: email_input,
				userPseudo: pseudo_input,
				userPassword: pwd_input,
				userBirthday: bday_input
			})
		};
		const response = await fetch(`http://localhost:8082/accounts/add`, requestBody);
		const data = await response.json();
		console.log(data);
		userPseudo.set(data.userPseudo);
		$loggedIn = true;
		$create_account_next_modal_shown = false;
		$isVisible = !$isVisible;
	};
</script>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

{#if $create_account_next_modal_shown}
	<div class="modal-wrapper">
		<div class="modal">
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<span class="close" on:click={() => hide()}>&times;</span>
			<p class="title">Next step</p>
			<p class="text">
				Reddit is anonymous, so we'll know you by your nickname here. Choose wisely, because once
				you have your name, you can't change it.
			</p>
			<br />
			<input class="pseudo_input" placeholder="Email address" bind:value={email_input} />
			<input class="pseudo_input" type="text" placeholder="Lastname" bind:value={lastname_input} />
			<input
				class="pseudo_input"
				type="text"
				placeholder="Firstname"
				bind:value={firstname_input}
			/>
			<input class="pseudo_input" type="date" bind:value={bday_input} />
			<input class="pseudo_input" placeholder="Pseudo" bind:value={pseudo_input} />
			<input class="pwd_input" type="password" placeholder="Password" bind:value={pwd_input} />
			<div style={'margin-bottom: 25px'}>
				<input class="checkbox" type="checkbox" />
				<span class="text">I am not a robot.</span><br />
			</div>

			<button on:click={handleClick} class="btn" id="continue_btn">Continue</button><br />
		</div>
	</div>
{/if}

