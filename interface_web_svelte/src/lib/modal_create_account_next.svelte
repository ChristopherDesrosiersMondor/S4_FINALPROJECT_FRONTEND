<script>
	// @ts-nocheck

	import '../app.css';
	import './modals.css';
	import { create_account_next_modal_shown } from '../stores.js';

	export function show() {
		$create_account_next_modal_shown = true;
	}
	export function hide() {
		$create_account_next_modal_shown = false;
	}

	let pseudo_input;
	let pwd_input;
</script>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

{#if $create_account_next_modal_shown}
	<div class="modal-wrapper">
		<div class="modal">
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<span class="close" on:click={() => hide()}>&times;</span>
			<p class="title" style={'margin-top: 50px'}>Create your pseudo and password</p>
			<p class="text">
				Reddit is anonymous, so we'll know you by your nickname here. Choose wisely, because once
				you have your name, you can't change it.
			</p>
			<br />
			<input class="pseudo_input" placeholder="Pseudo" bind:value={pseudo_input} />

			<input class="pwd_input" type="password" placeholder="Password" bind:value={pwd_input} />
			<div style={'margin-bottom: 25px'}>
				<input type="checkbox" />
				<span class="text">I am not a robot.</span><br />
			</div>

			<button class="btn" id="continue_btn">Continue</button><br />
		</div>
	</div>
{/if}
