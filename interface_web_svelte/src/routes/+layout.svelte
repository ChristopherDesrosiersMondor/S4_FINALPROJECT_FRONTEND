<script lang="ts">
	import Header from './header.svelte';

	import 'open-props/style';
	import 'open-props/normalize';
	import 'open-props/buttons';
	import 'iconify-icon';

	import '../app.css';
	import Sidebar from '../lib/sidebar.svelte';
</script>

<div class="layout">
	<div class="header">
		<Header />
	</div>

	<main>
		<div class="sidebar">
			<Sidebar />
		</div>

		<slot />
	</main>
</div>

<style>
	.layout {
		height: 100%;
		display: grid;
		grid-template-rows: auto 1fr auto;
		margin-inline: auto;
		padding-inline: var(--size-0);
	}

	main {
		padding-block: var(--size-9);
		width: 100%;
		height: 100%;
		display: flex;
		position: fixed;
		z-index: 0;
		background-color: var(--background);
	}

	.header {
		z-index: 1;
		background-color: var(--header-background);
	}

	.sidebar {
		width: 15%;
		height: 100%;
		padding-left: 10px;
		padding-top: 20px;
		background-color: var(--sidebar-background);
	}
</style>
