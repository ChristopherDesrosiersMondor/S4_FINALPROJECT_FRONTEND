<script>
// @ts-nocheck

	import { time_ranges_to_array } from 'svelte/internal';

	// @ts-nocheck

	import '../app.css';
	import { create_community_modal_shown, isCommunityPage } from '../stores.js';

	export function show() {
		$create_community_modal_shown = true;
	}
	export function hide() {
		$create_community_modal_shown = false;
	}

	let inputCommunityName;
	let inputCommunityDescription;
	let creationDate;

	const createCommunity = async () => {
		try {
			creationDate = Date.now();
			const requestBody = {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({
					communityName: inputCommunityName,
					communityDescription: inputCommunityDescription,
					communityCreatedOnDate: creationDate,
				})
			};
			const response = await fetch 
		} catch (error) {}
	};


	// let doPost = async () => {
	// 	const timeElapsed = Date.now();
	// 	const today = new Date(timeElapsed);
	// 	const res = await fetch(postUrl + 'posts/add', {
	// 		method: 'POST',
	// 		headers: {
	// 			'Content-Type': 'application/json'
	// 			// 'Content-Type': 'application/x-www-form-urlencoded',
	// 		},
	// 		body: JSON.stringify({
	// 			postTitle: $postTitle,
	// 			postContent: $postBody,
	// 			postSource: $postSource,
	// 			postDate: new Date(Date.now())
	// 		})
	// 	});
	// 	goto('/');
	// };


</script>

{#if $create_community_modal_shown}
	<div class="modal-wrapper">
		<div class="modal">
			<div class="first-line">
				<div>Create a community</div>
				<div class="exit" on:click={() => hide()}>&times;</div>
			</div>
			<hr />
			<br />
			<div>Name</div>
			<div class="subtitle">Community names including capitalization cannot be changed.</div>
			<br />
			<input type="text" bind:value={inputCommunityName} />
			<br /><br />
			<div>Description</div>
			<br />
			<textarea class="description" rows="4" cols="50" bind:value={inputCommunityDescription} />
			<div class="buttons">
				<button on:click={() => hide()} class="btn" id="cancel_btn">Cancel</button>
				<button
					on:click={() => {
						hide();
						createCommunity;
					}}
					class="btn"
					id="create_commu_btn">Create a community</button
				>
			</div>
		</div>
	</div>
{/if}

<style>
	.buttons {
		display: flex;
		padding-top: 25px;
	}

	#cancel_btn {
		background-color: var(--hublot-body);
		color: var(--back-to-top-btn);
		font-size: 14px;
		font-weight: 700;
		letter-spacing: unset;
		line-height: 17px;
		padding: 4px 16px;
		-ms-flex-align: center;
		align-items: center;
		border-radius: 9999px;
		box-sizing: border-box;
		justify-content: center;
		text-align: center;
		width: fit-content;
		margin-right: 10px;
		margin-left: 140px;
	}

	#create_commu_btn {
		background-color: var(--back-to-top-btn);
		color: white;
		font-size: 14px;
		font-weight: 700;
		letter-spacing: unset;
		line-height: 17px;
		padding: 4px 16px;
		-ms-flex-align: center;
		align-items: center;
		border-radius: 9999px;
		box-sizing: border-box;
		justify-content: center;
		text-align: center;
		width: fit-content;
	}

	.btn {
		border: var(--back-to-top-btn) 1px solid;
		width: 100%;
		font-size: small;
		padding: 6%;
		border-radius: 10%;
		margin-bottom: 4%;
		display: flex;
		align-items: center;
		justify-content: center;
		border-radius: 2.1em;
		height: 36px;
		font-weight: 500;
	}

	.modal {
		width: 511px;
		height: 455px;
		border-radius: 4px;
		padding: 2%;
		background-color: var(--hublot-body);
		position: fixed;
		top: 50%;
		left: 50%;
	}
	.first-line {
		display: flex;
		color: var(--title);
		font-weight: bold;
		margin-bottom: 3%;
	}

	.exit {
		position: fixed;
		top: 9px;
		left: 484px;
		cursor: pointer;
	}

	.subtitle {
		font-size: x-small;
	}

	input {
		background-color: white;
		border: 1px solid black;
		width: 445px;
	}

	textarea {
		background-color: white;
		border: 1px solid black;
	}
</style>
