<script>
	import { Mail } from 'lucide-svelte';
	import { Apple } from 'lucide-svelte';
	import '../app.css';
	import './modals.css';
	import { create_account_next_modal_shown } from '../stores.js';
	import { create_account_modal_shown } from '../stores.js';
	import { login_modal_shown } from '../stores.js';

	export function show() {
		$create_account_modal_shown = true;
	}
	export function hide() {
		$create_account_modal_shown = false;
	}
</script>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

{#if $create_account_modal_shown}
	<div class="modal-wrapper">
		<div class="modal">
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<span class="close" on:click={() => hide()}>&times;</span>
			<p class="title">Create account</p>
			<p class="text">
				By continuing, you are setting up an Hublot account and agree to our <a href="./"
					>User Agreement</a
				>
				and <a href="./">Privacy Policy</a>.
			</p>
			<br />
			<input type="checkbox" />
			<span class="text"> I agree to get emails about cool stuff on Hublot.</span><br />
			<div class="btn_container">
				<button class="btn"><Mail />Continue with Google</button>
				<button class="btn"><Apple />Continue with Apple</button>
			</div>
			<div class="dividing-line">
				<span class="line" />
				<span class="ou">ou</span>
				<span class="line" />
			</div>
			<button
				on:click={() => ($create_account_next_modal_shown = !$create_account_next_modal_shown)}
				on:click={() => ($create_account_modal_shown = !$create_account_modal_shown)}
				class="btn"
				id="continue_btn">Continue</button
			><br />
			<span class="text"
				>Already a Hublotor ? <a
					href="./"
					on:click={() => {
						$create_account_modal_shown = false;
						$login_modal_shown = !$login_modal_shown;
					}}>Log in</a
				></span
			>
		</div>
	</div>
{/if}
