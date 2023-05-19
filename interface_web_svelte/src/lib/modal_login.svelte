<script>
	// @ts-nocheck

	import { Mail } from 'lucide-svelte';
	import { Apple } from 'lucide-svelte';
	import '../app.css';
	import './modals.css';

	import { login_modal_shown } from '../stores.js';
	import { create_account_modal_shown } from '../stores.js';

	export function show() {
		$login_modal_shown = true;
	}
	export function hide() {
		$login_modal_shown = false;
	}

	let pseudo_input;
	let pwd_input;
	let data;

	const handleClick = async () => {
		data = await fetch(
			`http://localhost:8082/accounts/view/by_pseudo/${pseudo_input}/${pwd_input}`
		).then((response) => response.json());
		console.log(data);
	};
</script>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

{#if $login_modal_shown}
	<div class="modal-wrapper">
		<div class="modal">
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<span class="close" on:click={() => hide()}>&times;</span>
			<p class="title">Log In</p>
			<p class="text">
				By continuing, you are setting up an Hublot account and agree to our <a href="./"
					>User Agreement</a
				>
				and <a href="./">Privacy Policy</a>.
			</p>
			<div class="btn_container">
				<button class="btn"><Mail />Continue with Google</button>
				<button class="btn"><Apple />Continue with Apple</button>
			</div>
			<div class="dividing-line">
				<span class="line" />
				<span class="ou">ou</span>
				<span class="line" />
			</div>
			<input class="pseudo_input" placeholder="Pseudo" bind:value={pseudo_input} />
			<input class="pwd_input" type="password" placeholder="Password" bind:value={pwd_input} />

			<p class="text">
				Forgot your pseudo or password ? Click <a href="./">here</a> to reinitialize.
			</p>
			<br />

			<button on:click={() => handleClick()} class="btn" id="login_btn">Log In</button><br />
			<span class="text"
				>First time on Hublot ? <a
					href="./"
					on:click={() => {
						$login_modal_shown = false;
						$create_account_modal_shown = !$create_account_modal_shown;
					}}>Create account</a
				></span
			>
		</div>
	</div>
{/if}

<style>
	.btn,
	input {
		border: grey 1px solid;
		width: 100%;
		font-size: small;
		padding: 6%;
		border-radius: 10%;
		margin-bottom: 4%;
		display: flex;
		align-items: center;
		justify-content: center;
		border-radius: 2.1em;
		height: 36px;
		font-weight: 500;
	}

	#login_btn {
		background-color: #ff4500;
		color: white;
		font-weight: bold;
		border: 1px solid transparent;
	}
</style>
