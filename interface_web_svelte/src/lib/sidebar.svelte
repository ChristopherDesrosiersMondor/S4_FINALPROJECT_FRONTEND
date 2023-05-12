<script>
	import { Home } from 'lucide-svelte';
	import { ArrowUpRight } from 'lucide-svelte';
	import AccountCreation from '$lib/create_account.svelte';
	import '../app.css';
</script>

<div class="sidebar-container">
	<div role="menu" class="sidebar-menu-container">
		<div class="sidebar-menu-section-title">
			<p class="title">Feeds</p>
		</div>
	</div>
	<div>
		<div class="l">
			<hr />
			<p>Créez un compte pour suivre vos communautés préférées et participer aux conversations.</p>

			<br />

			<AccountCreation />
		</div>
	</div>
</div>

<!-- Source: https://www.w3schools.com/howto/howto_css_fixed_sidebar.asp -->

<style>
	.sidebar-container {
		background-color: var(--hublot-body);
		bottom: 0;
		top: 48px;
		display: -ms-flexbox;
		display: flex;
		flex-direction: column;
		left: 0;
		overflow: hidden;
		position: fixed;
		width: 270px;
		z-index: 4;
	}

	.sidebar-menu-container {
		-ms-flex: 1;
		flex: 1;
		overflow-y: auto;
	}

	.sidebar-menu-section-title {
		color: var(--text-1);
		font-size: 10px;
		font-weight: 500;
		line-height: 16px;
		text-transform: uppercase;
		padding: 16px 24px 8px;
	}

	.sidebar-menu-link {
		padding: 8px 24px;
		position: relative;
		align-items: center;
		display: flex;
		flex-direction: row;
	}
</style>
