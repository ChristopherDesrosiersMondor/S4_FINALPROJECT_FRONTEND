<script lang="ts">
	import Login from '$lib/login.svelte';
	import SearchBar from '$lib/search_bar.svelte';
	import { Anchor, User } from 'lucide-svelte';
	import '../app.css';
	import { isVisible, userPseudo, loggedIn } from '../stores';
	import Toggle from './toggle.svelte';
	import { redirect } from '@sveltejs/kit';
	import { goto } from '$app/navigation';

	function log_out() {
		$loggedIn = false;
		$isVisible = !$isVisible;
		goto('/');
	}
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
			<a href="/" class="anchor-icon">
				<Anchor />
			</a>
			<a href="/" class="title">Hublot</a>
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
					{#if $isVisible}
						<Login />
					{:else}
						<div class="icon"><User /></div>
						<div>Hi {$userPseudo}</div>
						<button class="log_out" on:click={log_out}>Log out</button>
					{/if}

					<!-- Toggle theme -->
					<Toggle />
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Source: https://www.reddit.com -->

<style>
	.log_out {
		margin-left: 20px;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: #ff4500;
		border: 1px solid transparent;
		border-radius: 1.25em;
		box-shadow: none;
		box-sizing: border-box;
		height: 32px;
		position: relative;
		min-width: 72px;
		width: 120px;
		color: white;
		font-weight: bold;
	}

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
		margin-bottom: 0;
	}

	.anchor-icon {
		padding-right: 10px;
		color: var(--title);
	}

	.icon {
		margin-right: 5px;
	}
</style>
