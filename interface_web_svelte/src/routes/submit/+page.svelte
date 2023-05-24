<script>
	import '../../app.css';
	import { ChevronDown, FileText, Image, Info, Link, ListOrdered, Plus, Tag } from 'lucide-svelte';
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
						<div class="post-form-main-tabs">
							<div class="options-container">
								<button class="options-button">
									<FileText />
									Post
								</button>
								<button class="options-button">
									<Image />
									Image
								</button>
								<button class="options-button">
									<Link />
									Link
								</button>
								<button class="options-button">
									<ListOrdered />
									Polls
								</button>
							</div>
						</div>
						<div class="post-form-main-content">content</div>
						<div class="post-form-main-actions">
							<div class="post-form-tags">
								<div class="tag-container">
									<button class="tag-buttons">
										<Plus />
										OC
									</button>
									<button class="tag-buttons">
										<Plus />
										Spoiler
									</button>
									<button class="tag-buttons">
										<Plus />
										NSFW
									</button>
									<button class="tag-buttons">
										<Tag />
										Flair
									</button>
								</div>
							</div>
							<hr class="post-form-main-actions-seperator" />
							<div class="post-form-save-draft">
								<div class="post-form-save-draft-outer">
									<div class="post-form-save-draft-inner">
										<div class="post-form-post-button-container">
											<button class="tag-buttons"> Post </button>
										</div>
										<div class="post-form-post-button-container">
											<button class="tag-buttons"> Save draft </button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="post-form-main-notifications">
							<div class="post-form-main-notifications-outer">
								<div class="post-form-main-notifications-inner">
									<div class="top-notification-text">
										<div class="top-notification-text-outer">
											<div class="top-notification-text-inner">
												<input type="checkbox" class="input-top-notification" />
												<div>Send me post reply notifications</div>
											</div>
										</div>
									</div>
									<div class="top-notification-text">
										<div class="top-notification-text-outer">
											<div class="top-notification-text-inner">
												<!-- svelte-ignore a11y-invalid-attribute -->
												<a href="">Connect accounts to share your post</a>
												<div class="info-icon-div">
													<Info />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="rules-container">
					<div class="rules-container-inner">
						<div class="rules-container-rules">
							<div class="rules-title">Posting to hublot</div>
							<ol class="rules-list">
								<li class="rules-list-item">Remember the pirate</li>
								<li class="rules-list-item">Behave like you would in real life</li>
								<li class="rules-list-item">Look for the original source of content</li>
								<li class="rules-list-item">Search for duplicates before posting</li>
								<li class="rules-list-item">Read the community's rules</li>
							</ol>
						</div>
						<div class="rules-container-spacer" />
						<div class="rules-container-policies">
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
	.info-icon-div {
		margin-left: 4px;
		color: var(--text-2);
	}

	.input-top-notification {
		font-size: 14px;
		font-weight: 500;
		line-height: 18px;
		color: var(--text-1);
		margin-left: 8px;
		margin-right: 4px;
	}

	.top-notification-text {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-direction: row;
		flex-direction: row;
		-ms-flex-align: center;
		align-items: center;
	}

	.top-notification-text-outer {
		font-size: 14px;
		font-weight: 500;
		line-height: 18px;
		color: var(--newCommunityTheme-bodyText);
		margin-bottom: 8px;
	}

	.top-notification-text-inner {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-direction: row;
		flex-direction: row;
		-ms-flex-align: center;
		align-items: center;
	}

	.post-form-main-notifications-inner {
		margin-right: auto;
		-ms-flex-item-align: start;
		align-self: flex-start;
		font-size: 14px;
		font-weight: 500;
		line-height: 18px;
		color: var(--text-1);
	}

	.post-form-main-notifications-outer {
		display: -ms-flexbox;
		display: flex;
		width: 100%;
		margin-top: 8px;
	}

	.post-form-save-draft {
		position: relative;
		width: 100%;
		margin-top: 8px;
	}

	.post-form-save-draft-outer {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-align: center;
		align-items: center;
		-ms-flex-direction: row-reverse;
		flex-direction: row-reverse;
		-ms-flex-pack: justify;
		justify-content: space-between;
	}

	.post-form-save-draft-inner {
		padding-top: 8px;
		display: -ms-flexbox;
		display: flex;
		-ms-flex-align: center;
		align-items: center;
		-ms-flex-direction: row-reverse;
		flex-direction: row-reverse;
	}

	.post-form-post-button-container {
		margin-left: 8px;
		box-sizing: border-box;
		display: -ms-flexbox;
		display: flex;
	}

	.tag-buttons {
		margin-bottom: 8px;
		margin-right: 4px;
		padding: 4px 16px;
		z-index: 1;
		position: relative;
		border: 1px solid var(--text-2);
		color: var(--text-2);
		fill: var(--text-2);
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

	.post-form-tags {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-flow: column nowrap;
		flex-flow: column nowrap;
		max-width: 100%;
		min-width: 0;
	}

	.tag-container {
		-ms-flex-wrap: wrap;
		flex-wrap: wrap;
		max-width: 530px;
		display: -ms-flexbox;
		display: flex;
		-ms-flex-direction: row;
		flex-direction: row;
		-ms-flex-align: center;
		align-items: center;
	}

	.post-form-main-actions-seperator {
		width: 100%;
		border: 0;
		border-top: 1px solid var(--new-hublot-line);
	}

	button {
		background: transparent;
	}

	button:hover {
		--_highlight-size: var(--size-0);
	}

	.options-button:hover {
		background-color: var(--new-hublot-field);
	}

	.options-button {
		font-size: 14px;
		font-weight: 700;
		line-height: 18px;
		cursor: pointer;
		outline: none;
		box-sizing: border-box;
		padding: 15px 17px;
		z-index: 1;
		position: relative;
		-ms-flex: 1;
		flex: 1;
		text-align: center;
		border-color: var(--new-hublot-line);
		border-style: solid;
		border-width: 0 1px 1px 0;
		border-radius: 0;
		-ms-flex-pack: center;
		justify-content: center;
		-ms-flex-align: center;
		align-items: center;
		color: var(--text-2);
		white-space: nowrap;
	}

	.options-container {
		display: flex;
		flex-direction: row;
		align-items: stretch;
	}
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

	.rules-container-inner {
		padding-top: 27px;
		width: inherit;
	}

	.rules-container-rules {
		background-color: var(--hublot-body);
		border-radius: 4px;
		margin-top: 15px;
		padding: 12px;
	}

	.rules-title {
		display: flex;
		font-size: 16px;
		line-height: 20px;
		align-items: center;
		border-bottom: 1px solid var(--new-hublot-line);
		color: var(--text-1);
		font-weight: 500;
		padding-bottom: 10px;
		padding-left: 2px;
	}

	.rules-list {
		font-size: 14px;
		line-height: 18px;
		list-style: decimal;
		list-style-position: inside;
		font-weight: 500;
	}

	.rules-list-item {
		border-bottom: 1px solid var(--new-hublot-line);
		color: var(--text-1);
		padding: 10px 5px;
	}

	.rules-container-spacer {
		margin-top: 16px;
		width: 312px;
	}

	.rules-container-policies {
		font-size: 12px;
		font-weight: 500;
		line-height: 16px;
		color: var(--text-2);
		margin: 10px auto 10px 0;
		max-width: 250px;
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
		display: -ms-flexbox;
		display: flex;
		-ms-flex-flow: column;
		flex-flow: column;
		padding: 8px 16px 21px;
		position: relative;
	}
</style>
