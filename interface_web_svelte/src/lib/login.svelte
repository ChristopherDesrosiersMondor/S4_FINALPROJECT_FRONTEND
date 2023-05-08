<script lang="ts">
	import '../app.css';
</script>

<!-- Login -->
<div class="log-in-container">
	<a
		role="button"
		tabindex="0"
		href="https://www.reddit.com/login/?dest=https%3A%2F%2Fwww.reddit.com%2F"
		class="log-in-color">Log In</a
	>
</div>

<style>
	a:link {
		color: white;
	}

	.log-in-container {
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: var(--orange-10);
		border: 1px solid transparent;
		border-radius: 1.25em;
		box-shadow: none;
		box-sizing: border-box;
		height: 36px;
		position: relative;
		min-width: 72px;
	}

	.log-in-color {
		display: flex;
		color: var(--text-1);
		text-decoration: none;
	}
</style>
