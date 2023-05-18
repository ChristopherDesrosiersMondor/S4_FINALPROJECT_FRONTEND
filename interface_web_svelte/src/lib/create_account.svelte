<script lang="ts">
	import '../app.css';

	import { create_account_modal_shown } from '../stores.js';
</script>

<!-- Create account -->
<button
	on:click={() => ($create_account_modal_shown = !$create_account_modal_shown)}
	class="create-account-container"
>
	Create account
</button>

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
