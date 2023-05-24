<script>
	import { Bold } from 'lucide-svelte';
</script>

<!-- Header with editing options -->
<div class="normal-post-editor-options">
	<div class="normal-post-editor-options-container">
		<div class="normal-post-editor-options-layout">
			<!-- All editing buttons -->
			<span>
				<button class="editor-buttons">
					<div class="editor-icons"><Bold /></div>
				</button>
			</span>
			<span>
				<button class="editor-buttons">
					<div class="editor-icons"><Bold /></div>
				</button>
			</span>
			<span>
				<button class="editor-buttons">
					<div class="editor-icons"><Bold /></div>
				</button>
			</span>
			<span>
				<button class="editor-buttons">
					<div class="editor-icons"><Bold /></div>
				</button>
			</span>
			<span>
				<button class="editor-buttons">
					<div class="editor-icons"><Bold /></div>
				</button>
			</span>
		</div>
	</div>
</div>

<style>
	.editor-buttons {
		background: transparent;
		min-height: 32px;
		min-width: 32px;
		padding: 4px 16px;
		align-items: center;
		box-sizing: border-box;
		display: flex;
		justify-content: center;
		position: relative;
		text-align: center;
		width: auto;
	}

	.editor-icons {
		display: inline-block;
		padding: 0 8px 0 0;
		height: 20px;
		width: 20px;
		font-size: 20px;
		line-height: 20px;
	}

	.normal-post-editor-options {
		position: sticky;
		top: 48px;
		z-index: 8;
		align-items: center;
		border-radius: 3px 3px 0 0;
		border-radius: 4px;
		box-sizing: border-box;
		display: flex;
		-ms-flex-wrap: nowrap;
		flex-wrap: nowrap;
	}
	.normal-post-editor-options-container {
		height: 100%;
		width: 100%;
		-ms-flex-align: center;
		align-items: center;
		margin-left: 4px;
		position: relative;
		display: -ms-flexbox;
		display: flex;
	}
	.normal-post-editor-options-layout {
		-ms-flex-align: center;
		align-items: center;
		display: -ms-flexbox;
		display: flex;
		position: absolute;
		background-color: var(--new-hublot-field);
	}
</style>
