<script lang="ts">
	import '../app.css';
</script>

<!-- Back to top button -->
<button class="back_to_top_btn" tabindex="0">Back to top</button>

<style>
	.back_to_top_btn {
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: var(--back-to-top-btn);
		border: 1px solid transparent;
		border-radius: 1.25em;
		box-shadow: none;
		box-sizing: border-box;
		height: fit-content;
		width: fit-content;
		color: black;
		font-weight: bold;
		font-size: smaller;
	}

	.back_to_top_btn:hover {
		background-color: var(--back-to-top-btn-hover);
	}
</style>
