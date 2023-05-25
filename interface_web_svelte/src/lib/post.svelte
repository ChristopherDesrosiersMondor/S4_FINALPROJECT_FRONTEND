<script>
	// @ts-nocheck

	import { ArrowUp } from 'lucide-svelte';
	import { ArrowDown } from 'lucide-svelte';

	/**
	 * @type {{ postTitle: any; }}
	 */
	export let propValue;
</script>

<div>
	<div>
		<div class="PostContainer-component">
			<div class="VotesContainer" style="width:40px;border-left:4px solid transparent">
				<div class="VotesContainerInner">
					<button class="VoteButton">
						<span class="VotesSpan">
							<i class="ArrowIcon">
								<ArrowUp />
							</i>
						</span>
					</button>

					<div class="VoteCount">{propValue.postUpvote - propValue.postDownvote}</div>

					<button>
						<span class="VotesSpan">
							<i class="ArrowIcon">
								<ArrowDown />
							</i>
						</span>
					</button>
				</div>
			</div>

			<div class="ContentContainer">
				{#if propValue.postIdCom != null}
					<div class="PostUserCommunityInformations">TextTest</div>
				{/if}

				<div class="PostTitleAndText">{propValue.postTitle}</div>

				<div class="PostTitleAndText">{propValue.postContent}</div>

				{#if propValue.postSource != null}
					<div class="PostImage">TextTest</div>
				{/if}

				<div class="PostInteractionBar">TextTest</div>
			</div>
		</div>
	</div>
</div>

<style>
	.VoteCount {
		font-size: 12px;
		font-weight: 700;
		line-height: 16px;
		pointer-events: none;
		word-break: normal;
	}

	.PostInteractionBar {
		align-items: center;
		display: flex;
		flex-direction: row;
		min-height: 40px;
		overflow-y: visible;
	}

	.PostImage {
		margin-top: 8px;
	}

	.PostTitleAndText {
		margin: 0 8px;
	}

	.PostUserCommunityInformations {
		font-size: 12px;
		font-weight: 400;
		line-height: 16px;
		display: flex;
		flex-flow: row nowrap;
		align-items: start;
		margin: 0 8px 8px;
		position: relative;
	}

	.ArrowIcon {
		line-height: 24px;
		position: relative;
		font-size: 20px;
		font-weight: 400;
		vertical-align: middle;
	}

	.VotesSpan {
		border-radius: 2px;
		cursor: pointer;
		display: inline-block;
		overflow: hidden;
		height: 24px;
		width: 24px;
		font-size: 16px;
		line-height: 24px;
		color: var(--new-hublot-line);
	}

	.VoteButton {
		height: 24px;
		width: 24px;
	}

	button {
		background: transparent;
		border: none;
		color: inherit;
		cursor: pointer;
		padding: initial;
	}

	.PostContainer-component {
		border-radius: 4px;
		padding-left: 40px;
		cursor: pointer;
		transition: color 0.5s, fill 0.5s, box-shadow 0.5s;
		border: 1px solid var(--new-hublot-line);
		margin-bottom: 10px;
		overflow: hidden;
		background-color: var(--new-hublot-votes);
		color: var(--text-1);
		position: relative;
	}

	.VotesContainer {
		align-items: center;
		box-sizing: border-box;
		display: flex;
		flex-direction: column;
		left: 0;
		padding: 8px 4px 8px 0;
		position: absolute;
		top: 0;
		background-color: var(--new-hublot-votes);
	}

	.VotesContainerInner {
		align-items: center;
		display: flex;
		fill: inherit;
		flex-direction: column;
	}

	.ContentContainer {
		background: var(--hublot-body);
		position: relative;
		padding-top: 8px;
	}
</style>
