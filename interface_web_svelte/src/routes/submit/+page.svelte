<script>
	import '../../app.css';
	import { ChevronDown } from 'lucide-svelte';
</script>

<div>
	<div class="outer-container">
		<div class="content-container">
			<div class="post-and-rules" style="max-width: 1248px;">
				<div class="post-form">
					<div class="create-post-title">
						<div class="create-post-text">Create a post</div>
						<button class="btn-draft">
							Drafts
							<span class="span-draft-number">0</span>
						</button>
					</div>
					<div class="choose-community-container">
						<div class="choose-community-selector">
							<div class="choose-community-main">
								<span class="doted-circle" />
								<div class="choose-community-input-container">
									<input
										placeholder="Choose a community"
										spellcheck="false"
										value=""
										class="choose-community-input"
									/>
								</div>
								<div class="">
									<div class="choose-community-arrow-down-selector">
										<ChevronDown />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="post-form-main-container">
						<div class="post-form-main-tabs">tabs</div>
						<div class="post-form-main-content">content</div>
						<div class="post-form-main-actions">actions</div>
						<div class="post-form-main-notifications">notifications</div>
					</div>
				</div>
				<div class="rules-container">
					<div class="rules-container-inner">
						<div class="rules-container-rules">
							<div>Posting to hublot</div>
							<ol>
								<li>Remember the pirate</li>
								<li>Behave like you would in real life</li>
								<li>Look for the original source of content</li>
								<li>Search for duplicates before posting</li>
								<li>Read the community's rules</li>
							</ol>
						</div>
						<div class="rules-container-spacer" />
						<div class="rules-containers-policies">
							Please be mindful of hublot's
							<!-- svelte-ignore a11y-invalid-attribute -->
							<a href="">content policy</a>
							and practice good
							<!-- svelte-ignore a11y-invalid-attribute -->
							<a href="">hublotiquette</a>
							.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<style>
	.outer-container {
		display: flex;
		flex-direction: column;
		min-height: calc(100vh - 48px);
	}

	.content-container {
		z-index: 3;
	}

	.post-and-rules {
		padding: 20px 24px;
		box-sizing: border-box;
		display: flex;
		flex-direction: row;
		justify-content: center;
		margin: 0 auto;
	}

	.post-form {
		max-width: 740px;
		width: 640px;
		flex: 1 1 100%;
		min-width: 0;
	}

	.rules-container {
		margin-left: 24px;
		margin-top: 0px;
		display: block;
		flex: 0 0 312px;
	}

	.create-post-title {
		padding: 4px;
		margin: 16px 0;
		border-bottom: 1px solid var(--new-hublot-line);
		display: flex;
	}

	.create-post-text {
		font-size: 20px;
		font-weight: 500;
		line-height: 22px;
		color: var(--text-1);
		flex: 1;
	}

	.btn-draft {
		font-size: 12px;
		font-weight: 700;
		letter-spacing: 0.5px;
		line-height: 24px;
		text-transform: uppercase;
		margin-left: 10px;
		position: relative;
		border: 1px solid transparent;
		color: var(--text-1);
		fill: var(--text-1);
		min-height: 32px;
		min-width: 32px;
		padding: 4px 16px;
		align-items: center;
		border-radius: 9999px;
		box-sizing: border-box;
		display: flex;
		justify-content: center;
		text-align: center;
		width: auto;
		background: transparent;
		cursor: pointer;
		font-family: Arial, Helvetica, sans-serif;
	}

	.span-draft-number {
		font-size: 12px;
		font-weight: 400;
		line-height: 16px;
		background: var(--hublot-body);
		border-radius: 2px;
		color: var(--text-1);
		margin-left: 4px;
		padding: 1px 3px;
	}

	.choose-community-container {
		margin-bottom: 8px;
		display: flex;
		flex-direction: row;
		align-items: center;
	}

	.choose-community-selector {
		margin-right: 16px;
		position: relative;
		box-sizing: border-box;
		min-width: 300px;
		height: 40px;
		border-radius: 4px;
		transition: box-shadow 0.2s ease;
		box-shadow: 0 0 0 0 var(--hublot-body);
		border: 1px solid var(--new-hublot-line);
		background-color: var(--hublot-body);
	}

	.choose-community-main {
		display: flex;
		align-items: center;
		height: 100%;
		padding: 0 8px;
	}

	.doted-circle {
		box-sizing: border-box;
		border-radius: 22px;
		border: 1px dashed var(--new-hublot-line);
		margin: 0;
		height: 22px;
		width: 22px;
		font-size: 22px;
		line-height: 22px;
	}

	.choose-community-input-container {
		flex: 1;
		padding-left: 8px;
	}

	.choose-community-input {
		color: var(--hublot-body);
		font-size: 14px;
		font-weight: 500;
		line-height: 18px;
		width: 100%;
		vertical-align: middle;
		background-color: transparent;
	}

	.choose-community-arrow-down-selector {
		margin: 0;
		height: 22px;
		width: 22px;
		font-size: 22px;
		line-height: 22px;
		font-weight: 400;
		vertical-align: middle;
		color: var(--new-hublot-line);
		cursor: pointer;
	}

	.post-form-main-container {
		background-color: var(--hublot-body);
		margin-bottom: 15px;
		border-radius: 5px;
	}

	.post-form-main-tabs {
		margin: 0 0 12px;
		overflow: auto;
	}

	.post-form-main-content {
		margin: 16px;
	}

	.post-form-main-actions {
		padding: 0 16px 16px;
	}

	.post-form-main-notifications {
		background-color: var(--new-hublot-field);
		border-radius: 0 0 6px 6px;
		border-top: 1px solid var(--new-hublot-line);
		display: flex;
		flex-flow: column;
		padding: 8px 16px 21px;
		position: relative;
	}
</style>
