<script>
	// @ts-nocheck
	// I could make it dynamic for the front page trending see https://www.twilio.com/blog/dynamically-render-svelte-components

	import { ArrowUp, Menu } from 'lucide-svelte';
	import { ArrowDown } from 'lucide-svelte';
	import { goto } from '$app/navigation';
	import { postUrl } from './config';

	/**
	 * @type {{ postTitle: any; }}
	 */
	export let propValue;
	let id = propValue.id;
	let votes = propValue.postUpvote - propValue.postDownvote;

	function hideAfterDelete() {
		var x = document.getElementById(id);
		if (x.style.display === 'none') {
			x.style.display = 'block';
		} else {
			x.style.display = 'none';
		}
	}

	// https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch
	let deletePost = async () => {
		await fetch(postUrl + 'posts/delete/' + propValue.id, { method: 'DELETE' });
		hideAfterDelete();
	};

	let upVote = async () => {
		const timeElapsed = Date.now();
		const today = new Date(timeElapsed);
		const res = await fetch(postUrl + 'posts/edit/' + propValue.id, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json'
				// 'Content-Type': 'application/x-www-form-urlencoded',
			},
			body: JSON.stringify({
				postTitle: propValue.postTitle,
				postContent: propValue.postContent,
				postSource: propValue.postSource,
				postDate: propValue.postDate,
				postUpvote: votes + 1
			})
		});
		votes += 1;
	};

	let downVote = async () => {
		const timeElapsed = Date.now();
		const today = new Date(timeElapsed);
		const res = await fetch(postUrl + 'posts/edit/' + propValue.id, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json'
				// 'Content-Type': 'application/x-www-form-urlencoded',
			},
			body: JSON.stringify({
				postTitle: propValue.postTitle,
				postContent: propValue.postContent,
				postSource: propValue.postSource,
				postDate: propValue.postDate,
				postUpvote: votes - 1
			})
		});
		votes -= 1;
	};
</script>

<div {id}>
	<div>
		<div class="PostContainer-component">
			<div class="VotesContainer" style="width:40px;border-left:4px solid transparent">
				<div class="VotesContainerInner">
					<button class="VoteButton" on:click={upVote}>
						<span class="VotesSpan">
							<i class="ArrowIcon">
								<ArrowUp />
							</i>
						</span>
					</button>

					<div class="VoteCount">{votes}</div>

					<button on:click={downVote}>
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
					<div class="PostUserCommunityInformations">Community</div>
				{:else if propValue.postDate != null}
					<div class="PostUserCommunityInformations">Community - {propValue.postDate}</div>
				{/if}

				<div class="PostTitleAndText">{propValue.postTitle}</div>

				<div class="PostTitleAndText">{propValue.postContent}</div>

				{#if propValue.postSource != 'string'}
					<div class="PostImage">
						<img class="post-images" src={propValue.postSource} alt="postImage" />
					</div>
				{/if}

				<div class="PostInteractionBar">
					<div class="PostInteractionBarLayout">
						<div class="InteractionMenuContainer">
							<div>
								<button class="InteractionMenuButton" on:click={deletePost}>
									<Menu />
									Delete
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<style>
	button:hover {
		--_highlight-size: var(--size-0);
	}

	.InteractionMenuButton:hover {
		background-color: var(--new-hublot-field) !important;
	}

	.InteractionMenuButton {
		background-color: transparent;
	}

	.InteractionMenuContainer {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-direction: column;
		flex-direction: column;
		-ms-flex-pack: center;
		justify-content: center;
	}

	.post-images {
		border-radius: var(--radius-0);
	}
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

	.PostInteractionBarLayout {
		font-size: 12px;
		font-weight: 700;
		line-height: 16px;
		-ms-flex-align: stretch;
		align-items: stretch;
		display: -ms-flexbox;
		display: flex;
		-ms-flex-direction: row;
		flex-direction: row;
		overflow: hidden;
		padding: 0 8px 0 4px;
		-ms-flex-positive: 1;
		flex-grow: 1;
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
