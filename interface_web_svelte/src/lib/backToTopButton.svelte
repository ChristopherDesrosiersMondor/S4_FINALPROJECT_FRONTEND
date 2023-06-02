<script lang="ts">
	import '../app.css';

	function topFunction() {
		document.documentElement.scrollTop = 0; 
	}
</script>

<!-- Back to top button -->
<div style="top:calc(100vh - 8px);" class="back-to-top-container">
	<!-- svelte-ignore a11y-no-redundant-roles -->
	<button on:click={topFunction} class="back_to_top_btn" role="button" tabindex="0"
		>Back to top</button
	>
</div>

<style>
	.back_to_top_btn {
		background-color: #ff4500;
		border: 1px solid transparent;

		color: black;

		font-size: 14px;
		font-weight: 700;

		min-height: 32px;
		min-width: 32px;
		padding: 4px 16px;
		-ms-flex-align: center;
		align-items: center;
		border-radius: 9999px;
		box-sizing: border-box;
		display: -ms-flexbox;
		display: flex;
		-ms-flex-pack: center;
		justify-content: center;
		position: fixed;
		text-align: center;
		width: auto;
		top: 880px;
	}

	.back_to_top_btn:hover {
		background-color: var(--back-to-top-btn-hover);
	}
</style>
