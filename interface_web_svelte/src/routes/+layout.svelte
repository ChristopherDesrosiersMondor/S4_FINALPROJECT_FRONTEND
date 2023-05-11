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
		<div class="content">
			<slot />
		</div>
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
		width: 100%;
		height: 100%;
		display: flex;
		z-index: 0;
		background-color: var(--background);
		padding-top: 5%;
	}

	.header {
		z-index: 1;
		background-color: var(--header-background);
	}

	.sidebar {
		width: 15%;
		padding-left: 10px;
		padding-top: 20px;
		background-color: var(--sidebar-background);
		position: fixed;
		bottom: 0;
		height: 100%;
		top: 7%;
		z-index: 1;
	}

	.content {
		width: 100%;
		height: 100%;
		margin-left: 15%;
	}
</style>
