<script lang="ts">
	import type { community } from '@prisma/client';

	/** @type {import('./$types').PageData} */
	export let data: community;
	$: a_community = data;
</script>

<div class="ListingLayoutOuterContainer">
	<div class="MainOuterLayer">
		<div style="max-width: 100%;">
			<div>
				<div data-scroller-first />
			</div>
		</div>
	</div>

	<div style="max-width: 100%;" class="MainPopularPanel">
		<div class="main_body">
			<div class="big_first_line">
				<div class="first_line">
					<h1>{a_community.community_name}</h1>
					<button class="btn" id="join_btn"
						><span>Joined : {a_community.ammount_of_members}</span></button
					>
				</div>
				<span class="subtitle">h/{a_community.community_name}</span>
			</div>
		</div>
		<div class="RightMainPanel">
			<div />
		</div>
	</div>
</div>

<style>
	.subtitle {
		font-size: 12px;
		padding: 8px 0px 0px 12px;
	}

	.main_body {
		width: 640;
	}

	h1 {
		font-size: 20px;
		padding: 8px 0px 0px 12px;
	}

	#join_btn {
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
		margin-left: 20px;
		margin-top: 5px;
	}

	#join_btn:hover span {
		display: none;
	}

	#join_btn:hover:before {
		content: 'Leave';
	}

	.big_first_line {
		background-color: var(--hublot-body);
	}

	.first_line {
		display: flex;
		background-color: var(--hublot-body);
		width: 640px;
		height: 35px;
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

	.MainOuterLayer {
		z-index: 3;
	}

	.ListingLayoutOuterContainer {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-direction: column;
		flex-direction: column;
		min-height: calc(100vh - 48px);
	}

	.MainPopularPanel {
		padding: 20px 24px;
		box-sizing: border-box;
		display: flex;
		flex-direction: row;
		justify-content: center;
		margin: 0 auto;
		max-width: 1248px;
	}

	.RightMainPanel {
		margin-left: 24px;
		margin-top: 28px;
		flex: 0 0 312px;
		width: 312px;
	}
</style>
