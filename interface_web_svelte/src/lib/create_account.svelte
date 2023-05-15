<script lang="ts">
	import '../app.css';
	import Modal from '$lib/modal_create_account.svelte';
	let modal: Modal;
</script>

<!-- Create account -->
<button on:click={() => modal.show()} class="create-account-container">Create account</button>
<Modal bind:this={modal} />

<style>
	.create-account-container {
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: #ff4500;
		border: 1px solid transparent;
		border-radius: 1.25em;
		box-shadow: none;
		box-sizing: border-box;
		height: 36px;
		width: 100%;
		color: white;
		font-weight: bold;
	}
</style>
