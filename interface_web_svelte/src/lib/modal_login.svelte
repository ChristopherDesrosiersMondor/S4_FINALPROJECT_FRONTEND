<script>
	// @ts-nocheck

	import { Mail } from 'lucide-svelte';
	import { Apple } from 'lucide-svelte';

	let shown = false;
	export function show() {
		shown = true;
	}
	export function hide() {
		shown = false;
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

{#if shown}
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

			<!-- <input class="pseudo_input" placeholder="Pseudo" />
			<input class="pwd_input" type="password" placeholder="Password" /> -->

			<p class="text">
				Forgot your pseudo or password ? Click <a href="./">here</a> to reinitialize.
			</p>
			<br />
			<!-- c'est ici que doit se faire l'appel a l'API pour checker si pseudo et mot de passe ok -->
			<button on:click={() => handleClick()} class="btn" id="login_btn">Log In</button><br />
			<span class="text">First time on Hublot ? <a href="./">Create account</a></span>
		</div>
	</div>
{/if}

<style>
	.modal-wrapper {
		width: auto !important;
		position: fixed;
		top: 0;
		left: 0;
		height: 100%;

		background-color: rgba(0, 0, 0, 0.4);
	}

	.modal {
		background-color: white;
		width: 400px;
		height: 640px;
		position: fixed;
		top: 15%;
		left: 45%;
		border-radius: 2%;
		padding: 4%;
		z-index: 80;
	}

	.text {
		font-size: small;
	}

	.title {
		font-weight: bold;
		margin-bottom: 3%;
	}

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

	.btn:hover {
		background-color: #f8fbff;
	}

	.btn_container {
		margin-top: 15%;
		margin-bottom: 12%;
	}

	.dividing-line {
		-webkit-box-align: center;
		align-items: center;
		display: flex;
		margin: 28px 0px;
		-webkit-box-pack: justify;
		justify-content: space-between;
	}

	.line {
		border-top: 1px solid #edeff1;
		width: 40%;
	}

	.ou {
		color: #a3a6aa;
	}

	.close {
		position: fixed;
		top: 150px;
		left: 1098px;
		cursor: pointer;
	}

	#login_btn {
		background-color: #ff4500;
		color: white;
		font-weight: bold;
		border: 1px solid transparent;
	}
</style>
