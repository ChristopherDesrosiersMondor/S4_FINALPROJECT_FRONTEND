<script>
	// @ts-nocheck

	import pirate from '$lib/images/pirate.png';
	import sea3 from '$lib/images/sea-illustration-3.jpg';
	import sea from '$lib/images/sea.png';
	import Post from '$lib/post.svelte';
	import { isVisible } from '../stores';

</script>

<div class="ListingLayoutOuterContainer">
	<div class="MainOuterLayer">
		<div style="max-width: 100%;">
			<div>
				<div data-scroller-first>
					<div>
						<div class="TrendingContainer">
							<div class="TrendingSeparationContainer">
								<div class="TrendingHeader">
									<div class="TrendingHeaderText">Trending today</div>
								</div>
								<div class="TrendingPostsContainer">
									<div class="TrendingPostsSorter">
										<div class="TrendingPosts">
											<div class="PostContainer">
												<img src={sea3} alt="TestPost" />
											</div>

											<div class="PostContainer">
												<img src={sea3} alt="TestPost" />
											</div>

											<div class="PostContainer">
												<img src={sea3} alt="TestPost" />
											</div>

											<div class="PostContainer">
												<img src={sea3} alt="TestPost" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div style="max-width: 100%;" class="MainPopularPanel">
			<div class="LeftMainPanel">
				<div class="PopularHeader">Popular posts</div>
				<div class="PopularPosts">
					<Post />
					<Post />
					<Post />
					<Post />
					<Post />
					<Post />
					<Post />
					<Post />
				</div>
			</div>
			<div class="RightMainPanel">
				{#if $isVisible}
				<div></div>
				{:else}
				<div class="RightMainPanelBox">
					<div><img class="mer" src={sea} alt="la mer" /></div>
					<div class="RightMainPanelBoxInside">
						<div style={'display: flex'} class="home"><img class="pirate" src={pirate} alt="pirate" />
							<div class="home_title">Home</div></div>
							<div class="text">Your personal Hublot frontpage. Come here to check in with your favorite communities.
						
							</div>
							<hr />
							<button class="btn" id="create_post_btn">Create Post</button>
							<button class="btn" id="create_com_btn">Create Comumnity</button>
					</div>
				</div>

				{/if}
			</div>
		</div>
	</div>
</div>

<style>

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

	#create_post_btn {
		background-color: var(--back-to-top-btn);
		color: white;
		font-size: 14px;
		font-weight: 700;
		letter-spacing: unset;
		line-height: 17px;;
		padding: 4px 16px;
		-ms-flex-align: center;
		align-items: center;
		border-radius: 9999px;
		box-sizing: border-box;
		justify-content: center;
		text-align: center;
		margin-top: 16px;

	}

	#create_com_btn{
		background-color: var(--hublot-body);
		color:var(--back-to-top-btn);
		font-size: 14px;
		font-weight: 700;
		letter-spacing: unset;
		line-height: 17px;;
		padding: 4px 16px;
		-ms-flex-align: center;
		align-items: center;
		border-radius: 9999px;
		box-sizing: border-box;
		justify-content: center;
		text-align: center;
	}

hr {
	border: 1px solid var(--new-hublot-line);
}

.RightMainPanelBox {

	background-color: var(--hublot-body);
	border: 1px solid var(--new-hublot-line);
}

.RightMainPanelBoxInside {
	margin: 10px;
}

.mer {
	border-radius: 0;
}

.home {
	color: var(--main-text);

}

.home_title {
	padding-top: 8px;
    padding-left: 7px;
}

.pirate {
    height: 40px;
    width: 40px;
}

.text {
	font-size: small;
	margin-top: 10px;
	margin-bottom: 13px;
}

	.PopularPosts {
		min-height: 1000px;
		width: 100%;
	}

	.TrendingPostsContainer {
		padding: 0 16px 16px;
	}

	.TrendingPostsSorter {
		display: flex;
		flex-direction: row;
		height: 220px;
	}

	.TrendingHeader {
		padding: 0 16px 10px;
	}

	.TrendingHeaderText {
		font-size: 14px;
		font-weight: 500;
		line-height: 18px;
		color: var(--text-1);
		text-transform: unset;
	}

	.TrendingPosts {
		height: 178px;
		flex: 1;
		flex-flow: row wrap;
		overflow: hidden;
		display: flex;
	}

	.TrendingPosts .PostContainer {
		margin-left: 12px;
	}

	.TrendingPosts .PostContainer:first-child {
		margin-left: 0;
	}

	.PostContainer {
		margin-left: 0;
		color: var(--text-2);
		flex: 1;
		max-width: 375px;
		min-width: 208px;
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

	.LeftMainPanel {
		width: 640px;
	}

	.RightMainPanel {
		margin-left: 24px;
		margin-top: 28px;
		flex: 0 0 312px;
		width: 312px;
	}

	.PopularHeader {
		padding-bottom: 10px;
		font-size: 14px;
		font-weight: 500;
		line-height: 18px;
		color: var(--text-1);
		text-transform: unset;
	}

	.TrendingContainer {
		margin: 0 auto;
		max-width: 1020px;
		padding: 16px 24px 0;
	}

	.TrendingSeparationContainer {
		background-color: transparent;
		border: none;
		height: 208px;
		margin-bottom: 0;
		contain: content;
		cursor: default;
		border-radius: 4px;
	}
</style>
