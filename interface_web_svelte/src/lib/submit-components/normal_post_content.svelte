<script>
	import { Bold } from 'lucide-svelte';
	import '../../app.css';
	import { postBody } from '../../stores';
</script>

<div>
	<div class="normal-post-container">
		<div class="normal-post-layout">
			<!-- Main body for text entry -->
			<div>
				<textarea class="normal-post-text" bind:value={$postBody} />
			</div>
		</div>
	</div>
</div>

<style>
	.normal-post-text {
		width: 100%;
		height: 100%;
		resize: vertical;
		outline: none;
		border: none;
		background: none;
	}

	.normal-post-container {
		position: relative;
	}

	.normal-post-layout {
		border-radius: 4px;
		background: var(--hublot-body);
		position: relative;
		border: 1px solid var(--new-hublot-line);
		border-radius: 4px;
		position: relative;
	}
</style>
