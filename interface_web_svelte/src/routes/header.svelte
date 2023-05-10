<script lang="ts">
	import * as config from '$lib/config';
	import Login from '$lib/login.svelte';
	import SearchBar from '$lib/search_bar.svelte';
	import '../app.css';
</script>

<nav>
	<!-- Title -->
	<a href="/" class="title">
		<b>{config.title}</b>
		<!-- <p>{config.description}</p> -->
	</a>

	<!-- Search bar -->
	<SearchBar />

	<!-- Login -->
	<Login />
</nav>

<!-- Source: https://www.reddit.com -->

<style>
	nav {
		color: var(--text-2);
		align-items: center;
		display: inline-flex;
		flex-direction: row;
		flex-grow: 1;
		padding-block: var(--size-2);
		position: fixed;
		top: 0;
		width: 100%;
		height: 7%;
		padding-left: 1%;
		padding-right: 1%;
		border-bottom: 1px solid var(--gray-7);
	}

	a {
		color: inherit;
		text-decoration: none;
	}

	@media (min-width: 768px) {
		nav {
			display: flex;
			justify-content: space-between;
		}
	}
</style>
