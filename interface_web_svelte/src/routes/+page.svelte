<script>
	// @ts-nocheck

	import BackToTopButton from '$lib/backToTopButton.svelte';
	import sea1 from '$lib/images/sea-illustration-1.jpg';
	import sea2 from '$lib/images/sea-illustration-2.jpg';
	import sea3 from '$lib/images/sea-illustration-3.jpg';
	import Post from '$lib/post.svelte';
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
				<h2>Right main</h2>
			</div>
		</div>
	</div>
</div>

<style>
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
