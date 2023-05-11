<script lang="ts">
	import '../app.css';
</script>

<!-- Create account -->
<div class="create-account-container">
	<a
		role="button"
		tabindex="0"
		href="https://www.reddit.com/login/?dest=https%3A%2F%2Fwww.reddit.com%2F"
		class="create-account-color">Join Hublot</a
	>
</div>

<style>
	a:link {
		color: white;
	}

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
		min-width: 72px;
	}

	.create-account-color {
		display: flex;
		color: white;
		font-weight: bold;
		text-decoration: none;
	}
</style>
