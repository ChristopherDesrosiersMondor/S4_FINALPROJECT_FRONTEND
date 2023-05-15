<script lang="ts">
	import '../app.css';
</script>

<!-- Back to top button -->
<div style="top:calc(100vh - 8px);" class="back-to-top-container">
	<!-- svelte-ignore a11y-no-redundant-roles -->
	<button class="back_to_top_btn" role="button" tabindex="0">Back to top</button>
</div>

<style>
	.back_to_top_btn {
		background-color: var(--back-to-top-btn);
		border: 1px solid transparent;
		box-shadow: none;
		color: black;
		font-family: Noto Sans, Arial, sans-serif;
		font-size: 14px;
		font-weight: 700;
		letter-spacing: unset;
		line-height: 17px;
		text-transform: unset;
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
		position: relative;
		text-align: center;
		width: auto;
	}

	.back-to-top-container {
		position: -webkit-sticky;
		position: sticky;
		margin-top: 45px;
		display: -ms-flexbox;
		display: flex;
		-ms-flex-pack: center;
		justify-content: center;
		text-align: center;
		transform: translateY(-100%);
	}

	.back_to_top_btn:hover {
		background-color: var(--back-to-top-btn-hover);
	}
</style>
