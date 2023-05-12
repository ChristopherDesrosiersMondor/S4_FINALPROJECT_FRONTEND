<script lang="ts">
	import * as config from '$lib/config';
	import Login from '$lib/login.svelte';
	import SearchBar from '$lib/search_bar.svelte';
	import '../app.css';
</script>

<header
	class="flex-grow-0 flex-shrink-0
		   z-[80] right-0 left-0 top-0
		   align-items-center display-inline-flex
		   flex-direction-row fixed"
>
	<div
		class="header-content-container
				align-items-center display-inline-flex
				flex-direction-row flex-grow-1"
	>
		<div
			class="align-items-center display-inline-flex
				   flex-direction-row flex-grow-1"
		>
			<a href="./">Hublot</a>
			<SearchBar />
		</div>

		<div
			class="align-items-center display-inline-flex
		flex-direction-row flex-grow-0"
		>
			<div>
				<Login />
			</div>
		</div>
	</div>
</header>

<!-- Source: https://www.reddit.com -->

<style>
	header {
		margin-top: 0;
		height: 48px;
	}

	.header-content-container {
		background-color: var(--hublot-body);
		border-bottom: 1px solid var(--hublot-line);
		color: var(--text-1);
		box-sizing: border-box;
		padding: 0 20px;
	}
</style>
