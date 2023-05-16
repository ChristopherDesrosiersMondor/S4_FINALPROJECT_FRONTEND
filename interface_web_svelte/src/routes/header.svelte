<script lang="ts">
	import * as config from '$lib/config';
	import Login from '$lib/login.svelte';
	import SearchBar from '$lib/search_bar.svelte';
	import '../app.css';
	import Toggle from './toggle.svelte';
	import { AlarmMinus, Anchor } from 'lucide-svelte';
</script>

<header>
	<div
		class="header-content-container
				align-items-center display-inline-flex
				flex-direction-row flex-grow-1"
	>
		<div
			class="align-items-center display-inline-flex
				   flex-direction-row flex-grow-1"
		>
			<a href="./" class="anchor-icon">
				<Anchor />
			</a>
			<a href="./" class="title">Hublot</a>
			<div class="search-margin-container">
				<SearchBar />
			</div>
		</div>

		<div
			class="align-items-center display-inline-flex
		flex-direction-row flex-grow-0"
		>
			<div class="header-right-container-level-2">
				<div class="header-right-container-level-3">
					<Login />
					<!-- Toggle theme -->
					<Toggle />
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Source: https://www.reddit.com -->

<style>
	.header-right-container-level-2 {
		display: flex;
		align-items: center;
		flex-direction: row;
	}

	.header-right-container-level-3 {
		display: flex;
		align-items: center;
		flex-direction: row;
	}

	header {
		margin-top: 0;
		height: 48px;
		align-items: center;
		display: -ms-inline-flexbox;
		display: inline-flex;
		flex-direction: row;
		flex-grow: 0;
		flex-shrink: 0;
		z-index: 4;
		right: 0;
		top: 0;
		left: 0;
		position: fixed;
		background-color: var(--hublot-body);
	}

	.header-content-container {
		background-color: var(--hublot-body);
		border-bottom: 1px solid var(--hublot-line);
		box-sizing: border-box;
		padding: 0 20px;
		height: 100%;
	}

	.search-margin-container {
		-ms-flex-positive: 1;
		flex-grow: 1;
		margin: 0 auto;
		max-width: 690px;
	}

	.title {
		color: var(--title);
		font-weight: bold;
	}

	.anchor-icon {
		padding-right: 10px;
		color: var(--title);
	}
</style>
