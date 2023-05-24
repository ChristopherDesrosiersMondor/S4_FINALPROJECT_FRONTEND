<script>
	import '../../app.css';
	/**
	 * @type {String}
	 */
	let title = '';
	let charCounter = title.length;
	// @ts-ignore
	const changeCounter = () => {
		charCounter = title.length;
	};

	/**
	 * @type {any}
	 */
	export let propValue;
	import NormalPostContent from './normal_post_content.svelte';
</script>

<div class="submit-content-container">
	<div class="submit-title-container">
		<div class="submit-title-layout">
			<textarea
				maxlength="300"
				placeholder="Title"
				class="submit-title-text-area"
				rows="1"
				style="overflow-x: hidden; overflow-wrap: break-word; height: 39px;"
				bind:value={title}
				on:input={changeCounter}
			/>

			<div class="submit-title-char-counter">
				{charCounter} / 300
			</div>
		</div>
	</div>
	{#if propValue == 'post'}
		<NormalPostContent />
	{:else}
		NO
	{/if}
</div>

<style>
	.submit-content-container {
		margin: 16px;
	}

	.submit-title-container {
		margin-bottom: 8px;
	}

	.submit-title-layout {
		position: relative;
	}

	.submit-title-text-area {
		resize: none;
		box-sizing: border-box;
		overflow: hidden;
		display: block;
		width: 100%;
		padding: 12px 8px;
		outline: none;
		border: 1px solid var(--new-hublot-line);
		border-radius: 4px;
		color: var(--text-1);
		padding: 8px 68px 8px 16px;
		border: 1px solid var(--new-hublot-line);
		background-color: transparent;
	}

	.submit-title-char-counter {
		font-size: 10px;
		font-weight: 700;
		letter-spacing: 0.5px;
		line-height: 12px;
		text-transform: uppercase;
		bottom: 12px;
		color: var(--text-2);
		pointer-events: none;
		position: absolute;
		right: 12px;
	}
</style>
