<script>
	let shown = false;
	export function show() {
		shown = true;
	}
	export function hide() {
		shown = false;
	}
</script>

{#if shown}
	<div class="modal-wrapper">
		<div class="modal">
			<p>Create account</p>
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
		padding: 3%;
	}
</style>
