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
		font-family: Noto Sans, Arial, sans-serif;
		font-size: 14px;
		font-weight: 700;
		letter-spacing: unset;
		line-height: 17px;
		text-transform: unset;
		min-height: 32px;
		min-width: 32px;
		padding: 4px 16px;
	}

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
	}

	.log-in-color {
		display: flex;
		color: white;
		font-weight: bold;
		text-decoration: none;
	}
</style>
