<script>
	let shown = false;
	export function show() {
		shown = true;
	}
	export function hide() {
		shown = false;
	}
</script>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

{#if shown}
	<div class="modal-wrapper">
		<div class="modal">
			<p class="title">Create account</p>
			<p class="text">By continuing, you are setting up an Hublot account and agree to our <a href="./">User Agreement</a> and <a href="./">Privacy Policy</a>.</p><br />
			<input type="checkbox"> <span class="text"> I agree to get emails about cool stuff on Hublot.</span><br />
			<div class="btn_container">
				<button class="btn">Continue with Google</button>
				<button class="btn">Continue with Apple</button>
			</div>
			<div class="dividing-line">
				<span class="line"></span>
				<span class="ou">ou</span>
				<span class="line"></span>
			</div>

		</div>
	</div>
{/if}

<style>
	.modal-wrapper {
		width: 100%;
		position: fixed;
		top: 0;
		left: 0;
		height: 100%;
		z-index: 80;
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
		padding: 5%;
	}

	.text {
		font-size: small;
	}

	.title {
		font-weight: bold;
		margin-bottom: 3%;
	}

	.btn {
		border: grey 1px solid;
		width: 100%;
		font-size:small;
		padding: 8%;
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
	


</style>
