<script lang="ts">
	import '../app.css';
	import ModalLogin from '$lib/modal_login.svelte';
	let modal_login: ModalLogin;
</script>

<!-- Login -->

<button on:click={() => modal_login.show()} class="log-in-container" tabindex="0">Log In</button>
<ModalLogin bind:this={modal_login} />

<style>
	.log-in-container {
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: #ff4500;
		border: 1px solid transparent;
		border-radius: 1.25em;
		box-shadow: none;
		box-sizing: border-box;
		height: 32px;
		position: relative;
		min-width: 72px;
		width: 120px;
		color: white;
		font-weight: bold;
	}
</style>
