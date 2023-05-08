<script lang="ts">
	import Header from './header.svelte';

	import 'open-props/style';
	import 'open-props/normalize';
	import 'open-props/buttons';
	import 'iconify-icon';

	import '../app.css';
</script>

<div class="layout">
	<!-- Header -->
	<Header />

	<main>
		<!-- Black hole for other content -->
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
		margin-top: 5%;
		padding-block: var(--size-9);
	}
</style>
